defmodule StringCalculator do
  @moduledoc """
  Documentation for StringCalculator.
  """

  @doc """
  Hello world.

  ## Examples

      iex> StringCalculator.hello
      :world

  """
  def add("") do
    0
  end

  def add("//" <> numbers) do
    delimiters = String.split(numbers, "\n")
      |> Enum.take(1)
      |> Enum.map(fn(x) -> String.replace(x,"//","") end)
    numbers = String.split(numbers, "\n")
      |> Enum.at(1)

      add_numbers_list(numbers, delimiters)
  end

  def add(numbers) do
    delimiters = [",","\n"]
    add_numbers_list(numbers, delimiters)
  end

  def negative_check(numbers_list) do 
    negatives = Enum.filter(numbers_list, fn(x) -> x < 0 end)
    case negatives do
      [] -> numbers_list
      _ -> raise "negatives not allowed: [" <> Enum.join(negatives, ",") <> "]"
    end
  end

  def add_numbers_list(numbers, delimiters) do
    String.split(numbers, delimiters)
      |> Enum.map(fn(str) -> String.to_integer(str) end)
      |> negative_check
      |> Enum.filter(fn(x) -> x < 1000 end)
      |> Enum.sum
  end

end
