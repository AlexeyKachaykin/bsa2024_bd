SELECT 
    u.id,
    u.username,
    ARRAY_AGG(fm.movie_id) as favorite_movie_ids
FROM 
    users u
LEFT JOIN 
    favorite_movies fm ON u.id = fm.user_id
GROUP BY 
    u.id, u.username;