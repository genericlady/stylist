class ServiceSearch
  def initialize(query)
  end

  def results
    [
      {
        image: '/path/to/emoji.png',
        title: 'Haircut by Sally Hansen',
        subtitle: '$120.00',
        locations: 'Brooklyn, NY - New York, NY',
        rating: '*****',
        total_reviews: 60
      },
      {
        image: '/path/to/emoji.png',
        title: 'Haircolor by Sally Hansen',
        subtitle: '$180.00',
        locations: 'Brooklyn, NY - New York, NY',
        rating: '*****',
        total_reviews: 23
      }
    ]
  end
end
