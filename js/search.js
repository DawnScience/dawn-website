---
---
$(document).ready(function() {
  // Initialize lunr with the fields to be searched, plus the boost.
  window.idx = lunr(function () {
    this.field('id');
    this.field('title');
    this.field('content', { boost: 10 });
    // this.field('author');
    // this.field('categories');
  });

  // Get the generated search_data.json file so lunr.js can search it locally.
  function loadSearchData(){
    if (window.data == null){
      window.data = $.getJSON('{{ "/search_data.json" | prepend: site.baseurl }}', function(loaded_data){
        $.each(loaded_data, function(index, value){
          window.idx.add(
            $.extend({ "id": index }, value)
          );
        });
      });
    } 
  } 

  // Event when the search text is edited
  $("#search").on('input',function(event){
      loadSearchData();
      var query = $(this).val(); // Get the value for the text field
      var results = window.idx.search(query); // Get lunr to perform a search
      display_search_results(results,query); // Hand the results off to be displayed
  });

  function display_search_results(results,query) {
    var $search_results = $("#search-results");

    // Wait for data to load
    window.data.then(function(loaded_data) {
      // Are there any results?
      if (results.length) {
        $('.search-results-wrapper').addClass('active');
        $search_results.empty(); // Clear any old results

        // Iterate over the results
        results.forEach(function(result) {
          var item = loaded_data[result.ref];

          // Build a snippet of HTML for this result
          var appendString = '<a class="collection-item" href="' + item.url + '">' + item.title + 
          '</a></li>';

          // Add the snippet to the collection of results.
          $search_results.append(appendString);
        });
      } else {
        if(query==""){
          // If the search box is empty, hide the results interface
          $('.search-results-wrapper').removeClass('active');
        }else{
          // If there are no results, let the user know.
          $('.search-results-wrapper').addClass('active');
          $search_results.html('<div class="collection-item">No results found for "'+query+'"</li>');
        }
      }
    });
  }
});