### Returns the Name of the film, They earliest year the film was first published, the film's IMDB Id, and the Wikidata film object

SELECT  ?filmLabel (MIN(YEAR(?publication_date)) AS ?year) ?imdb_id ?film   
WHERE {
  ?film wdt:P31 wd:Q11424.  # Get Films
  ?film wdt:P6145 ?oscar_id. # Academy Awards Film Database Id
  
  OPTIONAL { ?film wdt:P577 ?publication_date. } # For each film, return their, possibly multiple, publication dates
  OPTIONAL { ?film wdt:P345 ?imdb_id. } # for each film return the IMDB ID
  
  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE]". }
}
Group by ?filmLabel ?year ?imdb_id ?film # Group to allow the Min(year) to work
ORDER BY ?year ?filmLabel
