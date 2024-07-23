SELECT 
    m.id,
    m.title,
    COUNT(DISTINCT ma.person_id) as actors_count
FROM 
    movies m
LEFT JOIN 
    movie_actors ma ON m.id = ma.movie_id
WHERE 
    m.release_date >= CURRENT_DATE - INTERVAL '5 years'
GROUP BY 
    m.id, m.title
ORDER BY 
    m.release_date DESC;