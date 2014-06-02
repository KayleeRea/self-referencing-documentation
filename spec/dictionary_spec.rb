require 'dictonary'

describe Dictionary do
  let(:information) {
    <<INFO
   "word": {
      "definition": "a {collection} of {letters}",
      "url": "//example.com/word"
  },
    "letter": {
    "definition": "a {character} representing one or more of the {sounds} used in speech; any of the symbols of an alphabet",
    "url": "//example.com/letter"
  },
    "collection": {
    "definition": "a group of things or {people}",
    "url": "//example.us/collection"
  }
INFO
  }

  let(:expected1) {
    <<EXPECT
 {
      definition: "a collection of letters",
    }
EXPECT
  }

  let(:expected) {
    <<EXPECT
 {
      definition: "a collection of letters",
      see_also: [
        "//example.com/letter",
        "//example.com/collection"
      ]
    }
EXPECT
  }

    subject {Dictionary.new('word')}

  it 'returns the definition of the word' do
      expect(subject.definition).to eq(expected1)
  end
end




