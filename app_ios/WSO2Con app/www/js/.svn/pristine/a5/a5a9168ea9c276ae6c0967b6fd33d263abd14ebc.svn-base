// Prepare sponsors page
$('#sponsors').live('pageshow', function(event){
    if (testmode) { console.log("pageshow #sponsors"); }
    var levels = ["gold", "silver", "media"];
    var template = "<ul data-role='listview'>";
    for (var l in levels) {
        var temp_template = "<li data-role='list-divider'>" + ["Gold Sponsors", "Silver Sponsors", "Media Sponsors"][l] + "</li><li class='logo-container'>";
        
        for (var s in sponsors) {
            var sponsor = sponsors[s];
            if (sponsor.type == levels[l]) {
                template += temp_template;  // only add the separator if we encounter the sponsor type
                temp_template = "";
                template += "<span class='logo-" + sponsor.type + "'><a href='#sponsor?id=" + sponsor.id + "'><img src='" + sponsor.logo + "'></a></span>";
            }
        }
        template += "</li>";
    }
    template += "</ul>";
    $("#sponsorlist").html(template).trigger("create");
});

// Display sponsor ads
var adcounter = [0,0];  // separate counters for each sponsor level to ensure independent rotation
function showAd(level) {
    if (sponsors != null) {
        var adimg = $.mobile.activePage.find(".ad");
        
        // skip any sponsors not at the right level - warning infinite loop if no gold sponsor defined...
        while (sponsors.length > 1 && sponsors[adcounter[level-1] % sponsors.length].level > level) {
            adcounter[level - 1]++
        }
        
        var adsponsor = sponsors[adcounter[level-1] % sponsors.length];
        
        if (adsponsor.adcounter == null) {
            adsponsor.adcounter = 0;
        }
        
        var ad = adsponsor.ads[adsponsor.adcounter % adsponsor.ads.length];

        if (ad.image2x != null && $.mobile.activePage.outerWidth() >= (window.devicePixelRatio > 1 ? 320 : 640)) {
            adimg.attr("src", ad.image2x);
        } else {
            adimg.attr("src", ad.image);
        }
        if (ad.url.indexOf("#sponsor") == 0) {
            adimg.removeAttr("target");
        } else {
            adimg.attr("target", "_blank");
        }
        adimg.attr("href", ad.url);
        adimg.show();
        adsponsor.adcounter++;
        adcounter[level-1]++;
    }
}

