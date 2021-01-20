defmodule BankAccount do
  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank() do
    {:ok, account} = AccountAPI.start_link(0)
    account
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: :ok
  def close_bank(account) do
    with {:ok, :alive} <- AccountAPI.alive?(account),
         do: AccountAPI.close(account)
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account) do
    with {:ok, :alive} <- AccountAPI.alive?(account),
         do: AccountAPI.balance(account)
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update(account, amount) do
    with {:ok, :alive} <- AccountAPI.alive?(account),
         do: AccountAPI.update(account, amount)
  end
end

defmodule AccountAPI do
  def start_link(initial_value) do
    Agent.start_link(fn -> initial_value end)
  end

  def balance(account) do
    Agent.get(account, & &1)
  end

  def update(account, amount) do
    if balance(account) + amount >= 0 do
      Agent.update(account, fn balance -> balance + amount end)
    else
      {:error, :overdraft}
    end
  end

  def close(account), do: Agent.stop(account)

  def alive?(account) do
    if Process.alive?(account) do
      {:ok, :alive}
    else
      {:error, :account_closed}
    end
  end
end
