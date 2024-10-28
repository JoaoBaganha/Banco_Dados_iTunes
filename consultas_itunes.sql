--1. Listar todas as faixas (tracks) com o nome do artista (artist), o nome do álbum (album) e o nome do gênero (genre) associados.
SELECT track.name AS track_name, album.title AS album_name, genre.name AS genre_name, artist.name AS artist_name
FROM track
JOIN album ON track.album_id = album.album_id 
JOIN artist ON album.artist_id = artist.artist_id
JOIN genre ON track.genre_id = genre.genre_id;



--2. Listar todos os clientes (customers) e a quantidade de invoices associadas a cada um, mesmo que o cliente não tenha nenhuma invoice.(Left Join com Coalesce)




--3 Calcular o total de vendas (total) por cada cliente (customer), exibindo o nome do cliente e o valor total. Acima de 35.(Pesquisem sobre HAVING ou Subquery)




--4. Listar todos os clientes que residem em países cujo nome começa com 'B'.
SELECT * 
FROM customer
WHERE country LIKE 'B%';



--5. Listar os artistas (artists) que não possuem nenhum álbum associado.
SELECT artist.name AS artists, album.title AS albums
FROM artist
LEFT JOIN album ON artist.artist_id = album.artist_id
WHERE title IS NULL;


--6. Calcular o valor total gasto pelos clientes em faixas de um gênero que comece com "R" e termine com "k".



--7. Listar o total de vendas (invoices) por mês (extraído da invoice_date) que sejam ímpares.
SELECT EXTRACT(MONTH FROM invoice_date) AS invoice_month,
SUM(total) AS invoice_total_month
FROM invoice
WHERE EXTRACT(MONTH FROM invoice_date) % 2 != 0
GROUP BY EXTRACT(MONTH FROM invoice_date)
ORDER BY invoice_month ASC

--8. Listar as faixas (tracks) com a maior duração em milissegundos para cada álbum (album). Informe se a duracao é par ou não. 






--9. Mostre os três artistas que mais venderam, que não tenham a letra "e".




--10.Obter a quantidade de faixas (tracks) por gênero (genre) e o preço médio (unit_price) das faixas em cada gênero.


--11. Calcular a média do valor total das invoices por cidade (city) dos clientes. 


--12 Calcular o total de vendas (total) por cada cliente (customer), exibindo o nome do cliente e o valor total. Traga apenas os resultados acima da média. (Pesquisem sobre HAVING ou Subquery)


--13. Calcular o tempo total (milissegundos) das faixas (tracks) em cada álbum (album).
SELECT * FROM track
SELECT * FROM album

SELECT album.title as album_title,
SUM(track.milliseconds) AS album_total_time
FROM album
JOIN track ON album.album_id = track.album_id
GROUP BY album.title
ORDER BY album_total_time ASC;


--14. Listar o nome do álbum, o nome da faixa, e o preço total das faixas (track * quantity) vendidas em cada invoice. Mostre apenas os álbuns que foram gravados ao vivo.


--15. Calcular o valor total de vendas e o número de vendas realizadas por cada cliente cujo nome (first_name) começa com 'A' e  o sobrenome (last_name) não termine com 'a'.


--16.  Listar as faixas mais caras (tracks) para cada gênero (genre) que não tenha a letra "u", mostrando o nome do gênero, o nome da faixa e o preço.  


--17. Mostre os três artistas que mais venderam, que não tenham a letra "o".
SELECT artist.name AS artist,
SUM (invoice.total) AS revenue_artist
FROM artist
JOIN album ON artist.artist_id = album.artist_id
JOIN track ON album.album_id = track.album_id
JOIN invoice_line ON track.track_id = invoice_line.track_id
JOIN invoice ON invoice_line.invoice_id = invoice.invoice_id
WHERE artist.name NOT LIKE '%o%'
GROUP BY artist.name
ORDER BY revenue_artist DESC
LIMIT 3

select * from artist
