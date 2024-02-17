curl -s 'https://simonwillison.net/dashboard/blog-content-by-day-with-titles.json' | \
  jq -r '.queries[0].rows[0].result'
