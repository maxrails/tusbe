class Collector
  SEARCH_URL = "http://www.tusbe.com/header.asp?Page=page_number&Keywords=text_to_search"
  PAGE_URL   = 'http://www.tusbe.com/Contact.asp?Id=id_number'

  class << self
    def start text_to_search
      init
      first_url = SEARCH_URL.gsub('page_number', '1').gsub('text_to_search', text_to_search)
      @first_page   = @a.get first_url
      _body         = @first_page.body
      quantity      =  _body.scan(/(\d+) books found- showing 100 books/)[0][0].to_i
      page_quantity = quantity/100 +1
      p page_quantity

      (1..page_quantity).each do |page|
        p "PAGE NOW = #{page}"
        current_page_url = SEARCH_URL.gsub('page_number', page.to_s).gsub('text_to_search', text_to_search)
        p current_page_url
        single_page = @a.get current_page_url
        body        = single_page.body
        p body
        ids         = body.scan(/openContactWindow(\S+)/)
        p ids
        ids.each do |id|
          real_id = id[0].gsub('(','').gsub(')','').gsub("'",'').gsub(';','')
          p real_id
          email   = get_email real_id
          p "EMAIL = #{email}, ID=#{real_id}"
          BookLink.create :book_id => real_id, :email => email
        end
      end
    end

    def get_email id
      email_page = PAGE_URL.gsub('id_number', id)
      page       = @a.get email_page
      email      = page.body.scan(/contact information is (\S+)</)
      email[0][0].gsub('[','').gsub('<B>','')
    end

    def init
      @a = Mechanize.new { |agent|
        agent.user_agent_alias = 'Mac Safari'
      }
    end

    def agent
      @a
    end

  end
end
