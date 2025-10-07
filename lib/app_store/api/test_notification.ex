defmodule AppStore.API.TestNotification do
  @moduledoc """
  The module for Test Notification
  """

  alias AppStore.API.{Config, Error, Response, HTTP}

  @path "/inApps/v1/notifications/test"

  @doc """
  Send a test notification to the App Store.

  Official documentation: https://developer.apple.com/documentation/appstoreserverapi/request-a-test-notification
  """
  @spec send_test_notification(Config.t(), String.t()) ::
          {:error, Error.t()} | {:ok, Response.t()}
  def send_test_notification(%Config{} = api_config, token)  do
    HTTP.post(api_config, token, @path)
  end
end
