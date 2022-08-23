package org.kosta.myproject.test;

import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.kosta.myproject.entity.Member;
import org.kosta.myproject.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
class SpringbootstudyJpa1ApplicationTests {

	@Autowired
	private MemberRepository memberRepository;

	@Test
	void contextLoads() {

		log.info(memberRepository.getClass().getName());// Proxy 구현체가 실행
		// Entity Member class가 로딩되면서 table 생성되어 있음
	}

	/*
	 * JPA에서 기본으로 제공하는 메서드를 테스트 해본다
	 * https://docs.spring.io/spring-data/jpa/docs/current/api/org/springframework/
	 * data/jpa/repository/JpaRepository.html
	 */
	@Test
	void insertMember() {
		// CREATE -> insert : save ( 기본 제공 메서드 )
		log.info("insert member {}", memberRepository.save(new Member("rest", "a", "레스트", "캐나다")));
		log.info("insert member {}", memberRepository.save(new Member("jpa", "a", "이택조", "제주")));
	}

	@Test
	void memberCount() {
		// 총 회원수
		log.info("총 회원수 {}명", memberRepository.count());
	}

	@Test
	void existsById() {
		// pk 존재유무
		log.info("id 존재유무 {}", memberRepository.existsById("jpa"));
	}

	@Test
	void findAll() {
		// READ -> select : findAll() 전체리스트 조회
		List<Member> list = memberRepository.findAll();
		for (Member m : list)
			log.info("member {} ", m);
	}

	@Test
	void findById() {
		// pk로 검색
		Optional<Member> m = memberRepository.findById("jpa");
		log.info("jpa id member {}", m.get());
		// Optional get() 메서드는 존재하지 않으면 NoSuchElementException 발생시킨다
	}
	@Test
	void updateMember() {
		// 객체의 속성값을 변경해서 save 호출하면 update가 된다
		Member um = memberRepository.findById("jpa").get();
		log.info("update 전 정보 {}" , um);
		um.updateInfo("김영남", "수지");
		memberRepository.save(um);
		log.info("update후 정보 {}" , memberRepository.findById("jpa").get());
	}
	@Test
	void deleteMemberById() {		
		memberRepository.deleteById("jpa");
		log.info("delete result jpa id member {}",memberRepository.existsById("jpa"));		
	}
	
	@Test
	void methodJpaTest() {
		/*
		 * 직접 정의한 메서드 테스트 : MemberRepository 를 확인해본다 
		 */
		// log.info("findByAddress {}",memberRepository.findByAddress("캐나다"));
		// Like Test
		// log.info("findByNameLike {}",memberRepository.findByNameLike("%트%"));
		 log.info("findByNameLikeAndAddressLike {}",memberRepository.findByNameLikeAndAddressLike("%트%","%다%"));
	}
}
