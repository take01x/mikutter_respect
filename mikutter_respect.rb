# -*- coding: utf-8 -*-

Plugin.create(:mikutter_respect) do
  command(
          :mikutter_respect,
          name: 'りすぺくとする',
          condition: lambda{ |opt| true },
          visible: true,
          role: :timeline
          ) do |opt|
    opt.messages.map{ |m|
      Service.primary.post(:message => m.message,
                           :replyto => m.message[:replyto])
      m.message.retweet
      m.message.favorite(true)
    }
  end
end
