defmodule BlogParsingXmlTest do
  use ExUnit.Case
  doctest BlogParsingXml

  @xml """
  <?xml version="1.0" ?>
    <cities>
      <city>
        <name>Berlin</name>
        <population>3566791</population>
      </city>
      <city>
        <name>London</name>
        <population>9425622</population>
      </city>
      <city>
        <name>Madrid</name>
        <population>6668865</population>
      </city>
    </cities>
  """

  test "parses XML" do
    alias BlogParsingXml.City

    assert BlogParsingXml.parse_cities(@xml) == [
             %City{name: "Berlin", population: 3_566_791},
             %City{name: "London", population: 9_425_622},
             %City{name: "Madrid", population: 6_668_865}
           ]
  end
end
