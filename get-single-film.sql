SELECT  ?filmLabel (MIN(YEAR(?publication_date)) AS ?year) ?imdb_id ?film   
WHERE {
  wd:Q1888547 wdt:P171* ?film. # where wd:* is the Id of the film you want to look up
  ?film wdt:P345 ?imdb_id.  # for each film return the IMDB ID
  ?film wdt:P577 ?publication_date. # For each film, return their, possibly multiple, publication dates
  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE]". }
}
Group by ?filmLabel ?year ?imdb_id ?film # Group to allow the Min(year) to work
ORDER BY ?year ?filmLabel
