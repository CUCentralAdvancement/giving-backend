puts "Application ID"
puts ENV['ALGOLIASEARCH_APPLICATION_ID']
puts "API Key"
puts ENV['ALGOLIASEARCH_API_KEY']

AlgoliaSearch.configuration = {
  application_id: ENV['ALGOLIASEARCH_APPLICATION_ID'],
  api_key: ENV['ALGOLIASEARCH_API_KEY']
}