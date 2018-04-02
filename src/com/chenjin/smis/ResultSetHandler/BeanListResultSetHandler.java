package com.chenjin.smis.ResultSetHandler;
import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.chenjin.smis.DMLTemplate.IResultSetHandler;


public class BeanListResultSetHandler<T> implements IResultSetHandler<List<T>> {
	private Class<T> classType;

	public BeanListResultSetHandler(Class<T> classType) {
		this.classType = classType;
	}

	public List<T> handle(ResultSet rs) throws Exception {
		List<T> list = new ArrayList<>();
		while (rs.next()) {
			T obj = classType.newInstance();
			BeanInfo beanInfo = Introspector.getBeanInfo(classType,Object.class);
			PropertyDescriptor[] pds = beanInfo.getPropertyDescriptors();
			for (PropertyDescriptor pd : pds) {
				String name = pd.getName();
				Field field = classType.getDeclaredField(name);
				Object value = rs.getObject(name);
				pd.getWriteMethod().invoke(obj, value);
			}
			list.add(obj);
		}
		return list;
	}

}
