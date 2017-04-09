class BabelTranslator

  BLOCK_QUOTE = "blockquote".freeze
  BABEL_URL = "http://www.degraeve.com/cgi-bin/babel.cgi?d=%{type}&url=&w=%{content}".freeze

  def self.translate(content:, type: "yoda")
    request = self.http_get(content, type)
    Nokogiri::HTML(request.body).search(BLOCK_QUOTE).text.strip
  end

  private

  def self.http_get(content, type)
    ::RestClient.get(BABEL_URL % {content: URI.encode(content),  type: type})
  end
end