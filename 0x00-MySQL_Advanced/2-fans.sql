-- column names: origin and nb_fans
-- script executed by any database

SELECT origin, COUNT(fans) AS nb_fans
FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC;