package com.chenjin.smis.DMLTemplate;

import java.sql.ResultSet;

//瀹氫箟涓�涓鑼冭繘琛屽鐞嗙粨鏋滈泦
public interface IResultSetHandler<T> {
	public T handle(ResultSet rs) throws Exception;
}
