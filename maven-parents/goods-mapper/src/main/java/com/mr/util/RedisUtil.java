package com.mr.util;

import redis.clients.jedis.Jedis;

public class RedisUtil {

	//连接redis
	private static final Jedis jedis = new Jedis("localhost");
	/*//授权
	static{
		jedis.auth("yyy");
	}*/
	
	/** <pre>setObject(向redis存储数据)   
	 * 创建人：YuanYuyin    
	 * 创建时间：2017年12月18日 上午11:06:00    
	 * 修改人：YuanYuyin     
	 * 修改时间：2017年12月18日 上午11:06:00    
	 * 修改备注： 
	 * @param key   存储的键
	 * @param value  存储的对象</pre>    
	 */
	public static void setObject(String key,Object value){
		jedis.set(key.getBytes(), SerializeUtils.serialize(value));
	}
	
	/** <pre>getObject(从redis中获取对象)   
	 * 创建人：YuanYuyin    
	 * 创建时间：2017年12月18日 上午11:08:39    
	 * 修改人：YuanYuyin     
	 * 修改时间：2017年12月18日 上午11:08:39    
	 * 修改备注： 
	 * @param key   存储的键
	 * @return</pre>    
	 */
	public static Object getObject(String key){
		byte[] bs = jedis.get(key.getBytes());
		Object object =null;
		if(bs!=null){
			object = SerializeUtils.deSerialize(bs);
		}
		return object;
	}
	//设置生命周期
	public static void setObjectLife(String key,Integer time){
		jedis.expire(key, time*60);
	}
}
