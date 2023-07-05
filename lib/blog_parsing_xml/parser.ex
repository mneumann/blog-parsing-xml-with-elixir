defmodule BlogParsingXml.Parser do
  @behaviour Saxy.Handler

  alias BlogParsingXml.City

  def handle_event(:start_document, _prolog, {nil, data}) do
    {:ok, {[], data}}
  end

  def handle_event(:end_document, _data, {[], data}) do
    {:ok, {nil, data}}
  end

  def handle_event(:start_element, {"city", _attributes}, {~w"cities", data}) do
    {:ok, {["city", "cities"], [%City{} | data]}}
  end

  def handle_event(:start_element, {name, _attributes}, {path, data}) do
    {:ok, {[name | path], data}}
  end

  def handle_event(:end_element, name, {[name | rest], data}) do
    {:ok, {rest, data}}
  end

  def handle_event(:characters, chars, {~w"name city cities" = path, [city | cities]}) do
    {:ok, {path, [%City{city | name: chars} | cities]}}
  end

  def handle_event(:characters, chars, {~w"population city cities" = path, [city | cities]}) do
    city = %City{city | population: String.to_integer(chars)}
    {:ok, {path, [city | cities]}}
  end

  def handle_event(:characters, _chars, {path, data}) do
    {:ok, {path, data}}
  end
end
