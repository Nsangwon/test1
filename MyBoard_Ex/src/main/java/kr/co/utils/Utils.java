package kr.co.utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.swing.plaf.synth.SynthOptionPaneUI;

import org.imgscalr.Scalr;
import org.springframework.http.MediaType;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class Utils {
	
	public static String rename(String oriName) {
		String newName = null;
		
		UUID uid = UUID.randomUUID();
		newName = uid.toString()+"_"+oriName;
		
		return newName;	
	}
	
	public static String makeDir(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int date = cal.get(Calendar.DATE);
		
		File f_year = new File(uploadPath, year+"");
		if (!f_year.exists()) {
			f_year.mkdir();
		}
		
		File f_month = new File(f_year, month<10? "0"+month:""+month);
		if (!f_month.exists()) {
			f_month.mkdir();
		}
		
		File f_date = new File(f_month, date<10? "0"+date:""+date);
		if (!f_date.exists()) {
			f_date.mkdir();
		}
		
		return f_date.getAbsolutePath();
	}
	
	public static String getPathFileName(String aPath, String newName) {
		int idx = aPath.indexOf("uploads") + "uploads".length();
		String pathFileName = aPath.substring(idx)+File.separator+newName;
		pathFileName = pathFileName.replace(File.separatorChar, '/');
		return pathFileName;
	}
	
	public static String getExtendName(String oriName) {
		int idx = oriName.lastIndexOf(".");
		return oriName.substring(idx+1);
	}
	
	public static MediaType getMediaType(String extendName) {
		//String extendName = getExtendName(filename);
		Map<String, MediaType> map = new HashMap<String, MediaType>();
		map.put("JPG", MediaType.IMAGE_JPEG);
		map.put("JPEG", MediaType.IMAGE_JPEG);
		map.put("PNG", MediaType.IMAGE_PNG);
		map.put("GIF", MediaType.IMAGE_GIF);
		
		
		return map.get(extendName.toUpperCase());
	}
	
	public static String makeThumbnamil(String aPath, String newName) throws Exception  {
		int idx = newName.indexOf("_");
		String thumbnailName = newName.substring(0, idx)+"_s"+newName.substring(idx);
		
		BufferedImage sourceImg= ImageIO.read(new File(aPath, newName));
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_EXACT,100);
		
		File f = new File(aPath, thumbnailName);
		
		String extendName = getExtendName(newName).toUpperCase();
		
		
		ImageIO.write(destImg, extendName, f);
		
		return getPathFileName(aPath, thumbnailName);
	}
	
	public static String uploadFile(String oriName, String uploadPath,
			MultipartFile file) throws Exception {
		String path = makeDir(uploadPath);
		String newName = rename(oriName);
		
		 File terget= new File(path, newName);
		 FileCopyUtils.copy(file.getBytes(), terget);
		 
		 String extendName = getExtendName(oriName);
		 MediaType mType = getMediaType(extendName);
		 
		 if(mType != null) {
			 return makeThumbnamil(path, newName);
		 }else {			
			 return getPathFileName(path, newName);
		}
		 
		
	}
	
	public static String getSystemfileName(String filename) {
		String name = null;
		int idx= filename.indexOf("_");
		String prefix= filename.substring(0, idx);
		String sffix= filename.substring(idx+2);
		name = prefix + sffix;
		
		return name;
	}


}
