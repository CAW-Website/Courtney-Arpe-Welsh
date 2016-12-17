
$(document).ready (function () {
	for (let i = 0; i < $(".client-ad-image").length; i++) {
		$(".client-ad-image").eq(i).on ("click", function() {
			for (var j = 0; j < $(".client-profile").length; j++) {
				$(".client-profile").eq(j).css ("display", "none");
			}
			$(".client-profile").eq(i).css ("display", "block");
		});
	}
});