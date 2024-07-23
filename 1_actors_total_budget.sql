SELECT 
    p.id,
    p.first_name,
    p.last_name,
    COALESCE(SUM(m.budget), 0) as total_movies_budget
FROM 
    persons p
LEFT JOIN 
    movie_actors ma ON p.id = ma.person_id
LEFT JOIN 
    movies m ON ma.movie_id = m.id
GROUP BY 
    p.id, p.first_name, p.last_name
ORDER BY 
    total_movies_budget DESC;