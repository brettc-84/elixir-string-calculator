defmodule StringCalculatorTest do
  use ExUnit.Case
  # doctest StringCalculator

  test "return 0 for blank string input" do
    assert StringCalculator.add("") == 0
  end

  test "return value of single string intput" do
    assert StringCalculator.add("4") == 4
  end

  test "return value of 5 for input 2,3" do
    assert StringCalculator.add("2,3") == 5
  end
  
  test "return value of 17 for input 5,5,2,5" do
    assert StringCalculator.add("5,5,2,5") == 17
  end

  test "return value of 6 for input 1,2\n3" do
    assert StringCalculator.add("1,2\n3") == 6
  end

  test "return value of 5 with custom delimiter input of //;\n2;3" do
    assert StringCalculator.add("//;\n2;3") == 5
  end

  test "raise an exception if list contains negatives" do
    assert_raise(RuntimeError, "negatives not allowed: [-1,-3]", fn -> StringCalculator.add("-1,2,-3") end)
  end

  test "numbers larger than 1000 are ignored" do
    assert StringCalculator.add("1,3,1001,4") == 8
  end

  test "custom delimiter of any length" do
    assert StringCalculator.add("//***\n1***2***3") == 6
  end
end
