# -*- coding: utf-8 -*-

Plugin.create(:mikutter_respect) do
  command(
          :mikutter_respect,
          name: 'りすぺくとする',
          condition: lambda{ |opt| true },
          visible: true,
          role: :timeline
          ) do |opt|
    opt.messages[0].retweet
    opt.messages[0].favorite(true)
    Service.primary.post(:message => opt.messages[0],
                         :replyto => opt.messages[0][:replyto])
  end
end
