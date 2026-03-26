//%attributes = {}
var $en; $fr : 4D:C1709.Vector
var $AIClient : cs:C1710.AIKit.OpenAI
var $cosineSimilarity : Real
$AIClient:=cs:C1710.AIKit.OpenAI.new()

$AIClient.baseURL:="http://127.0.0.1:8080/v1"  // llama-server

$batch:=$AIClient.embeddings.create(\
["Achy Breaky Heart is a country song written by Don Von Tress. Originally titled Don't Tell My Heart and performed by The Marcy Brothers in 1991. "; \
"Who made the song My achy breaky heart?"])

$e1:=$batch.embeddings[0].embedding
$e2:=$batch.embeddings[1].embedding

$cosineSimilarity:=$e2.cosineSimilarity($e1)

ALERT:C41([$cosineSimilarity].join())

//0.8219073229358