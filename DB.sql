DROP DATABASE IF EXISTS `Spring_AM_01`;
CREATE DATABASE `Spring_AM_01`;
USE `Spring_AM_01`;

# article 테이블 생성
CREATE TABLE article(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    title CHAR(100) NOT NULL,
    `body` TEXT NOT NULL
);

# member 테이블 생성
CREATE TABLE `member`(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId CHAR(20) NOT NULL,
    loginPw CHAR(80) NOT NULL,
    `authLevel` SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한 레벨 (3=일반,7=관리자)',
    `name` CHAR(20) NOT NULL,
    nickname CHAR(20) NOT NULL,
    cellphoneNum CHAR(20) NOT NULL,
    email CHAR(50) NOT NULL,
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴 여부 (0=탈퇴 전, 1=탈퇴 후)',
    delDate DATETIME COMMENT '탈퇴 날짜'
    
);


# article TD 생성
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목1',
`body` = '내용1';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목2',
`body` = '내용2';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목3',
`body` = '내용3';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목4',
`body` = '내용4';

# member TD 생성
# (관리자)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
`authLevel` = 7,
`name` = '관리자',
nickname = '관리자',
cellphoneNum = '01012341234',
email = 'abcd@gmail.com';

# (일반)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test1',
loginPw = 'test1',
`name` = '회원1',
nickname = '회원1',
cellphoneNum = '01043214321',
email = 'abcde@gmail.com';

# (일반)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test2',
loginPw = 'test2',
`name` = '회원2',
nickname = '회원2',
cellphoneNum = '01056785678',
email = 'abcdef@gmail.com';

ALTER TABLE article ADD COLUMN memberId INT(10) UNSIGNED NOT NULL AFTER updateDate;

UPDATE article
SET memberId = 2
WHERE id IN (1,2);

UPDATE article
SET memberId = 3
WHERE id IN (3,4);


# board 테이블 생성
CREATE TABLE board(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `code` CHAR(50) NOT NULL UNIQUE COMMENT 'notice(공지사항), free(자유), QnA(질의응답) ...',
    `name` CHAR(20) NOT NULL UNIQUE COMMENT '게시판 이름',
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제 여부 (0=삭제 전, 1=삭제 후)',
    delDate DATETIME COMMENT '삭제 날짜'
);

# board TD 생성
INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'NOTICE',
`name` = '공지사항';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'FREE',
`name` = '자유';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'QnA',
`name` = '질의응답';

ALTER TABLE article ADD COLUMN boardId INT(10) UNSIGNED NOT NULL AFTER `memberId`;

UPDATE article
SET boardId = 1
WHERE id IN (1,2);

UPDATE article
SET boardId = 2
WHERE id = 3;

UPDATE article
SET boardId = 3
WHERE id = 4;

ALTER TABLE article ADD COLUMN hitCount INT(10) UNSIGNED NOT NULL DEFAULT 0 AFTER `body`;

# reactionPoint 테이블 생성
CREATE TABLE reactionPoint(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    relTypeCode CHAR(50) NOT NULL COMMENT '관련 데이터 타입 코드',
    relId INT(10) NOT NULL COMMENT '관련 데이터 번호',
    `point` INT(10) NOT NULL
);

# reactionPoint 테스트 데이터 생성
# 1번 회원이 1번 글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'article',
relId = 1,
`point` = -1;

# 1번 회원이 2번 글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'article',
relId = 2,
`point` = 1;

# 2번 회원이 1번 글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 1,
`point` = -1;

# 2번 회원이 2번 글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 2,
`point` = -1;

# 3번 회원이 1번 글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
relTypeCode = 'article',
relId = 1,
`point` = 1;

# article 테이블에 좋아요 관련 컬럼 추가
ALTER TABLE article ADD COLUMN goodReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE article ADD COLUMN badReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;

# update join -> 기존 게시물의 good,bad RP 값을 RP 테이블에서 가져온 데이터로 채운다
UPDATE article AS A
INNER JOIN (
    SELECT RP.relTypeCode,RP.relId,
    SUM(IF(RP.point > 0, RP.point, 0)) AS goodReactionPoint,
    SUM(IF(RP.point < 0, RP.point * -1, 0)) AS badReactionPoint
    FROM reactionPoint AS RP
    GROUP BY RP.relTypeCode, RP.relId
) AS RP_SUM
ON A.id = RP_SUM.relId
SET A.goodReactionPoint = RP_SUM.goodReactionPoint,
A.badReactionPoint = RP_SUM.badReactionPoint;

# reply 테이블 생성
CREATE TABLE reply (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    relTypeCode CHAR(50) NOT NULL COMMENT '관련 데이터 타입 코드',
    relId INT(10) NOT NULL COMMENT '관련 데이터 번호',
    `body`TEXT NOT NULL
);

# 2번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 1,
`body` = '댓글 1';

# 2번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 1,
`body` = '댓글 2';

# 3번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
relTypeCode = 'article',
relId = 1,
`body` = '댓글 3';

# 3번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 2,
`body` = '댓글 4';

# reply 테이블에 좋아요 관련 컬럼 추가
ALTER TABLE reply ADD COLUMN goodReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE reply ADD COLUMN badReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;

# reactionPoint 테스트 데이터 생성
# 1번 회원이 1번 댓글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'reply',
relId = 1,
`point` = -1;

# 1번 회원이 2번 댓글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'reply',
relId = 2,
`point` = 1;

# 2번 회원이 1번 댓글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'reply',
relId = 1,
`point` = -1;

# 2번 회원이 2번 댓글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'reply',
relId = 2,
`point` = -1;

# 3번 회원이 1번 댓글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
relTypeCode = 'reply',
relId = 1,
`point` = 1;

# update join -> 기존 게시물의 good,bad RP 값을 RP 테이블에서 가져온 데이터로 채운다
UPDATE reply AS R
INNER JOIN (
    SELECT RP.relTypeCode,RP.relId,
    SUM(IF(RP.point > 0, RP.point, 0)) AS goodReactionPoint,
    SUM(IF(RP.point < 0, RP.point * -1, 0)) AS badReactionPoint
    FROM reactionPoint AS RP
    GROUP BY RP.relTypeCode, RP.relId
) AS RP_SUM
ON R.id = RP_SUM.relId
SET R.goodReactionPoint = RP_SUM.goodReactionPoint,
R.badReactionPoint = RP_SUM.badReactionPoint;

CREATE TABLE image(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    imageData LONGBLOB,
    memberId INT(10) UNSIGNED NOT NULL, 
    regDate DATETIME NOT NULL
    );

# 이미지 테이블 테스트 데이터

INSERT INTO image 
SET regDate= NOW(),
    memberId= 3,
    imageData = "data:image/jpeg;base64,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";

INSERT INTO image
SET regDate=NOW(),
    memberId = 2,
    imageData="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;"
    

CREATE TABLE psychological_test(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    answer VARCHAR(255) NOT NULL
);
###############################################

SELECT imageData
FROM image;

SELECT * FROM psychological_test;
SELECT * FROM article;

SELECT * FROM `member`;

SELECT * FROM `board`;

SELECT * FROM reactionPoint;

SELECT * FROM `reply`;

SELECT * FROM image;

SELECT imageData
FROM image
WHERE memberId = 123;

SELECT goodReactionPoint
FROM article 
WHERE id = 1

INSERT INTO article
(
    regDate, updateDate, memberId, boardId, title, `body`
)
SELECT NOW(),NOW(), FLOOR(RAND() * 2) + 2, FLOOR(RAND() * 3) + 1, CONCAT('제목_',RAND()), CONCAT('내용_',RAND())
FROM article;

SELECT IFNULL(SUM(RP.point),0)
FROM reactionPoint AS RP
WHERE RP.relTypeCode = 'article'
AND RP.relId = 3
AND RP.memberId = 1;


UPDATE article 
SET title = '제목5'
WHERE id = 5;

UPDATE article 
SET title = '제목11'
WHERE id = 6;

UPDATE article 
SET title = '제목45'
WHERE id = 7;

SELECT FLOOR(RAND() * 2) + 2

SELECT FLOOR(RAND() * 3) + 1


SHOW FULL COLUMNS FROM `member`;
DESC `member`;



SELECT LAST_INSERT_ID();

SELECT *
FROM article AS A
WHERE 1

	AND boardId = 1

			AND A.title LIKE CONCAT('%','0000','%')
			OR A.body LIKE CONCAT('%','0000','%')

ORDER BY id DESC

SELECT COUNT(*)
FROM article AS A
WHERE 1
AND boardId = 1
AND A.title LIKE CONCAT('%','0000','%')
OR A.body LIKE CONCAT('%','0000','%')
ORDER BY id DESC


SELECT hitCount
FROM article
WHERE id = 374;

SELECT A.*
FROM article AS A
WHERE A.id = 1

SELECT A.*, M.nickname AS extra__writer
FROM article AS A
INNER JOIN `member` AS M
ON A.memberId = M.id
WHERE A.id = 1

# LEFT JOIN
SELECT A.*, M.nickname AS extra__writer, RP.point
FROM article AS A
INNER JOIN `member` AS M
ON A.memberId = M.id
LEFT JOIN reactionPoint AS RP
ON A.id = RP.relId AND RP.relTypeCode = 'article'
GROUP BY A.id
ORDER BY A.id DESC;

# 서브쿼리
SELECT A.*,
IFNULL(SUM(RP.point),0) AS extra__sumReactionPoint,
IFNULL(SUM(IF(RP.point > 0, RP.point, 0)),0) AS extra__goodReactionPoint,
IFNULL(SUM(IF(RP.point < 0, RP.point, 0)),0) AS extra__badReactionPoint
FROM (
    SELECT A.*, M.nickname AS extra__writer 
    FROM article AS A
    INNER JOIN `member` AS M
    ON A.memberId = M.id
    ) AS A
LEFT JOIN reactionPoint AS RP
ON A.id = RP.relId AND RP.relTypeCode = 'article'
GROUP BY A.id
ORDER BY A.id DESC;

# 조인
SELECT A.*, M.nickname AS extra__writer,
IFNULL(SUM(RP.point),0) AS extra__sumReactionPoint,
IFNULL(SUM(IF(RP.point > 0, RP.point, 0)),0) AS extra__goodReactionPoint,
IFNULL(SUM(IF(RP.point < 0, RP.point, 0)),0) AS extra__badReactionPoint
FROM article AS A
INNER JOIN `member` AS M
ON A.memberId = M.id
LEFT JOIN reactionPoint AS RP
ON A.id = RP.relId AND RP.relTypeCode = 'article'
GROUP BY A.id
ORDER BY A.id DESC;


SELECT *, COUNT(*)
FROM reactionPoint AS RP
GROUP BY RP.relTypeCode,RP.relId

SELECT IF(RP.point > 0, '큼','작음')
FROM reactionPoint AS RP
GROUP BY RP.relTypeCode,RP.relId

# 각 게시물의 좋아요, 싫어요 갯수
SELECT RP.relTypeCode, RP.relId,
SUM(IF(RP.point > 0,RP.point,0)) AS goodReactionPoint,
SUM(IF(RP.point < 0,RP.point * -1,0)) AS badReactionPoint
FROM reactionPoint AS RP
GROUP BY RP.relTypeCode,RP.relId

# member테이블과 image 테이블 join
SELECT *
FROM image I
INNER JOIN `member` M
ON I.memberId=M.id;
 
