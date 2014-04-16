require 'test_helper'

module SirTrevorRails
  class BlockArrayTest < MiniTest::Test

    def test_can_be_initialized_from_json
      json = Factory.create(:array, block_types: [:text])
      array = BlockArray.from_json(json, nil)

      assert { array.is_a? BlockArray }
    end

    def test_can_be_initialized_from_json_without_blocks
      json = Factory.create(:array, block_types: [])
      array = BlockArray.from_json(json, nil)

      assert { array.is_a? BlockArray }
    end

    def test_has_block_of_type_returns_true_if_block_exists
      json = Factory.create(:array, block_types: [:text])
      array = BlockArray.from_json(json, nil)

      assert { array.has_block_of_type? :text }
    end

    def test_has_block_of_type_returns_false_if_block_not_exists
      json = Factory.create(:array, block_types: [:text])
      array = BlockArray.from_json(json, nil)

      deny { array.has_block_of_type? :tweet }
    end

    def test_first_block_of_type_returns_first_block_matching
      first_block = Factory.create(:text_block, text: 'First')
      second_block = Factory.create(:text_block, text: 'Second')
      json = Factory.create(:array, blocks: [first_block, second_block])
      array = BlockArray.from_json(json, nil)

      first_of_type = array.first_block_of_type(:text)

      assert { first_of_type.text == 'First' }
      deny { first_of_type.text == 'Second' }
    end

    def test_first_block_of_type_doesnt_return_other_block_types
      first_block = Factory.create(:image_block)
      second_block = Factory.create(:text_block, text: 'Text block')
      json = Factory.create(:array, blocks: [first_block, second_block])
      array = BlockArray.from_json(json, nil)

      first_text_block = array.first_block_of_type(:text)

      assert { first_text_block.is_a? Blocks::TextBlock }
      assert { first_text_block.text == 'Text block' }
    end

    def test_first_block_of_type_returns_nil_if_not_found
      json = Factory.create(:array, block_types: [:text])
      array = BlockArray.from_json(json, nil)

      assert { array.first_block_of_type(:tweet) == nil }
    end
  end
end
