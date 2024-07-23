SELECT 
    p.id as director_id,
    CONCAT(p.first_name, ' ', p.last_name) as director_name,
    AVG(m.budget) as average_budget
FROM 
    persons p
JOIN 
    movies m ON p.id = m.director_id
GROUP BY 
    p.id, p.first_name, p.last_name
ORDER BY 
    average_budget DESC;