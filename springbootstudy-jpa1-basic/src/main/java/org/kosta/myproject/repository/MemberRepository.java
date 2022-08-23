package org.kosta.myproject.repository;

import java.util.List;

import org.kosta.myproject.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
/*
  JpaRepository<Entity, 기본키 타입> 을 상속받으면(extends하면) 
  기본적인 Create, Read, Update, Delete 메서드가 자동으로 생성
  junit 으로 테스트 해본다 
  
  https://docs.spring.io/spring-data/jpa/docs/current/api/org/springframework/data/jpa/repository/JpaRepository.html
 */
@Repository
public interface MemberRepository extends JpaRepository<Member, String>{
	//findBy 뒤에 컬럼을 붙여주면 이를 이용해 SELECT 가 가능 
	public List<Member> findByName(String name);
	public List<Member> findByAddress(String address);
	public List<Member> findByNameLike(String name);
	public List<Member> findByNameLikeAndAddressLike(String name, String address);
	
}
