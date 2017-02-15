curl -X POST -k -H "Content-Type: application/json" "https://apps.sematext.com/spm-reports/api/v2/metrics/data" -d '
{
  "apiKey" : "f4be76f5-119a-435c-807b-a39049341f50",
  "appToken" : "e37df2a5-5d3d-48c8-803e-5a0844a577ed",
  "metric" : "docker.containers"
}'
