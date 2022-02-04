REQ=$(curl -s http://eeebox:18085/json_rpc -d '{"jsonrpc":"2.0","id":"0","method":"get_accounts"}' -H 'Content-Type: application/json')

if [ "$REQ" ]
then
	DATA=$(echo $REQ | jq ".result")
	TOTAL_BALANCE=$(echo "$DATA" | jq ".total_balance" )
	echo "The total balance: $TOTAL_BALANCE"
else
	NODE_ONLINE="🔴 XMR Node Offline!"
	echo $NODE_ONLINE
fi


cat zombie_static.html > zombie_index.html 
echo "<h3>Total Balance</h3> <p> $TOTAL_BALANCE </p> </pre>" >> zombie_index.html 
echo "</body></html>" >> zombie_index.html