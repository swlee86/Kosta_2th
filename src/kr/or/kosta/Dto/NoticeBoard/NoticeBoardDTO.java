package kr.or.kosta.Dto.NoticeBoard;

import java.util.Date;

public class NoticeBoardDTO {
	String board_number = null;
	String board_writer = null;
	String board_title = null;
	String board_content = null;
	Date board_date = null;
	String board_file = null;
	String board_file_size = null;





	public NoticeBoardDTO(String board_writer, String board_title, String board_content, String board_file) {
		super();
		this.board_writer = board_writer;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_file = board_file;
	}
	
	public NoticeBoardDTO(String board_number, String board_title, String board_content, String board_file, String board_file_size) {
		super();
		this.board_number = board_number;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_file = board_file;
		this.board_file_size = board_file_size;
	}


	public NoticeBoardDTO(String board_number, String board_title, String board_content) {
		super();
		this.board_number = board_number;
		this.board_title = board_title;
		this.board_content = board_content;
	}


	public NoticeBoardDTO(String board_writer, String board_title, String board_content, Date board_date, String board_file,
			String board_file_size) {
		super();
		this.board_writer = board_writer;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_file = board_file;
		this.board_file_size = board_file_size;
	}


	public NoticeBoardDTO(String board_number, String board_writer, String board_title, String board_content, Date board_date, String board_file,
			String board_file_size) {
		super();
		this.board_number = board_number;
		this.board_writer = board_writer;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_file = board_file;
		this.board_file_size = board_file_size;
	}
	

	public String getboard_number() {
		return board_number;
	}
	public void setboard_number(String board_number) {
		this.board_number = board_number;
	}
	public String getboard_writer() {
		return board_writer;
	}
	public void setboard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public String getboard_title() {
		return board_title;
	}
	public void setboard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getboard_content() {
		return board_content;
	}
	public void setboard_content(String board_content) {
		this.board_content = board_content;
	}
	public Date getboard_date() {
		return board_date;
	}
	public void setboard_date(Date board_date) {
		this.board_date = board_date;
	}
	public String getboard_file() {
		return board_file;
	}
	public void setboard_file(String board_file) {
		this.board_file = board_file;
	}
	public String getboard_file_size() {
		return board_file_size;
	}
	public void setboard_file_size(String board_file_size) {
		this.board_file_size = board_file_size;
	}
	

	
}
