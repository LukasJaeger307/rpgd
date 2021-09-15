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
require_relative "../src/DivClassPhotoUriExtractor"
require "test/unit"
require "test/unit/assertions"
include Test::Unit::Assertions

class DivClassPhotoUriExtractorTest < Test::Unit::TestCase
  def test_extract_photo_uris_no_pictures()
    html_string = load_string_from_file(TEST_FILE_1)
    extractor = DivClassPhotoUriExtractor.new()
    uris = extractor.extract_photo_uris(html_string, nil)
    assert_empty(uris)
  end

  def test_extract_photo_uris_all_pictures()
    html_string = load_string_from_file(TEST_FILE_2)
    extractor = DivClassPhotoUriExtractor.new()
    uris = extractor.extract_photo_uris(html_string, nil)
    assert_equal(5, uris.length())
    assert_true(uris.include? "img/flag_english.svg")
    assert_true(uris.include? "img/flag_german.svg")
    assert_true(uris.include? "img/label_queenofthewest.png")
    assert_true(uris.include? "img/label_lamiedelanuit.png")
    assert_true(uris.include? "img/label_troislunes.png")
  end

  def test_extract_photo_uris_id_not_in_html()
    html_string = load_string_from_file(TEST_FILE_2)
    extractor = DivClassPhotoUriExtractor.new()
    uris = extractor.extract_photo_uris(html_string, "image")
    assert_empty(uris)
  end

  def test_extract_photo_uris_flags()
    html_string = load_string_from_file(TEST_FILE_2)
    extractor = DivClassPhotoUriExtractor.new()
    uris = extractor.extract_photo_uris(html_string, "flag")
    assert_equal(2, uris.length())
    assert_true(uris.include? "img/flag_english.svg")
    assert_true(uris.include? "img/flag_german.svg")
  end
  
  def test_extract_photo_uris_labels()
    html_string = load_string_from_file(TEST_FILE_2)
    extractor = DivClassPhotoUriExtractor.new()
    uris = extractor.extract_photo_uris(html_string, "label")
    assert_equal(3, uris.length())
    assert_true(uris.include? "img/label_queenofthewest.png")
    assert_true(uris.include? "img/label_lamiedelanuit.png")
    assert_true(uris.include? "img/label_troislunes.png")
  end

end
