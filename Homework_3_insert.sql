INSERT INTO genres(genre_name)
VALUES ('alternative'),
       ('pop music'),
       ('rap'),
       ('electronic dance music'),
       ('grunge'),
       ('nu metal'),
       ('heavy metal'),
       ('hip-hop');
       
INSERT INTO singers(singer_stage_name)
VALUES ('Evanescence'),
       ('Madonna'),
       ('Kanye West'),
       ('Avicii'),
       ('Nirvana'),
       ('Slipknot'),
       ('Manowar'),
       ('Jay-Z');
       
INSERT INTO albums(album_name, album_year)
VALUES ('Fallen', '2003-12-08'),
       ('Ray of Light', '1998-02-22'),
       ('Ye', '2018-06-01'),
       ('True', '2013-06-17'),
       ('Nevermind', '1991-09-24'),
       ('All Hope Is Gone', '2008-08-20'),
       ('Gods of War', '2007-02-23'),
       ('The Blueprint', '2001-09-11'),
       ('Madame X', '2020-06-14');      

INSERT INTO tracks(track_name, duration, album_id)
VALUES ('My Immortal', 273, 1),
       ('Frozen', 370, 2),
       ('All mine', 145, 3),
       ('Wake me up', 246, 4),
       ('Smells Like Teen Spirit', 301, 5),
       ('Sulfur', 278, 6),
       ('Sleipnir', 313, 7),
       ('Super Ugly', 300, 8 ),
       ('In Bloom', 254, 5),
       ('Come as You Are', 218, 5),
       ('Breed', 183, 5),
       ('Lithium', 256, 5),
       ('Polly', 176, 5),
       ('Drain You', 223, 5),
       ('Stay Away', 212, 5),
       ('Crazy', 242, 9),
       ('I Rise', 224, 9),
       ('Takeover', 313, 8);

INSERT INTO collections(collection_name, collection_year)
VALUES ('First collection', '2021-01-02'),
       ('Second collection', '2020-08-02'),
       ('Third collection', '2022-02-12'),
       ('Fourth collection', '2019-06-25'),
       ('Fifth collection', '2018-07-08'),
       ('The best collection', '2022-05-06'),
       ('New collection', '2022-04-09'),
       ('Top collection', '2021-04-28');

INSERT INTO genressingers(singer_id, genre_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8),
       (3, 8),
       (8, 3);

INSERT INTO albumssingers(album_id, singer_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8),
       (9, 2); 

INSERT INTO collectionstracks(collection_id, track_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8),
       (1, 2),
       (2, 3),
       (3, 4),
       (4, 5),
       (5, 6),
       (6, 7),
       (7, 8),
       (8, 1);
       

