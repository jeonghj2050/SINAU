spackage com.sinau.dao;

import java.util.List;

import com.sinau.dto.WarningDto;

public interface WarningDao {

	//신고List
	 public List<WarningDto> getWaningList(String w_code);
		//신고 insert
	public void warningInsert(WarningDto warning);
	

}
