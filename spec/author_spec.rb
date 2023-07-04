require './classes/author'

describe Author do
  before :each do
    @author = Author.new 'Ezz-Eldin', 'Shokry'
  end

  describe '#new' do
    it 'takes two parameters and returns a Author object' do
      @author.should be_an_instance_of Author
    end
  end

  describe '#first_name' do
    it 'returns the correct first_name' do
      @author.first_name.should eql 'Ezz-Eldin'
    end
  end

  describe '#last_name' do
    it 'returns the correct first_name' do
      @author.last_name.should eql 'Shokry'
    end
  end

  describe '#items' do
    it 'returns the correct first_name' do
      @author.items.should eql []
    end
  end

  describe '#add_item' do
    it 'should add item to items array using add_item' do
      item = double('item')
      allow(item).to receive(:author=).with(@author)
      @author.add_item(item)
      expect(@author.items).to include(item)
    end
  end
end
