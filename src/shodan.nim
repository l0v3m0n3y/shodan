import asyncdispatch, httpclient, json, strutils,uri
const api = "https://entitydb.shodan.io/api"
var headers = newHttpHeaders({
    "Connection": "keep-alive",
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36",
    "Host": "entitydb.shodan.io",
    "Accept": "application/json",
    "Content-Type": "application/json"
})


proc get_entities *(entities_id:int): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/entities/" & $entities_id)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_entities_symbol *(symbol:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/entities/symbol/" & symbol)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
