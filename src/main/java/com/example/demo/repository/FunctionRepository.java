package com.example.demo.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
@Mapper
@Repository
public interface FunctionRepository {

	@Insert("""
			INSERT INTO
			image SET
			regDate = NOW(),
			imageData = #{imageData},
			memberId = 1
			""")
	public void saveImage(byte[] imageData);

	@Select("""
			SELECT imageData
			FROM image
			WHERE memberId = 1
			""")
	public String getImageUrl();

}
