package org.zerock.domain;

import java.util.ArrayList;
import java.util.List;

import org.zerock.sample.SampleDTO;

import lombok.Data;

@Data
public class SampleDTOList {
	
	private List<SampleDTO> list;
	
	public SampleDTOList() {
		list = new ArrayList<>();
	}
}
