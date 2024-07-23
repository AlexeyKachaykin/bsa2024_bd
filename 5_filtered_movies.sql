SELECT 
    m.id,
    m.title,
    m.release_date,
    m.duration,
    m.description,
    json_build_object(
        'id', f.id,
        'file_name', f.file_name,
        'url', f.url
    ) as poster,
    json_build_object(
        'id', p.id,
        'first_name', p.first_name,
        'last_name', p.last_name
    ) as director
FROM 
    movies m
JOIN 
    persons p ON m.director_id = p.id
LEFT JOIN 
    files f ON m.poster_file_id = f.id
JOIN 
    movie_genres mg ON m.id = mg.movie_id
JOIN 
    genres g ON mg.genre_id = g.id
WHERE 
    m.country_id = 1
    AND m.release_date >= '2022-01-01'
    AND m.duration > 135
    AND g.name IN ('Action', 'Drama')
GROUP BY 
    m.id, m.title, m.release_date, m.duration, m.description, f.id, f.file_name, f.url, p.id, p.first_name, p.last_name
HAVING 
    COUNT(DISTINCT CASE WHEN g.name IN ('Action', 'Drama') THEN g.id END) > 0;