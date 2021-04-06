put "Application ID"
put ENV['ALGOLIASEARCH_APPLICATION_ID']
put "API Key"
put ENV['ALGOLIASEARCH_API_KEY']

AlgoliaSearch.configuration = {
  application_id: ENV['ALGOLIASEARCH_APPLICATION_ID'],
  api_key: ENV['ALGOLIASEARCH_API_KEY']
}