defmodule VM.Math do
  def add(a, b) do
    a + b
  end

  def subtract(a, b) do
    a - b
  end

  def multiply(a, b) do
    a * b
  end

  def divide(a, b) do
    a / b
  end

  def modulo(a, b) do
    rem(a, b)
  end

  def negative(a) do
    a * -1
  end

end

defmodule VM.Bool do
  def bool_and(a, b) do
    a && b
  end

  def bool_or(a, b) do
    a || b
  end

  def bool_not(a) do
    !a
  end
  def bool_is(a, b) do
    a == b
  end

  # Not sure if these should be classified as boolean or math operators.
  def bool_gt(a, b) do
    a > b
  end

  def bool_lt(a, b) do
    a < b
  end

  def bool_gte(a, b) do
    a >= b
  end

  def bool_lte(a, b) do
    a <= b
  end

end


defmodule VM do
  import VM.Math
  import Arevel.Utils

  def binary_operators, do: %{
    "+" => &VM.Math.add/2,
    "-" => &VM.Math.subtract/2,
    "*" => &VM.Math.multiply/2,
    "/" => &VM.Math.divide/2,
    "MOD" => &VM.Math.modulo/2,

    # Boolean operators
    "AND" => &VM.Bool.bool_and/2,
    "OR" => &VM.Bool.bool_or/2,
    "IS" => &VM.Bool.bool_is/2,
    # XOR? Keep it minimal for now.

    # Comparison operators
    "<" => &VM.Bool.bool_lt/2,
    "<=" => &VM.Bool.bool_lte/2,
    ">" => &VM.Bool.bool_gt/2,
    ">=" => &VM.Bool.bool_gte/2,
  }

  def unary_operators, do: %{
    "-" => &VM.Math.negative/1,
    "NOT" => &VM.Bool.bool_not/1,
  }

  @doc """
  Evaluate an expression json tree.
  """
  def eval(code) do
    dependencies = get_eval_order(code)
    result = Enum.map(
      code,
      fn ({id, cell}) -> {id, eval_cell(cell)} end
    )
    # Convert tuple back into map
    Enum.into(result, %{})
  end

  def eval_cell(cell) do
    %{"id" => _, "parsed" => parsed} = cell
    Map.put(cell, "output", eval_expr(parsed))
  end

  def eval_expr(expr) do
    # %{id: id, value: value} = cell
    # TODO: case value starts with =
    recurse_expr(expr)
  end

  def eval_binary(op, left, right) do
    op = String.upcase(op)
    Map.get(VM.binary_operators, op).(left, right)
  end

  def eval_unary(op, arg) do
    op = String.upcase(op)
    Map.get(VM.unary_operators, op).(arg)
  end

  # [integer: 1], {:binopt, "+"}, [integer: 2, binopt: "*", integer: 3]
  def recurse_expr(expr) do
    case Map.get(expr, "type") do
      # Unwrap empty wrapper
      "BinaryExpression" ->
        op = Map.get(expr, "operator")
        left = recurse_expr(Map.get(expr, "left"))
        right = recurse_expr(Map.get(expr, "right"))
        eval_binary(op, left, right)
      "UnaryExpression" ->
        op = Map.get(expr, "operator")
        arg = recurse_expr(Map.get(expr, "argument"))
        eval_unary(op, arg)
      "Literal" ->
        Map.get(expr, "value")
    end
  end

  @doc """
  Performs a topological sort of the cells to figure out which leaf nodes we
  can begin evaluating from in the graph and detects any cycles.
  You could conceivably make this churn out seprate independent threads of execution
  with multiple workers.
  """
  def get_eval_order(cells) do
    dependency_map = Enum.map(cells, fn {id, cell} -> {id, Map.get(cell, "depends_on")} end)
    dependency_count = Enum.map(dependency_map, fn {id, deps} -> {id, length(deps)} end)
    dependency_count_map = Enum.into(dependency_count, %{})
    leafs = Enum.filter(dependency_count, fn {_, count} -> count == 0 end)
    used_by_map = Arevel.Utils.invert_map(dependency_map)

    # eval_order = get_eval_order(leafs, dependency_map)
    eval_order = Enum.reduce()
  end



  def get_used_by(cells) do

  end

  # def get_eval_order(leafs, dependency_map) do
  #   [cell | _] = leafs

  #   # Enum.concat([cell], )
  # end


end


