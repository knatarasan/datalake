#Follow these steps to made a pipeline
	twitter--> flume --> hive

#step 1

flume3_twitter_text.conf
-------------------------

# Flume agent config
# #hadoop, big data, analytics, bigdata, cloudera, data science, data scientiest,business intelligence, mapreduce, data #warehouse, data warehousing, mahout, hbase, nosql, newsql,businessintelligence, cloudcomputing

TwitterAgent.sources = Twitter
TwitterAgent.channels = MemChannel
#TwitterAgent.sinks = Kafka
TwitterAgent.sinks = HDFS 


TwitterAgent.sources.Twitter.type = org.flume.source.twitter.json.TwitterSource
#TwitterAgent.sources.Twitter.type = org.apache.flume.source.twitter.TwitterSource
TwitterAgent.sources.Twitter.channels = MemChannel
TwitterAgent.sources.Twitter.deserializer.maxLineLength = 16384
TwitterAgent.sources.Twitter.consumerKey = ur0yZLSCOtE7TUOmGgv0OeOFG
TwitterAgent.sources.Twitter.consumerSecret = v2JLWcZKXktlJ9bpmjmlfLBzCoa12Qpwxfx7GouUvcjfPDmHDN
TwitterAgent.sources.Twitter.accessToken = 31794869-LKFB0qa2DcellcCKfgY2h4vW0BCwGWAjHTIrIeMnr
TwitterAgent.sources.Twitter.accessTokenSecret = 2paAAhkd0fE2Eytn3zYYMcRNzlPJ1cMUSNiys9yCd2zhC
TwitterAgent.sources.Twitter.languages = en

TwitterAgent.sources.Twitter.keywords =US SENATE , DONALD TRUMP , Hilary Clinton

#TwitterAgent.sinks.Kafka.channel = MemChannel
#TwitterAgent.sinks.Kafka.type = org.apache.flume.sink.kafka.KafkaSink

TwitterAgent.sinks.HDFS.channel = MemChannel 
TwitterAgent.sinks.HDFS.type = hdfs 
TwitterAgent.sinks.HDFS.hdfs.path = hdfs://wn1.kara:8020/apps/flume/tweets 
 

#TwitterAgent.sinks.Kafka.zookeeperConnect = wn1.kara:2181
#TwitterAgent.sinks.Kafka.brokerList = wn4.kara:6667
#TwitterAgent.sinks.Kafka.topic = twitter-topic
#TwitterAgent.sinks.Kafka.batchSize = 1

TwitterAgent.sinks.HDFS.hdfs.fileType = DataStream 
TwitterAgent.sinks.HDFS.hdfs.writeFormat = Text 
TwitterAgent.sinks.HDFS.hdfs.batchSize = 1000 
TwitterAgent.sinks.HDFS.hdfs.rollSize = 0 
TwitterAgent.sinks.HDFS.hdfs.rollCount = 10000

  
TwitterAgent.channels.MemChannel.type = memory
TwitterAgent.channels.MemChannel.capacity = 10000
TwitterAgent.channels.MemChannel.transactionCapacity = 100


---------------------------------------------------------------------

#step 2

/usr/hdp/2.3.0.0-2557/flume/bin/flume-ng agent --conf ./conf/ -f /home/kannappan/datalake/now/twitter_2_flume/flume3_twitter_text.conf -Dflume.root.logger=DEBUG,console -n TwitterAgent

#Step 3
Copy jar  https://github.com/sheetaldolas/Hive-JSON-Serde/blob/master/dist/json-serde-1.1.9.9-Hive1.2.jar into hive_home/lib

#Step 4 restart hive

#Step 5

Use SerDe org.openx.data.jsonserde.JsonSerDe

drop table tweets;

CREATE EXTERNAL TABLE tweets (
   id BIGINT,
   timestamp_ms STRING,
   created_at STRING,
   source STRING,
   favorited BOOLEAN,
   retweet_count INT,
   retweeted_status STRUCT<text:STRING, user2:STRUCT<screen_name:STRING,name:STRING>       >,

   entities STRUCT<urls:ARRAY<STRUCT<expanded_url:STRING>>,
      user_mentions:ARRAY<STRUCT<screen_name:STRING,name:STRING>>,
      hashtags:ARRAY<STRUCT<text:STRING>>>,
   text STRING,
   users STRUCT<
      screen_name:STRING,
      name:STRING,
      friends_count:INT,
      followers_count:INT,
      statuses_count:INT,
      verified:BOOLEAN,
      utc_offset:INT,
      time_zone:STRING>,
   in_reply_to_screen_name STRING
) 
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION '/apps/flume/json/';


select retweeted_status.user2.screen_name from tweets


hive> select id,created_at,source,users.friends_count from tweets limit 10;
OK
670285537404706816	Fri Nov 27 16:58:20 +0000 2015	<a href="http://twitter.com" rel="nofollow">Twitter Web Client</a>	NULL
670285537815711744	Fri Nov 27 16:58:20 +0000 2015	<a href="http://twitter.com" rel="nofollow">Twitter Web Client</a>	NULL
670285536704274432	Fri Nov 27 16:58:19 +0000 2015	<a href="http://twitter.com/download/iphone" rel="nofollow">Twitter for iPhone</a>	NULL
670285538189029377	Fri Nov 27 16:58:20 +0000 2015	<a href="http://twitter.com/download/android" rel="nofollow">Twitter for Android</a>	NULL
670285539518607360	Fri Nov 27 16:58:20 +0000 2015	<a href="http://twitter.com/download/iphone" rel="nofollow">Twitter for iPhone</a>	NULL
670285539791249408	Fri Nov 27 16:58:20 +0000 2015	<a href="http://ifttt.com" rel="nofollow">IFTTT</a>	NULL
670285541095694336	Fri Nov 27 16:58:20 +0000 2015	<a href="http://twitter.com" rel="nofollow">Twitter Web Client</a>	NULL
670285541309620224	Fri Nov 27 16:58:21 +0000 2015	<a href="http://twitter.com" rel="nofollow">Twitter Web Client</a>	NULL
670285543364820992	Fri Nov 27 16:58:21 +0000 2015	<a href="http://twitter.com/download/iphone" rel="nofollow">Twitter for iPhone</a>	NULL
670285545596182528	Fri Nov 27 16:58:22 +0000 2015	<a href="http://twitter.com/#!/download/ipad" rel="nofollow">Twitter for iPad</a>	NULL
Time taken: 0.443 seconds, Fetched: 10 row(s)

/*Following query fails */
hive> select id,created_at,source,users.friends_count from tweets limit 10;


{  
   "filter_level":"low",
   "retweeted":false,
   "in_reply_to_screen_name":null,
   "possibly_sensitive":false,
   "truncated":false,
   "lang":"en",
   "in_reply_to_status_id_str":null,
   "id":670285537404706816,
   "extended_entities":{  
      "media":[  
         {  
            "sizes":{  
               "small":{  
                  "w":340,
                  "resize":"fit",
                  "h":242
               },
               "thumb":{  
                  "w":150,
                  "resize":"crop",
                  "h":150
               },
               "medium":{  
                  "w":600,
                  "resize":"fit",
                  "h":428
               },
               "large":{  
                  "w":1024,
                  "resize":"fit",
                  "h":730
               }
            },
            "source_user_id":15164565,
            "media_url":"http://pbs.twimg.com/media/CU1OJqFUsAAJlF5.jpg",
            "display_url":"pic.twitter.com/W9FgqNcQCa",
            "type":"photo",
            "url":"https://t.co/W9FgqNcQCa",
            "id":670277847370477568,
            "media_url_https":"https://pbs.twimg.com/media/CU1OJqFUsAAJlF5.jpg",
            "expanded_url":"http://twitter.com/Slate/status/670277847995518976/photo/1",
            "source_user_id_str":"15164565",
            "indices":[  
               139,
               140
            ],
            "source_status_id_str":"670277847995518976",
            "source_status_id":670277847995518976,
            "id_str":"670277847370477568"
         }
      ]
   },
   "in_reply_to_user_id_str":null,
   "timestamp_ms":"1448643500077",
   "in_reply_to_status_id":null,
   "created_at":"Fri Nov 27 16:58:20 +0000 2015",
   "favorite_count":0,
   "place":null,
   "coordinates":null,
   "text":"RT @Slate: Donald Trump is a \u201cfascist\u201d--that\u2019s not an insult. It\u2019s the political label that fits best: https://t.co/aOKAHC8fbD https://t.co\u2026",
   "contributors":null,
   "retweeted_status":{  
      "filter_level":"low",
      "retweeted":false,
      "in_reply_to_screen_name":null,
      "possibly_sensitive":false,
      "truncated":false,
      "lang":"en",
      "in_reply_to_status_id_str":null,
      "id":670277847995518976,
      "extended_entities":{  },
      "in_reply_to_user_id_str":null,
      "in_reply_to_status_id":null,
      "created_at":"Fri Nov 27 16:27:46 +0000 2015",
      "favorite_count":48,
      "place":null,
      "coordinates":null,
      "text":"Donald Trump is a \u201cfascist\u201d--that\u2019s not an insult. It\u2019s the political label that fits best: https://t.co/aOKAHC8fbD https://t.co/W9FgqNcQCa",
      "contributors":null,
      "geo":null,
      "entities":{  
         "symbols":[  

         ],
         "urls":[  
            {  
               "expanded_url":"http://slate.me/1Ov0M0v",
               "indices":[  
                  92,
                  115
               ],
               "display_url":"slate.me/1Ov0M0v",
               "url":"https://t.co/aOKAHC8fbD"
            }
         ],
         "hashtags":[  

         ],
         "media":[  
            {  
               "sizes":{  
                  "small":{  
                     "w":340,
                     "resize":"fit",
                     "h":242
                  },
                  "thumb":{  
                     "w":150,
                     "resize":"crop",
                     "h":150
                  },
                  "medium":{  
                     "w":600,
                     "resize":"fit",
                     "h":428
                  },
                  "large":{  
                     "w":1024,
                     "resize":"fit",
                     "h":730
                  }
               },
               "id":670277847370477568,
               "media_url_https":"https://pbs.twimg.com/media/CU1OJqFUsAAJlF5.jpg",
               "media_url":"http://pbs.twimg.com/media/CU1OJqFUsAAJlF5.jpg",
               "expanded_url":"http://twitter.com/Slate/status/670277847995518976/photo/1",
               "indices":[  
                  116,
                  139
               ],
               "id_str":"670277847370477568",
               "type":"photo",
               "display_url":"pic.twitter.com/W9FgqNcQCa",
               "url":"https://t.co/W9FgqNcQCa"
            }
         ],
         "user_mentions":[  

         ]
      },
      "is_quote_status":false,
      "source":"<a href=\"http://www.socialflow.com\" rel=\"nofollow\">SocialFlow<\/a>",
      "favorited":false,
      "in_reply_to_user_id":null,
      "retweet_count":61,
      "id_str":"670277847995518976",
      "user":{  
         "location":null,
         "default_profile":false,
         "profile_background_tile":false,
         "statuses_count":176602,
         "lang":"en",
         "profile_link_color":"0084B4",
         "profile_banner_url":"https://pbs.twimg.com/profile_banners/15164565/1448288971",
         "id":15164565,
         "following":null,
         "protected":false,
         "favourites_count":3278,
         "profile_text_color":"000000",
         "verified":true,
         "description":"Politics, culture, technology, business, news, and commentary. Procrastinate better.",
         "contributors_enabled":false,
         "profile_sidebar_border_color":"87BC44",
         "name":"Slate",
         "profile_background_color":"670033",
         "created_at":"Thu Jun 19 01:08:29 +0000 2008",
         "default_profile_image":false,
         "followers_count":1489936,
         "profile_image_url_https":"https://pbs.twimg.com/profile_images/2151387107/slateLogo-S-facebookSquarex200_normal.jpg",
         "geo_enabled":true,
         "profile_background_image_url":"http://pbs.twimg.com/profile_background_images/578119077/wz4rqy2glu2jnibxu6hc.jpeg",
         "profile_background_image_url_https":"https://pbs.twimg.com/profile_background_images/578119077/wz4rqy2glu2jnibxu6hc.jpeg",
         "follow_request_sent":null,
         "url":"http://www.slate.com",
         "utc_offset":-18000,
         "time_zone":"Eastern Time (US & Canada)",
         "notifications":null,
         "profile_use_background_image":false,
         "friends_count":576,
         "profile_sidebar_fill_color":"E0FF92",
         "screen_name":"Slate",
         "id_str":"15164565",
         "profile_image_url":"http://pbs.twimg.com/profile_images/2151387107/slateLogo-S-facebookSquarex200_normal.jpg",
         "listed_count":29516,
         "is_translator":false
      }
   },
   "geo":null,
   "entities":{  
      "symbols":[  

      ],
      "urls":[  
         {  
            "expanded_url":"http://slate.me/1Ov0M0v",
            "indices":[  
               103,
               126
            ],
            "display_url":"slate.me/1Ov0M0v",
            "url":"https://t.co/aOKAHC8fbD"
         }
      ],
      "hashtags":[  

      ],
      "media":[  
         {  
            "sizes":{  
               "small":{  
                  "w":340,
                  "resize":"fit",
                  "h":242
               },
               "thumb":{  
                  "w":150,
                  "resize":"crop",
                  "h":150
               },
               "medium":{  
                  "w":600,
                  "resize":"fit",
                  "h":428
               },
               "large":{  
                  "w":1024,
                  "resize":"fit",
                  "h":730
               }
            },
            "source_user_id":15164565,
            "media_url":"http://pbs.twimg.com/media/CU1OJqFUsAAJlF5.jpg",
            "display_url":"pic.twitter.com/W9FgqNcQCa",
            "type":"photo",
            "url":"https://t.co/W9FgqNcQCa",
            "id":670277847370477568,
            "media_url_https":"https://pbs.twimg.com/media/CU1OJqFUsAAJlF5.jpg",
            "expanded_url":"http://twitter.com/Slate/status/670277847995518976/photo/1",
            "source_user_id_str":"15164565",
            "indices":[  
               139,
               140
            ],
            "source_status_id_str":"670277847995518976",
            "source_status_id":670277847995518976,
            "id_str":"670277847370477568"
         }
      ],
      "user_mentions":[  
         {  
            "id":15164565,
            "name":"Slate",
            "indices":[  
               3,
               9
            ],
            "screen_name":"Slate",
            "id_str":"15164565"
         }
      ]
   },
   "is_quote_status":false,
   "source":"<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client<\/a>",
   "favorited":false,
   "in_reply_to_user_id":null,
   "retweet_count":0,
   "id_str":"670285537404706816",
   "user":{  
      "location":"Pre: 41.840274,-71.596311",
      "default_profile":false,
      "profile_background_tile":false,
      "statuses_count":11955,
      "lang":"en",
      "profile_link_color":"0084B4",
      "profile_banner_url":"https://pbs.twimg.com/profile_banners/39876847/1398310453",
      "id":39876847,
      "following":null,
      "protected":false,
      "favourites_count":267,
      "profile_text_color":"333333",
      "verified":false,
      "description":"The opinions expressed are my own and not those of the sponsors or this network... Former ACP Board Chair, current member ABIM IM specialty board (it's true!)",
      "contributors_enabled":false,
      "profile_sidebar_border_color":"FFFFFF",
      "name":"Yul Ejnes",
      "profile_background_color":"9AE4E8",
      "created_at":"Thu May 14 00:08:07 +0000 2009",
      "default_profile_image":false,
      "followers_count":561,
      "profile_image_url_https":"https://pbs.twimg.com/profile_images/212402145/Photo_021707_002_normal.jpg",
      "geo_enabled":true,
      "profile_background_image_url":"http://pbs.twimg.com/profile_background_images/459175810759266304/izjIk5Ns.jpeg",
      "profile_background_image_url_https":"https://pbs.twimg.com/profile_background_images/459175810759266304/izjIk5Ns.jpeg",
      "follow_request_sent":null,
      "url":"http://www.coastalmedical.com/find-a-doctor/doc/yul-david-ejnes",
      "utc_offset":-18000,
      "time_zone":"Eastern Time (US & Canada)",
      "notifications":null,
      "profile_use_background_image":true,
      "friends_count":320,
      "profile_sidebar_fill_color":"DDFFCC",
      "screen_name":"yejnes",
      "id_str":"39876847",
      "profile_image_url":"http://pbs.twimg.com/profile_images/212402145/Photo_021707_002_normal.jpg",
      "listed_count":57,
      "is_translator":false
   }
}

