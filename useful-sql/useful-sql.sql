SELECT
  status,
  include_in_school_search,
  count(*)
FROM areas
  INNER JOIN area_summaries ON areas.id = area_summaries.area_id
GROUP BY status, include_in_school_search;

/**
SELECT
  count(schools.id),
  areas.name
FROM schools
  INNER JOIN areas ON areas.id = schools.area_id
GROUP BY areas.name;

**/