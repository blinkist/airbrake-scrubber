# Add Hash#traverse(&block)
class Hash

  # Traverse hash and run block on each key-value pair
  # Block should return [key, value] array
  def traverse(&block)
    inject({}) do |memo, (key,value)|
      # Go deep
      if Hash === value
        value = value.traverse(&block)
      elsif value.respond_to?(:to_hash)
        value = value.to_hash.traverse(&block)
      end

      # Process key-value pair
      new_key, new_value = block.call key, value
      memo[new_key]      = new_value

      memo
    end
  end
end
