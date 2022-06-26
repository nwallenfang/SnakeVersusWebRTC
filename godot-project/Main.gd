extends Node

func generate():
	var crypto = Crypto.new()
	# Generate 4096 bits RSA key.
	var key = crypto.generate_rsa(4096)
	key.save("test.key")
	# Generate self-signed certificate using the given key.
	var cert = crypto.generate_self_signed_certificate(key, "CN=example.com,O=A Game Company,C=IT")
	cert.save("test.crt")
	
	# -- read keys
	var keyy = CryptoKey.new()
	var err = keyy.load("res://HTTPSKeys/private.key")
	var certt = X509Certificate.new()
	var err_cert = certt.load("res://HTTPSKeys/chain.crt")
	print(err_cert)
	
func main():
	randomize()
	var isClient = ProjectSettings.get_setting("Config/IsClient")
	if OS.has_feature("Server") or not isClient:
		get_tree().change_scene("res://Server/Server.tscn")
	else:
		get_tree().change_scene("res://Client/Client.tscn")

func _ready():
	main()





