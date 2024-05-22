package com.example.demo.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
@Mapper
@Repository
public interface FunctionRepository {

	@Insert("""
			INSERT INTO
			image SET
			regDate = NOW(),
			memberId = #{memberId},
			img = #{imageDataURL}
			""")
	public void saveImage(int memberId, String imageDataURL);

}
