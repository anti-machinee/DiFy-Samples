URL_REPO='https://github.com/langgenius/dify'
STATE='open'
# STATE='closed'

curl -i "$URL_REPO/issues?state=$STATE"
