package com.dat.now.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dat.now.bean.User;
import com.dat.now.service.UserService;

@Controller
public class FileUploadController {
	@Autowired
	UserService userService;

	@RequestMapping(value = "importexcel", method = RequestMethod.POST)
	public String uploadExcel(@RequestParam("file") MultipartFile file,
			HttpServletRequest request, Model model) {
		// 获取服务器端路径
		String path = request.getServletContext().getRealPath("upload");
		// 获取到上传文件名称
		String fileName = file.getOriginalFilename();
		// 创建目标File
		File targetFile = new File(path + "\\" + fileName);
		// 创建存储目录
		File targetPath = new File(path);

		// 判断服务器端目录是否存在,如果不存在创建目录
		if (!targetPath.exists()) {
			targetPath.mkdir();
		}
		// 把上传的文件存储到服务器端
		try {
			file.transferTo(targetFile);
		} catch (IllegalStateException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
		// 读取上传到服务器端的文件,遍历excel
		try {
			Workbook workbook = WorkbookFactory.create(targetFile);
			Sheet sheet = workbook.getSheet("Sheet1");
			// 判断行数
			int rownum = sheet.getPhysicalNumberOfRows();
			for (int i = 0; i < rownum; i++) {
				Row row = sheet.getRow(i);
				// 判断单元格数量
				int cellnum = row.getPhysicalNumberOfCells();
				StringBuffer buf = new StringBuffer();
				for (int j = 0; j < cellnum; j++) {
					Cell cell = row.getCell(j);
					if (cell.getCellType() == CellType.STRING) {
						buf.append(cell.getStringCellValue() + "~");
					} else if (cell.getCellType() == CellType.NUMERIC) {
						// 创建数字格式化工具类
						DecimalFormat df = new DecimalFormat("####");
						// 把从cell单元格读取到的数字,进行格式化防止科学计数法形式显示
						buf.append(df.format(cell.getNumericCellValue()) + "~");
					}
				}
				// 单元格循环完成后读取到的是一行内容 1~xingming~88
				String hang = buf.toString();
				String[] rows = hang.split("~");
				User user = new User();
				user.setId(rows[1]);
				user.setName(rows[2]);
				user.setEmail(rows[3]);
				System.out.println("上传用户:" + user);
				userService.insertUser(user);
			}
		} catch (IOException e) {

			e.printStackTrace();
		}

		return "success";

	}

	// 导出数据库表User所有数据
	@RequestMapping(value = "/exportExcelUser")
	public void exportExcelAttachment(String titleName,
			HttpServletResponse response) throws UnsupportedEncodingException {
		response.reset();
		// 创建工作表
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFCellStyle cellStyle = workbook.createCellStyle();
		response.setCharacterEncoding("utf-8");
		titleName = URLEncoder.encode(titleName,"utf-8");
		System.out.println(titleName);
		// 设置边框
		cellStyle.setBorderBottom(BorderStyle.THIN); // 下边框
		cellStyle.setBorderLeft(BorderStyle.THIN);// 左边框
		cellStyle.setBorderTop(BorderStyle.THIN);// 上边框
		cellStyle.setBorderRight(BorderStyle.THIN);// 右边框
		// 设置居中
		cellStyle.setAlignment(HorizontalAlignment.CENTER);
		HSSFFont font = workbook.createFont();
		font.setFontName("微软雅黑");
		font.setFontHeightInPoints((short) 10);// 设置字体大小
		cellStyle.setFont(font);// 选择需要用到的字体格式

		// 创建sheet
		HSSFSheet sheet = workbook.createSheet(titleName);
		// 创建sheet中的行
		HSSFRow row = sheet.createRow(0);
		// 创建sheet中的列
		HSSFCell[] cells = new HSSFCell[3];
		for (int i = 0; i < cells.length; i++) {
			cells[i] = row.createCell(i);
			// 设置第一行标题样式
			cells[i].setCellStyle(cellStyle);
		}

		// 设置表头信息
		cells[0].setCellValue("id");
		cells[1].setCellValue("name");
		cells[2].setCellValue("email");

		// 内容部分
		List<User> list = userService.queryAll();
		for (int i = 0; i < list.size(); i++) {
			HSSFRow row1 = sheet.createRow(i + 1);
			HSSFCell[] cells1 = new HSSFCell[3];
			for (int j = 0; j < cells1.length; j++) {
				cells1[j] = row1.createCell(j);
				cells1[j].setCellStyle(cellStyle);
			}
			User user = list.get(i);
			cells1[0].setCellValue(user.getId());
			cells1[1].setCellValue(user.getName());
			cells1[2].setCellValue(user.getEmail());

			for (int k = 0; k < list.size(); k++) {
				sheet.autoSizeColumn(k);
			}
			// 处理中文不能自动调整列宽的问题
			this.setSizeColumn(sheet, list.size());
		}
		// 创建流来写入文件
		ServletOutputStream outputStream = null;
		try {
			outputStream = response.getOutputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}
		response.setContentType("application/msexcel");
		response.setHeader("Content-Disposition",
				"attachment;filename=UserDetailsReport.xls");
		try {
			workbook.write(outputStream);
			outputStream.close();
			workbook.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	// 自适应宽度(中文支持)
	private void setSizeColumn(HSSFSheet sheet, int size) {
		for (int columnNum = 0; columnNum < size; columnNum++) {
			int columnWidth = sheet.getColumnWidth(columnNum) / 256;
			for (int rowNum = 0; rowNum < sheet.getLastRowNum(); rowNum++) {
				HSSFRow currentRow;
				// 当前行未被使用过
				if (sheet.getRow(rowNum) == null) {
					currentRow = sheet.createRow(rowNum);
				} else {
					currentRow = sheet.getRow(rowNum);
				}
				if (currentRow.getCell(columnNum) != null) {
					HSSFCell currentCell = currentRow.getCell(columnNum);
					if (currentCell.getCellType() == CellType.STRING) {
						int length = currentCell.getStringCellValue()
								.getBytes().length;
						if (columnWidth < length) {
							columnWidth = length;
						}
					}
				}
			}
			sheet.setColumnWidth(columnNum, columnWidth * 256);
		}
	}

}
