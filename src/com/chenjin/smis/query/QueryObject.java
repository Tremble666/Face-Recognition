package com.chenjin.smis.query;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;


//抽取出公共的查询对象作为父类
public class QueryObject implements IQuery {
	// 定义一个集合用来存取参数
	private List<Object> params = new ArrayList<>();

	// 定义一个集合用来存取条件
	private List<String> conditions = new ArrayList<>();
	
	//使用键值对保存排序的列名以及排序的规则（升序或者降序），采用LinkedHashMap记录添加顺序
	Map<String, String> orderByMap = new LinkedHashMap<>();

	// 拼接sql语句中的条件部分
	public String getQuery() {
		StringBuilder sql = new StringBuilder();
		
		//子类自己定制自己的条件和参数
		this.customizedQuery();

		// 现在conditions集合中存取的是where中的条件，遍历该集合，拼接sql
		for (int i = 0; i < conditions.size(); i++) {
			if (i == 0) {
				sql.append(" where ");
			} else {
				sql.append(" and ");
			}
			// 无论是不是第一个，都要将参数拼进去
			sql.append(conditions.get(i));
		}
		
		
		Set<Entry<String, String>> orderSet = orderByMap.entrySet();
		sql.append(" order by ");
		//判断集合是否为空
		if(orderByMap.size()>0){
			//遍历排序的map，拼接sql
			for (Entry<String, String> os : orderSet) {
				sql.append(os.getKey()).append(" ").append(os.getValue()).append(",");
			}
			sql.deleteCharAt(sql.length()-1);
		}
		return sql.toString();
	}

	// 返回参数集合
	public List<Object> getParams() {
		return this.params;
	}
	
	//允许子类自己定制自己的查询条件及查询参数
	protected void customizedQuery(){
	}
	
	//允许子类想条件和参数集合中添加相应的条件和参数
	protected void addQuery(String con,Object...par){
		conditions.add("("+con+")");
		params.addAll(Arrays.asList(par));
		System.out.println(params);
	}
	//判断字符串是否为空
	protected boolean haslength(String str) {
		return str != null && !"".equals(str.trim());
	}
	//枚举类，存储升序和降序
	enum orderBy{
		//ASC为升序，默认；DESC为降序
		ASC,DESC
	}
	public void setOrder(String columnName, orderBy asc) {
		orderByMap.put(columnName, asc.name());
	}
}
