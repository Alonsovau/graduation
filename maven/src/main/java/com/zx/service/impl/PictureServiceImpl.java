package com.zx.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zx.dao.BaseDao;
import com.zx.model.Picture;
import com.zx.service.PictureServiceI;

@Service("pictureService")
public class PictureServiceImpl implements PictureServiceI{

	private BaseDao<Picture> pictureDao;
	@Autowired
	public void setPictureDao(BaseDao<Picture> pictureDao) {
		this.pictureDao = pictureDao;
	}

	@Override
	public boolean delete(Long pId) throws IOException {
		Picture picture=pictureDao.get(pId, Picture.class);
		Properties properties=new Properties();
		properties.load(getClass().getResourceAsStream("/config.properties"));
		String path=properties.get("uploadDirectory").toString();
		int begin=path.indexOf("UploadImage");
		String realPath=path+picture.getPath().substring(begin+1);
		File file=new File(realPath);
		if(file.exists())
			file.delete();
		pictureDao.delete(Picture.class, pId);
		return true;
	}

}
