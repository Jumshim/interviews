=begin
The file 'sample_transactions.txt' contains a list of transactions for a single account.
Your goal is to identify recurring spend from the series of transactions. 

Recurring spend can be roughly defined as any transaction that is automatically repeated
at set intervals, like with a phone bill or a subscription.

Find all recurring charges that happen weekly, then print the merchant, amount, and interval.

Example output:
"OrangeNews: $10.00 / week"

Google, stack overflow, etc. usage is allowed.

list of transactions in sample_transactions.txt
- 4 categories: created_at,merchant_name,amount,currency
- Identify recurring spend
  - any transaction that is automatically repeated at set intervals
    - 10/01
    - 10/08
- By week
- Output (print merchant, amount, and interval)


1) A way to parse through the file
2) Separate each line into created_at,merchant_name,amount,currency
  3) populating an array or hash
4) Going through the transactions to identify recurring spends
  5) more parts... think abt later
6) Output "#{merchant}: $#{amount} / week"
=end

require 'io/console'
require 'time'
require 'pry'
require 'date'

class RecurringTransactions
  WEEK_MS = 604800000

  def initialize()
    @transactions = {}
    @recurring_spends = {}
  end

  # Parse through transaction file and populate transactions array
    # every transaction, using the vendor as a primary key, append to an array in spends
  # spends['vendor'] = {timestamp => ... price =>... currency =>>}
  def parse_file(file_name)
    lines = IO.readlines(file_name)
    headers = lines[0] # revisit later
    (1..lines.length-1).each do |index|
      line = lines[index]
      parsed_line = parse_file_line(line)
      if @transactions[parsed_line['vendor']]
        @transactions[parsed_line['vendor']].push({"timestamp" => parsed_line["timestamp"], "price" => parsed_line["price"], "currency" => parsed_line["currency"]})
      else
        @transactions[parsed_line['vendor']] = []
      end
    end
  end

  # make into created_at, merchant_name, amount, currency
  def parse_file_line(line)
    line_details = line.split(',')
    timestamp = DateTime.parse(Time.parse(line_details[0]).to_s) # Timestamp
    vendor = line_details[1] # Vendor
    price = line_details[2].to_i # price (int)
    currency = line_details[3][0..-2] # currency
    return {"timestamp" => timestamp, "vendor" => vendor, "price" => price, "currency" => currency}
  end

  # go through transactions. 
    # go through each of the vendors
      # if the differences in timestamp between their transactions == WEEK_MS
      # append recurring spend to recurring_spends
  def identify_recurring_spends()
    @transactions.each do |vendor, bills|
      next if bills.length == 1
      (1..bills.length-1).each do |index|
        new_transaction = bills[index]["timestamp"]
        old_transaction = bills[index-1]["timestamp"]
        if weekly_difference(new_transaction, old_transaction)
          @recurring_spends[vendor] = {"price" => bills[index]["price"], "currency" => bills[index]["currency"], "transaction_type" => "week"}
        elsif monthly_difference(new_transaction, old_transaction)
          @recurring_spends[vendor] = {"price" => bills[index]["price"], "currency" => bills[index]["currency"], "transaction_type" => "month"}
        end
      end
    end
  end

  def weekly_difference(new_transaction, old_transaction)
    return new_transaction == old_transaction + 7
  end

  def monthly_difference(new_transaction, old_transaction)
    return new_transaction == old_transaction + 31 || new_transaction == old_transaction + 30 || new_transaction == old_transaction + 28
  end

  # print as "#{merchant}: $#{amount} / week"
  def print_spends()
    @recurring_spends.each do |vendor, details|
      puts "#{vendor}: #{details["price"]} #{details["currency"]} / #{details["transaction_type"]}"
    end
  end
end

# date = Date.new(2019, 9, 30)
# puts date
# puts date - 1.month()

transactor = RecurringTransactions.new
transactor.parse_file("sample_transactions.txt")
transactor.identify_recurring_spends
transactor.print_spends
