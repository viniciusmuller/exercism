defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(map, String.t(), integer) :: map
  def add(db, name, grade) do
    # The callback is called if the key already exists
    # if it exists, we append it to the grade students
    Map.update(db, grade, [name], fn students -> [name | students] end)
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(map, integer) :: [String.t()]
  def grade(db, grade) do
    Map.get(db, grade, [])
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(map) :: [{integer, [String.t()]}]
  def sort(db) do
    # Converting it into a keyword list
    db
    |> Map.to_list()
    |> Enum.map(fn {grade, students} -> {grade, Enum.sort(students)} end)
  end
end
