from tweepy import API
from tweepy import Cursor
from tweepy.streaming import StreamListener
from tweepy import OAuthHandler
from tweepy import Stream
import Twitter_Credentials

# TWITTER CLIENT #


class TwitterClient:
    def __init__(self, twitter_user=None):
        self.auth = TwitterAuthenticator().authenticate_twitter_app()
        self.twitter_client = API(self.auth)

        self.twitter_user = twitter_user

    def get_user_timeline_tweets(self, num_tweets):
        tweets = []
        for tweet in Cursor(self.twitter_client.user_timeline, id=self.twitter_user).items(num_tweets):
            tweets.append(tweet)
        return tweets

    def get_friend_list(self, num_friends):
        friend_list = []
        for friend in Cursor(self.twitter_client.friends, id=self.twitter_user).items(num_friends):
            friend_list.append(friend)
        return friend_list

    def get_home_timeline_tweets(self, num_tweets):
        home_timeline_tweets = []
        for tweet in Cursor(self.twitter_client.home_timeline, id=self.twitter_user).items(num_tweets):
            home_timeline_tweets.append(tweet)

# TWIITTER AUTENTICATOR #


class TwitterAuthenticator:

    def authenticate_twitter_app(self):
        auth = OAuthHandler(Twitter_Credentials.Consumer_Key, Twitter_Credentials.Consumer_Secret)
        auth.set_access_token(Twitter_Credentials.Access_Token, Twitter_Credentials.Access_Token_Secret)
        return auth


class TwitterStreamer:
    """

    Classe para coleta em tempo real de tweets

    """
    def __init__(self):
        self.twitter_auntenticator = TwitterAuthenticator()

    def stream_tweets(self, fetched_tweets_filename, hash_tag_list):
        # Autenticação do Twitter e conexão em tempo real com os Tweets(Streaming API)
        listener = TwitterListener(fetched_tweets_filename)
        auth = self.twitter_auntenticator.authenticate_twitter_app()
        stream = Stream(auth, listener)

        # Método de filtragem dos dados e captura de keywords
        stream.filter(track=hash_tag_list)


class TwitterListener(StreamListener):

    def __init__(self, fetched_tweets_filename):
        self.fetched_tweets_filename = fetched_tweets_filename

    def on_data(self, data):
        try:
            print(data)
            with open(self.fetched_tweets_filename, 'a') as tf:
                tf.write(data)
            return True
        except BaseException as e:
            print("Error on_data: %s" % str(e))
            return True

    def on_error(self, status):
        if status == 420:
            # Retorna falso no método data caso haja limite de ocorrencias
            return False
        print(status)


if __name__ == '__main__':
    hash_tag_list = ['Lula']
    fetched_tweets_filename = 'tweets.json'

    twitter_client = TwitterClient('pycon')
    print(twitter_client.get_user_timeline_tweets(1))

    # twitter_streamer = TwitterStreamer()
    # twitter_streamer.stream_tweets(fetched_tweets_filename, hash_tag_list)
