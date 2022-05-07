package com.example.demo.service;

import java.util.List;
import java.util.Set;

import org.springframework.data.domain.Page;

import com.example.demo.dto.SanPhamDto;
import com.example.demo.dto.SearchSanPhamObject;
import com.example.demo.entities.SanPham;

public interface SanPhamService {
	
 List<SanPham> getLatestGiaDungSanPham();
 List<SanPham> getLatestThoiTrangSanPham();
 List<SanPham> getLatestDienTuSanPham();
	SanPham save(SanPhamDto sp);

	SanPham update(SanPhamDto sp);

	void deleteById(long id);

	Page<SanPham> getAllSanPhamByFilter(SearchSanPhamObject object, int page, int limit);

	SanPham getSanPhamById(long id);
	
	Iterable<SanPham> getSanPhamByTenSanPhamWithoutPaginate(SearchSanPhamObject object);
	
	Page<SanPham> getSanPhamByTenSanPham(SearchSanPhamObject object,int page, int resultPerPage);
	
	List<SanPham> getAllSanPhamByList(Set<Long> idList);
	
	Page<SanPham> getSanPhamByTenSanPhamForAdmin(String tenSanPham, int page, int size);
	
	Iterable<SanPham> getSanPhamByTenDanhMuc(String brand);
	
	public Page<SanPham> getSanPhamByBrand(SearchSanPhamObject object, int page, int resultPerPage);
}
