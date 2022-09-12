USE `n2exercici1`;


# Inserts USER

INSERT INTO `user`(email, nickname, born_date, Genre, country, zip_code) VALUES
    ("varlat@gmail.com", "varlat", DATE("1992-12-03"), "F", "Denmark", "30491"),
    ("robpatale@gmail.com", "sir_patale", DATE("1998-04-30"), "M", "Ireland", "02013"),
    ("maskilat@gmail.com", "maski", DATE("1984-10-13"), "M", "Turkey", "20482"),
    ("perseakanopus@gmail.com", "perska", DATE("1989-05-09"), "F", "Greece", "63167"),
    ("arnycastle@gmail.com", "mr.whiskers", DATE("1996-02-28"), "M", "United Kingdom", "74245"),
    ("ainacortes@gmail.com", "puppycat", DATE("2000-11-27"), "M", "Spain", "08030");

SELECT * FROM `user`; # Confirmem que les dades s'han pujat correctament

# Inserts VIDEO

INSERT INTO `video`(title, size, file_name, duration, thumbnail, num_plays, state, user_id) VALUES 
    ("MongoDB from 0 to 100 Tutorial #1", 30.4, "mongodb1.mp4", TIME("15:30:24"), 
        "https://live.mrf.io/statics/i/ps/www.muylinux.com/wp-content/uploads/2019/01/mongodb.png?width=1200&enable=upscale", 120, "Public", 1),
    ("Test", 1.3, "test.mp4", TIME("00:00:03"), 
        "https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Solid_black.svg/768px-Solid_black.svg.png", 1, "Private", 3),
    ("Gameplay Fortnite", 80.2, "fornite1.mp4", TIME("1:34:19"), 
        "https://cdn2.unrealengine.com/14br-consoles-1920x1080-wlogo-1920x1080-432974386.jpg", 630, "Public", 6),
    ("Machine Learning vs Society", 13.5, "csct_homework.mp4", TIME("12:20:53"), 
        "https://revistabyte.es/wp-content/uploads/2020/06/el-machine-learning-en-50-terminos-por-paradigma-digital-696x416.jpg", 27, "Hidden", 1);

SELECT * FROM `video`; # Confirmem que les dades s'han pujat correctament

-- Disparador per tal de calcular el num de likes i dislikes d'un video
DROP TRIGGER IF EXISTS compute_video_reacts;

DELIMITER \\

CREATE TRIGGER compute_video_reacts 
AFTER INSERT ON video_reaction
FOR EACH ROW
BEGIN 
    
    # Calculem el número de likes i dislikes i els guardem en n_likes i n_dislikes respectivament
    SELECT COUNT(vr.id) INTO @n_likes FROM video_reaction as vr JOIN video as v
    ON v.id = vr.video_id WHERE v.id = NEW.video_id AND vr.`type` LIKE "Like";
    
    SELECT COUNT(vr.id) INTO @n_dislikes FROM video_reaction as vr JOIN video as v
    ON v.id = vr.video_id WHERE v.id = NEW.video_id AND vr.`type` LIKE "Dislike";

    # Actualitzem els números segons les dades extretes
    UPDATE video SET 
        num_likes = @n_likes,
        num_dislikes = @n_dislikes
    WHERE id = NEW.video_id;
END; \\

DELIMITER ;
# Inserts TAG

INSERT INTO `tag`(`name`, video_id) VALUES 
    ("databases", 1),
    ("programming", 1),
    ("developing", 1),
    ("technology", 1),
    ("tutorial", 1),
    ("technology", 4),
    ("humanity", 4),
    ("society", 4),
    ("games", 3),
    ("gameplay", 3);

SELECT * FROM `tag`; # Confirmem que les dades s'han pujat correctament

# Inserts CHANNEL

INSERT INTO `channel`(`name`, `description`, user_id) VALUES 
    ("techandtheo", "Channel focused on programming and technologies theories", 1),
    ("gamology", "Having fun and posting it", 6),
    ("rookieboy", "Just trying something new", 3);

SELECT * FROM `channel`; # Confirmem que les dades s'han pujat correctament

# Inserts SUBSCRIPTION

INSERT INTO `subscription`(user_id, channel_id) VALUES 
    (1, 2),
    (3, 2),
    (3, 1);

SELECT * FROM `subscription`; # Confirmem que les dades s'han pujat correctament

# Inserts VIDEO_REACTION

INSERT INTO `video_reaction`(`type`, user_id, video_id) VALUES 
    ("Like", 3, 1),
    ("Like", 3, 2),
    ("Dislike", 6, 1);

SELECT * FROM `video_reaction`; # Confirmem que les dades s'han pujat correctament

# Inserts PLAYLIST

INSERT INTO `playlist`(`name`, state, user_id) VALUES
    ("techies", "Public", 3),
    ("games", "Private", 1);

SELECT * FROM `playlist`; # Confirmem que les dades s'han pujat correctament

# Inserts COMMENT

INSERT INTO `comment`(`text`, user_id, video_id) VALUES 
    ("I learnt a lot with you", 3, 1),
    ("Hahahah so cool when you shot that stick", 3, 2);

SELECT * FROM `comment`; # Confirmem que les dades s'han pujat correctament

# Inserts COMMENT_REACTION

INSERT INTO `comment_reaction`(`type`, user_id, comment_id) VALUES
    ("Like", 2, 1),
    ("Like", 6, 1),
    ("Like", 4, 2),
    ("Dislike", 5, 1);

SELECT * FROM `comment_reaction`;

# Inserts PLAYLIST_HAS_VIDEO

INSERT INTO `playlist_has_video`(playlist_id, video_id) VALUES
    (1, 1),
    (1, 4),
    (2, 2);

SELECT * FROM `playlist_has_video`;

SELECT * FROM `video`; # comprovem que el trigger ha funcionat
