=begin
Walkthrough:
- Implement a very simple TCP server
- Listens to a specifc port and echos back messages received from a client
- Handle multiple client connections

**Hints**
Server Class
- Initialize a socket
- Bind it to a port
- Listen to incoming connections

Handle clients such that its responsible for receiving / echoing back data
- Accept incoming connections

1. Listens on a specified host and port for incoming connections.
  # host / port / threads 
2. Accepts multiple client connections simultaneously. => concurrency / threading
3. Receives messages from connected clients and echoes them back to the respective clients.
4. Continues listening for new client connections and handles them concurrently. => concurrency / threading
=end

# Implementation Details
=begin
class Server
  attr_accessor :host, :port, :maximum_connections

  def initialize()
    connections = {}
  end

  1) Start server
    - Get a request to make a connection to the server
    - Check if at capacity / if there's any spots open
        - if yes, make a connection
            - Creating a thread for that connection
                - if message, process message
                - if close, close connection
        - if no, return a error + status code

  2)  Process message (req)
          get req.body
          format a response
          return the response appropriately
  
  3) Close connection
          erases thread
          decrement number of connections

  What our server receives:
  1) Incoming client connection
    -> Thread specifically for that client
      2) Incoming client messages (within this thread) and echoing them back
      3) Close client request, that the thread is then closed

end
=end