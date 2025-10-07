defmodule AppStore.API.TestNotificationTest do
  use AppStore.TestCase, async: false

  alias AppStore.API.TestNotification

  describe "send_test_notification/2" do
    test "sends a test notification", %{bypass: bypass, app_store: app_store} do
      expected_body = %{signedPayload: "signed_payload_value"} |> Jason.encode!()

      Bypass.expect_once(bypass, "POST", "/inApps/v1/notifications/test", fn conn ->
        conn
        |> Plug.Conn.put_resp_header("server", "daiquiri/3.0.0")
        |> Plug.Conn.resp(200, expected_body)
      end)

      {:ok, %AppStore.API.Response{body: body, status: status}} =
        TestNotification.send_test_notification(
          app_store.api_config,
          "token"
        )

      assert status === 200
      assert body === expected_body
    end
  end
end
