defmodule RobotSimulator do
  @type robot :: %{:direction => atom, :position => {integer, integer}}
  @type position :: {integer, integer}

  @directions [:north, :south, :east, :west]
  @left %{:south => :east, :east => :north, :north => :west, :west => :south}
  @right %{:south => :west, :west => :north, :north => :east, :east => :south}
  @movement %{:south => {0, -1}, :west => {-1, 0}, :north => {0, 1}, :east => {1, 0}}

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: position) :: robot
  def create(direction \\ :north, position \\ {0, 0}) do
    with {:ok, direction} <- valid_direction?(direction),
         {:ok, position} <- valid_position?(position),
         do: %{:direction => direction, :position => position}
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: robot, instructions :: String.t()) :: robot
  def simulate(robot, instructions) do
    instructions
    |> String.to_charlist()
    |> Enum.reduce_while(robot, &do_simulate/2)
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: robot) :: atom
  def direction(robot), do: robot.direction

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: robot) :: position
  def position(robot), do: robot.position

  defp do_simulate(?A, robot) do
    {x, y} = robot.position
    {nx, ny} = @movement[robot.direction]
    {:cont, %{robot | :position => {x + nx, y + ny}}}
  end

  defp do_simulate(?L, robot) do
    {:cont, %{robot | :direction => @left[robot.direction]}}
  end

  defp do_simulate(?R, robot) do
    {:cont, %{robot | :direction => @right[robot.direction]}}
  end

  defp do_simulate(_instruction, _robot) do
    {:halt, {:error, "invalid instruction"}}
  end

  defp valid_direction?(direction) when direction in @directions do
    {:ok, direction}
  end

  defp valid_direction?(_direction), do: {:error, "invalid direction"}

  defp valid_position?(position) do
    with true <- is_tuple(position),
         true <- tuple_size(position) == 2,
         true <- pos_are_integers?(position) do
      {:ok, position}
    else
      _ -> {:error, "invalid position"}
    end
  end

  defp pos_are_integers?({x, y}) do
    is_integer(x) and is_integer(y)
  end
end
