package org.kosta.myproject.controller;

import java.util.List;
import java.util.Optional;

import org.kosta.myproject.entity.Member;
import org.kosta.myproject.repository.MemberRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;

@SuppressWarnings({ "unchecked", "rawtypes" })
@AllArgsConstructor
@RestController
public class MemberController {
	private final MemberRepository memberRepository;

	@GetMapping("/members")
	public List<Member> getAllMemberList() {
		return memberRepository.findAll();
	}

	@RequestMapping(value = "/members/{id}", method = RequestMethod.GET)
	public ResponseEntity findById(@PathVariable(value = "id") String id) throws Exception {
		Optional<Member> member = memberRepository.findById(id);
		if (member.isPresent())
			return new ResponseEntity(member.get(), HttpStatus.OK);
		else
			return new ResponseEntity("회원이 존재하지 않습니다", HttpStatus.NOT_FOUND);
	}

	@PostMapping(value = "/members")
	public ResponseEntity registerMember(Member member) {	
		
		if (memberRepository.existsById(member.getId())) {
			return new ResponseEntity("회원 아이디가 중복됩니다", HttpStatus.CONFLICT);
		}else {			
			memberRepository.save(member);
			return new ResponseEntity(member.getId() + " " + member.getName() + " 회원등록완료", HttpStatus.OK);
		}
	}

	@DeleteMapping("/members/{id}")
	public ResponseEntity deleteMember(@PathVariable String id) {
		System.out.println("Request Method : DELETE");
		if (memberRepository.existsById(id)) {
			memberRepository.deleteById(id);
			return new ResponseEntity(id + " id 회원정보삭제완료", HttpStatus.OK);
		} else {
			return new ResponseEntity(id + "회원 아이디에 대한 회원이 없어 삭제 불가", HttpStatus.NOT_FOUND);
		}
	}

	@PutMapping("/members")
	public ResponseEntity updateMember(Member member) {
		System.out.println("Request Method : PUT " + member);
		if (memberRepository.existsById(member.getId())) {
			memberRepository.save(member);
			return new ResponseEntity(member.getId() + " id 회원정보수정완료", HttpStatus.OK);			
		} else {
			return new ResponseEntity(member.getId() + "번 회원 아이디에 대한 회원이 없어 수정불가", HttpStatus.NOT_FOUND);
		}
	}
}
