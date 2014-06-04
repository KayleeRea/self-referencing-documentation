require 'dictionary'
require 'rspec'


describe Dictionary do
  let(:data) {
    {
      "word" => {
        "definition" => "a {collection} of {letters}",
        "url" => "//example.com/word"
      },
      "letter" => {
        "definition" => "a character representing one or more of the sounds used in speech; any of the symbols of an alphabet",
        "url" => "//example.com/letter"
      },
      "collection" => {
        "definition" => "a group of things or people",
        "url" => "//example.us/collection"
      }
    }
  }

  it 'returns the definition of a single word' do
    defined_word = Dictionary.new(data).definition("word")
    expect(defined_word).to eq(
                              definition: "a collection of letters",
                              see_also: [
                                "//example.us/collection",
                                "//example.com/letter"
                              ]
                            )
  end
end




