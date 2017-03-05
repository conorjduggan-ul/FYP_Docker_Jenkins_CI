curl -X POST -k -H "Content-Type: application/json" "https://apps.sematext.com/spm-reports/api/v2/metrics/data" -d '
{
  "apiKey" : "<REDACTED>",
  "appToken" : "<REDACTED>",
  "start" : "2017-03-04 21:50:00",
  "end" : "2017-03-05 00:25:00",
  "granularity": "ONE_MINUTE",
  "metric" : "docker.containers"
}'
