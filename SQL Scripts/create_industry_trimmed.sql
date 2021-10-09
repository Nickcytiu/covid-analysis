DROP TABLE IF EXISTS industry_trimmed_avg;
CREATE TABLE industry_trimmed_avg AS
WITH aer AS(
	SELECT
		*
	FROM trimmed_Aerospace ta),

auto AS(
	SELECT
		*
	FROM trimmed_Automotive ta),

ecom AS(
	SELECT
		*
	FROM trimmed_Ecommerce te),

ent AS(
	SELECT
		*
	FROM trimmed_Entertainment te),

ret AS(	
	SELECT
		*
	FROM trimmed_Retail tr),

trans AS(
	SELECT
		*
	FROM trimmed_Transportation tt),

trav AS(
	SELECT
		*
	FROM trimmed_Travel tt)

SELECT
	aer.date,
	aer.Trimmed_avg AS Aerospace,
	auto.Trimmed_avg AS Automotive,
	ecom.Trimmed_avg AS Ecommerce,
	ent.Trimmed_avg AS Entertainment,
	ret.Trimmed_avg AS Retail,
	trans.Trimmed_avg AS Transportation,
	trav.Trimmed_avg AS Travel
FROM aer
JOIN auto
ON
	aer.date = auto.date
JOIN ecom
ON
	aer.date = ecom.date
JOIN ent
ON
	aer.date = ent.date
JOIN ret
ON
	aer.date = ret.date
JOIN trans
ON
	aer.date = trans.date
JOIN trav
ON
	aer.date = trav.date;