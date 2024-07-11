-- 3-glam_rock.sql
-- lists all bands with Glam rock ranked by logevity

SELECT band_name, (2022 - formed) AS lifespan
FROM metal_bands
WHERE main_style = 'Glam rock'
ORDER BY lifespan DESC;