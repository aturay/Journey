App.cable.subscriptions.create {
    channel: "UserChannel"
  },

  received: (data) ->
    @appendLine(data)

  appendLine: (data) ->
    user = data.user
    user.file_url = data.file_url
    user.sign_in_count = data.sign_in_count

    html = @createLine( user )
    $("#ws_new_user").append(html)

  createLine: (user) ->
    console.log user
    """
    <tr>
      <td><a href="/users/#{user.id}">#{user.username}</a></td>
      <td class="item_user_mail">#{user.email}</td>
      <td>#{user.sign_in_count}</td>
      <td><a target="_blank" href="#{user.file_url}">#{user.file_file_name}</a></td>
      <td class="status">#{user.email}</td>
      <td class="blocked_date">#{user.blocked_date || '-'}</td>
      <td class="action"><a href="/users/#{user.id}?status=accept">Принять</a></td>
      <td class="action"><a href="/users/#{user.id}?status=reject">Отклонить</a></td>
      <td class="action"><a href="/users/#{user.id}?status=block">Заблакировать</a></td>
      <td><a confirm="Are you sure?" rel="nofollow" user-method="delete" href="/users/#{user.id}">Удалить</a></td>
    </tr>
    """
