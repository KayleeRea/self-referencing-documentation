require 'strscan'

class Dictionary
  def  initialize(data)
    @data = (data)
  end

  def definition(word)
    word = @data.fetch(word)
    definition = word['definition']
    references = definition.scan(/\{([^}]+)\}/).flatten
    see_also = lookup_reference_urls(references)
    definition = definition.gsub(/\{|\}/, '')
    {
      definition: definition,
      see_also: see_also
    }
  end

  def lookup_reference_urls(references)
    references.map {|r|
      @data.fetch(r) { |r| @data.fetch(r.sub(/s\z/, '')) }['url']
    }
  end
end