
### Returns the Name of the film, They earliest year the film was first published, the film's IMDB Id, and the Wikidata film object


SELECT  ?filmLabel (MIN(YEAR(?publication_date)) AS ?year) ?imdb_id ?film   WHERE {
  ?film wdt:P31 wd:Q11424.
  ?film (wdt:P1411/wdt:P31?) wd:Q19020.
  ?film wdt:P345 ?imdb_id.
  ?film wdt:P577 ?publication_date.
  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE]". }
}
Group by ?filmLabel ?year ?imdb_id ?film
ORDER BY ?year ?filmLabel
