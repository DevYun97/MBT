-- 회원가입, 로그인, 로그아웃, 아이디 비밀번호 찾기, 아이디 중복
-- 게시판 글쓰기, 수정, 삭제

-- 유저 테이블
drop table mbd_user;
create table mbd_user (
    user_idx       number(4) primary key,
    user_id      varchar2(20),
    user_pw     varchar2(20),
    user_name   varchar2(20),
    user_nick_name   varchar2(20),
    user_email   varchar2(100),
    user_phone   varchar2(100),
    user_join      date default sysdate
);

COMMENT ON TABLE mbd_user IS '사용자정보';
COMMENT ON COLUMN mbd_user.user_idx IS '이용자등록번호';
COMMENT ON COLUMN mbd_user.user_id IS '이용자ID';
COMMENT ON COLUMN mbd_user.user_pw IS '이용자PW';
COMMENT ON COLUMN mbd_user.user_name IS '이용자이름';
COMMENT ON COLUMN mbd_user.user_nick_name IS '이용자별명';
COMMENT ON COLUMN mbd_user.user_email IS '이용자이메일';
COMMENT ON COLUMN mbd_user.user_phone IS '이용자전화번호';
COMMENT ON COLUMN mbd_user.user_join IS '이용자가입일';

create sequence mbd_user_seq;

insert into mbd_user (user_idx, user_id, user_pw, user_name, user_nick_name, user_email, user_phone, user_join) 
values (mbd_user_seq.nextval, 'admin', '1111', '관리자', '관리인', 'admin@test.com', '000-0000-0000', sysdate);
insert into mbd_user (user_idx, user_id, user_pw, user_name, user_nick_name, user_email, user_phone, user_join) 
values (mbd_user_seq.nextval, 'hong', '2222', '홍길동', '홍적홍적', 'hong@test.com', '000-0000-0000', sysdate);


-- 공지사항 테이블

create table mbd_notice (
    notice_idx       number(4) primary key,
    notice_title      varchar2(20),
    notice_contents     varchar2(20),
    notice_show   number(2),
    notice_date   date default sysdate
);

COMMENT ON TABLE mbd_notice IS '공지사항';
COMMENT ON COLUMN mbd_notice.notice_idx IS '공지사항번호';
COMMENT ON COLUMN mbd_notice.notice_title IS '공지제목';
COMMENT ON COLUMN mbd_notice.notice_contents IS '공지내용';
COMMENT ON COLUMN mbd_notice.notice_show IS '중요공지여부';
COMMENT ON COLUMN mbd_notice.notice_date IS '공지작성일';


create sequence mbd_notice_seq;

insert into mbd_notice (notice_idx, notice_title, notice_contents, notice_show, notice_date) 
values (mbd_notice_seq.nextval, '공지사항제목입니다 1', '공지사항 내용입니다1', '0', sysdate);
insert into mbd_notice (notice_idx, notice_title, notice_contents, notice_show, notice_date) 
values (mbd_notice_seq.nextval, '공지사항제목입니다 2', '공지사항 내용입니다2', '1', sysdate);


-- 문의하기

create table mbd_qna (
	qna_idx       number(4) primary key,
    user_idx       number(4) NOT NULL,
    qna_cat      number(4),
    qna_title    varchar2(50),
    qna_contents    varchar2(500),
    qna_date  		date default sysdate,
    qna_reply_check   number(4) DEFAULT 0,
    qna_reply   	varchar2(500),
    qna_reply_date      date default sysdate
);

COMMENT ON TABLE mbd_qna IS '문의사항';
COMMENT ON COLUMN mbd_qna.qna_idx IS '문의등록번호';
COMMENT ON COLUMN mbd_qna.user_idx IS '이용자등록번호';
COMMENT ON COLUMN mbd_qna.qna_cat IS '문의카테고리';
COMMENT ON COLUMN mbd_qna.qna_title IS '문의제목';
COMMENT ON COLUMN mbd_qna.qna_contents IS '문의내용';
COMMENT ON COLUMN mbd_qna.qna_date IS '문의작성일';
COMMENT ON COLUMN mbd_qna.qna_reply_check IS '문의답변여부';
COMMENT ON COLUMN mbd_qna.qna_reply IS '문의답변내용';
COMMENT ON COLUMN mbd_qna.qna_reply_date IS '문의답변작성일';


create sequence mbd_qna_seq;

insert into mbd_qna (qna_idx, user_idx, qna_cat, qna_title, qna_contents, qna_date, qna_reply_check, qna_reply, qna_reply_date) 
values (mbd_qna_seq.nextval, '','문의하기 제목입니다 1', '문의하기 내용입니다1', sysdate, 0, '', sysdate);

-- 자주하는 질문
drop table mbd_faq;
create table mbd_faq (
	faq_idx       number(4) primary key,
    faq_title       VARCHAR2(50),
    faq_contents     varchar2(500)
);

COMMENT ON TABLE mbd_faq IS '자주하는질문';
COMMENT ON COLUMN mbd_faq.faq_idx IS 'faq등록번호';
COMMENT ON COLUMN mbd_faq.faq_title IS 'faq제목';
COMMENT ON COLUMN mbd_faq.faq_contents IS 'faq내용';



create sequence mbd_faq_seq;

insert into mbd_qna (faq_idx, faq_title, faq_contents) 
values (mbd_qna_seq.nextval, '자주하는 질문 제목입니다 1', '자주하는 질문 내용입니다1');


-- 게시판 

drop table mbd_board;
create table mbd_board (
	board_idx       number(4) primary key,
    user_idx       number(4) NOT NULL,
    reply_idx      number(4),
    board_title    	varchar2(50),
    board_content   varchar2(500),
    board_hit  		number(4) default 0,
    board_data   	date default sysdate
);

COMMENT ON TABLE mbd_board IS '게시판';
COMMENT ON COLUMN mbd_board.board_idx IS '게시판등록번호';
COMMENT ON COLUMN mbd_board.board_title IS '게시판제목';
COMMENT ON COLUMN mbd_board.board_content IS '게시판내용';
COMMENT ON COLUMN mbd_board.board_hit IS '게시판조횟수';
COMMENT ON COLUMN mbd_board.board_data IS '게시판작성일';

create sequence mbd_board_seq;

-- 게시판 댓글 
drop table mbd_reply;
create table mbd_reply (
	reply_idx       number(4) primary key,
    user_idx       	number(4) NOT NULL,
    reply_content  	varchar2(500),
    reply_data    	date default sysdate
);

COMMENT ON TABLE mbd_reply IS '게시판댓글';
COMMENT ON COLUMN mbd_reply.reply_idx IS '댓글등록번호';
COMMENT ON COLUMN mbd_reply.reply_content IS '댓글내용';
COMMENT ON COLUMN mbd_reply.reply_data IS '댓글작성일';

create sequence mbd_reply_seq;

commit;