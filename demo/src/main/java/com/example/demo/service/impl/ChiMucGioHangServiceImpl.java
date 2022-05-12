package com.example.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.ChiMucGioHang;
import com.example.demo.entities.GioHang;
import com.example.demo.entities.SanPham;
import com.example.demo.repository.ChiMucGioHangRepository;
import com.example.demo.service.ChiMucGioHangService;

@Service
public class ChiMucGioHangServiceImpl implements ChiMucGioHangService{
	
	@Autowired
	private ChiMucGioHangRepository repo;
	
	@Override
	public ChiMucGioHang getChiMucGioHangBySanPhamAndGioHang(SanPham sp,GioHang g)
	{
		return repo.findBySanPhamAndGioHang(sp,g);
	}
	
	@Override
	public ChiMucGioHang saveChiMucGiohang(ChiMucGioHang c)
	{
		return repo.save(c);
	}
	
	@Override
	public void deleteChiMucGiohang(ChiMucGioHang c)
	{
		repo.delete(c);
	}
	
	@Override
	public List<ChiMucGioHang> getChiMucGioHangByGioHang(GioHang g)
	{
		return repo.findByGioHang(g);
	}
	
	@Override
	public void deleteAllChiMucGiohang(List<ChiMucGioHang> c)
	{
		repo.deleteAll(c);
	}

//	@Override
//	public int findSoLuongBySanPhamAndGioHang(SanPham sp, GioHang g) {
//		return repo.findSoLuongBySanPhamAndGioHang(sp, g);
//	}
}
