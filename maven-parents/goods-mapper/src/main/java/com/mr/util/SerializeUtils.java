package com.mr.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class SerializeUtils {
	/** <pre>serialize(序列化java对象 )   
	 * 创建人：YuanYuyin    
	 * 创建时间：2017年12月14日 下午5:02:26    
	 * 修改人：YuanYuyin     
	 * 修改时间：2017年12月14日 下午5:02:26    
	 * 修改备注： 
	 * @param obj   对象
	 * @return</pre>    
	 */
	public static byte[] serialize(Object obj){  
		byte[] bytes = null;  
		try {  
			ByteArrayOutputStream baos=new ByteArrayOutputStream();;  
			ObjectOutputStream oos=new ObjectOutputStream(baos);  
			oos.writeObject(obj);  
			bytes=baos.toByteArray();  
			baos.close();  
			oos.close();  
		} catch (IOException e) {  
		e.printStackTrace();  
		}  
		return bytes;  
		}  
		/** <pre>deSerialize(反序列化redis存储对象)   
		 * 创建人：YuanYuyin    
		 * 创建时间：2017年12月14日 下午5:02:46    
		 * 修改人：YuanYuyin     
		 * 修改时间：2017年12月14日 下午5:02:46    
		 * 修改备注： 
		 * @param bytes
		 * @return</pre>    
		 */
		public static Object deSerialize(byte[] bytes){  
		Object obj=null;  
		try {  
			ByteArrayInputStream bais=new ByteArrayInputStream(bytes);  
			ObjectInputStream ois=new ObjectInputStream(bais);  
			obj=ois.readObject();  
		} catch (Exception e) {  
		e.printStackTrace();  
		}  
		return obj;  
		}  
}
