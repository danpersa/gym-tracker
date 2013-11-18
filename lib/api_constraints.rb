class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    true
    #@default || req.headers['Accept'].include?("application/vnd.gym.tracker.v#{@version}")
  end
end