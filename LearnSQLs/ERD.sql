
CREATE TABLE Users
(
  UserID    INT(10)      NOT NULL COMMENT '회원번호',
  UserName  VARCHAR(255) NOT NULL COMMENT '회원이름',
  UserEmail VARCHAR(255) NULL     COMMENT '회원메일',
  PRIMARY KEY (UserID)
) COMMENT '사용자들';
