# This file is part of rpgd.
#
# rpgd is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# rpgd is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#  
# You should have received a copy of the GNU General Public License
# along with rpgd.  If not, see <http://www.gnu.org/licenses/>.

require_relative "PhotoUriExtractor"
require "nokogiri"

class DivClassPhotoUriExtractor < PhotoUriExtractor
  def extract_photo_uris(html_string, extraction_criterion)
    xpath_document = Nokogiri::HTML(html_string) 
    xpath_search_string = create_xpath_search_string(extraction_criterion)
    xpath_results = xpath_document.xpath(xpath_search_string)
    uris = []
    xpath_results.each do |result|
      uris.append(result.text)
    end
    return uris
  end

  def create_xpath_search_string(extraction_criterion)
    xpath_search_string = "//div"
    if extraction_criterion
      xpath_search_string = xpath_search_string + "[@class = \'" + extraction_criterion + "\']"
    end
    xpath_search_string = xpath_search_string + "//img/@src"
    puts xpath_search_string
    return xpath_search_string
  end
end

