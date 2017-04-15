App.cable.subscriptions.create {
    channel: "UserChannel"
  },

  received: (data) ->
    @appendLine(data)

  appendLine: (data) ->
    user = data.user
    user.file_url = data.file_url
    user.sign_in_count = 1

    html = @createLine( user )
    $("#ws_new_user").append(html)

  createLine: (user) ->
    if user.file?
      file = "<a target='_blank' href='#{user.file_url}'>#{user.file_file_name}</a>"
    else
      file = '-'

    if user.url
      url = "<a href=#{user.url} target='_blank'>#{user.provider}</a>"
    else
      url = '-'

    """
    <tr>
      <td><a href="/users/#{user.id}">#{user.username}</a></td>
      <td>#{user.phone}</td>
      <td class="item_user_mail">#{user.email}</td>
      <td>#{user.city}</td>
      <td>#{file}</td>

      <td>#{user.sign_in_count}</td>
      <td class="status">#{user.credentials}</td>
      <td>#{url}</td>
      <td class="blocked_date">#{user.blocked_date || '-'}</td>

      <td class="action"><a href="/users/#{user.id}?status=accept">Принять</a></td>
      <td class="action"><a href="/users/#{user.id}?status=reject">Отклонить</a></td>
      <td class="action"><a href="/users/#{user.id}?status=block">Заблакировать</a></td>
      <td><a confirm="Are you sure?" rel="nofollow" user-method="delete" href="/users/#{user.id}">Удалить</a></td>
    </tr>
    """
