package org.zerock.sample;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Setter;
import org.springframework.beans.factory.annotation.*;
import org.springframework.beans.factory.annotation.*;

@Component
@Data
public class Restaurant {
	
	@Setter(onMethod_ = @Autowired)
	private Chef chef;

}
