package com.example.demo.service;

import com.example.demo.entities.GioHang;
import com.example.demo.entities.NguoiDung;

public interface GioHangService {
	
	GioHang getGioHangByNguoiDung(NguoiDung n);
	
	GioHang save(GioHang g);
}
