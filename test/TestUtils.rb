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

require "test/unit"
require "test/unit/assertions"
include Test::Unit::Assertions

TEST_DATA_FOLDER = "test_data/"
TEST_DOMAIN = "https://crimsonsunrise.hopto.org/test/"

TEST_PAGE_FILE_1 = TEST_DATA_FOLDER + "test1.html"
TEST_PAGE_URI_1 = TEST_DOMAIN + "test1.html"

TEST_PAGE_FILE_2 = TEST_DATA_FOLDER + "test2.html"
TEST_PAGE_URI_2 = TEST_DOMAIN + "test2.html"

TEST_URI_NONEXISTENT = TEST_DOMAIN + "test_gnampf.html"

TEST_IMAGE_FILE_1 = TEST_DATA_FOLDER + "img/label_troislunes.png"
TEST_IMAGE_URI_1 = TEST_DOMAIN + "img/label_troislunes.png"

def load_string_from_file(filename)
  return IO.read(filename)
end

def load_binary_from_file(filename)
  file = File.open(filename, "rb")
  contents = file.read()
  file.close()
  return contents
end
