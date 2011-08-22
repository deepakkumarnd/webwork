from urlparse import urljoin

from scrapy.http import Request
from scrapy.selector import XmlXPathSelector
from scrapy.spider import BaseSpider


class NasaImagesSpider(BaseSpider):
    name = "nasa.gov"
    start_urls = (
        'http://www.nasa.gov/multimedia/imagegallery/iotdxml.xml',
    )

    def parse(self, response):
        xxs = XmlXPathSelector(response)
        urls = xxs.select('//ig/ap/text()').extract()
        for url in urls:
            abs_url = urljoin(self.start_urls[0], url) + '.xml'
            yield Request(abs_url, callback=self.parse_image)

    def parse_image(self, response):
        # parse individual images here
        pass


SPIDER = NasaImagesSpider()
