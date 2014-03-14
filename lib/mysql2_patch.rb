ActiveRecord::Base.instance_eval do
  def self.mysql2_connection(config)
    config[:username] = 'root' if config[:username].nil?
    config[:flags] = 2 | 65536 | 131072 # FOUND_ROWS | MULTI_STATEMENTS | MULTI_RESULTS

    client = Mysql2::Client.new(config.symbolize_keys)
    options = config.values_at(:host, :username, :password, :database, :port, :socket, :flags)

    ActiveRecord::ConnectionAdapters::Mysql2Adapter.new(client, logger, options, config)
  end
end
