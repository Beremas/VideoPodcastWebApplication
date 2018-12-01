package ParserXMLRSS;

public class TestRead {
    public static void main(String[] args) {
        RSSFeedParser parser = new RSSFeedParser("http://rss.cnn.com/rss/money_news_international.rss");
        
        Feed feed = parser.readFeed();
        
        System.out.println(feed);
        
        
        feed.getMessages().forEach((message) -> {
            System.out.println(message);
        });

    }
}