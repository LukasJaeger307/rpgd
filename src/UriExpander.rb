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

require "uri"

class UriExpander
  def expand_uri_if_necessary(uri_to_expand, domain_uri)
    if expansion_is_necessary(uri_to_expand)
      return expand_local_uri(uri_to_expand, domain_uri)
    else 
      return uri_to_expand
    end
  end

  def expansion_is_necessary(uri_to_expand)
    parsed_uri = URI.parse(uri_to_expand)
    return !(parsed_uri.kind_of?(URI::HTTP) or parsed_uri.kind_of?(URI::HTTPS))
  end

  def expand_local_uri(uri_to_expand, domain_uri)
    if (domain_uri.end_with?("/"))
        return domain_uri + uri_to_expand
    else
      return domain_uri + "/" + uri_to_expand
    end
  end
end
