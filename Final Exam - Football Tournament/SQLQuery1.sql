
--Query number 1 - all players from teams:



	SELECT player_name AS Players
	FROM dbo.[Football Players];



--Query number 2 - Number of wins, losses and draw for teams:



	SELECT 
			SUM(CASE
				WHEN t.team_id = m.home_team_id AND home_team_score > m.away_team_score OR t.team_id = m.away_team_id AND away_team_score > home_team_score THEN 1
				ELSE 0
				END) AS Wins,
			SUM(CASE
				WHEN t.team_id = m.home_team_id AND home_team_score = away_team_score OR t.team_id = m.away_team_id AND away_team_score = home_team_score THEN 1
				ELSE 0  
				END) AS Ties,
			SUM(CASE
				WHEN t.team_id = m.home_team_id AND home_team_score < away_team_score OR t.team_id = m.away_team_id AND away_team_score < home_team_score THEN 1
				ELSE 0
				END) AS Losses
			FROM Matches as m
			JOIN Teams as t
			ON m.home_team_id = t.team_id OR m.away_team_id = t.team_id
			WHERE t.team_id = 1  -- Here we change the number, with the team id we want to check



	--Query number 3 - Last match on team by date:



	SELECT t.team_name AS TeamName, m.game_date AS GameDate, m.home_team_score AS HomeTeamScore, m.away_team_score AS AwayTeamScore
	FROM Matches AS m
	JOIN Teams AS t
	ON m.home_team_id=t.team_id OR away_team_id=t.team_id
	WHERE t.team_id=1
	ORDER BY m.game_date DESC;



	--Query number 4 - All teams, with more than half of matches won:



;WITH checker 
AS
(
select t.team_name AS TeamName,
       count(*) as TotalGames,
       SUM(case 
                when t.team_id = m.home_team_id AND m.home_team_score > m.away_team_score OR t.team_id = m.away_team_id AND m.away_team_score > m.home_team_score
                then 1 ELSE 0
           end) as Wins,
       SUM(case 
                when t.team_id = m.home_team_id AND m.home_team_score < m.away_team_score OR t.team_id = m.away_team_id AND m.away_team_score < m.home_team_score
                then 1 ELSE 0
           end) as Losses
from Matches as m
JOIN Teams as t
ON m.home_team_id=t.team_id OR m.away_team_id=t.team_id
GROUP BY t.team_name
)
SELECT *
FROM Checker
WHERE Wins > Losses



	--Query number 5 



	USE [Football Tournament]
	GO;


	CREATE PROCEDURE QueryN5 (@team_id AS INT) AS
	SELECT t.team_name AS TeamName,
		SUM
		(
			CASE WHEN t.team_id = m.home_team_id AND home_team_score > away_team_score OR t.team_id = m.away_team_id AND
			away_team_score > home_team_score THEN 3  
			WHEN t.team_id = m.home_team_id AND home_team_score = away_team_score OR t.team_id = m.away_team_id AND
			away_team_score = home_team_score THEN 1 ELSE 0 END) AS TotalPoints,
													 m.game_date AS GameDate
	FROM Matches AS m
	JOIN Teams AS t
		ON m.home_team_id = t.team_id OR m.away_team_id = t.team_id 
		WHERE team_id=@team_id
		GROUP BY m.game_date, t.team_name;


EXEC QueryN5
@team_id = 1;
GO