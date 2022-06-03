-- 회원가입, 로그인, 로그아웃, 아이디 비밀번호 찾기, 아이디 중복
-- 게시판 글쓰기, 수정, 삭제

-- 유저 테이블
drop table mbt_user;
create table mbt_user (
    user_idx       number(4) primary key,
    user_id      varchar2(50),
    user_pw     varchar2(50),
    user_name   varchar2(50),
    user_email   varchar2(100),
    user_phone   varchar2(100),
    user_rank   varchar2(10),
    useYN   	varchar2(10) default 'Y',
    user_join      date default sysdate,
    user_address  varchar2(100)
);

COMMENT ON TABLE mbt_user IS '사용자정보';
COMMENT ON COLUMN mbt_user.user_idx IS '이용자등록번호';
COMMENT ON COLUMN mbt_user.user_id IS '이용자ID';
COMMENT ON COLUMN mbt_user.user_pw IS '이용자PW';
COMMENT ON COLUMN mbt_user.user_name IS '이용자이름';
COMMENT ON COLUMN mbt_user.user_email IS '이용자이메일';
COMMENT ON COLUMN mbt_user.user_phone IS '이용자전화번호';
COMMENT ON COLUMN mbt_user.user_rank IS '이용자등급';
COMMENT ON COLUMN mbt_user.useYN IS '회원유지여부';
COMMENT ON COLUMN mbt_user.user_join IS '이용자가입일';

create sequence mbt_user_seq;

-- 공지사항 테이블

create table mbt_notice (
    notice_idx       number(4) primary key,
    notice_title      varchar2(20),
    notice_contents     varchar2(20),
    notice_show   	number(2),
    notice_date   date default sysdate
);

COMMENT ON TABLE mbt_notice IS '공지사항';
COMMENT ON COLUMN mbt_notice.notice_idx IS '공지사항번호';
COMMENT ON COLUMN mbt_notice.notice_title IS '공지제목';
COMMENT ON COLUMN mbt_notice.notice_contents IS '공지내용';
COMMENT ON COLUMN mbt_notice.notice_show IS '중요공지여부';
COMMENT ON COLUMN mbt_notice.notice_date IS '공지작성일';

create sequence mbt_notice_seq;

-- 문의하기

create table mbt_qna (
	qna_idx       number(4) primary key,
    qna_user       varchar2(50) NOT NULL,
    qna_cat      number(4),
    qna_title    varchar2(50),
    qna_contents    varchar2(500),
    qna_date  		date default sysdate,
    qna_reply_check   number(4) DEFAULT 0,
    qna_reply   	varchar2(500),
    qna_reply_date      date default sysdate
);

COMMENT ON TABLE mbt_qna IS '문의사항';
COMMENT ON COLUMN mbt_qna.qna_idx IS '문의등록번호';
COMMENT ON COLUMN mbt_qna.qna_user IS '이용자등록번호';
COMMENT ON COLUMN mbt_qna.qna_cat IS '문의카테고리';
COMMENT ON COLUMN mbt_qna.qna_title IS '문의제목';
COMMENT ON COLUMN mbt_qna.qna_contents IS '문의내용';
COMMENT ON COLUMN mbt_qna.qna_date IS '문의작성일';
COMMENT ON COLUMN mbt_qna.qna_reply_check IS '문의답변여부';
COMMENT ON COLUMN mbt_qna.qna_reply IS '문의답변내용';
COMMENT ON COLUMN mbt_qna.qna_reply_date IS '문의답변작성일';


create sequence mbt_qna_seq;

-- 자주하는 질문
drop table mbt_faq;
create table mbt_faq (
	faq_idx       number(4) primary key,
    faq_title       VARCHAR2(50),
    faq_contents     varchar2(500)
);

COMMENT ON TABLE mbt_faq IS '자주하는질문';
COMMENT ON COLUMN mbt_faq.faq_idx IS 'faq등록번호';
COMMENT ON COLUMN mbt_faq.faq_title IS 'faq제목';
COMMENT ON COLUMN mbt_faq.faq_contents IS 'faq내용';

create sequence mbt_faq_seq;

-- 게시판 

drop table mbt_board;
create table mbt_board (
	board_idx       number(4) primary key,
    board_user       varchar2(50),
    board_title    	varchar2(50),
    board_content   varchar2(500),
    board_hit  		number(20) default 0,
    board_data   	date default sysdate
);

COMMENT ON TABLE mbt_board IS '게시판';
COMMENT ON COLUMN mbt_board.board_idx IS '게시판등록번호';
COMMENT ON COLUMN mbt_board.board_title IS '게시판제목';
COMMENT ON COLUMN mbt_board.board_content IS '게시판내용';
COMMENT ON COLUMN mbt_board.board_hit IS '게시판조횟수';
COMMENT ON COLUMN mbt_board.board_data IS '게시판작성일';

create sequence mbt_board_seq;

-- 게시판 댓글 
drop table mbt_reply;
create table mbt_reply (
	reply_idx       number(4) primary key,
    reply_user      varchar2(50),
    board_idx		number(4),
    reply_content  	varchar2(500),
    reply_data    	date default sysdate
);

COMMENT ON TABLE mbt_reply IS '게시판댓글';
COMMENT ON COLUMN mbt_reply.reply_idx IS '댓글등록번호';
COMMENT ON COLUMN mbt_reply.board_idx IS '게시글댓글번호';
COMMENT ON COLUMN mbt_reply.reply_user IS '댓글작성자';
COMMENT ON COLUMN mbt_reply.reply_content IS '댓글내용';
COMMENT ON COLUMN mbt_reply.reply_data IS '댓글작성일';

create sequence mbt_reply_seq;

commit;