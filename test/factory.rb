class Factory
  class << self
    def create(factory, attrs = {})
      send(factory, attrs).to_json
    end

    private
    def text_block(attrs = {})
      {
        type: 'text',
        data: {
          text: attrs[:text] || 'Lorem ipsum...'
        }
      }
    end

    def array(attrs = {})
      blocks = []
      if attrs[:block_types]
        blocks += attrs[:block_types].map { |block_type| send(:"#{block_type}_block") }
      end

      if attrs[:blocks]
        blocks += attrs[:blocks].map { |block| JSON.parse(block) }
      end

      {
        data: blocks
      }
    end
  end
end
