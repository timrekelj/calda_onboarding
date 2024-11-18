CREATE VIEW deathwish WITH (security_invoker) AS
SELECT
  COALESCE(dc.name, dd.name) AS combined_name,
  dc.price,
  dc.personal_note,
  ud.name,
  json_agg(
    json_build_object(
      'benefactors_name', b.name,
      'kinship', b.kinship
    )
  ) AS benefactors
  FROM deathwish_custom dc
  LEFT JOIN benefactors b ON dc.id = b.deathwish_id
  LEFT JOIN deathwish_default dd ON dc.deathwish_id = dd.id
  LEFT JOIN user_data ud ON dc.user_id = ud.id
  GROUP BY dc.id, dc.name, ud.name, dd.name, dc.price, dc.personal_note;
