package com.javalec.ex.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.BDto;

@Repository
public interface BDao {
	//1. ��ɺ� ����
	//2. mapper.xml
	//3. ����
	//4. ���� ����
	//5. ��Ʈ�ѷ�
	
	//���� ����Ʈ �ҷ�����
	List<BDto> getAllBoards();
}
