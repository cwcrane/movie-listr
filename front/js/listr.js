
var url = 'http://localhost:3000'; //todo
var placeImage = "http://placehold.it/900x300";

$('#movie-search').on('click', function(e){

	//clear image and previous results before receiving new results. 
	$('#movie-poster').attr("src", '');
	$('#movie-title').html('');
	$('#movie-title').data('omdbid', '');
	$('#movie-info').html('Retrieving Movie ...');

	var input = $('#search-inpt').val();
	// console.log(input);
	
	if(input) {

		$.ajax({
			url: url + '/movies',
			type: 'GET',
			contentType: 'application/json',
			dataType: 'json',
			data: {search: input},
		})
		.done(function(msg) {
			//TODO: bundle this into function
			//			handle "movie not found"
			console.log(msg);

			if(msg.movie_info.Error) {
				$('#movie-poster').attr("src", placeImage);
			}
			else {
				//Print the title and set omdbid
				$('#movie-title').html(msg.movie_info.Title);
				$('#movie-title').data('omdbid', msg.movie_info.imdbID);

				//Print the poster image
				$('#movie-poster').attr("src", msg.movie_info.Poster)

				//Print the rating 
				if(msg.rating) {
					$('#prev-rating').html(msg.rating).show();
					$('#rating-span').hide();
				}
				else {
					$('#rating-span').show();
					$('#rating-inpt').val('');
					$('#prev-rating').hide();
				}
			}

			//Print the movie's info (or error message)
			var sorted = Object.keys(msg.movie_info).sort();
			var movieInfo = '';
			for(var i=0; i<sorted.length; i++){
				//TODO - handle objects like "ratings" better. Don't just skip
				if(typeof msg.movie_info[sorted[i]] != 'object') {
					movieInfo += `${sorted[i]}:  ${msg.movie_info[sorted[i]]}<br>`;
				}
			}
			$('#movie-info').html(movieInfo);

		})
		.fail(function(jqXHR, textStatus) {
			console.log("error", jqXHR, textStatus);
			$('#movie-poster').attr("src", placeImage);
		})
		.always(function() {
			console.log("complete");
		});
	}
	else {
		//missing search term
	}
	
	
})

$('#rating-submit').on('click', function(e){
	
	var rating = $('#rating-inpt').val();
	var omdbId = $('#movie-title').data('omdbid');
	var mTitle = $('#movie-title').html();
	var userId = 1; //TODO
	console.log(rating, omdbId, mTitle, userId);
	
	if(rating && omdbId && mTitle && userId) {
		//TODO - better input validation
		$.ajax({
			url: url + '/ratings',
			type: 'POST',
			contentType: 'application/json',
			dataType: 'json',
			data: JSON.stringify({
					rating: rating,
					omdbId: omdbId,
					title:  mTitle,
					userId: userId
			}),
		})
		.done(function(msg) {
			console.log("success", msg);
			$('#prev-rating').html(msg.rating).show();
			$('#rating-span').hide();
		})
		.fail(function(jqXHR, textStatus) {
			console.log("error", jqXHR, textStatus);
		})
		.always(function() {
			console.log("complete");
		});
	}
	else {
		//missing params message
	}
	
})