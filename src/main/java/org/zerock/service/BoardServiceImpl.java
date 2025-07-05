package org.zerock.service;

import java.util.List;

import org.junit.Test;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	private BoardMapper mapper;

	@Override
	public void register(BoardVO board) {

		log.info("register......" + board);

		mapper.insertSelectKey(board);
	}

	@Override
	public List<BoardVO> getList() {

		log.info("getList.......");

		return mapper.getList();
	}

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	}

	@Override
	private BoardVO get(Long bno) {

		log.info("get........" + bno);

		return mapper.read(bno);
	}

	@Test
	public void testGet() {

		log.info(Service.get(1L));
	}

	@Override
	public boolean modify(BoardVO board) {

		log.info("modify....." + board);

		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {

		log.info("removve....." + bno);

		return mapper.delete(bno) == 1;
	}
	
	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		
		log.info("get List with criteria: " + cri);
		
		return mapper.getListWithPaging(cri);
}
