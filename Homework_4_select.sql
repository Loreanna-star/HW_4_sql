--количество исполнителей в каждом жанре;
SELECT genre_name, COUNT(singer_id) singer_quantity FROM genres g
JOIN genressingers gs ON gs.singer_id = g.genre_id
GROUP BY g.genre_name 

--количество треков, вошедших в альбомы 2019-2020 годов;
SELECT album_name, COUNT(track_id) tracks_quantity FROM albums a 
JOIN tracks t ON t.album_id = a.album_id
WHERE date_part('year', a.album_year) BETWEEN 2019 AND 2020
GROUP BY album_name 

--средняя продолжительность треков по каждому альбому;
SELECT album_name, ROUND(AVG(duration), 2) average_track_duration FROM albums a
JOIN tracks t ON t.album_id = a.album_id
GROUP BY album_name 

--все исполнители, которые не выпустили альбомы в 2020 году;
SELECT DISTINCT singer_stage_name FROM singers s
WHERE singer_stage_name NOT IN (SELECT DISTINCT singer_stage_name FROM singers s
JOIN albumssingers als ON als.singer_id = s.singer_id
JOIN albums a ON als.album_id = a.album_id
WHERE date_part('year', a.album_year) = 2020)

--названия сборников, в которых присутствует конкретный исполнитель ('Madonna');
SELECT collection_name FROM collections c 
JOIN collectionstracks ct ON ct.collection_id = c.collection_id
JOIN tracks t ON ct.track_id = t.track_id
JOIN albums a ON t.album_id  = a.album_id
JOIN albumssingers als ON als.album_id = a.album_id
JOIN singers s ON als.singer_id = s.singer_id
WHERE s.singer_stage_name = 'Madonna'

--название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT album_name FROM albums a
JOIN albumssingers als ON als.album_id = a.album_id
JOIN singers s ON als.singer_id = s.singer_id
JOIN genressingers gs ON gs.singer_id = s.singer_id  
JOIN genres g ON gs.genre_id = g.genre_id
GROUP BY album_name 
HAVING COUNT(album_name) > 1

--наименование треков, которые не входят в сборники;
SELECT track_name FROM tracks t
LEFT JOIN collectionstracks ct ON ct.track_id = t.track_id
LEFT JOIN collections c ON ct.collection_id = c.collection_id
WHERE collection_name IS NULL

--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT singer_stage_name FROM singers s
JOIN albumssingers als ON als.singer_id = s.singer_id
JOIN albums a ON als.album_id = a.album_id
JOIN tracks t ON t.album_id = a.album_id
WHERE duration = (SELECT MIN(duration) from tracks)

--название альбомов, содержащих наименьшее количество треков. =(((
--SELECT album_id, COUNT(track_id) numb FROM tracks t

SELECT album_name FROM albums a
JOIN tracks t ON t.album_id = a.album_id
GROUP BY album_name
HAVING COUNT(track_id) = (SELECT MIN(cnt)
FROM (SELECT track_name, count(*) AS cnt FROM tracks t
GROUP BY track_name) t)