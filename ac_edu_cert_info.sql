/*ac_edu+cert_info*/
INSERT INTO AC_EDU_CERT_INFO(ac_edu_cert_info_no,judge_no,judge_name,judge_kind,ac_edu_id,ac_edu_cert_file_path,reg_date,reg_id,mod_date,mod_id,file_date,file_id) VALUES (1,'1234567890','심판일','100002','ihloLsf',NULL,'2022/04/06 01:18:08','admin','2022/04/06 07:20:15','admin',NULL,NULL);

/*ac_edu_schedule*/
INSERT INTO AC_EDU_SCHEDULE(ac_edu_schedule_no,ac_edu_id,ac_edu_seq,ac_edu_title,ac_edu_start_date,ac_edu_end_date,ac_edu_place,ac_edu_contents,ac_apply_start_date,ac_apply_end_date,ac_apply_limit_count,ac_edu_institute,reg_date,reg_id,mod_date,mod_id,ac_edu_url) VALUES (2,'ihloLsf',1,'테스트','20220406','20220406','','<p><br></p>','20220406','20220406',10,'','2022/04/06 01:14:00','admin',NULL,NULL,'');

/*admin_info*/
INSERT INTO ADMIN_INFO(admin_id,admin_pw,admin_name,admin_dept,admin_etc_info,use_yn,reg_date,reg_id,mod_date,mod_id) VALUES ('050011','050011','박종현',NULL,NULL,'Y','2022/04/06 07:12:38','admin',NULL,NULL);
INSERT INTO ADMIN_INFO(admin_id,admin_pw,admin_name,admin_dept,admin_etc_info,use_yn,reg_date,reg_id,mod_date,mod_id) VALUES ('20006','20006','정예슬',NULL,NULL,'Y','2022/04/06 07:12:38','admin',NULL,NULL);
INSERT INTO ADMIN_INFO(admin_id,admin_pw,admin_name,admin_dept,admin_etc_info,use_yn,reg_date,reg_id,mod_date,mod_id) VALUES ('admin','admin','관리자',NULL,NULL,'Y','2020/04/06 04:24:42','admin',NULL,NULL);

/*common_code*/
INSERT INTO COMMON_CODE(common_code_no,group_code,group_code_name,code,code_name,etc_info,reg_id,reg_date,display_order) VALUES (4,'100002','신청 진행상태','01','신청',NULL,'admin','2022/04/06 09:41:06',1);
INSERT INTO COMMON_CODE(common_code_no,group_code,group_code_name,code,code_name,etc_info,reg_id,reg_date,display_order) VALUES (5,'100002','신청 진행상태','02','신청확정',NULL,'admin','2022/04/06 09:41:06',2);
INSERT INTO COMMON_CODE(common_code_no,group_code,group_code_name,code,code_name,etc_info,reg_id,reg_date,display_order) VALUES (6,'100002','신청 진행상태','03','수료확정',NULL,'admin','2022/04/06 09:41:06',3);
INSERT INTO COMMON_CODE(common_code_no,group_code,group_code_name,code,code_name,etc_info,reg_id,reg_date,display_order) VALUES (7,'100002','신청 진행상태','04','신청취소',NULL,'admin','2022/04/06 09:41:06',4);
INSERT INTO COMMON_CODE(common_code_no,group_code,group_code_name,code,code_name,etc_info,reg_id,reg_date,display_order) VALUES (8,'100002','신청 진행상태','05','미수료',NULL,'admin','2022/04/06 09:41:06',5);
INSERT INTO COMMON_CODE(common_code_no,group_code,group_code_name,code,code_name,etc_info,reg_id,reg_date,display_order) VALUES (9,'100003','교육과정 상태','01','대기중',NULL,'admin','2022/04/06 06:23:33',1);
INSERT INTO COMMON_CODE(common_code_no,group_code,group_code_name,code,code_name,etc_info,reg_id,reg_date,display_order) VALUES (10,'100003','교육과정 상태','02','신청중',NULL,'admin','2022/04/06 06:23:33',2);
INSERT INTO COMMON_CODE(common_code_no,group_code,group_code_name,code,code_name,etc_info,reg_id,reg_date,display_order) VALUES (11,'100003','교육과정 상태','03','인원마감',NULL,'admin','2022/04/06 06:23:33',3);
INSERT INTO COMMON_CODE(common_code_no,group_code,group_code_name,code,code_name,etc_info,reg_id,reg_date,display_order) VALUES (12,'100003','교육과정 상태','04','종료',NULL,'admin','2022/04/06 06:23:33',4);
INSERT INTO COMMON_CODE(common_code_no,group_code,group_code_name,code,code_name,etc_info,reg_id,reg_date,display_order) VALUES (13,'100001','심판종목구분','100001','골볼','','admin','2022/04/06 09:23:09',1);
INSERT INTO COMMON_CODE(common_code_no,group_code,group_code_name,code,code_name,etc_info,reg_id,reg_date,display_order) VALUES (14,'100001','심판종목구분','100002','골프','','admin','2022/04/06 09:23:09',2);
INSERT INTO COMMON_CODE(common_code_no,group_code,group_code_name,code,code_name,etc_info,reg_id,reg_date,display_order) VALUES (15,'100001','심판종목구분','100003','노르딕스키','','admin','2022/04/06 09:23:09',3);
INSERT INTO COMMON_CODE(common_code_no,group_code,group_code_name,code,code_name,etc_info,reg_id,reg_date,display_order) VALUES (16,'100001','심판종목구분','100004','농구','','admin','2022/04/06 09:23:09',4),
(17,'100001','심판종목구분','100005','당구','','admin','2022/04/06 09:23:09',5),
(18,'100001','심판종목구분','100006','댄스스포츠','','admin','2022/04/06 09:23:09',6);
INSERT INTO COMMON_CODE(common_code_no,group_code,group_code_name,code,code_name,etc_info,reg_id,reg_date,display_order) VALUES (19,'100001','심판종목구분','100007','럭비','','admin','2022/04/06 09:23:09',7),
(20,'100001','심판종목구분','100008','론볼','','admin','2022/04/06 09:23:09',8),
(21,'100001','심판종목구분','100009','배구','','admin','2022/04/06 09:23:09',9),
(22,'100001','심판종목구분','100010','배드민턴','','admin','2022/04/06 09:23:09',10),
(23,'100001','심판종목구분','100011','보치아','','admin','2022/04/06 09:23:10',11),
(24,'100001','심판종목구분','100012','볼링','','admin','2022/04/06 09:23:10',12),
(25,'100001','심판종목구분','100013','사격','','admin','2022/04/06 09:23:10',13),
(26,'100001','심판종목구분','100014','사이클','','admin','2022/04/06 09:23:10',14),
(27,'100001','심판종목구분','100015','수영','','admin','2022/04/06 09:23:10',15),
(28,'100001','심판종목구분','100016','스키','','admin','2022/04/06 09:23:10',16),
(29,'100001','심판종목구분','100017','승마','','admin','2022/04/06 09:23:10',17),
(30,'100001','심판종목구분','100018','아이스하키','','admin','2022/04/06 09:23:10',18),
(31,'100001','심판종목구분','100019','양궁','','admin','2022/04/06 09:23:10',19),
(32,'100001','심판종목구분','100020','역도','','admin','2022/04/06 09:23:10',20),
(33,'100001','심판종목구분','100021','요트','','admin','2022/04/06 09:23:10',21),
(34,'100001','심판종목구분','100022','유도','','admin','2022/04/06 09:23:10',22),
(35,'100001','심판종목구분','100023','육상','','admin','2022/04/06 09:23:10',23),
(36,'100001','심판종목구분','100024','조정','','admin','2022/04/06 09:23:10',24),
(37,'100001','심판종목구분','100025','축구','','admin','2022/04/06 09:23:10',25),
(38,'100001','심판종목구분','100026','컬링','','admin','2022/04/06 09:23:10',26),
(39,'100001','심판종목구분','100027','탁구','','admin','2022/04/06 09:23:10',27),
(40,'100001','심판종목구분','100028','태권도','','admin','2022/04/06 09:23:10',28),
(41,'100001','심판종목구분','100029','테니스','','admin','2022/04/06 09:23:10',29),
(42,'100001','심판종목구분','100030','펜싱','','admin','2022/04/06 09:23:10',30);

/*edu_apply_info*/
INSERT INTO EDU_APPLY_INFO(edu_apply_info_no,judge_no,judge_name,judge_kind,ac_edu_id,state,etc_info,use_yn,reg_date,reg_id,mod_date,mod_id,apply_confirm_date,apply_confirm_id,cert_confirm_date,cert_confirm_id) VALUES (1,'1234567890','심판일','100002','ihloLsf','03',NULL,'Y','2022/04/06 01:17:14','1234567890','2022/04/26 07:20:02','admin','2022/04/06 01:18:08','admin','2022/04/06 07:20:15','admin');

/*judge_info*/
INSERT INTO JUDGE_INFO(judge_no,judge_name,judge_kind,reg_date) VALUES ('0033','정예슬','100001','2022/04/06 02:12:12');
INSERT INTO JUDGE_INFO(judge_no,judge_name,judge_kind,reg_date) VALUES ('123454','정효란','100001','2022/04/06 08:52:32');
INSERT INTO JUDGE_INFO(judge_no,judge_name,judge_kind,reg_date) VALUES ('1234567890','심판일','100002','2022/04/06 05:53:39');
INSERT INTO JUDGE_INFO(judge_no,judge_name,judge_kind,reg_date) VALUES ('123456790','심판일','100002','2022/04/06 05:44:03');
INSERT INTO JUDGE_INFO(judge_no,judge_name,judge_kind,reg_date) VALUES ('999999','테스트','100004','2022/04/06 09:03:32');




