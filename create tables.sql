CREATE TABLE `smart5db`.`AC_EDU_CERT_INFO`
(
    `ac_edu_cert_info_no`    int(11)       NOT NULL AUTO_INCREMENT,
    `judge_no`               varchar(30)   CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '심판번호',
    `judge_name`             varchar(100)  CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '심판명',
    `judge_kind`             varchar(6)    CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '심판종목',
    `ac_edu_id`              varchar(20)   CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `ac_edu_cert_file_path`  varchar(400)  CHARACTER SET utf8 COLLATE utf8_general_ci,
    `reg_date`               datetime      NOT NULL COMMENT '등록일시',
    `reg_id`                 varchar(30)   CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `mod_date`               datetime,
    `mod_id`                 varchar(30)   CHARACTER SET utf8 COLLATE utf8_general_ci,
    `file_date`              datetime      COMMENT '파일 업로드 일시',
    `file_id`                varchar(30)   CHARACTER SET utf8 COLLATE utf8_general_ci,
    PRIMARY KEY (`ac_edu_cert_info_no`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=Dynamic AUTO_INCREMENT=2;


CREATE TABLE `smart5db`.`AC_EDU_SCHEDULE`
(
    `ac_edu_schedule_no`    int(11)       NOT NULL AUTO_INCREMENT,
    `ac_edu_id`             varchar(20)   CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `ac_edu_seq`            int(11)       NOT NULL,
    `ac_edu_title`          varchar(200)  CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `ac_edu_start_date`     varchar(14)   CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `ac_edu_end_date`       varchar(14)   CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `ac_edu_place`          varchar(400)  CHARACTER SET utf8 COLLATE utf8_general_ci,
    `ac_edu_contents`       text          CHARACTER SET utf8 COLLATE utf8_general_ci,
    `ac_apply_start_date`   varchar(14)   CHARACTER SET utf8 COLLATE utf8_general_ci,
    `ac_apply_end_date`     varchar(14)   CHARACTER SET utf8 COLLATE utf8_general_ci,
    `ac_apply_limit_count`  int(11)       NOT NULL DEFAULT 30,
    `ac_edu_institute`      varchar(100)  CHARACTER SET utf8 COLLATE utf8_general_ci,
    `reg_date`              datetime      NOT NULL COMMENT '등록일시',
    `reg_id`                varchar(30)   CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '등록자(관리자)',
    `mod_date`              datetime      COMMENT '수정일시',
    `mod_id`                varchar(30)   CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '수정자(관리자)',
    `ac_edu_url`            varchar(100)  CHARACTER SET utf8 COLLATE utf8_general_ci,
    PRIMARY KEY (`ac_edu_schedule_no`),
    CONSTRAINT `ac_edu_schedule_no_unique` UNIQUE (`ac_edu_schedule_no`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=Dynamic AUTO_INCREMENT=5;

CREATE TABLE `smart5db`.`ADMIN_INFO`
(
    `admin_id`        varchar(30)   CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `admin_pw`        varchar(600)  CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `admin_name`      varchar(100)  CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `admin_dept`      varchar(200)  CHARACTER SET utf8 COLLATE utf8_general_ci,
    `admin_etc_info`  varchar(400)  CHARACTER SET utf8 COLLATE utf8_general_ci,
    `use_yn`          char(1)       CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y',
    `reg_date`        datetime      NOT NULL,
    `reg_id`          varchar(30)   CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `mod_date`        datetime,
    `mod_id`          varchar(30)   CHARACTER SET utf8 COLLATE utf8_general_ci,
    PRIMARY KEY (`admin_id`, `use_yn`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=Dynamic;


CREATE TABLE `smart5db`.`COMMON_CODE`
(
    `common_code_no`   int(11)       NOT NULL AUTO_INCREMENT,
    `group_code`       varchar(6)    CHARACTER SET utf8 COLLATE utf8_general_ci,
    `group_code_name`  varchar(50)   CHARACTER SET utf8 COLLATE utf8_general_ci,
    `code`             varchar(6)    CHARACTER SET utf8 COLLATE utf8_general_ci,
    `code_name`        varchar(50)   CHARACTER SET utf8 COLLATE utf8_general_ci,
    `etc_info`         varchar(400)  CHARACTER SET utf8 COLLATE utf8_general_ci,
    `reg_id`           varchar(30)   CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `reg_date`         datetime      NOT NULL,
    `display_order`    int(11)       NOT NULL DEFAULT 1,
    PRIMARY KEY (`common_code_no`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=Dynamic AUTO_INCREMENT=43;

CREATE TABLE `smart5db`.`EDU_APPLY_INFO`
(
    `edu_apply_info_no`   int(11)       NOT NULL AUTO_INCREMENT COMMENT '교육신청ID',
    `judge_no`            varchar(30)   CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '심판번호(신청자)',
    `judge_name`          varchar(100)  CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '심판명(신청자)',
    `judge_kind`          varchar(6)    CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '심판종목(신청자)',
    `ac_edu_id`           varchar(20)   CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '아카데미교육ID',
    `state`               varchar(2)    CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '상태\n01 : 신청\n02 : 신청확정\n03 : 수료확정\n04 : 신청취소(관리자취소)\n05 : 미수료',
    `etc_info`            varchar(400)  CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '비고',
    `use_yn`              char(1)       CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '사용여부 Y : 사용 N : 삭제(신청자취소)',
    `reg_date`            datetime      NOT NULL COMMENT '등록일시',
    `reg_id`              varchar(30)   CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '등록자 : 일반적으로 JUDGE_NO와 동일',
    `mod_date`            datetime      COMMENT '수정일시',
    `mod_id`              varchar(30)   CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '수정자',
    `apply_confirm_date`  datetime      COMMENT '신청확정일시(관리자)',
    `apply_confirm_id`    varchar(30)   CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '신청확정자(관리자)',
    `cert_confirm_date`   datetime      COMMENT '수료확정일시',
    `cert_confirm_id`     varchar(30)   CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '수료확정자(관리자)',
    PRIMARY KEY (`edu_apply_info_no`),
    CONSTRAINT `id_unique` UNIQUE (`edu_apply_info_no`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=Dynamic AUTO_INCREMENT=3;

CREATE TABLE `smart5db`.`JUDGE_INFO`
(
    `judge_no`    varchar(30)   CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '심판번호',
    `judge_name`  varchar(100)  CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '심판명',
    `judge_kind`  varchar(6)    CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '심판종목',
    `reg_date`    datetime      NOT NULL COMMENT '등록일시',
    PRIMARY KEY (`judge_no`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=Dynamic;



