defmodule BlogParsingXml do
  @moduledoc """
  Documentation for `BlogParsingXml`.
  """

  def parse_cities(xml) do
    {:ok, {nil, cities}} = Saxy.parse_string(xml, BlogParsingXml.Parser, {nil, []})
    cities |> Enum.reverse()
  end
end
