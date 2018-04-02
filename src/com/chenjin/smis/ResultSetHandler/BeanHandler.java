package com.chenjin.smis.ResultSetHandler;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.sql.ResultSet;

import com.chenjin.smis.DMLTemplate.IResultSetHandler;


//閫氱敤缁撴灉闆嗗鐞嗗櫒锛岀敤浜庡皢杩斿洖鐨勪竴琛屾暟鎹皝瑁呮垚涓�涓猨avaBean瀵硅薄
public class BeanHandler<T> implements IResultSetHandler<T> {
	private Class<T> classType;

	public BeanHandler(Class<T> classType) {
		this.classType = classType;
	}

	public T handle(ResultSet rs) throws Exception {
		if (rs.next()) {	
			T obj = classType.newInstance();
			BeanInfo beanInfo = Introspector.getBeanInfo(classType,Object.class);
			PropertyDescriptor[] pds = beanInfo.getPropertyDescriptors();
			for (PropertyDescriptor pd : pds) {
				String name = pd.getName();
				Field field = classType.getDeclaredField(name);
				Object value = rs.getObject(name);
				pd.getWriteMethod().invoke(obj,value);
			}
			return obj;
		}
		return null;
	}

}
