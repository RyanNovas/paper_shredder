# Paper Shredder

Paper Shredder is a Slack integration that helps keep your private messages private.

##Set Up

At the moment, Paper shredder is only an unofficial slash command integration, not an official Slack app. Until it is,
you have a couple option.

  1. Get in touch with the creator, Ryan Novas, via his [website](http://ryannovas.com/). He'll hook you up with Paper Shredder.

  2. Fork this repo, host the app where ever you want, and set an environmental variable ```SLACK_API_KEY=your_api_key```. Finally, set up a [slash command](https://api.slack.com/slash-commands) that sends a ```POST``` request to the app.


##Usage

Once the slash command has been set up access Paper Shredder by typing ```/paper_shredder last number_of_messages_you_want_to_delete```

This will only work in DM's, and there is an upper limit of 100 messages(imposed by the Slack API). There will be more features coming soon.
