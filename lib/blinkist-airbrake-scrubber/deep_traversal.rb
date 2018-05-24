# DeepTraversal provides traverse possibility of Hashes
# Can handle Hash objects with deep nesting, or other nested objects that can be dug deeper (e.g. Array)
class DeepTraversal
  def initialize(source)
    @source = source
  end

  def traverse(&block)
    recursive_traverse(@source, &block)
  end

  private

  def recursive_traverse(input, &block)
    if input.is_a? Array
      input.map { |i| recursive_traverse(i, &block) }

    elsif input.respond_to?(:to_hash)
      Hash[input.map { |key, value|

        # Go deeper for things that are not simple objects
        if value.respond_to?(:to_hash) || value.is_a?(Array)
          [ key, recursive_traverse(value, &block) ]
        else
          [ key, block.call(key, value) ]
        end

      }]
    else
      input
    end
  end
end
