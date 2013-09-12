Koala::Facebook::OAuth.class_eval do
  def initialize_with_default_settings(*args)
    case args.size
      when 0, 1
        initialize_without_default_settings('587786671260237', '58f9b2bfe8ba7e931c2482e85af344dc', args.first)
      when 2, 3
        initialize_without_default_settings(*args) 
    end
  end 

  alias_method_chain :initialize, :default_settings 
end