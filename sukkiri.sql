CREATE DATABASE study;
USE study;
CREATE TABLE 家計簿(日付 DATE, 費目 VARCHAR(20), メモ VARCHAR(100), 入金額 INTEGER (10), 出金額 INTEGER(10));
INSERT INTO 家計簿 VALUES ('2013-02-03','食費',	'コーヒーを購入',	0,	380);
INSERT INTO 家計簿 VALUES ('2013-02-10','給料',	'1月の給料',	280000,	0);
INSERT INTO 家計簿 VALUES ('2013-02-11','教養娯楽費',	'書籍を購入',	0,	2800);
INSERT INTO 家計簿 VALUES ('2013-02-14','交際費',	'同期会の会費',	0,	5000);
INSERT INTO 家計簿 VALUES ('2013-02-18','水道光熱費',	'1月の電気代',	0,	7560);


CREATE TABLE 家計簿アーカイブ(日付 DATE, 費目 VARCHAR(20), メモ VARCHAR(100), 入金額 INTEGER, 出金額 INTEGER);
INSERT INTO 家計簿アーカイブ VALUES('2012-12-10', '給料', '11月の給料', 280000, 0);
INSERT INTO 家計簿アーカイブ VALUES('2012-12-18', '水道光熱費', '水道代', 0, 4200);
INSERT INTO 家計簿アーカイブ VALUES('2012-12-24', '食費', 'レストランみやび', 0, 5000);
INSERT INTO 家計簿アーカイブ VALUES('2012-12-25', '居住費', '1月の家賃支払い', 0, 80000);
INSERT INTO 家計簿アーカイブ VALUES('2013-01-10', '給料', '12月の給料', 2, 0000	0);
INSERT INTO 家計簿アーカイブ VALUES('2013-01-13', '教養娯楽費', 'スッキリシネマズ', 0, 1800);
INSERT INTO 家計簿アーカイブ VALUES('2013-01-13', '食費', '新年会', 0, 5000);
INSERT INTO 家計簿アーカイブ VALUES('2013-01-25', '居住費', '2月の家賃支払い', 0, 80000);

CREATE TABLE 家計簿集計 (費目 VARCHAR(20), 合計 INTEGER, 平均 INTEGER, 最大 INTEGER, 最小 INTEGER, 回数 INTEGER);
INSERT INTO 家計簿集計 VALUES('居住費', 160000, 80000, 80000, 80000, 3);
INSERT INTO 家計簿集計 VALUES('水道光熱費', 11760, 5880, 7560, 4200, 2);
INSERT INTO 家計簿集計 VALUES('食費', 10380, 3460, 5000, 380, 3);
INSERT INTO 家計簿集計 VALUES('教養娯楽費', 4600, 2300, 2800, 1800, 2);
INSERT INTO 家計簿集計 VALUES('給料', 840000, 280000, 280000, 280000, 3);

-- mysqldump -uusui -pusui -r kakeibo.backup --single-transaction study;
-- mysql -uusui -pusui kakeibo2 < kakeibo.bakcup


-- RPG(p426)
CREATE DATABASE rpg;
USE rpg;
CREATE TABLE パーティー (ID CHAR(3) PRIMARY KEY, 名称 VARCHAR(20) NOT NULL, 職業コード CHAR(2) NOT NULL, HP INTEGER NOT NULL, MP INTEGER NOT NULL, 状態コード CHAR(2) NOT NULL);
CREATE TABLE イベント (イベント番号 INTEGER PRIMARY KEY, イベント名称 VARCHAR(50) NOT NULL, タイプ CHAR(1) NOT NULL, 前提イベント番号 INTEGER, 後続イベント番号 INTEGER);
CREATE TABLE 経験イベント (イベント番号 INTEGER PRIMARY KEY, クリア区分 CHAR(1) NOT NULL, クリア結果 CHAR(1), ルート番号 INTEGER);

CREATE TABLE コード (コード種別 INTEGER, コード値 CHAR(2), コード名称 VARCHAR(100),PRIMARY KEY(コード種別, コード値));
INSERT INTO コード VALUES
(1, '01', '勇者'),
(1, '10', '戦士'),
(1, '11', '武道家'),
(1, '20', '魔法使い'),
(1, '21', '学者');
INSERT INTO コード VALUES
(2, '00', '異常なし'),
(2, '01', '眠り'),
(2, '02', '毒'),
(2, '03', '沈黙'),
(2, '04', '混乱'),
(2, '09', '気絶');
INSERT INTO コード VALUES
(3, '1', '強制'),
(3, '2', 'フリー'),
(3, '3', '特殊');
INSERT INTO コード VALUES
(4, 'A', 'たいへんよくできました'),
(4, 'B', 'よくできました'),
(4, 'C', 'もう少し頑張りましょう'),
(4, 'X', '判定不能');

INSERT INTO パーティー VALUES ('C01', 'ミナト', '01', 89, 35, '00'), ('C02', 'アサカ', '11', 74, 66, '00');
INSERT INTO イベント VALUES
(1, 'オープニング', 1, NULL, 3),
(2, 'オープニング（2週目以降）', 3, NULL, 3),
(3, '勇者の旅立ち', 1, NULL, 4),
(4, '初めての仲間', 1, 3, 5),
(5, '盗賊ダンシーを追え！', 1, 4, 7),
(6, '宝石の洞窟', 2, NULL, NULL),
(7, 'イガヤの町の秘密', 1, 5, 9),
(8, '妖精の森の下で', 2, NULL, NULL),
(9, '潜入！バクロック城', 1, 7, 10),
(10, '師との出会い', 1, 9, 12),
(11, '隠れ里ボウジーン', 2, NULL, NULL),
(12, 'ドウンブリッジの戦い', 1, 10, 15),
(13, '名誉を賭して', 2, NULL, 18),
(14, 'ナボーリ火山と三つの島', 2, NULL, NULL),
(15, '水の洞窟に潜むもの', 1, 12, 17),
(16, '盗賊ダンシーの依頼', 2, 5, NULL),
(17, '封印の町ノザ', 1, 15, 22),
(18, '聖騎士の涙', 2, 13, NULL),
(19, '賢者の婚姻', 2, 17, NULL),
(20, '王位継承者の帰郷', 2, 17, NULL),
(21, '新大陸の魔女', 2, 17, NULL),
(22, 'それぞれの願いのために', 1, 17, 23),
(23, '最終決戦', 1, 22, 24),
(24, 'そして世界のはじまりに', 1, 23, NULL),
(25, 'エンディング', 1, 24, NULL),
(26, 'エンディング（2週目以降）', 3, 24, NULL);

INSERT INTO 経験イベント VALUES
(1, '1', 'A', 1),
(3, '1', 'B', 2),
(4, '1', 'A', 3),
(5, '1', 'B', 4),
(6, '1', 'C', 5),
(7, '1', 'B', 6),
(9, '0', NULL, 7);


-- LEVEL1
    /* 01. */SELECT ID, 名称, 職業コード, HP, MP, 状態コード FROM パーティー;
    /* 02. */SELECT 名称 AS なまえ, HP AS 現在のHP, MP AS 現在のMP FROM パーティー;
    /* 03. */SELECT * FROM イベント;
    /* 04. */SELECT イベント番号 AS 番号, イベント名称 AS 場面 FROM イベント;
    /* 05. */INSERT INTO パーティー VALUES ('A01', 'スガワラ', '21', 131, 232, '00');
        INSERT INTO パーティー VALUES ('A02', 'オーエ', '10', 156, 84, '00');
        INSERT INTO パーティー VALUES ('A03', 'イズミ', '20', 84, 190, '00');
-- LEVEL2
    /* 06. */SELECT * FROM パーティー WHERE ID='C02';
    /* 07. */UPDATE パーティー SET HP=120 WHERE ID='A01';
    /* 08. */SELECT ID, 名称, HP FROM パーティー WHERE HP<100;
    /* 09. */SELECT ID, 名称, MP FROM パーティー WHERE MP>=100;
    /* 10. */SELECT イベント番号, イベント名称, タイプ FROM イベント WHERE タイプ=3;
    /* 11. */SELECT イベント番号, イベント名称 FROM イベント WHERE イベント番号<=5;
    /* 12. */SELECT イベント番号, イベント名称 FROM イベント WHERE イベント番号>20;
    /* 13. */SELECT イベント番号, イベント名称 FROM イベント WHERE 前提イベント番号 IS NULL;
    /* 14. */SELECT イベント番号, イベント名称, 後続イベント番号 FROM イベント WHERE 後続イベント番号 IS NOT NULL;
    /* 15. */UPDATE パーティー SET 状態コード='01' WHERE 名称 LIKE '%ミ%';
    /* 16. */SELECT ID, 名称, HP FROM パーティー WHERE HP IN (120, 160);
    /* 17. */SELECT 名称, 職業コード FROM パーティー WHERE 職業コード IN ('00', '01', '02');
    /* 18. */SELECT 名称, 状態コード FROM パーティー WHERE 状態コード NOT IN ('00', '09');
    /* 19. */SELECT * FROM パーティー WHERE HP > 100 AND MP > 100;
    /* 20. */SELECT * FROM パーティー WHERE ID LIKE 'A%' AND 職業コード LIKE '2%';
    /* 21. */SELECT * FROM イベント WHERE タイプ=1 AND 前提イベント番号 IS NOT NULL AND 後続イベント番号 IS NOT NULL;
    /* 22. */ID、イベント番号ID、イベント番号
-- LEVEL3
    /* 23. */SELECT DISTINCT 状態コード FROM パーティー;
    /* 24. */SELECT ID, 名称 FROM パーティー ORDER BY ID;
    /* 25. */SELECT 名称, 職業コード FROM パーティー ORDER BY 名称 DESC;
    /* 26. */SELECT 名称, HP, 状態コード FROM パーティー ORDER BY 状態コード, HP DESC;
    /* 27. */SELECT タイプ, イベント番号, イベント名称, 前提イベント番号, 後続イベント番号 FROM イベント ORDER BY 1, 2;
    /* 28. */SELECT * FROM パーティー ORDER BY HP DESC LIMIT 3;
    /* 29. */SELECT * FROM パーティー ORDER BY MP DESC LIMIT 1 OFFSET 2;
    /* 30. */SELECT CASE WHEN 職業コード LIKE '1%' THEN 'S' WHEN 職業コード LIKE '2%' THEN 'M'ELSE 'A' END AS 職業区分, 職業コード, ID, 名称 FROM パーティー ORDER BY 職業コード;
    /* 31. */SELECT イベント.イベント番号 FROM イベント WHERE NOT EXISTS( SELECT 経験イベント.イベント番号 FROM 経験イベント WHERE 経験イベント.イベント番号=イベント.イベント番号);
    /* 32. */SELECT イベント番号 FROM イベント WHERE タイプ=2 AND EXISTS (SELECT 経験イベント.イベント番号 FROM 経験イベント WHERE 経験イベント.イベント番号=イベント.イベント番号);
    /* 33. */SELECT 名称 AS なまえ, HP AS 現在のHP, HP + 50 AS 装備後のHP FROM パーティー WHERE 職業コード IN ('11', '21');
    /* 34. */UPDATE パーティー SET MP=MP+20 WHERE ID IN ('A01', 'A03');
    /* 35. */SELECT 名称 AS なまえ, HP AS 現在のHP,HP * 2 AS 予想されるダメージ FROM パーティー WHERE 職業コード='11';
    /* 36. */SELECT 名称 AS なまえ, HP + "/" + MP  AS HPとMP, CASE 状態コード WHEN '00' THEN '' WHEN '01' THEN '眠り' WHEN '02' THEN '毒' WHEN '03' THEN '沈黙' WHEN '04' THEN '混乱' WHEN '09' THEN '気絶' END AS ステータス FROM パーティー;
    /* 37. */SELECT イベント番号, イベント名称, CASE タイプ WHEN '1' THEN '強制' WHEN '2' THEN 'フリー' WHEN '3' THEN '特殊'END AS タイプ, CASE WHEN イベント番号 BETWEEN 1 AND 10 THEN '序盤' WHEN イベント番号 BETWEEN 11 AND 17 THEN '中盤' ELSE '終盤' END AS 発生時期 FROM イベント;
    /* 38. */SELECT 名称 AS なまえ, HP AS 現在のHP, LENGTH(名称) * 10 AS 予想ダメージ FROM パーティー;
    /* 39. */UPDATE パーティー SET 状態コード='04' WHERE HP % 4 = 0 OR MP % 4 = 0;
    /* 40. */SELECT TRUNCATE(777 * (1-0.3),0) AS 支払った金額;
    /* 41. */UPDATE パーティー SET HP=ROUND(HP*1.3, 0), MP=ROUND(MP*1.3, 0);
    /* 42. */SELECT 名称 AS なまえ, HP, 1 AS 攻撃1回目, HP AS 攻撃1回目, HP*HP AS 攻撃3回目 FROM パーティー WHERE 職業コード='10';
    /* 43. */SELECT 名称 AS なまえ, HP, 状態コード, CASE WHEN HP BETWEEN 0 AND 50 THEN 3+CAST(状態コード AS SIGNED) WHEN HP BETWEEN 51 AND 100 THEN 2+CAST(状態コード AS SIGNED) WHEN HP BETWEEN 101 AND 150 THEN 1+CAST(状態コード AS SIGNED) ELSE CAST(状態コード AS SIGNED) END AS リスク値 FROM パーティー ORDER BY 4 DESC, HP;
    /* 44. */SELECT CASE WHEN 前提イベント番号 IS NULL THEN '前提なし' ELSE 前提イベント番号 END AS 前提イベント番号, イベント番号, CASE WHEN 後続イベント番号 IS NULL THEN '後続なし' ELSE 後続イベント番号 END AS 後続イベント番号 FROM イベント;
    /* 45. */SELECT MAX(HP), MIN(HP), AVG(HP) FROM パーティー;
    /* 46. */SELECT CASE タイプ WHEN '1' THEN '強制' WHEN '2' THEN 'フリー' WHEN '3' THEN '特殊'END AS タイプ, COUNT(*) FROM イベント GROUP BY タイプ;
    /* 47. */SELECT クリア結果, COUNT(*) FROM 経験イベント GROUP BY クリア結果 ORDER BY クリア結果;
    /* 48. */SELECT CASE WHEN SUM(MP) < 500 THEN '敵は見とれている!' WHEN SUM(MP) >= 1000 THEN '敵はひれ伏している!' ELSE '敵は呆然としている!' END AS 小さな奇跡 FROM パーティー;
    /* 49. */SELECT CASE クリア区分 WHEN '1' THEN 'クリアした' WHEN '0' THEN '参加したがクリアしていない' END AS 区分, COUNT(*) AS イベント数 FROM 経験イベント GROUP BY クリア区分 ORDER BY クリア区分 DESC;
    /* 50. */SELECT SUBSTRING(職業コード, 1, 1) AS IDによる分類, MAX(HP), MIN(HP), AVG(HP), MAX(MP), MIN(MP), AVG(MP) FROM パーティー GROUP BY SUBSTRING(職業コード, 1, 1);
    /* 51. */SELECT SUBSTRING(ID, 1, 1) AS IDによる分類, AVG(HP) AS HPの平均, AVG(MP) AS MPの平均 FROM パーティー GROUP BY SUBSTRING(ID, 1, 1) HAVING SUM(HP)>100;
    /* 52. */SELECT SUBSTRING(ID, 1, 1) AS IDによる分類, SUM(CASE WHEN HP < 100 THEN 1 WHEN HP BETWEEN 100 AND 149 THEN 2 WHEN HP BETWEEN 150 AND 200 THEN 3 ELSE 5 END) AS 力の扉の枚数 FROM パーティー GROUP BY SUBSTRING(ID, 1, 1);
    /* 53. */SELECT 名称 AS なまえ, HP, 1 AS 現在のHP, ROUND(HP/(SELECT SUM(HP) FROM パーティー),1) AS パーティーでの割合 FROM パーティー WHERE 職業コード='01';
    /* 54. */UPDATE パーティー, (SELECT SUM(MP) AS 合計 FROM パーティー) p SET MP=MP+ROUND((p.合計 - MP) * 0.1 ,0) WHERE 職業コード='20';
    /* 55. */SELECT イベント番号, クリア結果 FROM 経験イベント WHERE イベント番号 IN (SELECT イベント番号 FROM イベント WHERE タイプ IN ('1', '3'));
    /* 56. */SELECT 名称, MP FROM パーティー WHERE MP=(SELECT MAX(MP) FROM パーティー);
    /* 57. */SELECT イベント番号, イベント名称 FROM イベント WHERE イベント番号 NOT IN (SELECT イベント番号 FROM 経験イベント) ORDER BY イベント番号;
    /* 58. */SELECT COUNT(*) FROM イベント WHERE イベント番号 NOT IN (SELECT イベント番号 FROM 経験イベント);
    /* 59. */SELECT イベント番号, イベント名称 FROM イベント WHERE イベント番号<(SELECT イベント番号 FROM 経験イベント ORDER BY ルート番号 LIMIT 1 OFFSET 4);
    /* 60. */SELECT イベント番号, イベント名称, 前提イベント番号 FROM イベント WHERE 前提イベント番号 IN (SELECT イベント番号 FROM 経験イベント WHERE クリア区分='1');
    /* 61. */UPDATE 経験イベント SET クリア区分='1', クリア結果='B' WHERE イベント番号=9; 
             INSERT INTO 経験イベント(イベント番号, クリア区分, クリア結果, ルート番号) SELECT イベント.イベント番号,'0', NULL, MAX(経験イベント.ルート番号)+1 FROM イベント, 経験イベント WHERE イベント.前提イベント番号=9;
    /* 62. */SELECT 経験イベント.ルート番号, 経験イベント.イベント番号, イベント.イベント名称, 経験イベント.クリア結果 FROM 経験イベント, イベント WHERE 経験イベント.クリア区分='1' AND 経験イベント.イベント番号=イベント.イベント番号 ORDER BY 経験イベント.ルート番号;
    /* 63. */SELECT イベント.イベント番号, イベント名称, CASE WHEN クリア区分 IS NULL THEN '未クリア' ELSE クリア区分 END AS クリア区分 FROM イベント JOIN 経験イベント ON イベント.イベント番号=経験イベント.イベント番号 AND イベント.タイプ='1';
    /* 64. */SELECT イベント.イベント番号, イベント名称, CASE WHEN クリア区分 IS NULL THEN '未クリア' ELSE クリア区分 END AS クリア区分 FROM イベント LEFT JOIN 経験イベント ON イベント.イベント番号=経験イベント.イベント番号 AND イベント.タイプ='1';
    /* 65. */SELECT パーティー.ID, パーティー.名称 AS なまえ, c1.コード名称 AS 職業, c2.コード名称 AS 状態 FROM パーティー, コード c1, コード c2 WHERE c1.コード種別=1 AND c1.コード値=パーティー.職業コード AND c2.コード種別=2 AND c2.コード値=パーティー.状態コード ORDER BY パーティー.ID;
    /* 66. */SELECT ID, CASE WHEN 名称 IS NULL THEN '仲間になっていない!' ELSE 名称 END AS なまえ, コード名称 AS 職業 FROM パーティー LEFT JOIN (SELECT コード値, コード名称 FROM コード WHERE コード種別=1) c ON パーティー.職業コード=c.コード値;
    /* 67. */SELECT イベント番号, クリア区分, CONCAT(COALESCE(クリア結果,'NULL'),':',コード名称) AS クリア結果 FROM 経験イベント RIGHT JOIN (SELECT * FROM コード WHERE コード種別=4) c ON c.コード値=COALESCE(経験イベント.クリア結果, '');
    /* 68. */SELECT e1.イベント番号, e1.イベント名称, e1.前提イベント番号, COALESCE(e2.イベント名称, 'NULL') AS 前提イベント名称 FROM (SELECT * FROM イベント WHERE 前提イベント番号 IS NOT NULL) e1 LEFT JOIN イベント e2 ON e2.イベント番号=e1.前提イベント番号;
    /* 69. */SELECT e1.イベント番号, e1.イベント名称, e1.前提イベント番号, COALESCE(e2.イベント名称, 'NULL'), e1.後続イベント番号, COALESCE(e3.イベント名称, 'NULL') AS 後続イベント名称 FROM (SELECT * FROM イベント WHERE 前提イベント番号 IS NOT NULL OR 後続イベント番号 IS NOT NULL) e1 LEFT JOIN イベント e2 ON e2.イベント番号=e1.前提イベント番号 LEFT JOIN イベント e3 ON e3.イベント番号=e1.後続イベント番号 ;
    /* 70. */SELECT e1.イベント番号, e1.イベント名称, (SELECT COUNT(e2.イベント番号) FROM イベント e2 WHERE e2.前提イベント番号=e1.イベント番号) FROM イベント e1 WHERE e1.イベント番号 IN (SELECT 前提イベント番号 FROM イベント);