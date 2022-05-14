package com.example.demo.service;

import java.util.List;

import com.example.demo.entities.ChiMucGioHang;
import com.example.demo.entities.GioHang;
import com.example.demo.entities.SanPham;

public interface ChiMucGioHangService{
	
	List<ChiMucGioHang> getChiMucGioHangByGioHang(GioHang g);
	
	ChiMucGioHang getChiMucGioHangBySanPhamAndGioHang(SanPham sp,GioHang g);
	
	ChiMucGioHang saveChiMucGiohang(ChiMucGioHang c);
	
	void deleteChiMucGiohang(ChiMucGioHang c);
	
	void deleteAllChiMucGiohang(List<ChiMucGioHang> c);

//	int findSoLuongBySanPhamAndGioHang(SanPham sp,GioHang g);
}
