curl -X POST -k -H "Content-Type: application/json" "https://apps.sematext.com/spm-reports/api/v2/metrics/data" -d '
{
  "apiKey" : "<REDACTED>",
  "appToken" : "<REDACTED>",
  "metric" : "os.*",
  "filters" : {
    "hostFilter" : {"values":["default3"]}
  }
}'
