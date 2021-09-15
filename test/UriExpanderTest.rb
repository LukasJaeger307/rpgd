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

require_relative "TestUtils"
require_relative "../src/UriExpander"

class UriExpanderTest < Test::Unit::TestCase
  def test_expand_uri_if_necessary_global_uri()
    assert_true(generic_test(
      "https://crimsonsunrise.hopto.org/test/img/flag_english.svg",
      "https://crimsonsunrise.hopto.org/test",
      "https://crimsonsunrise.hopto.org/test/img/flag_english.svg"
    ))
  end
  
  def test_expand_uri_if_necessary_local_uri()
    assert_true(generic_test(
      "img/flag_english.svg",
      "https://crimsonsunrise.hopto.org/test",
      "https://crimsonsunrise.hopto.org/test/img/flag_english.svg"
    ))
  end
  
  def test_expand_uri_if_necessary_local_uri_with_trailing_slash()
    assert_true(generic_test(
      "img/flag_english.svg",
      "https://crimsonsunrise.hopto.org/test/",
      "https://crimsonsunrise.hopto.org/test/img/flag_english.svg"
    ))
  end

  def generic_test(uri_to_expand, domain_uri, expected_uri)
    expander = UriExpander.new()
    expanded_uri = expander.expand_uri_if_necessary(uri_to_expand, domain_uri)
    return expected_uri == expanded_uri
  end
end
