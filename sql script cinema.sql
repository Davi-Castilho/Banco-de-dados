select * from directors as d inner join movies as m on d.id = m.director_id; -- inner join
select count(*) from movies;

-- Left Join
select * from movies as m left join directors as d on m.director_id = d.id;

-- right join
select * from movies as m right join directors as d on m.director_id = d.id;

-- Exercicios slide 11 aula 26/03

-- 1) Liste todos os diretores e os filmes que eles dirigiram
select * from movies as m right join directors as d on m.director_id = d.id; 

-- 2) Liste todos os filmes e seus tickets vendidos
  select * from movies as m join tickets as t on m.id = t.movie_id;
  
-- 3)Liste todos os filmes, seus diretores e os tickets vendidos
 select * from movies as m join directors as d on d.id = m.director_id join tickets as t on m.id = t.movie_id;

-- 4) Liste todos os diretores, incluindo aqueles que não dirigiram nenhum filme 
    select * from directors as d left join movies as m on d.id = m.director_id;
    
-- 5) Liste todos os filmes, incluindo aqueles que não têm um diretor associado
  select * from movies as m left join directors as d on m.director_id = d.id;

-- 6) Liste todos os filmes que têm tickets e seus diretores, incluindo os filmes sem tickets
     select * from movies as m join directors as d on d.id = m.director_id left join tickets as t on m.id = t.movie_id;
     
-- 7) liste todos os filmes que têm tickets e seus diretores, incluindo os diretores sem filmes
    select * from movies as m join tickets as t on m.id = t.movie_id right join directors as d on  d.id = m.director_id; 

-- 8) Liste todos os filmes que não têm tickets e seus diretores
  select * from movies as m left join tickets as t on m.id = t.movie_id  left join directors as d on m.director_id = d.id where t.id is null;
  
-- 9) Liste todos os diretores, incluindo aqueles que não dirigiram nenhum filme, e os filmes que têm tickets
   select * from directors as d left join movies as m on d.id = m.director_id left join tickets as t on m.id = t.movie_id;
   
-- 10) Liste todos os filmes que têm tickets e seus diretores
 select * from movies as m inner join tickets as t on m.id = t.movie_id inner join directors as d on m.director_id = d.id;
 
-- 11) Liste todos os filmes e seus diretores, incluindo os filmes sem diretores 
 select * from movies as m left join directors as d on m.director_id = d.id;

 