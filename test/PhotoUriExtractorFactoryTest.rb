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
require_relative "../src/PhotoUriExtractorFactory"
require_relative "../src/DivClassPhotoUriExtractor"

class PhotoUriExtractorFactoryTest < Test::Unit::TestCase
  def test_create_extractor_invalid_type()
    factory = PhotoUriExtractorFactory.new()
    expected_message = "Could not find PhotoUriExtractor type: Obvious rubbish."
    assert_raise_message(expected_message) do
      factory.create_extractor("Obvious rubbish")
    end
  end

  def test_create_extractor_div_class()
    test_one_case_statement("DivClass", DivClassPhotoUriExtractor)
  end
  
  def test_create_extractor_img()
    test_one_case_statement("Img", ImgPhotoUriExtractor)
  end

  def test_one_case_statement(name, class_name)
    factory = PhotoUriExtractorFactory.new()
    extractor = factory.create_extractor(name)
    assert_true(extractor.instance_of?(class_name))
  end
end
