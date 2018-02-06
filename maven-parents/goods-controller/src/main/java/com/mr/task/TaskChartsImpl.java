package com.mr.task;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class TaskChartsImpl implements TaskCharts{

	@Scheduled(cron="0/5 * * * * ? ") // 每 5 秒执行一次
	@Override
	public void createCharts() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println("生成时间为："+sdf.format(new Date()));
	}

}
