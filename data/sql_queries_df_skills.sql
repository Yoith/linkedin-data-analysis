SELECT * FROM b.df_skills;

-- 1. Total ofertas de empleo para cada tipo de habilidad

SELECT 
    tipo_habilidad,
    COUNT(*) AS total_ofertas
FROM 
    df_skills
GROUP BY 
    tipo_habilidad;

-- 3. Total de apariciones de cada habilidad para cada tipo de empleo

SELECT 
    tipo_habilidad,
    SUM(da_intermedio) AS total_da_intermedio,
    SUM(da_junior) AS total_da_junior,
    SUM(da_senior) AS total_da_senior,
    SUM(de_intermedio) AS total_de_intermedio,
    SUM(de_junior) AS total_de_junior,
    SUM(de_senior) AS total_de_senior,
    SUM(ds_intermedio) AS total_ds_intermedio,
    SUM(ds_junior) AS total_ds_junior,
    SUM(ds_senior) AS total_ds_senior
FROM 
    df_skills
GROUP BY 
    tipo_habilidad;
    
-- 4.  Total de apariciones de cada habilidad para cada nivel de responsabilidad

SELECT 
    nombre_habilidad,
    SUM(da_intermedio + de_intermedio + ds_intermedio) AS total_intermedio,
    SUM(da_junior + de_junior + ds_junior) AS total_junior,
    SUM(da_senior + de_senior + ds_senior) AS total_senior
FROM 
    df_skills
GROUP BY 
    nombre_habilidad;
    
-- 5. habilidades más demandadas para cada tipo de empleo

SELECT 
    tipo_habilidad,
    CASE 
        WHEN MAX(da_intermedio + da_junior + da_senior) THEN 'Data Analyst'
        WHEN MAX(de_intermedio + de_junior + de_senior) THEN 'Data Engineer'
        WHEN MAX(ds_intermedio + ds_junior + ds_senior) THEN 'Data Scientist'
    END AS habilidad_más_demandada,
    MAX(da_intermedio + da_junior + da_senior + de_intermedio + de_junior + de_senior + ds_intermedio + ds_junior + ds_senior) AS apariciones_máximas
FROM 
    df_skills
GROUP BY 
    tipo_habilidad;
    
-- 6. Habilidades más demandadas

SELECT 
    nombre_habilidad,
    SUM(da_intermedio + da_junior + da_senior + de_intermedio + de_junior + de_senior + ds_intermedio + ds_junior + ds_senior) AS total_apariciones
FROM 
    df_skills
GROUP BY 
    nombre_habilidad
ORDER BY 
    total_apariciones DESC;
    
-- 7. Tipo de empleo más demandado para cada habilidad

SELECT 
    nombre_habilidad,
    CASE 
        WHEN MAX(da_intermedio + da_junior + da_senior) THEN 'Data Analyst'
        WHEN MAX(de_intermedio + de_junior + de_senior) THEN 'Data Engineer'
        WHEN MAX(ds_intermedio + ds_junior + ds_senior) THEN 'Data Scientist'
    END AS empleo_más_demandado
FROM 
    df_skills
GROUP BY 
    nombre_habilidad;

-- 8. Habilidades presentes en todos los empleos y Niveles de Responsabilidad

SELECT 
    nombre_habilidad
FROM 
    df_skills
GROUP BY 
    nombre_habilidad
HAVING 
    SUM(da_intermedio > 0 AND da_junior > 0 AND da_senior > 0
         AND de_intermedio > 0 AND de_junior > 0 AND de_senior > 0
         AND ds_intermedio > 0 AND ds_junior > 0 AND ds_senior > 0) = 1;
         
-- 9. Habilidades que son relevantes para un nivel de responsabilidad intermedio         
         
SELECT 
    nombre_habilidad
FROM 
    df_skills
GROUP BY 
    nombre_habilidad
HAVING 
    SUM(da_intermedio + de_intermedio + ds_intermedio) > 0 
    AND SUM(da_junior + de_junior + ds_junior) = 0 
    AND SUM(da_senior + de_senior + ds_senior) = 0;
    
-- 10. Habilidades menos comunes para cada tipo de empleo

SELECT 
    tipo_habilidad,
    nombre_habilidad,
    LEAST(
        SUM(da_intermedio + da_junior + da_senior),
        SUM(de_intermedio + de_junior + de_senior),
        SUM(ds_intermedio + ds_junior + ds_senior)
    ) AS total_demandado
FROM 
    df_skills
GROUP BY 
    tipo_habilidad, nombre_habilidad
ORDER BY 
    total_demandado;
    
-- 11. Habilidades más comunes y su proporción respecto al total de apariciones

SELECT 
    nombre_habilidad,
    SUM(da_intermedio + da_junior + da_senior + de_intermedio + de_junior + de_senior + ds_intermedio + ds_junior + ds_senior) AS total_apariciones,
    ROUND(SUM(da_intermedio + da_junior + da_senior + de_intermedio + de_junior + de_senior + ds_intermedio + ds_junior + ds_senior) / (SELECT SUM(da_intermedio + da_junior + da_senior + de_intermedio + de_junior + de_senior + ds_intermedio + ds_junior + ds_senior) FROM df_skills) * 100, 2) AS proporción_total
FROM 
    df_skills
GROUP BY 
    nombre_habilidad
ORDER BY 
    total_apariciones DESC;

-- 12. Habilidades que son más comunes en los niveles intermedio y junior, pero no en el nivel senior    
    
SELECT 
    nombre_habilidad
FROM 
    df_skills
GROUP BY 
    nombre_habilidad
HAVING 
    SUM(da_intermedio + de_intermedio + ds_intermedio + da_junior + de_junior + ds_junior) > 0
    AND SUM(da_senior + de_senior + ds_senior) = 0;
    
-- 13. Habilidades que son relevantes solo para el tipo de habilidad "Hard Skill"    
    
SELECT 
    nombre_habilidad
FROM 
    df_skills
WHERE 
    tipo_habilidad = 'Hard Skill'
GROUP BY 
    nombre_habilidad;