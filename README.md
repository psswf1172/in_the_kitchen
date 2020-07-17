# README


To run in localhost:
Make sure postgres is running

Make sure elasticsearch is running: 
brew services start elasticsearch-full

Start the server:
rails s -e development -b 'ssl://127.0.0.1:3000?key=localhost/localhost.key&cert=localhost/localhost.crt'
