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

require "open-uri"
require_relative "UriNotFoundError"

class UriDownloader
  def load_as_string(uri)
    begin
      webpage = URI.open(uri)
    rescue OpenURI::HTTPError => httpError
      raise UriNotFoundError.new(uri)
    end
    html_string = webpage.read
    return html_string
  end
end
