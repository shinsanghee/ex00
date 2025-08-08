package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.zerock.domain.Criteria;

public class ReplyController {

	@GetMapping(value = "/pages/{bno}/{page}",
		produces = {
			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<ReplyVO>> getList(
		@PathVariable("page") int page,
		@PathVariable("bno") Long bno) {
		
	  log.info("getList..................");
	  Criteria cri = new Criteria(page, 10);
	  log.info(cri);
	  
	return new ResponseEntity<>(service.getList(cri, bno), HttpSttatus.OK);
	
	@GetMapping(value = "/pages/{rno",
			produces = { MediaType.APPLICATION_XML_VALUE,
						 MediaType.APPLICATION_JSON_UTF8_VALUE })
		public ResponseEntity<ReplyVO> get(@PathVariable("rno")Long rno)  {
		
			log.info("get: "  rno);
			
			return new ResponseEntity<>(service.get(gno), HttpStatus.OK);
		}
	
	@DeleteMapping(value= "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno){
		
		log.info("remove: " + rno);
		
		return service.remove(rno) == 1
		  ? new ResponseEntity<>("success", HttpStatus.OK)
		  : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {})
