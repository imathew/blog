---
title: "Delete old tweets selectively using Python and Tweepy"
description: "Delete tweets on a regular schedule with the Twitter API"
date: "2015-03-05"
categories: 
  - "technology"
code: true
comments: true
---
For some time I've used an online service to delete tweets that are more than one week old. I do this because I use Twitter for levity, for throwaway comments and retweets on issues of the day, and I don't really want those saved for posterity. Thanks to search crawlers and caches I can never be certain that tweets are gone forever, but this is a small step in that direction.

When [I joined Keybase](//keybase.io/imathew "imathew @ Keybase") I discovered that I needed to prevent my 'proof' tweet from being deleted, and the simple method used by the online deletion service was no longer an option. My solution uses an exception list containing the IDs of the tweets I wish to save, and these are ignored when their contemporaries are merged with the infinite.

I've written a [Python](//www.python.org/ "Python") script that uses [Tweepy](//www.tweepy.org/ "Tweepy") to scan the contents of my timeline and delete any tweet that meets two criteria - more than seven days old and not in my exception list. It's very simple, there are probably better ways of doing it (please let me know), but it works well for me as a nightly cron job.

Please note that since I've been deleting my old tweets this way for some time I've never had issues with the [Twitter API rate limits](//dev.twitter.com/rest/public/rate-limiting "Twitter API rate limits"). Every deletion is an API call, so if you have many tweets you may need to consider initially limiting the number returned via the .items() method. This is demonstrated in the [Tweepy](//tweepy.readthedocs.org/en/v3.2.0/cursor_tutorial.html "Cursor tutorial") cursor tutorial.

To get the required authentication keys you will need to [register a Twitter application](//apps.twitter.com/ "Register app").

### Update

Since my initial post I've added functionality to unfavor (or 'unfavorite') tweets, too. I've included the full script below.

```python
#!/usr/bin/env python
 
import tweepy
from datetime import datetime, timedelta
 
# options
test_mode = False
verbose = False
delete_tweets = True
delete_favs = True
days_to_keep = 7
 
tweets_to_save = [
	573245340398170114, # keybase proof
	573395137637662721, # a tweet to this very post
]
favs_to_save = [
	362469775730946048, # tony this is icac
]
 
# auth and api
consumer_key = 'XXXXXXXX'
consumer_secret = 'XXXXXXXX'
access_token = 'XXXXXXXX'
access_token_secret = 'XXXXXXXX'
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth)
 
# set cutoff date, use utc to match twitter
cutoff_date = datetime.utcnow() - timedelta(days=days_to_keep)
 
# delete old tweets
if delete_tweets:
	# get all timeline tweets
	print "Retrieving timeline tweets"
	timeline = tweepy.Cursor(api.user_timeline).items()
	deletion_count = 0
	ignored_count = 0
 
	for tweet in timeline:
		# where tweets are not in save list and older than cutoff date
		if tweet.id not in tweets_to_save and tweet.created_at < cutoff_date:
			if verbose:
				print "Deleting %d: [%s] %s" % (tweet.id, tweet.created_at, tweet.text)
			if not test_mode:
				api.destroy_status(tweet.id)
			 
			deletion_count += 1
		else:
			ignored_count += 1
 
	print "Deleted %d tweets, ignored %d" % (deletion_count, ignored_count)
else:
	print "Not deleting tweets"
	 
# unfavor old favorites
if delete_favs:
	# get all favorites
	print "Retrieving favorite tweets"
	favorites = tweepy.Cursor(api.favorites).items()
	unfav_count = 0
	kept_count = 0
 
	for tweet in favorites:
		# where tweets are not in save list and older than cutoff date
		if tweet.id not in favs_to_save and tweet.created_at < cutoff_date:
			if verbose:
				print "Unfavoring %d: [%s] %s" % (tweet.id, tweet.created_at, tweet.text)
			if not test_mode:
				api.destroy_favorite(tweet.id)
			 
			unfav_count += 1
		else:
			kept_count += 1
 
	print "Unfavored %d tweets, ignored %d" % (unfav_count, kept_count)
else:
	print "Not unfavoring tweets"
```