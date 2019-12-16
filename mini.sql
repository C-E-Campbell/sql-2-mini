CREATE TABLE movie(
  	movie_id SERIAL PRIMARY KEY,
  	title TEXT NOT NULL,
  	media_type_id INTEGER
  	FOREIGN KEY(media_type_id) REFRENCES media_type(media_type_id)
  	
  )
-- shortcut
  CREATE TABLE movie(
  	movie_id SERIAL PRIMARY KEY,
  	title TEXT NOT NULL,
  	media_type_id INTEGER REFERENCES media_type(media_type_id)
  	
  )

  INSERT INTO movie(title, media_type_id)
  VALUES("Everyone died on tuesday", 3)

  ALTER TABLE movie
  ADD COLUMN genre_id INTEGER REFERENCES genre(genre_id)
  SELECT * from movie


  SELECT * FROM track
  WHERE genre_id IN (SELECT genre_id FROM genre WHERE name = 'Jazz' OR name = 'Blues')


  UPDATE employee
  SET phone = NULL
  WHERE EmployeeId = 1

  SELECT * FROM customer
  WHERE company IS NULL;

  SELECT artst.name COUNT(*) FROM artist 
  JOIN album ON(artist.artist_id = album.artist_id)
  GROUP BY artist.artist_id;

SELECT artist.name, COUNT(*) FROM artist JOIN 
album ON(artist.artist_id = album.artist_id)
GROUP BY artist.artist_id ORDER BY COUNT DESC;

SELECT ar.artist_id, ar.name, COUNT(*) 
FROM artist ar
JOIN album a ON ar.artist_id = a.artist_id 
GROUP BY ar.artist_id;

-- JOINS
SELECT *
FROM invoice
JOIN invoice_line ON invoice_line.invoice_id = invoice.invoice_id
WHERE invoice_line.unit_price > 0.99;

SELECT invoice.invoice_date, customer.first_name, customer.last_name, invoice.total
FROM invoice
JOIN customer ON customer.customer_id = invoice.customer_id

SELECT customer.first_name, customer.last_name, customer.support_rep_id, employee.employee_id, employee.first_name, employee.last_name
FROM customer
JOIN employee ON customer.support_rep_id = employee.employee_id;

SELECT album.title, artist.artist_id
FROM album
JOIN artist ON album.artist_id = artist.artist_id

SELECT playlist.name, playlist_track.playlist_track_id
FROM playlist
JOIN playlist_track ON playlist_track.playlist_id = playlist.playlist_id
WHERE playlist.name = 'Music'

SELECT track.name
FROM track
JOIN playlist_track ON playlist_track.track_id = track.track_id
WHERE playlist_track.playlist_id = 5

-- nested queries
SELECT *
FROM invoice
WHERE invoice_id IN ( SELECT invoice_id FROM invoice_line WHERE unit_price > 0.99 );

SELECT *
FROM playlist_track
WHERE playlist_id IN(SELECT playlist_id FROM playlist WHERE name = 'Music')

SELECT name
FROM track
WHERE track_id IN ( SELECT track_id FROM playlist_track WHERE playlist_id = 5 );

SELECT *
FROM track
WHERE genre_id IN ( SELECT genre_id FROM genre WHERE name = 'Comedy' );

SELECT *
FROM track
WHERE album_id IN ( SELECT album_id FROM album WHERE title = 'Fireball' );

-- Practicing updating Rows

UPDATE customer
SET phone = NULL
WHERE fax IS NOT NULL

UPDATE customer
SET company = 'Self'
WHERE company = NULL