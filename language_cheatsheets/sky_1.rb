=begin
Objectives: Object Oriented Programming, Class Structure

Design a logging system for a distributed software
- Should support two operations - ADD_LOG
  - Add a log entry with timestamp and message
  - Retrieve a log entry whose timestamps are within a range AND message starts with a prefix

message - string
timestamp - integer

speed and execution vs. class design

- adding a log entry
- querying a log entry by timestamp & message

{
  key (int) : value (message)

  # retrive log entries within a range
}

=end

class Logging 
  attr_accessor :logs

  def initialize(logs = {})
    @logs = logs
  end

  # Adds a log entry with a timestamp and message
  # Time complexity; hash insert -> Average Case O(1) Big-O O(n)
    # keys into buckets
    # appened into a bucket like a linkedlist
    # n := number of logs in the database
  def add_log(timestamp, message)
    @logs[timestamp] = message
  end

  # O(n) => O(1), O(logn)
    # Minheaps have O(logn)
  # insert 
  # retrieve within a range

  # Retrieves a log entry within a range && a prefix
  # Time complexity: O(n*m) n := number of logs, m := number of characters in prefix
  # iterating over each of the logs => n runtime
    # prefix of a message => m runtime m:= length of the prefix
  def get_log(start_time, end_time, prefix)
    result = []
    logs.each do |key, message|
      result.push(key => message) if key >= start_time && key <= end_time && message.downcase.start_with?(prefix.downcase)
    end
    result
  end
end


logger = Logging.new()

# testing add_log
logger.add_log(0, "hello")
pp logger.logs

# testing get_log
pp logger.get_log(0, 0, "he")

# test logging functions
new_logger = Logging.new()
new_logger.add_log(0, "Stanley")
new_logger.add_log(1, "Hydroflask")
new_logger.add_log(2, "Takea")
new_logger.add_log(3, "Hydrowater")
new_logger.add_log(4, "Camelbak")

pp new_logger.get_log(1, 3, "Hydro")
pp new_logger.get_log(0, 0, "Hydro")