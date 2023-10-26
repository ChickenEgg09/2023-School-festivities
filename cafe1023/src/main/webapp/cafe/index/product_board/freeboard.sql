connect scott/tiger

create table freeboard(
id		 number primary key,
name 		varchar2(20) not null,
password 	varchar2(20),
email 		varchar2(50),
subject	 	varchar2(100) not null,
content	 	clob not null,
inputdate 	date not null,
masterid 	number default 0,
readcount 	number default 0,
replynum 	number default 0,
step 		number default 0
);