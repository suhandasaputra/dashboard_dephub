<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Animated Radial Progress Bars</title>
<style>
*, :before, :after { box-sizing: border-box; }

body {
  background-color: #1d1f20;
  color: #e5e5e5;
  font: 16px/1.25 'Raleway', sans-serif;
  margin: 0;
  background: linear-gradient(to top right, #060628, #1F245A, #682359);
}

.row {
  margin-left: auto;
  margin-right: auto;
  max-width: 80em;
  padding: 1em;
}

section { text-align: center; }

h1, h2, h3, h4, h5, h6 {
  font-family: 'Oswald', sans-serif;
  font-weight: 400;
  text-align: center;
}

p {
  margin-left: auto;
  margin-right: auto;
  max-width: 36em;
  text-align: center;
}

.arrow {
  border: 2em solid transparent;
  height: 0;
  margin: 50vh auto;
  width: 0;
}

.arrow.down {
  border-bottom: none;
  border-top-color: #e5e5e5;
}
.arrow.up {
    border-bottom-color: #e5e5e5;
    border-top: none;
}
/*** RADIAL PROGRESS ***/
/* Circumference = 2?r */
/* ? = 3.1415926535898 */
/* r = 35 */

svg.radial-progress {
  height: auto;
  max-width: 200px;
  padding: 1em;
  transform: rotate(-90deg);
  width: 100%;
}

svg.radial-progress circle {
  fill: rgba(0,0,0,0);
  stroke: #fff;
  stroke-dashoffset: 219.91148575129; /* Circumference */
  stroke-width: 10;
}

svg.radial-progress circle.incomplete { opacity: 0.25; }

svg.radial-progress circle.complete { stroke-dasharray: 219.91148575129; /* Circumference */ }

svg.radial-progress text {
  fill: #fff;
  font: 400 1em/1 'Oswald', sans-serif;
  text-anchor: middle;
}

/*** COLORS ***/
/* Primary */

svg.radial-progress:nth-of-type(6n+1) circle { stroke: #a2ed56; }

/* Secondary */

svg.radial-progress:nth-of-type(6n+2) circle { stroke: #83e4e2; }

/* Tertiary */

svg.radial-progress:nth-of-type(6n+3) circle { stroke: #fd6470; }

/* Quaternary */

svg.radial-progress:nth-of-type(6n+4) circle { stroke: #fca858; }

/* Quinary */

svg.radial-progress:nth-of-type(6n+5) circle { stroke: #fddc32; }
</style>
</head>

<body>
<main>
  <div class="arrow down"></div>
  <section class="row"> <svg class="radial-progress" data-percentage="82" viewBox="0 0 80 80">
    <circle class="incomplete" cx="40" cy="40" r="35"></circle>
    <circle class="complete" cx="40" cy="40" r="35" style="stroke-dashoffset: 39.58406743523136;"></circle>
    <text class="percentage" x="50%" y="57%" transform="matrix(0, 1, -1, 0, 80, 0)">82%</text>
    </svg> <svg class="radial-progress" data-percentage="33" viewBox="0 0 80 80">
    <circle class="incomplete" cx="40" cy="40" r="35"></circle>
    <circle class="complete" cx="40" cy="40" r="35" style="stroke-dashoffset: 147.3406954533613;"></circle>
    <text class="percentage" x="50%" y="57%" transform="matrix(0, 1, -1, 0, 80, 0)">33%</text>
    </svg> <svg class="radial-progress" data-percentage="71" viewBox="0 0 80 80">
    <circle class="incomplete" cx="40" cy="40" r="35"></circle>
    <circle class="complete" cx="40" cy="40" r="35" style="stroke-dashoffset: 63.774330867872806;"></circle>
    <text class="percentage" x="50%" y="57%" transform="matrix(0, 1, -1, 0, 80, 0)">71%</text>
    </svg> <svg class="radial-progress" data-percentage="24" viewBox="0 0 80 80">
    <circle class="incomplete" cx="40" cy="40" r="35"></circle>
    <circle class="complete" cx="40" cy="40" r="35" style="stroke-dashoffset: 167.13272917097697;"></circle>
    <text class="percentage" x="50%" y="57%" transform="matrix(0, 1, -1, 0, 80, 0)">24%</text>
    </svg> <svg class="radial-progress" data-percentage="100" viewBox="0 0 80 80">
    <circle class="incomplete" cx="40" cy="40" r="35"></circle>
    <circle class="complete" cx="40" cy="40" r="35" style="stroke-dashoffset: 0;"></circle>
    <text class="percentage" x="50%" y="57%" transform="matrix(0, 1, -1, 0, 80, 0)">100%</text>
    </svg> <svg class="radial-progress" data-percentage="0" viewBox="0 0 80 80">
    <circle class="incomplete" cx="40" cy="40" r="35"></circle>
    <circle class="complete" cx="40" cy="40" r="35" style="stroke-dashoffset: 219.91148575129;"></circle>
    <text class="percentage" x="50%" y="57%" transform="matrix(0, 1, -1, 0, 80, 0)">0%</text>
    </svg> </section>
    <div class="arrow up"></div>
</main>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> 
<script>
$(function(){

    // Remove svg.radial-progress .complete inline styling
    $('svg.radial-progress').each(function( index, value ) { 
        $(this).find($('circle.complete')).removeAttr( 'style' );
    });

    // Activate progress animation on scroll
    $(window).scroll(function(){
        $('svg.radial-progress').each(function( index, value ) { 
            // If svg.radial-progress is approximately 25% vertically into the window when scrolling from the top or the bottom
            if ( 
                $(window).scrollTop() > $(this).offset().top - ($(window).height() * 0.75) &&
                $(window).scrollTop() < $(this).offset().top + $(this).height() - ($(window).height() * 0.25)
            ) {
                // Get percentage of progress
                percent = $(value).data('percentage');
                // Get radius of the svg's circle.complete
                radius = $(this).find($('circle.complete')).attr('r');
                // Get circumference (2?r)
                circumference = 2 * Math.PI * radius;
                // Get stroke-dashoffset value based on the percentage of the circumference
                strokeDashOffset = circumference - ((percent * circumference) / 100);
                // Transition progress for 1.25 seconds
                $(this).find($('circle.complete')).animate({'stroke-dashoffset': strokeDashOffset}, 1250);
            }
        });
    }).trigger('scroll');

});
</script>
</body>
</html>
