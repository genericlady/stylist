# TODO
- create a StyleSearch class that integrates that class and the `User.joins(:locations)
           .where(stylist_search_term.where_clause,
                  stylist_search_term.where_args)
           .order(stylist_search_term.order)`
- change your controller

```ruby
@style_search = StyleSearch.new(params);
@results = @style_search.results
```
