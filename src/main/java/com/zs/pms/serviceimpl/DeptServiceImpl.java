package com.zs.pms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zs.pms.dao.DePtDao;
import com.zs.pms.po.TDep;
import com.zs.pms.service.DeptService;
@Service
public class DeptServiceImpl implements DeptService {

	@Autowired
	DePtDao ddao;
	public List<TDep> queryByPid(int pid) {
		
		return ddao.queryByPid(pid);
	}

}
