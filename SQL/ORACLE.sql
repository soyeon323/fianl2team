
-- USER
DROP TABLE "USER" CASCADE CONSTRAINTS;
CREATE TABLE "USER" (
	"NO"	NUMBER		NOT NULL,
	"DEPARTMENT_NO"	NUMBER		NOT NULL,
	"RANK_NO"	NUMBER		NOT NULL,
	"POSITION_NO"	NUMBER		NOT NULL,
	"STATE_NO"	NUMBER		NOT NULL,
	"AGENT"	NUMBER		NULL,
	"DIVISION_NO"	NUMBER		NOT NULL,
	"ID"	VARCHAR2(100)		NOT NULL,
	"PWD"	VARCHAR2(100)		NOT NULL,
	"NAME"	VARCHAR2(20)		NOT NULL,
	"GENDER"	CHAR(1)		NOT NULL,
	"BIRTH_DATE"	CHAR(8)		NOT NULL,
	"PROFILE"	VARCHAR2(300)		NULL,
	"LINE_INTRO"	VARCHAR2(300)		NULL,
	"ADDRESS"	VARCHAR2(300)		NOT NULL,
	"PHONE"	VARCHAR2(20)		NOT NULL,
	"MAIL"	VARCHAR2(100)		NOT NULL,
	"REGISTRATION_DATE"	CHAR(8)		NOT NULL,
	"LEAVE_REASON"	VARCHAR2(500)		NULL,
	"LEAVE_DATE"	CHAR(8)		NULL,
	"OFFICE_NUMBER"	CHAR(11)		NULL,
	"LEAVE_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"CAPACITY"	NUMBER	DEFAULT 500	NOT NULL
);

-- ADMIN
DROP TABLE "ADMIN" CASCADE CONSTRAINTS;
CREATE TABLE "ADMIN" (
	"NO"	NUMBER		NOT NULL,
	"ID"	VARCHAR2(100)		NOT NULL,
	"PWD"	VARCHAR2(100)		NOT NULL,
	"POWER"	CHAR(1)		NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'O'	NOT NULL
);

-- SUGGESTION
DROP TABLE "SUGGESTION" CASCADE CONSTRAINTS;
CREATE TABLE "SUGGESTION" (
	"NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"TITLE"	VARCHAR2(100)		NOT NULL,
	"CONTENT"	VARCHAR2(1000)		NOT NULL,
	"ENROLL_DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'O'	NOT NULL,
	"HIT"	NUMBER	DEFAULT 0	NOT NULL,
	"MODIFY_DATE"	TIMESTAMP		NULL,
	"ORIGIN_NAME"	VARCHAR2(500)		NULL,
	"CHANGE_NAME"	VARCHAR2(500)		NULL,
	"COMMNET_YN"	CHAR(1)	DEFAULT 'Y'	NULL,
	"RIGHTCLICK_YN"	CHAR(1)	DEFAULT 'Y'	NULL,
	"BOARD_LIMIT"	NUMBER	DEFAULT 0	NULL
);

-- CALENDAR
DROP TABLE "CALENDAR" CASCADE CONSTRAINTS;
CREATE TABLE "CALENDAR" (
	"NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"TYPE_NO"	NUMBER		NOT NULL,
	"REV_NO"	NUMBER		NULL,
	"TITLE"	VARCHAR2(100)		NOT NULL,
	"CONTENT"	VARCHAR2(500)		NULL,
	"START_TIME"	TIMESTAMP		NOT NULL,
	"END_TIME"	TIMESTAMP		NOT NULL,
	"PLACE"	VARCHAR2(100)		NULL,
	"STATUS"	NUMBER	DEFAULT 0	NOT NULL
);

-- RANK
DROP TABLE "RANK" CASCADE CONSTRAINTS;
CREATE TABLE "RANK" (
	"NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(10)		NULL
);

-- POSITION
DROP TABLE "POSITION" CASCADE CONSTRAINTS;
CREATE TABLE "POSITION" (
	"NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(10)		NULL
);

-- NOTICE
DROP TABLE "NOTICE" CASCADE CONSTRAINTS;
CREATE TABLE "NOTICE" (
	"NO"	NUMBER	NOT NULL,
	"ADMIN_NO"	NUMBER		NOT NULL,
	"CATEGORY_NO"	NUMBER		NOT NULL,
	"TITLE"	VARCHAR2(100)		NOT NULL,
	"CONTENT"	VARCHAR2(4000)		NOT NULL,
	"ENOLLDATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'O'	NOT NULL,
	"ORIGIN_NAME"	VARCHAR2(500)		NULL,
	"CHANGE_NAME"	VARCHAR2(500)		NULL,
	"RIGHTCLICK_YN"	CHAR(1)	DEFAULT 'Y'	NULL,
	"COMMNET_YN"	CHAR(1)	DEFAULT 'Y'	NULL,
	"BOARD_LIMIT"	NUMBER	DEFAULT 0	NULL
);

-- USER_STATE
DROP TABLE "USER_STATE" CASCADE CONSTRAINTS;
CREATE TABLE "USER_STATE" (
	"NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(30)		NULL
);

-- PROJECT
DROP TABLE "PROJECT" CASCADE CONSTRAINTS;
CREATE TABLE "PROJECT" (
	"NO"	NUMBER		NOT NULL,
	"TITLE"	VARCHAR2(500)		NOT NULL,
	"CONTENT"	VARCHAR2(1000)		NOT NULL,
	"START_DATE"	TIMESTAMP		NOT NULL,
	"END_DATE"	TIMESTAMP		NOT NULL,
	"TEAM_NAME"	VARCHAR2(100)		NOT NULL
);

-- DEPARTMENT
DROP TABLE "DEPARTMENT" CASCADE CONSTRAINTS;
CREATE TABLE "DEPARTMENT" (
	"NO"	NUMBER		NOT NULL,
	"LOWER_DEPARTMENT_NO"	NUMBER		NULL,
	"NAME"	VARCHAR2(10)		NULL
);

-- ELECTRONIC_APPROVAL
DROP TABLE "ELECTRONIC_APPROVAL" CASCADE CONSTRAINTS;
CREATE TABLE "ELECTRONIC_APPROVAL" (
	"NO"	NUMBER		NOT NULL,
	"DRAFTER"	NUMBER		NOT NULL,
	"CATEGORY_NO"	NUMBER		NOT NULL,
	"REQUEST_DATE"	TIMESTAMP		NOT NULL,
	"TITLE"	VARCHAR(300)		NOT NULL
);

-- ATTENDANCE
DROP TABLE "ATTENDANCE" CASCADE CONSTRAINTS;
CREATE TABLE "ATTENDANCE" (
	"NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"CURRENT_NO"	NUMBER		NOT NULL,
	"ENROLLDATE"	TIMESTAMP	DEFAULT SYSDATE	NULL,
	"CHECK_IN_TIME"	TIMESTAMP	DEFAULT SYSDATE	NULL,
	"CHECK_OUT_TIME"	TIMESTAMP	DEFAULT SYSDATE	NULL,
	"PLUS_WORK_TIME"	TIMESTAMP		NULL,
	"TOTAL_WORK_TIME"	TIMESTAMP		NULL,
	"OBJECTION_REASON"	VARCHAR2(500)		NULL,
	"APPROVAL_STATUS"	NUMBER	DEFAULT 0	NULL
);

-- NOTICE_CATEGORY
DROP TABLE "NOTICE_CATEGORY" CASCADE CONSTRAINTS;
CREATE TABLE "NOTICE_CATEGORY" (
	"NO"	NUMBER	NOT NULL,
	"NAME"	VARCHAR2(100)		NOT NULL
);

-- APPROVER
DROP TABLE "APPROVER" CASCADE CONSTRAINTS;
CREATE TABLE "APPROVER" (
	"NO"	NUMBER		NOT NULL,
	"APPROVAL_NO"	NUMBER		NOT NULL,
	"APPROVAL_STATE"	NUMBER		NOT NULL,
	"APPROVER_NO"	NUMBER		NOT NULL,
	"NEXT_APPROVAER_NO"	NUMBER		NULL,
	"APPROVAL_DATE"	CHAR(8)		NULL
);

-- ANIMAL
DROP TABLE "ANIMAL" CASCADE CONSTRAINTS;
CREATE TABLE "ANIMAL" (
	"NO"	NUMBER		NOT NULL,
	"CATEGORY_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"DEPARTMONT_NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(100)		NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'O'	NOT NULL,
	"DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL,
	"FEILD"	VARCHAR2(100)		NOT NULL
);

-- APPROVAL_CATEGORY
DROP TABLE "APPROVAL_CATEGORY" CASCADE CONSTRAINTS;
CREATE TABLE "APPROVAL_CATEGORY" (
	"NO"	NUMBER		NOT NULL,
	"AUTHORITY_RANK_NO"	NUMBER		NOT NULL,
	"CATEOGORY"	VARCHAR2(30)		NOT NULL,
	"FORM"	VARCHAR2(4000)		NOT NULL
);

-- ANIMAL_TRAINING
DROP TABLE "ANIMAL_TRAINING" CASCADE CONSTRAINTS;
CREATE TABLE "ANIMAL_TRAINING" (
	"TRAINING_NO"	NUMBER	NOT NULL,
	"NO"	NUMBER		NOT NULL,
	"TITLE"	VARCHAR2(100)		NOT NULL,
	"DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL,
	"CONTENT"	VARCHAR2(4000)		NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'O'	NOT NULL
);

-- REPLY
DROP TABLE "REPLY" CASCADE CONSTRAINTS;
CREATE TABLE "REPLY" (
	"NO"	NUMBER		NOT NULL,
	"SUGGESTION"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"CONTENT"	VARCHAR2(500)		NOT NULL,
	"ENROLL_DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL,
	"MODIFY_DATE"	TIMESTAMP		NULL,
	"STATUS"	CHAR(1)	DEFAULT 'X'	NOT NULL
);

-- ANIMAL_HEALTH_SCREENING
DROP TABLE "ANIMAL_HEALTH_SCREENING" CASCADE CONSTRAINTS;
CREATE TABLE "ANIMAL_HEALTH_SCREENING" (
	"NO"	NUMBER		NOT NULL,
	"ANIMAL_NO"	NUMBER	NOT NULL,
	"STATE_OF_HEALTH"	VARCHAR2(1000)		NOT NULL,
	"CHECKUP_DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL,
	"CONTENT"	VARCHAR2(4000)		NULL,
    "DISEASE"	VARCHAR2(400)		NULL,
	"LIFE_STYLE_MANAGEMENT"	VARCHAR2(4000)		NULL
);

-- MAIL
DROP TABLE "MAIL" CASCADE CONSTRAINTS;
CREATE TABLE "MAIL" (
	"NO"	NUMBER		NOT NULL,
	"SENDER"	NUMBER		NOT NULL,
	"PREV_NO"	NUMBER		NOT NULL,
	"NO2"	NUMBER		NOT NULL,
	"TITLE"	VARCHAR2(100)		NULL,
	"CONTENT"	VARCHAR2(3000)		NOT NULL,
	"SEND_DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL
);

-- MAIL RECIPIENT
DROP TABLE "MAIL RECIPIENT" CASCADE CONSTRAINTS;
CREATE TABLE "MAIL RECIPIENT" (
	"MAIL_NO"	NUMBER		NOT NULL,
	"RECEIVER_NO"	NUMBER		NOT NULL,
	"READ_CHECK"	CHAR(1)	DEFAULT 'X'	NOT NULL,
	"BOOKMARK_CHECK"	CHAR(1)	DEFAULT 'X'	NULL,
	"DELETE_CHECK"	CHAR(1)	DEFAULT 'X'	NULL
);

-- MAIL_CC
DROP TABLE "MAIL_CC" CASCADE CONSTRAINTS;
CREATE TABLE "MAIL_CC" (
	"MAIL_NO"	NUMBER		NOT NULL,
	"CC_NO"	NUMBER		NOT NULL,
	"BCC_CHECK"	CHAR(1)	DEFAULT 'X'	NOT NULL
);

-- MAIL_ATTATCHMENT
DROP TABLE "MAIL_ATTATCHMENT" CASCADE CONSTRAINTS;
CREATE TABLE "MAIL_ATTATCHMENT" (
	"NO"	NUMBER		NOT NULL,
	"MAIL_NO"	NUMBER		NOT NULL,
	"ORIGIN_NAME"	VARCHAR2(100)		NOT NULL,
	"CHANGE_NAME"	VARCHAR2(100)		NOT NULL
);

-- APPROVAL_CC
DROP TABLE "APPROVAL_CC" CASCADE CONSTRAINTS;
CREATE TABLE "APPROVAL_CC" (
	"NO"	NUMBER		NOT NULL,
	"CC_NO"	NUMBER		NOT NULL
);

-- APPROVAL_STATE
DROP TABLE "APPROVAL_STATE" CASCADE CONSTRAINTS;
CREATE TABLE "APPROVAL_STATE" (
	"NO"	NUMBER		NOT NULL,
	"STATE_NAME"	VARCHAR2(9)		NOT NULL
);

-- BOARD
DROP TABLE "BOARD" CASCADE CONSTRAINTS;
CREATE TABLE "BOARD" (
	"NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"NO2"	NUMBER		NOT NULL,
	"TITLE"	VARCHAR2(100)		NOT NULL,
	"CONTENT"	VARCHAR2(4000)		NOT NULL,
	"ENOLL_DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL,
	"MODIFY_DATE"	TIMESTAMP		NULL,
	"STATUS"	CHAR(1)	DEFAULT 'O'	NOT NULL,
	"FILE"	VARCHAR2(4000)		NULL
);

-- CALENDAR_TYPE
DROP TABLE "CALENDAR_TYPE" CASCADE CONSTRAINTS;
CREATE TABLE "CALENDAR_TYPE" (
	"NO"	NUMBER		NOT NULL,
	"TYPE"	VARCHAR2(100)		NOT NULL
);


-- BOARD_REPLY
DROP TABLE "BOARD_REPLY" CASCADE CONSTRAINTS;
CREATE TABLE "BOARD_REPLY" (
	"NO"	NUMBER		NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL,
	"NO2"	NUMBER		NOT NULL,
	"COMMENT"	VARCHAR2(4000)		NOT NULL,
	"CLASS"	NUMBER		NOT NULL,
	"GROUP"	NUMBER		NOT NULL,
	"ENOLLDATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'O'	NOT NULL
);

-- ATTENDANCE_CURRENT
DROP TABLE "ATTENDANCE_CURRENT" CASCADE CONSTRAINTS;
CREATE TABLE "ATTENDANCE_CURRENT" (
	"NO"	NUMBER		NOT NULL,
	"TYPE"	VARCHAR2(100)		NOT NULL
);

-- LEAVE
DROP TABLE "LEAVE" CASCADE CONSTRAINTS;
CREATE TABLE "LEAVE" (
	"NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"LEAVE_NO"	NUMBER		NOT NULL,
	"PROXY_NO"	NUMBER		NOT NULL,
	"ENROLLDATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL,
	"REASON_CONTENT"	VARCHAR2(500)		NOT NULL,
	"START_TIME"	TIMESTAMP		NOT NULL,
	"END_TIME"	TIMESTAMP		NOT NULL
);

-- DRIVE
DROP TABLE "DRIVE" CASCADE CONSTRAINTS;
CREATE TABLE "DRIVE" (
	"NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"CAT_NO"	NUMBER		NULL,
	"STATUS"	CHAR(1)	DEFAULT 'O'	NOT NULL
);

-- CATEGORY
DROP TABLE "CATEGORY" CASCADE CONSTRAINTS;
CREATE TABLE "CATEGORY" (
	"CATEGORY_NO"	VARCHAR2(10)		NOT NULL,
	"CLASS_NO"	NUMBER		NOT NULL,
	"TASTE_NO"	NUMBER		NOT NULL,
	"HABITAT_NO"	NUMBER		NOT NULL,
	"ENDANGERED_RATING_NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(100)		NOT NULL
);

-- DRIVE_CATEGORY
DROP TABLE "DRIVE_CATEGORY" CASCADE CONSTRAINTS;
CREATE TABLE "DRIVE_CATEGORY" (
	"NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(100)		NOT NULL
);

-- LEAVE_TYPE
DROP TABLE "LEAVE_TYPE" CASCADE CONSTRAINTS;
CREATE TABLE "LEAVE_TYPE" (
	"NO"	NUMBER		NOT NULL,
	"TYPE"	VARCHAR2(100)		NOT NULL
);

-- MAILBOX
DROP TABLE "MAILBOX" CASCADE CONSTRAINTS;
CREATE TABLE "MAILBOX" (
	"NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(100)	DEFAULT '������'	NOT NULL
);

-- MAIL_IMAGE
DROP TABLE "MAIL_IMAGE" CASCADE CONSTRAINTS;
CREATE TABLE "MAIL_IMAGE" (
	"NO"	NUMBER		NOT NULL,
	"MAIL_NO"	NUMBER		NOT NULL,
	"ORIGIN_NAME"	VARCHAR2(100)		NULL,
	"CHAGE_NAME"	VARCHAR2(100)		NULL
);

-- WORK
DROP TABLE "WORK" CASCADE CONSTRAINTS;
CREATE TABLE "WORK" (
	"NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(100)		NOT NULL,
	"CONTENT"	VARCHAR2(4000)		NOT NULL,
	"DATE"	TIMESTAMP		NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'X'	NOT NULL
);

-- ANMAL_CLASSIFICATION
DROP TABLE "ANIMAL_CLASSIFICATION" CASCADE CONSTRAINTS;
CREATE TABLE "ANIMAL_CLASSIFICATION" (
	"NO"	NUMBER	NOT NULL,
	"NAME"	VARCHAR2(100)		NOT NULL
);

-- PROJECT_TEAM_MEMBER
DROP TABLE "PROJECT_TEAM_MEMBER" CASCADE CONSTRAINTS;
CREATE TABLE "PROJECT_TEAM_MEMBER" (
	"USER_NO"	NUMBER		NOT NULL,
	"NO2"	NUMBER		NOT NULL
);

-- PROJECT_TODO
DROP TABLE "PROJECT_TODO" CASCADE CONSTRAINTS;
CREATE TABLE "PROJECT_TODO" (
	"NO"	NUMBER		NOT NULL,
	"PROJECT_NO"	NUMBER		NOT NULL,
	"START_DATE"	TIMESTAMP		NULL,
	"END_DATE"	TIMESTAMP		NULL
);

-- TODO_LIST
DROP TABLE "TODO_LIST" CASCADE CONSTRAINTS;
CREATE TABLE "TODO_LIST" (
	"NO"	NUMBER		NOT NULL,
	"PROJECT_NO"	NUMBER		NOT NULL,
	"CONTENT"	VARCHAR2(1000)		NOT NULL
);

-- MEETINGROOM
DROP TABLE "MEETINGROOM" CASCADE CONSTRAINTS;
CREATE TABLE "MEETINGROOM" (
	"NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(50)		NOT NULL,
	"INFO"	VARCHAR2(500)		NOT NULL,
	"ENROLLDATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL,
	"MODIFYDATE"	TIMESTAMP	DEFAULT SYSDATE	NULL,
	"STATUS"	CHAR(1)	DEFAULT 'O'	NOT NULL,
	"ORIGIN_NAME"	VARCHAR2(500)		NULL,
	"CHANGE_NAME"	VARCHAR2(500)		NULL,
	"CAPACITY"	NUMBER		NOT NULL
);

-- MEETINGROOM_RESERVATION
DROP TABLE "MEETINGROOM_RESERVATION" CASCADE CONSTRAINTS;
CREATE TABLE "MEETINGROOM_RESERVATION" (
	"NO"	NUMBER		NOT NULL,
	"MEETINGROOM_NO"	NUMBER		NOT NULL,
	"DATE"	TIMESTAMP		NOT NULL,
	"START_TIME"	TIMESTAMP		NOT NULL,
	"END_TIME"	TIMESTAMP		NOT NULL,
	"STATUS"	NUMBER	DEFAULT 0	NOT NULL
);

-- TASTE
DROP TABLE "TASTE" CASCADE CONSTRAINTS;
CREATE TABLE "TASTE" (
	"TASTE_NO"	NUMBER		NOT NULL,
	"TASTE"	VARCHAR2(100)		NOT NULL
);

-- HABITAT
DROP TABLE "HABITAT" CASCADE CONSTRAINTS;
CREATE TABLE "HABITAT" (
	"HABITAT_NO"	NUMBER		NOT NULL,
	"HABITAT"	VARCHAR2(100)		NOT NULL
);

-- ENDANGERED_RATING
DROP TABLE "ENDANGERED_RATING" CASCADE CONSTRAINTS;
CREATE TABLE "ENDANGERED_RATING" (
	"ENDANGERED_RATING_NO"	NUMBER		NOT NULL,
	"ENDANGERED"	VARCHAR2(100)		NOT NULL
);

-- AGENT
DROP TABLE "AGENT" CASCADE CONSTRAINTS;
CREATE TABLE "AGENT" (
	"NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL
);

-- WORK_CHECKLIST
DROP TABLE "WORK_CHECKLIST" CASCADE CONSTRAINTS;
CREATE TABLE "WORK_CHECKLIST" (
	"NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(100)		NOT NULL,
	"STATE"	CHAR(1)	DEFAULT 'X'	NOT NULL
);

-- VOTE
DROP TABLE "VOTE" CASCADE CONSTRAINTS;
CREATE TABLE "VOTE" (
	"NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"TITLE"	VARCHAR2(4000)		NOT NULL,
	"GUIDE"	VARCHAR2(4000)		NULL,
	"IMG_PATH"	VARCHAR2(4000)		NULL,
	"DATE"	TIMESTAMP		NULL,
	"RESULTS_REVEAL"	CHAR(1)	DEFAULT 'O'	NOT NULL,
	"MULTIPLE_CHOICE"	CHAR(1)	DEFAULT 'X'	NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'X'	NULL,
	"QUESTION"	VARCHAR2(4000)		NOT NULL
);

-- VOTING_ITEM
DROP TABLE "VOTING_ITEM" CASCADE CONSTRAINTS;
CREATE TABLE "VOTING_ITEM" (
	"NO"	NUMBER		NOT NULL,
	"VOTE_NO"	NUMBER		NOT NULL,
	"ITEM"	VARCHAR2(4000)		NULL
);

-- APPROVAL_ATTACHMENT
DROP TABLE "APPROVAL_ATTACHMENT" CASCADE CONSTRAINTS;
CREATE TABLE "APPROVAL_ATTACHMENT" (
	"NO"	NUMBER		NOT NULL,
	"APPROVAL_NO"	NUMBER		NOT NULL,
	"ORIGIN_NAME"	VARCHAR2(100)		NULL,
	"CHANGE_NAME"	VARCHAR2(100)		NULL
);

-- LETTER_OF_APPROVAL
DROP TABLE "LETTER_OF_APPROVAL" CASCADE CONSTRAINTS;
CREATE TABLE "LETTER_OF_APPROVAL" (
	"NO"	NUMBER		NOT NULL,
	"APPROVAL_NO"	NUMBER		NOT NULL,
	"CONTENT"	VARCHAR2(4000)		NOT NULL,
	"INSTRUCTION"	VARCHAR2(4000)		NULL
);

-- APPLICATION_FOR_LEAVE
DROP TABLE "APPLICATION_FOR_LEAVE" CASCADE CONSTRAINTS;
CREATE TABLE "APPLICATION_FOR_LEAVE" (
	"NO"	NUMBER		NOT NULL,
	"APPROVAL_NO"	NUMBER		NOT NULL,
	"TYPE_NO"	NUMBER		NOT NULL,
	"REASON"	VARCHAR2(3000)		NOT NULL,
	"FROM"	VARCHAR2(10)		NOT NULL,
	"TO"	VARCHAR2(10)		NOT NULL
);

-- CASH_DISBURSEMENT_VOUCHER
DROP TABLE "CASH_DISBURSEMENT_VOUCHER" CASCADE CONSTRAINTS;
CREATE TABLE "CASH_DISBURSEMENT_VOUCHER" (
	"NO"	NUMBER		NOT NULL,
	"APPROVAL_NO"	NUMBER		NOT NULL
);

-- EXPENSE_DETAIL
DROP TABLE "EXPENSE_DETAIL" CASCADE CONSTRAINTS;
CREATE TABLE "EXPENSE_DETAIL" (
	"NO"	NUMBER		NOT NULL,
	"Field"	VARCHAR2(300)		NOT NULL,
	"DETAIL"	VARCHAR2(300)		NOT NULL,
	"AMOUNT"	NUMBER		NOT NULL,
	"NOTE"	VARCHAR2(300)		NULL
);

-- EXPENSE_RECEIPT
DROP TABLE "EXPENSE_RECEIPT" CASCADE CONSTRAINTS;
CREATE TABLE "EXPENSE_RECEIPT" (
	"NO"	NUMBER		NOT NULL,
	"RECEIPT"	VARCHAR2(100)		NULL
);

-- CHEATING_ROOM
DROP TABLE "CHEATING_ROOM" CASCADE CONSTRAINTS;
CREATE TABLE "CHEATING_ROOM" (
	"NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(100)		NOT NULL,
	"ENROLL_DATE"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL,
	"STATUS"	CHAR(1)		NOT NULL
);

-- CHATTING_MESSAGE
DROP TABLE "CHATTING_MESSAGE" CASCADE CONSTRAINTS;
CREATE TABLE "CHATTING_MESSAGE" (
	"NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"ROOM_NO"	NUMBER		NOT NULL,
	"CONTENT"	VARCHAR2(1000)		NOT NULL,
	"SEND_TIME"	TIMESTAMP	DEFAULT SYSDATE	NOT NULL
);

-- SURVEY
DROP TABLE "SURVEY" CASCADE CONSTRAINTS;
CREATE TABLE "SURVEY" (
	"NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"TITLE"	VARCHAR2(4000)		NOT NULL,
	"GUIDE"	VARCHAR2(4000)		NULL,
	"DATE"	TIMESTAMP		NULL,
	"STATUS"	CHAR(1)	DEFAULT 'X'	NOT NULL,
	"RESULTS_REVEAL"	CHAR(1)	DEFAULT 'O'	NOT NULL
);

-- SURVEY_QUESTION
DROP TABLE "SURVEY_QUESTION" CASCADE CONSTRAINTS;
CREATE TABLE "SURVEY_QUESTION" (
	"NO"	NUMBER		NOT NULL,
	"SURVEY_NO"	NUMBER		NOT NULL,
	"TYPE_NO"	NUMBER		NOT NULL,
	"QUESTION"	VARCHAR2(4000)		NOT NULL,
	"GROUP"	NUMBER		NULL,
	"ESSENTIAL"	CHAR(1)	DEFAULT 'X'	NOT NULL
);

-- SURVEY_HISTORY
DROP TABLE "SURVEY_HISTORY" CASCADE CONSTRAINTS;
CREATE TABLE "SURVEY_HISTORY" (
	"NO"	NUMBER		NULL,
	"SURVEY_USER_NO"	NUMBER		NOT NULL,
	"SURVEY_NO"	NUMBER		NOT NULL,
	"QUESTION_NO"	NUMBER		NOT NULL,
	"TEXT_ANSWER"	VARCHAR2(4000)		NULL,
	"SELECT_ANSWER"	NUMBER		NULL,
	"SCORE_ANSWER"	NUMBER		NULL
);

-- EMPLOY_DIVISION
DROP TABLE "EMPLOY_DIVISION" CASCADE CONSTRAINTS;
CREATE TABLE "EMPLOY_DIVISION" (
	"NO"	NUMBER		NOT NULL,
	"EMPLOY_DIVISION"	CHAR(6)		NULL
);

-- CURROPTION_SURVEY_QUESTION
DROP TABLE "CURROPTION_SURVEY_QUESTION" CASCADE CONSTRAINTS;
CREATE TABLE "CURROPTION_SURVEY_QUESTION" (
	"NO"	NUMBER		NOT NULL,
	"CONTENT"	VARCHAR2(100)		NOT NULL
);

-- QUESTION_TYPE
DROP TABLE "QUESTION_TYPE" CASCADE CONSTRAINTS;
CREATE TABLE "QUESTION_TYPE" (
	"NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(9)		NOT NULL
);

-- BOARD_CATEGORY
DROP TABLE "BOARD_CATEGORY" CASCADE CONSTRAINTS;
CREATE TABLE "BOARD_CATEGORY" (
	"NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(50)		NOT NULL
);

-- APPLICATION_FOR_EXTRA_WORK
DROP TABLE "APPLICATION_FOR_EXTRA_WORK" CASCADE CONSTRAINTS;
CREATE TABLE "APPLICATION_FOR_EXTRA_WORK" (
	"NO"	NUMBER		NOT NULL,
	"APPROVAL_NO"	NUMBER		NOT NULL,
	"CATEGORY_NO"	NUMBER		NOT NULL,
	"DATE"	CHAR(8)		NOT NULL,
	"START_TIME"	CHAR(4)		NOT NULL,
	"END_TIME"	CHAR(4)		NOT NULL,
	"REASON"	VARCHAR2(900)		NOT NULL
);

-- EXTRA_WORK_CATEGORY
DROP TABLE "EXTRA_WORK_CATEGORY" CASCADE CONSTRAINTS;
CREATE TABLE "EXTRA_WORK_CATEGORY" (
	"NO"	NUMBER		NOT NULL,
	"CATEGORY"	CHAR(6)		NULL
);

-- APPROVAL_PASSIVE_SETTING
DROP TABLE "APPROVAL_PASSIVE_SETTING" CASCADE CONSTRAINTS;
CREATE TABLE "APPROVAL_PASSIVE_SETTING" (
	"CATEGORY_NO"	NUMBER		NOT NULL,
	"RANK_NO"	NUMBER		NOT NULL,
	"ON_OFF"	CHAR(1)	DEFAULT 'X'	NOT NULL
);

-- VOTING_HISTORY
DROP TABLE "VOTING_HISTORY" CASCADE CONSTRAINTS;
CREATE TABLE "VOTING_HISTORY" (
	"NO"	NUMBER		NOT NULL,
	"VOTE_NO"	NUMBER		NOT NULL,
	"VOTER_NO"	NUMBER		NOT NULL,
	"ITEM_NO"	NUMBER		NOT NULL
);

-- SURVEY_ITEM
DROP TABLE "SURVEY_ITEM" CASCADE CONSTRAINTS;
CREATE TABLE "SURVEY_ITEM" (
	"NO"	NUMBER		NOT NULL,
	"SURVEY_NO"	NUMBER		NOT NULL,
	"ITEM"	VARCHAR2(4000)		NULL
);

-- CURROPTION_SURVEY_USER
DROP TABLE "CURROPTION_SURVEY_USER" CASCADE CONSTRAINTS;
CREATE TABLE "CURROPTION_SURVEY_USER" (
	"NO"	NUMBER		NOT NULL,
	"SURVEY_NO"	NUMBER		NOT NULL
);

-- RESEARCH
DROP TABLE "RESEARCH" CASCADE CONSTRAINTS;
CREATE TABLE "RESEARCH" (
	"NO"	NUMBER		NOT NULL,
	"TOTAL_SCORE"	NUMBER		NULL
);

-- DIRECTORY
DROP TABLE "DIRECTORY" CASCADE CONSTRAINTS;
CREATE TABLE "DIRECTORY" (
	"NO"	NUMBER		NOT NULL,
	"DRIVE_NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(4000)		NULL,
	"ENOLL_DATE"	TIMESTAMP		NOT NULL,
	"MODIFY_DATE"	TIMESTAMP		NULL,
	"STATUS"	CHAR(1)	DEFAULT 'X'	NOT NULL
);


-- PK 
ALTER TABLE "USER" ADD CONSTRAINT "PK_USER" PRIMARY KEY (
	"NO"
);

ALTER TABLE "ADMIN" ADD CONSTRAINT "PK_ADMIN" PRIMARY KEY (
	"NO"
);

ALTER TABLE "SUGGESTION" ADD CONSTRAINT "PK_SUGGESTION" PRIMARY KEY (
	"NO"
);

ALTER TABLE "CALENDAR" ADD CONSTRAINT "PK_CALENDAR" PRIMARY KEY (
	"NO"
);

ALTER TABLE "RANK" ADD CONSTRAINT "PK_RANK" PRIMARY KEY (
	"NO"
);

ALTER TABLE "POSITION" ADD CONSTRAINT "PK_POSITION" PRIMARY KEY (
	"NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"NO"
);

ALTER TABLE "USER_STATE" ADD CONSTRAINT "PK_USER_STATE" PRIMARY KEY (
	"NO"
);

ALTER TABLE "PROJECT" ADD CONSTRAINT "PK_PROJECT" PRIMARY KEY (
	"NO"
);

ALTER TABLE "DEPARTMENT" ADD CONSTRAINT "PK_DEPARTMENT" PRIMARY KEY (
	"NO"
);

ALTER TABLE "ELECTRONIC_APPROVAL" ADD CONSTRAINT "PK_ELECTRONIC_APPROVAL" PRIMARY KEY (
	"NO"
);

ALTER TABLE "ATTENDANCE" ADD CONSTRAINT "PK_ATTENDANCE" PRIMARY KEY (
	"NO"
);

ALTER TABLE "NOTICE_CATEGORY" ADD CONSTRAINT "PK_NOTICE_CATEGORY" PRIMARY KEY (
	"NO"
);

ALTER TABLE "APPROVER" ADD CONSTRAINT "PK_APPROVER" PRIMARY KEY (
	"NO"
);

ALTER TABLE "ANIMAL" ADD CONSTRAINT "PK_ANIMAL" PRIMARY KEY (
	"NO"
);

ALTER TABLE "APPROVAL_CATEGORY" ADD CONSTRAINT "PK_APPROVAL_CATEGORY" PRIMARY KEY (
	"NO"
);

ALTER TABLE "ANIMAL_TRAINING" ADD CONSTRAINT "PK_ANIMAL_TRAINING" PRIMARY KEY (
	"TRAINING_NO"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "PK_REPLY" PRIMARY KEY (
	"NO"
);

ALTER TABLE "ANIMAL_HEALTH_SCREENING" ADD CONSTRAINT "PK_ANIMAL_HEALTH_SCREENING" PRIMARY KEY (
	"NO"
);

ALTER TABLE "MAIL" ADD CONSTRAINT "PK_MAIL" PRIMARY KEY (
	"NO"
);

ALTER TABLE "MAIL_ATTATCHMENT" ADD CONSTRAINT "PK_MAIL_ATTATCHMENT" PRIMARY KEY (
	"NO"
);

ALTER TABLE "APPROVAL_STATE" ADD CONSTRAINT "PK_APPROVAL_STATE" PRIMARY KEY (
	"NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"NO"
);

ALTER TABLE "CALENDAR_TYPE" ADD CONSTRAINT "PK_CALENDAR_TYPE" PRIMARY KEY (
	"NO"
);

ALTER TABLE "BOARD_REPLY" ADD CONSTRAINT "PK_BOARD_REPLY" PRIMARY KEY (
	"NO",
	"BOARD_NO",
	"NO2"
);

ALTER TABLE "ATTENDANCE_CURRENT" ADD CONSTRAINT "PK_ATTENDANCE_CURRENT" PRIMARY KEY (
	"NO"
);

ALTER TABLE "LEAVE" ADD CONSTRAINT "PK_LEAVE" PRIMARY KEY (
	"NO"
);

ALTER TABLE "DRIVE" ADD CONSTRAINT "PK_DRIVE" PRIMARY KEY (
	"NO",
	"USER_NO"
);

ALTER TABLE "CATEGORY" ADD CONSTRAINT "PK_CATEGORY" PRIMARY KEY (
	"CATEGORY_NO"
);

ALTER TABLE "DRIVE_CATEGORY" ADD CONSTRAINT "PK_DRIVE_CATEGORY" PRIMARY KEY (
	"NO"
);

ALTER TABLE "LEAVE_TYPE" ADD CONSTRAINT "PK_LEAVE_TYPE" PRIMARY KEY (
	"NO"
);

ALTER TABLE "MAILBOX" ADD CONSTRAINT "PK_MAILBOX" PRIMARY KEY (
	"NO"
);

ALTER TABLE "MAIL_IMAGE" ADD CONSTRAINT "PK_MAIL_IMAGE" PRIMARY KEY (
	"NO"
);

ALTER TABLE "WORK" ADD CONSTRAINT "PK_WORK" PRIMARY KEY (
	"NO"
);

ALTER TABLE "ANIMAL_CLASSIFICATION" ADD CONSTRAINT "PK_ANMAL_CLASSIFICATION" PRIMARY KEY (
	"NO"
);

ALTER TABLE "PROJECT_TODO" ADD CONSTRAINT "PK_PROJECT_TODO" PRIMARY KEY (
	"NO"
);

ALTER TABLE "TODO_LIST" ADD CONSTRAINT "PK_TODO_LIST" PRIMARY KEY (
	"NO"
);

ALTER TABLE "MEETINGROOM" ADD CONSTRAINT "PK_MEETINGROOM" PRIMARY KEY (
	"NO"
);

ALTER TABLE "MEETINGROOM_RESERVATION" ADD CONSTRAINT "PK_MEETINGROOM_RESERVATION" PRIMARY KEY (
	"NO"
);

ALTER TABLE "TASTE" ADD CONSTRAINT "PK_TASTE" PRIMARY KEY (
	"TASTE_NO"
);

ALTER TABLE "HABITAT" ADD CONSTRAINT "PK_HABITAT" PRIMARY KEY (
	"HABITAT_NO"
);

ALTER TABLE "ENDANGERED_RATING" ADD CONSTRAINT "PK_ENDANGERED_RATING" PRIMARY KEY (
	"ENDANGERED_RATING_NO"
);

ALTER TABLE "VOTE" ADD CONSTRAINT "PK_VOTE" PRIMARY KEY (
	"NO",
	"USER_NO"
);

ALTER TABLE "VOTING_ITEM" ADD CONSTRAINT "PK_VOTING_ITEM" PRIMARY KEY (
	"NO"
);

ALTER TABLE "APPROVAL_ATTACHMENT" ADD CONSTRAINT "PK_APPROVAL_ATTACHMENT" PRIMARY KEY (
	"NO"
);

ALTER TABLE "LETTER_OF_APPROVAL" ADD CONSTRAINT "PK_LETTER_OF_APPROVAL" PRIMARY KEY (
	"NO"
);

ALTER TABLE "APPLICATION_FOR_LEAVE" ADD CONSTRAINT "PK_APPLICATION _FOR_LEAVE" PRIMARY KEY (
	"NO"
);

ALTER TABLE "CASH_DISBURSEMENT_VOUCHER" ADD CONSTRAINT "PK_CASH_DISBURSEMENT_VOUCHER" PRIMARY KEY (
	"NO"
);

ALTER TABLE "CHEATING_ROOM" ADD CONSTRAINT "PK_CHEATING_ROOM" PRIMARY KEY (
	"NO"
);

ALTER TABLE "CHATTING_MESSAGE" ADD CONSTRAINT "PK_CHATTING_MESSAGE" PRIMARY KEY (
	"NO"
);

ALTER TABLE "SURVEY" ADD CONSTRAINT "PK_SURVEY" PRIMARY KEY (
	"NO",
	"USER_NO"
);

ALTER TABLE "SURVEY_QUESTION" ADD CONSTRAINT "PK_SURVEY_QUESTION" PRIMARY KEY (
	"NO",
	"SURVEY_NO"
);

ALTER TABLE "SURVEY_HISTORY" ADD CONSTRAINT "PK_SURVEY_HISTORY" PRIMARY KEY (
	"NO"
);

ALTER TABLE "EMPLOY_DIVISION" ADD CONSTRAINT "PK_EMPLOY_DIVISION" PRIMARY KEY (
	"NO"
);

ALTER TABLE "CURROPTION_SURVEY_QUESTION" ADD CONSTRAINT "PK_CURROPTION_SURVEY_QUESTION" PRIMARY KEY (
	"NO"
);

ALTER TABLE "QUESTION_TYPE" ADD CONSTRAINT "PK_QUESTION_TYPE" PRIMARY KEY (
	"NO"
);

ALTER TABLE "BOARD_CATEGORY" ADD CONSTRAINT "PK_BOARD_CATEGORY" PRIMARY KEY (
	"NO"
);

ALTER TABLE "APPLICATION_FOR_EXTRA_WORK" ADD CONSTRAINT "PK_APPLICATION_FOR_EXTRA_WORK" PRIMARY KEY (
	"NO"
);

ALTER TABLE "EXTRA_WORK_CATEGORY" ADD CONSTRAINT "PK_EXTRA_WORK_CATEGORY" PRIMARY KEY (
	"NO"
);

ALTER TABLE "VOTING_HISTORY" ADD CONSTRAINT "PK_VOTING_HISTORY" PRIMARY KEY (
	"NO"
);

ALTER TABLE "SURVEY_ITEM" ADD CONSTRAINT "PK_SURVEY_ITEM" PRIMARY KEY (
	"NO",
	"SURVEY_NO"
);

ALTER TABLE "RESEARCH" ADD CONSTRAINT "PK_RESEARCH" PRIMARY KEY (
	"NO"
);

ALTER TABLE "DIRECTORY" ADD CONSTRAINT "PK_DIRECTORY" PRIMARY KEY (
	"NO"
);

ALTER TABLE "USER" ADD CONSTRAINT "FK_DEPARTMENT_TO_USER_1" FOREIGN KEY (
	"DEPARTMENT_NO"
)
REFERENCES "DEPARTMENT" (
	"NO"
);

ALTER TABLE "USER" ADD CONSTRAINT "FK_RANK_TO_USER_1" FOREIGN KEY (
	"RANK_NO"
)
REFERENCES "RANK" (
	"NO"
);

ALTER TABLE "USER" ADD CONSTRAINT "FK_POSITION_TO_USER_1" FOREIGN KEY (
	"POSITION_NO"
)
REFERENCES "POSITION" (
	"NO"
);

ALTER TABLE "USER" ADD CONSTRAINT "FK_USER_STATE_TO_USER_1" FOREIGN KEY (
	"STATE_NO"
)
REFERENCES "USER_STATE" (
	"NO"
);

ALTER TABLE "USER" ADD CONSTRAINT "FK_USER_TO_USER_1" FOREIGN KEY (
	"AGENT"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "USER" ADD CONSTRAINT "FK_EMPLOY_DIVISION_TO_USER_1" FOREIGN KEY (
	"DIVISION_NO"
)
REFERENCES "EMPLOY_DIVISION" (
	"NO"
);

ALTER TABLE "SUGGESTION" ADD CONSTRAINT "FK_USER_TO_SUGGESTION_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "CALENDAR" ADD CONSTRAINT "FK_USER_TO_CALENDAR_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "CALENDAR" ADD CONSTRAINT "FK_CALENDAR_TYPE_TO_CALENDAR_1" FOREIGN KEY (
	"TYPE_NO"
)
REFERENCES "CALENDAR_TYPE" (
	"NO"
);

ALTER TABLE "CALENDAR" ADD CONSTRAINT "FK_MEETINGROOM_RESERVATION_TO_CALENDAR_1" FOREIGN KEY (
	"REV_NO"
)
REFERENCES "MEETINGROOM_RESERVATION" (
	"NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "FK_ADMIN_TO_NOTICE_1" FOREIGN KEY (
	"ADMIN_NO"
)
REFERENCES "ADMIN" (
	"NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "FK_NOTICE_CATEGORY_TO_NOTICE_1" FOREIGN KEY (
	"CATEGORY_NO"
)
REFERENCES "NOTICE_CATEGORY" (
	"NO"
);

ALTER TABLE "DEPARTMENT" ADD CONSTRAINT "FK_DEPARTMENT_TO_DEPARTMENT_1" FOREIGN KEY (
	"LOWER_DEPARTMENT_NO"
)
REFERENCES "DEPARTMENT" (
	"NO"
);

ALTER TABLE "ELECTRONIC_APPROVAL" ADD CONSTRAINT "FK_USER_TO_ELECTRONIC_APPROVAL_1" FOREIGN KEY (
	"DRAFTER"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "ELECTRONIC_APPROVAL" ADD CONSTRAINT "FK_APPROVAL_CATEGORY_TO_ELECTRONIC_APPROVAL_1" FOREIGN KEY (
	"CATEGORY_NO"
)
REFERENCES "APPROVAL_CATEGORY" (
	"NO"
);

ALTER TABLE "ATTENDANCE" ADD CONSTRAINT "FK_USER_TO_ATTENDANCE_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "ATTENDANCE" ADD CONSTRAINT "FK_ATTENDANCE_CURRENT_TO_ATTENDANCE_1" FOREIGN KEY (
	"CURRENT_NO"
)
REFERENCES "ATTENDANCE_CURRENT" (
	"NO"
);

ALTER TABLE "APPROVER" ADD CONSTRAINT "FK_ELECTRONIC_APPROVAL_TO_APPROVER_1" FOREIGN KEY (
	"APPROVAL_NO"
)
REFERENCES "ELECTRONIC_APPROVAL" (
	"NO"
);

ALTER TABLE "APPROVER" ADD CONSTRAINT "FK_APPROVAL_STATE_TO_APPROVER_1" FOREIGN KEY (
	"APPROVAL_STATE"
)
REFERENCES "APPROVAL_STATE" (
	"NO"
);

ALTER TABLE "APPROVER" ADD CONSTRAINT "FK_USER_TO_APPROVER_1" FOREIGN KEY (
	"APPROVER_NO"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "APPROVER" ADD CONSTRAINT "FK_APPROVER_TO_APPROVER_1" FOREIGN KEY (
	"NEXT_APPROVAER_NO"
)
REFERENCES "APPROVER" (
	"NO"
);

ALTER TABLE "ANIMAL" ADD CONSTRAINT "FK_CATEGORY_TO_ANIMAL_1" FOREIGN KEY (
	"CATEGORY_NO"
)
REFERENCES "CATEGORY" (
	"CATEGORY_NO"
);

ALTER TABLE "ANIMAL" ADD CONSTRAINT "FK_USER_TO_ANIMAL_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "ANIMAL" ADD CONSTRAINT "FK_DEPARTMENT_TO_ANIMAL_1" FOREIGN KEY (
	"DEPARTMONT_NO"
)
REFERENCES "DEPARTMENT" (
	"NO"
);

ALTER TABLE "APPROVAL_CATEGORY" ADD CONSTRAINT "FK_RANK_TO_APPROVAL_CATEGORY_1" FOREIGN KEY (
	"AUTHORITY_RANK_NO"
)
REFERENCES "RANK" (
	"NO"
);

ALTER TABLE "ANIMAL_TRAINING" ADD CONSTRAINT "FK_ANIMAL_TO_ANIMAL_TRAINING_1" FOREIGN KEY (
	"NO"
)
REFERENCES "ANIMAL" (
	"NO"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "FK_SUGGESTION_TO_REPLY_1" FOREIGN KEY (
	"SUGGESTION"
)
REFERENCES "SUGGESTION" (
	"NO"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "FK_USER_TO_REPLY_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "ANIMAL_HEALTH_SCREENING" ADD CONSTRAINT "FK_ANIMAL_TO_ANIMAL_HEALTH_SCREENING_1" FOREIGN KEY (
	"ANIMAL_NO"
)
REFERENCES "ANIMAL" (
	"NO"
);

ALTER TABLE "MAIL" ADD CONSTRAINT "FK_USER_TO_MAIL_1" FOREIGN KEY (
	"SENDER"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "MAIL" ADD CONSTRAINT "FK_MAIL_TO_MAIL_1" FOREIGN KEY (
	"PREV_NO"
)
REFERENCES "MAIL" (
	"NO"
);

ALTER TABLE "MAIL" ADD CONSTRAINT "FK_MAILBOX_TO_MAIL_1" FOREIGN KEY (
	"NO2"
)
REFERENCES "MAILBOX" (
	"NO"
);

ALTER TABLE "MAIL RECIPIENT" ADD CONSTRAINT "FK_MAIL_TO_MAIL RECIPIENT_1" FOREIGN KEY (
	"MAIL_NO"
)
REFERENCES "MAIL" (
	"NO"
);

ALTER TABLE "MAIL RECIPIENT" ADD CONSTRAINT "FK_USER_TO_MAIL RECIPIENT_1" FOREIGN KEY (
	"RECEIVER_NO"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "MAIL_CC" ADD CONSTRAINT "FK_MAIL_TO_MAIL_CC_1" FOREIGN KEY (
	"MAIL_NO"
)
REFERENCES "MAIL" (
	"NO"
);

ALTER TABLE "MAIL_CC" ADD CONSTRAINT "FK_USER_TO_MAIL_CC_1" FOREIGN KEY (
	"CC_NO"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "MAIL_ATTATCHMENT" ADD CONSTRAINT "FK_MAIL_TO_MAIL_ATTATCHMENT_1" FOREIGN KEY (
	"MAIL_NO"
)
REFERENCES "MAIL" (
	"NO"
);

ALTER TABLE "APPROVAL_CC" ADD CONSTRAINT "FK_ELECTRONIC_APPROVAL_TO_APPROVAL_CC_1" FOREIGN KEY (
	"NO"
)
REFERENCES "ELECTRONIC_APPROVAL" (
	"NO"
);

ALTER TABLE "APPROVAL_CC" ADD CONSTRAINT "FK_USER_TO_APPROVAL_CC_1" FOREIGN KEY (
	"CC_NO"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_USER_TO_BOARD_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_BOARD_CATEGORY_TO_BOARD_1" FOREIGN KEY (
	"NO2"
)
REFERENCES "BOARD_CATEGORY" (
	"NO"
);

ALTER TABLE "BOARD_REPLY" ADD CONSTRAINT "FK_BOARD_TO_BOARD_REPLY_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"NO"
);

ALTER TABLE "BOARD_REPLY" ADD CONSTRAINT "FK_USER_TO_BOARD_REPLY_1" FOREIGN KEY (
	"NO2"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "LEAVE" ADD CONSTRAINT "FK_USER_TO_LEAVE_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "LEAVE" ADD CONSTRAINT "FK_USER_TO_LEAVE_2" FOREIGN KEY (
	"PROXY_NO"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "LEAVE" ADD CONSTRAINT "FK_LEAVE_TYPE_TO_LEAVE_1" FOREIGN KEY (
	"LEAVE_NO"
)
REFERENCES "LEAVE_TYPE" (
	"NO"
);

ALTER TABLE "DRIVE" ADD CONSTRAINT "FK_USER_TO_DRIVE_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "DRIVE" ADD CONSTRAINT "FK_DRIVE_CATEGORY_TO_DRIVE_1" FOREIGN KEY (
	"CAT_NO"
)
REFERENCES "DRIVE_CATEGORY" (
	"NO"
);

ALTER TABLE "CATEGORY" ADD CONSTRAINT "FK_ANIMAL_CLASSIFICATION_TO_CATEGORY_1" FOREIGN KEY (
	"CLASS_NO"
)
REFERENCES "ANIMAL_CLASSIFICATION" (
	"NO"
);

ALTER TABLE "CATEGORY" ADD CONSTRAINT "FK_TASTE_TO_CATEGORY_1" FOREIGN KEY (
	"TASTE_NO"
)
REFERENCES "TASTE" (
	"TASTE_NO"
);

ALTER TABLE "CATEGORY" ADD CONSTRAINT "FK_HABITAT_TO_CATEGORY_1" FOREIGN KEY (
	"HABITAT_NO"
)
REFERENCES "HABITAT" (
	"HABITAT_NO"
);

ALTER TABLE "CATEGORY" ADD CONSTRAINT "FK_ENDANGERED_RATING_TO_CATEGORY_1" FOREIGN KEY (
	"ENDANGERED_RATING_NO"
)
REFERENCES "ENDANGERED_RATING" (
	"ENDANGERED_RATING_NO"
);

ALTER TABLE "MAILBOX" ADD CONSTRAINT "FK_USER_TO_MAILBOX_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "MAIL_IMAGE" ADD CONSTRAINT "FK_MAIL_TO_MAIL_IMAGE_1" FOREIGN KEY (
	"MAIL_NO"
)
REFERENCES "MAIL" (
	"NO"
);

ALTER TABLE "PROJECT_TEAM_MEMBER" ADD CONSTRAINT "FK_USER_TO_PROJECT_TEAM_MEMBER_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "PROJECT_TEAM_MEMBER" ADD CONSTRAINT "FK_PROJECT_TO_PROJECT_TEAM_MEMBER_1" FOREIGN KEY (
	"NO2"
)
REFERENCES "PROJECT" (
	"NO"
);

ALTER TABLE "PROJECT_TODO" ADD CONSTRAINT "FK_PROJECT_TO_PROJECT_TODO_1" FOREIGN KEY (
	"PROJECT_NO"
)
REFERENCES "PROJECT" (
	"NO"
);

ALTER TABLE "TODO_LIST" ADD CONSTRAINT "FK_PROJECT_TODO_TO_TODO_LIST_1" FOREIGN KEY (
	"PROJECT_NO"
)
REFERENCES "PROJECT_TODO" (
	"NO"
);

ALTER TABLE "MEETINGROOM_RESERVATION" ADD CONSTRAINT "FK_MEETINGROOM_TO_MEETINGROOM_RESERVATION_1" FOREIGN KEY (
	"MEETINGROOM_NO"
)
REFERENCES "MEETINGROOM" (
	"NO"
);

ALTER TABLE "AGENT" ADD CONSTRAINT "FK_WORK_TO_AGENT_1" FOREIGN KEY (
	"NO"
)
REFERENCES "WORK" (
	"NO"
);

ALTER TABLE "AGENT" ADD CONSTRAINT "FK_USER_TO_AGENT_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "WORK_CHECKLIST" ADD CONSTRAINT "FK_WORK_TO_WORK_CHECKLIST_1" FOREIGN KEY (
	"NO"
)
REFERENCES "WORK" (
	"NO"
);

ALTER TABLE "VOTE" ADD CONSTRAINT "FK_USER_TO_VOTE_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "VOTING_ITEM" ADD CONSTRAINT "FK_VOTE_TO_VOTING_ITEM_1" FOREIGN KEY (
	"VOTE_NO"
)
REFERENCES "VOTE" (
	"NO"
);

ALTER TABLE "APPROVAL_ATTACHMENT" ADD CONSTRAINT "FK_ELECTRONIC_APPROVAL_TO_APPROVAL_ATTACHMENT_1" FOREIGN KEY (
	"APPROVAL_NO"
)
REFERENCES "ELECTRONIC_APPROVAL" (
	"NO"
);

ALTER TABLE "LETTER_OF_APPROVAL" ADD CONSTRAINT "FK_ELECTRONIC_APPROVAL_TO_LETTER_OF_APPROVAL_1" FOREIGN KEY (
	"APPROVAL_NO"
)
REFERENCES "ELECTRONIC_APPROVAL" (
	"NO"
);

ALTER TABLE "APPLICATION_FOR_LEAVE" ADD CONSTRAINT "FK_ELECTRONIC_APPROVAL_TO_APPLICATION_FOR_LEAVE_1" FOREIGN KEY (
	"APPROVAL_NO"
)
REFERENCES "ELECTRONIC_APPROVAL" (
	"NO"
);

ALTER TABLE "APPLICATION_FOR_LEAVE" ADD CONSTRAINT "FK_LEAVE_TYPE_TO_APPLICATION_FOR_LEAVE_1" FOREIGN KEY (
	"TYPE_NO"
)
REFERENCES "LEAVE_TYPE" (
	"NO"
);

ALTER TABLE "CASH_DISBURSEMENT_VOUCHER" ADD CONSTRAINT "FK_ELECTRONIC_APPROVAL_TO_CASH_DISBURSEMENT_VOUCHER_1" FOREIGN KEY (
	"APPROVAL_NO"
)
REFERENCES "ELECTRONIC_APPROVAL" (
	"NO"
);

ALTER TABLE "EXPENSE_DETAIL" ADD CONSTRAINT "FK_CASH_DISBURSEMENT_VOUCHER_TO_EXPENSE_DETAIL_1" FOREIGN KEY (
	"NO"
)
REFERENCES "CASH_DISBURSEMENT_VOUCHER" (
	"NO"
);

ALTER TABLE "EXPENSE_RECEIPT" ADD CONSTRAINT "FK_CASH_DISBURSEMENT_VOUCHER_TO_EXPENSE_RECEIPT_1" FOREIGN KEY (
	"NO"
)
REFERENCES "CASH_DISBURSEMENT_VOUCHER" (
	"NO"
);

ALTER TABLE "CHATTING_MESSAGE" ADD CONSTRAINT "FK_USER_TO_CHATTING_MESSAGE_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "CHATTING_MESSAGE" ADD CONSTRAINT "FK_CHEATING_ROOM_TO_CHATTING_MESSAGE_1" FOREIGN KEY (
	"ROOM_NO"
)
REFERENCES "CHEATING_ROOM" (
	"NO"
);

ALTER TABLE "SURVEY" ADD CONSTRAINT "FK_USER_TO_SURVEY_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "SURVEY_QUESTION" ADD CONSTRAINT "FK_SURVEY_TO_SURVEY_QUESTION_1" FOREIGN KEY (
	"SURVEY_NO"
)
REFERENCES "SURVEY" (
	"NO"
);

ALTER TABLE "SURVEY_QUESTION" ADD CONSTRAINT "FK_QUESTION_TYPE_TO_SURVEY_QUESTION_1" FOREIGN KEY (
	"TYPE_NO"
)
REFERENCES "QUESTION_TYPE" (
	"NO"
);

ALTER TABLE "SURVEY_HISTORY" ADD CONSTRAINT "FK_USER_TO_SURVEY_HISTORY_1" FOREIGN KEY (
	"SURVEY_USER_NO"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "SURVEY_HISTORY" ADD CONSTRAINT "FK_SURVEY_TO_SURVEY_HISTORY_1" FOREIGN KEY (
	"SURVEY_NO"
)
REFERENCES "SURVEY" (
	"USER_NO"
);

ALTER TABLE "SURVEY_HISTORY" ADD CONSTRAINT "FK_SURVEY_QUESTION_TO_SURVEY_HISTORY_1" FOREIGN KEY (
	"QUESTION_NO"
)
REFERENCES "SURVEY_QUESTION" (
	"NO"
);

ALTER TABLE "APPLICATION_FOR_EXTRA_WORK" ADD CONSTRAINT "FK_ELECTRONIC_APPROVAL_TO_APPLICATION_FOR_EXTRA_WORK_1" FOREIGN KEY (
	"APPROVAL_NO"
)
REFERENCES "ELECTRONIC_APPROVAL" (
	"NO"
);

ALTER TABLE "APPLICATION_FOR_EXTRA_WORK" ADD CONSTRAINT "FK_EXTRA_WORK_CATEGORY_TO_APPLICATION_FOR_EXTRA_WORK_1" FOREIGN KEY (
	"CATEGORY_NO"
)
REFERENCES "EXTRA_WORK_CATEGORY" (
	"NO"
);

ALTER TABLE "APPROVAL_PASSIVE_SETTING" ADD CONSTRAINT "FK_APPROVAL_CATEGORY_TO_APPROVAL_PASSIVE_SETTING_1" FOREIGN KEY (
	"CATEGORY_NO"
)
REFERENCES "APPROVAL_CATEGORY" (
	"NO"
);

ALTER TABLE "APPROVAL_PASSIVE_SETTING" ADD CONSTRAINT "FK_RANK_TO_APPROVAL_PASSIVE_SETTING_1" FOREIGN KEY (
	"RANK_NO"
)
REFERENCES "RANK" (
	"NO"
);

ALTER TABLE "VOTING_HISTORY" ADD CONSTRAINT "FK_VOTE_TO_VOTING_HISTORY_1" FOREIGN KEY (
	"VOTE_NO"
)
REFERENCES "VOTE" (
	"NO"
);

ALTER TABLE "VOTING_HISTORY" ADD CONSTRAINT "FK_USER_TO_VOTING_HISTORY_1" FOREIGN KEY (
	"VOTER_NO"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "VOTING_HISTORY" ADD CONSTRAINT "FK_VOTING_ITEM_TO_VOTING_HISTORY_1" FOREIGN KEY (
	"ITEM_NO"
)
REFERENCES "VOTING_ITEM" (
	"NO"
);

ALTER TABLE "SURVEY_ITEM" ADD CONSTRAINT "FK_SURVEY_QUESTION_TO_SURVEY_ITEM_1" FOREIGN KEY (
	"SURVEY_NO"
)
REFERENCES "SURVEY_QUESTION" (
	"NO"
);

ALTER TABLE "CURROPTION_SURVEY_USER" ADD CONSTRAINT "FK_USER_TO_CURROPTION_SURVEY_USER_1" FOREIGN KEY (
	"NO"
)
REFERENCES "USER" (
	"NO"
);

ALTER TABLE "CURROPTION_SURVEY_USER" ADD CONSTRAINT "FK_RESEARCH_TO_CURROPTION_SURVEY_USER_1" FOREIGN KEY (
	"SURVEY_NO"
)
REFERENCES "RESEARCH" (
	"NO"
);

ALTER TABLE "DIRECTORY" ADD CONSTRAINT "FK_DRIVE_TO_DIRECTORY_1" FOREIGN KEY (
	"DRIVE_NO"
)
REFERENCES "DRIVE" (
	"NO"
);

