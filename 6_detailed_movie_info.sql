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
        'id', d.id,
        'first_name', d.first_name,
        'last_name', d.last_name,
        'photo', json_build_object(
            'id', df.id,
            'file_name', df.file_name,
            'url', df.url
        )
    ) as director,
    COALESCE(json_agg(
        json_build_object(
            'id', a.id,
            'first_name', a.first_name,
            'last_name', a.last_name,
            'photo', json_build_object(
                'id', af.id,
                'file_name', af.file_name,
                'url', af.url
            )
        )
    ) FILTER (WHERE a.id IS NOT NULL), '[]') as actors,
    COALESCE(json_agg(
        json_build_object(
            'id', g.id,
            'name', g.name
        )
    ) FILTER (WHERE g.id IS NOT NULL), '[]') as genres
FROM 
    movies m
LEFT JOIN 
    files f ON m.poster_file_id = f.id
LEFT JOIN 
    persons d ON m.director_id = d.id
LEFT JOIN 
    files df ON d.primary_photo_id = df.id
LEFT JOIN 
    movie_actors ma ON m.id = ma.movie_id
LEFT JOIN 
    persons a ON ma.person_id = a.id
LEFT JOIN 
    files af ON a.primary_photo_id = af.id
LEFT JOIN 
    movie_genres mg ON m.id = mg.movie_id
LEFT JOIN 
    genres g ON mg.genre_id = g.id
WHERE 
    m.id = 1
GROUP BY 
    m.id, m.title, m.release_date, m.duration, m.description, f.id, f.file_name, f.url, 
    d.id, d.first_name, d.last_name, df.id, df.file_name, df.url;