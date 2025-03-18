/* soccerdb실습문제 - soccerdb */

-- 별도로 제공한 soccerdb.sql 파일 안의 db 스크립트를 실행한 후 아래의 내용을 풀어주세요.


/*
   1번
   PLAYER 테이블에서 K02, K05 팀에 해당하는 선수들의 이름과 포지션, 등번호, 키를 조회하시오.

   선수이름 | 포지션 | 등번호 | 키 
   -----------------------------------
   전명구	| DF     | (null) | (null)
   박경치	| DF	   | (null) | (null)
   정이섭	| GK	   | 45	   | 185
   최관민	| GK	   | 31	   | 188
   ...
   -----------------------------------
   
   조회되는 순서는 다를 수 있음 

   100개의 행 조회
*/

SELECT
    player_name
    ,position
    ,back_no
    ,height
FROM
    player
WHERE
    team_id IN ("K02","K05")
;


/*
   2번
   PLAYER 테이블에서 국적이 명시된 선수들의 이름과 국적을 조회하시오.

   선수이름 |국적
   -------------------
   우르모브	| 유고
   이고르	| 브라질
   디디	   | 브라질
   하리	   | 콜롬비아
   ...
   -------------------

   조회되는 순서는 다를 수 있음 

   27개의 행 조회
*/
SELECT
    player_name
    ,nation
FROM
    player
WHERE
    nation IS NOT NULL
;


/*
   3번
   PLAYER 테이블에서 팀ID가 K02이거나 K07인 선수들의 이름과 포지션, 등번호, 팀ID, 키를 조회하시오.

   선수이름 | 포지션 | 등번호 | 팀ID | 키
   -------------------------------------------
   김회택	| DF	   | (null)	| K07	 | (null)	
   서현옥	| DF	   | (null) | K07	 | (null) 
   정상호	| DF	   | (null)	| K07	 | (null) 
   최철우	| DF	   | (null)	| K07	 | (null) 
   정영광	| GK	   | 41	   | K07	 | 185
   최종문	| GK	   | 1	   | K07	 | 185
   염동균	| GK	   | 31	   | K07	 | 189
      ...
   오규찬	| MF	   | 24	   | K02	 | 178
   윤원일	| MF	   | 45	   | K02	 | 176
   김동욱	| MF	   | 40	   | K02	 | 176   
   -------------------------------------------

   조회되는 순서는 다를 수 있음 

   100개의 행 조회
*/
SELECT * FROM player;

SELECT
    player_name
    ,position
    ,back_no
    ,team_id
    ,height
FROM
    player
WHERE
    team_id IN ("K02","K07")
;

/*
   4번
   TEAM 테이블에서 각 팀의 우편번호 두 개를 '-' 구분자로 합하여 팀ID와 우편번호 조합을 조회하시오.

   팀ID | 우편번호
   -----------------
   K05  | 560-190
   K08  | 462-130
   K03  | 790-050
   K07  | 544-010
   K09  | 138-221
   K04  | 110-728
   K11  | 111-222
      ...
   K13  | 333-444
   K14  | 555-666
   K15  | 777-888
   -----------------

   조회되는 순서는 다를 수 있음 

   15개의 행 조회
*/
SELECT
    team_id
    ,fax
FROM
    team
;


/*
   5번
   PLAYER 테이블에서 모든 선수들의 인원 수와 신장 크기가 등록된 선수의 수, 
   최대 신장과 최소 신장, 평균 신장을 조회하시오.

   전체 인원수 | 신장크기등록 인원수 | 최대 신장 | 최소 신장 | 평균 신장
   ----------------------------------------------------------------------
   480	      | 447	                | 196	    | 165	    | 179.31
   ----------------------------------------------------------------------
*/
SELECT
    COUNT(*)
    ,COUNT(height)
    ,MAX(height)
    ,MIN(height)
    ,FORMAT(AVG(height),2)
FROM
    player
;


/*
   6번
   PLAYER 테이블을 활용하여 각 팀 별 인원수를 조회하는 SQL을 작성하되 
   정렬은 인원 수 기준으로 내림차순 정렬하여 조회 하시오.

   팀ID | 인원수
   -------------
   K05  | 51
   K07  | 51
   K03  | 49
   K09  | 49
   K02  | 49
      ...
   K15  | 3
   K12  | 2
   K14  | 2
   ------------

   15개의 행 조회
*/
SELECT
    team_id AS 팀ID
    ,COUNT(*) AS 인원수
FROM
    player
GROUP BY
    team_id
ORDER BY
    인원수 DESC
;


/*
   7번
   PLAYER와 TEAM 테이블을 활용하여 각 선수의 이름과 소속팀명을 조회 하시오.

   선수이름 | 소속팀명
   ---------------------
   우르모브	| 아이파크
   윤희준	| 아이파크
   김규호	| 아이파크
   김민성	| 아이파크
   김장관	| 아이파크
   김정효	| 아이파크
   장대일	| 아이파크
      ...
   오춘식	| 대구FC
   박창우	| 대구FC
   박진하	| 대구FC
   ---------------------
   
   조회되는 순서는 다를 수 있음 

   480개의 행 조회

*/ 
SELECT
    player_name
    ,team_name
FROM
    player p
        JOIN team t ON t.team_id = p.team_id
;


/*
   8번
   PLAYER, TEAM, STADIUM 테이블을 활용하여 각 선수들의 정보 중 선수명, 포지션, 출신지, 팀명, 홈경기장 명을 조회하시오.

   선수명   | 포지션 | 출신지 | 팀명     | 홈경기장 
   -------------------------------------------------------------
   우르모브 | DF	   | 유고	| 아이파크 | 부산아시아드경기장
   윤희준	| DF	   | (null) | 아이파크 | 부산아시아드경기장
   김규호	| DF	   | (null) | 아이파크 | 부산아시아드경기장
   김민성	| DF	   | (null) | 아이파크 | 부산아시아드경기장
   김장관	| DF	   | (null) | 아이파크 | 부산아시아드경기장
      ...
   박창우	| DF		| (null) | 대구FC	  | 대구월드컵경기장
   박진하	| FW		| (null) | 대구FC	  | 대구월드컵경기장   
   -------------------------------------------------------------
   
   조회되는 순서는 다를 수 있음 

   480개의 행 조회

*/ 
SELECT * FROM team;
SELECT * FROM player;
SELECT * FROM stadium;

SELECT
    player_name
    ,position
    ,nation
    ,team_name
    ,stadium_name
FROM
    player p
        JOIN team t ON t.team_id = p.team_id
        JOIN stadium s ON s.hometeam_id = p.team_id
;




/*
   9번
   TEAM, STADIUM 테이블을 활용하여 각 팀의 이름과 경기장ID, 경기장명을 조회하되
   경기장ID가 존재하는 팀만 조회 하고 결과는 경기장 명이 오름차순 정렬이 되도록 조회하시오.

   팀명              | 경기장ID | 경기장명
   ----------------------------------------------
   강원FC	         | A03	     | 강릉종합경기장
   드래곤즈	         | D01	     | 광양전용경기장
   광주상무	         | A02	     | 광주월드컵경기장
      ...
   제주유나이티드FC	| A04	     | 제주월드컵경기장
   경남FC	         | C05	     | 창원종합운동장
   스틸러스	         | C06	     | 항스틸야드
   -----------------------------------------------
   
   15개의 행 조회
*/ 
SELECT
    team_name
    ,s.stadium_id
    ,stadium_name
FROM
    team t
        JOIN stadium s ON hometeam_id = team_id
;


/*
   10번
   PLAYER 테이블을 활용하여 신장 크기가 모든 선수의 신장 길이의 평균 이상인
   선수들의 선수명, 포지션, 등번호를 선수이름 기준 오름차순으로 조회하시오.

   선수명   | 포지션 | 등번호
   ---------------------------
   가이모토	| DF	   | 3
   강성일	| GK	   | 30
   고관영	| MF	   | 32
   고병운	| DF	   | 16
   곽경근	| FW	   | 9
      ...
   황연석	| FW	   | 16
   히카르도	| MF	   | 10
   ---------------------------

   219개의 행 조회
*/
SELECT
    player_name
    ,position
    ,back_no
FROM
    player
WHERE
    height >= (SELECT AVG(height) FROM player)
;


/*
   11번
   선수 중 '정현수'라는 동명이인이 속한 팀의 한글 명칭과 영문 명칭, 소속 지역을 조회하시오.

   한글 명칭 | 영문 명칭               | 소속 지역
   ------------------------------------------------
   드래곤즈	 | CHUNNAM DRAGONS FC	   | 전남
   일화천마	 | SEONGNAM ILHWA CHUNMA FC| 성남
   ------------------------------------------------
*/
SELECT * FROM team;
SELECT
    team_name
    ,e_team_name
    ,region_name
FROM
    team t
        JOIN player p ON p.team_id = t.team_id
WHERE
    t.team_id IN (SELECT team_id FROM player WHERE p.player_name = '정현수')
;



/*
   12번
   SCHEDULE에 기록된 정보들 중 HOME팀과 AWAY팀의 합산 점수가 가장 높은 경기의 
   날짜와 경기장 명, HOME팀 명과 AWAY팀 명, 그리고 각 팀이 기록한 골의 점수를 조회하시오.

   경기일자 | 경기장명       | HOME팀명 | HOME팀점수 | AWAY팀명 | AWAY팀점수
   --------------------------------------------------------------------------
   20120824	| 성남종합운동장 | 일화천마 | 4	        | 아이파크 | 3
   20120427	| 창원종합운동장 | 경남FC	 | 5	        | 아이파크 | 2
   --------------------------------------------------------------------------
*/
SELECT * FROM stadium;
SELECT * FROM team;
SELECT * FROM  schedule;
SELECT
    sche_date
    ,stadium_name 
    ,home.team_name
    ,home_score
    ,away.team_name
    ,away_score
FROM
    schedule s
        JOIN team home ON home.team_id = s.hometeam_id
        JOIN team away ON away.team_id = s.awayteam_id
        JOIN stadium st ON st.stadium_id = s.stadium_id
ORDER BY
    (home_score + away_score) DESC
LIMIT
    2
;


SET autocommit = OFF; 
COMMIT;
/*
   13번
   울산 현대 팀에 '박주호' 선수가 새로 영입되어서 해당 선수에 대한 데이터를 추가하는 SQL문을 작성하시오. 
   해당 선수의 정보로 포지션은 DF이며 1987년 3월 16일생, 신장과 몸무게가 각각 176cm, 75kg으로 나간다고 한다. 
   해당 선수의 데이터를 추가할 때 선수ID는 기존 선수들 중 가장 마지막 번호에서 숫자 하나를 증가시켜 추가하도록하자.
*/
SELECT * FROM player;
SELECT * FROM team;
ROLLBACK;
INSERT INTO
    player
VALUES
    ((SELECT player_id FROM player ORDER BY player_id DESC LIMIT 1)+1,
    '박주호', 
    (SELECT team_id FROM team WHERE team_name = '울산현대'), 
    'PJH', 
    null, 
    null,
    'DF',
    null,
    '대한민국',
    '1987-03-16',
    null,
    176,
    75
);

INSERT INTO
    player
VALUES
    (2012138,
    '박주호', 
    'K01', 
    'PJH', 
    null, 
    null,
    'DF',
    null,
    '대한민국',
    '1987-03-16',
    null,
    176,
    75
);
    
    



