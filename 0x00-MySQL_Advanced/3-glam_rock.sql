-- 3-glam_rock.sql
-- lists all bands with Glam rock ranked by logevity

SELECT band_name, 
        IF(split IS NULL, 2022 - formed, split - formed) AS lifespan
FROM metal_bands
WHERE style = 'Glam rock'
ORDER BY lifespan DESC;