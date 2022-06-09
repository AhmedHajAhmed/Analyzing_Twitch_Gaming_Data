-- Let's have a look at the tables 
SELECT *
FROM stream
LIMIT 20;

SELECT *
FROM chat
LIMIT 20;


-- What are the unqiue games?
SELECT DISTINCT game
FROM stream;

-- What are the unique channels?
SELECT DISTINCT channel
FROM stream;


-- What are the mmost popular games? 
SELECT game, COUNT(*)
FROM stream
GROUP BY game
ORDER BY COUNT(*) DESC;


-- There are big numbers from the game 'League of Legends'. Where are 'League of Legends' stream viewers located? 
SELECT country, COUNT(*)
FROM stream
WHERE game = 'League of Legends'
GROUP BY country
ORDER BY COUNT(*) DESC;


-- The player column contains the source the user is using to view the stream. Let's see the number of streamers for each source.
SELECT player, COUNT(*)
FROM stream
GROUP BY player
ORDER BY COUNT(*) DESC;


-- Let's create a new column 'genre' for each of the games
SELECT game,
  CASE
    WHEN game = 'Dota2'
      THEN 'MOBA'
    WHEN game = 'League of Legends'
      THEN 'MOBA'
    WHEN game = 'Heroes of the Storm'
      THEN 'MOBA'
    WHEN game = 'Counter-Strike: Global Offensive'
      THEN 'FPS'
    WHEN game = 'DayZ'
      THEN 'Survival'
    WHEN game = 'ARK: Survival Evolved'
      THEN 'Survival'
    ELSE 'Other'
  END AS 'genre',
  COUNT(*)
FROM stream 
GROUP BY game
ORDER BY COUNT(*) DESC;


-- How does view count change in the course if a day? Let's see the view count for each hour. (Because this data is international and there are multiple time differences, let’s filter the result to the US)
SELECT strftime('%H', time), COUNT(*)
FROM stream 
WHERE country = 'US'
GROUP BY 1;
