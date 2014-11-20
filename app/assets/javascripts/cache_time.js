/*************************
 * CONFIGURABLE SETTINGS *
 *************************/

var TIME_LIMIT = 3; /* used to be 2 */
var MAX_ATTEMPTS = 1;

/**********************
 * MAIN STATE MACHINE *
 **********************/


var target_off = 0;
var attempt = 0;
var confirmed_visited = false;

var current_url;
var wait_cycles;

var frame_ready = false;

var start, stop, urls;

/* The frame points to about:blank. Initialize a new test, giving the
   about:blank frame some time to fully load. */

function perform_check() {
  wait_cycles = 0;
  setTimeout(wait_for_read1, 1);
}


/* Confirm that about:blank is loaded correctly. */
function wait_for_read1() {
  if (wait_cycles++ > 100) {
    alert('Something went wrong, sorry.');
    return;
  }

  try {
    if (frames.f.location.href != 'about:blank') throw 1;

    frames.f.stop();
    document.getElementById('f').src ='javascript:"<body onload=\'parent.frame_ready = true\'>"';

    setTimeout(wait_for_read2, 1);
  } catch (e) {
    setTimeout(wait_for_read1, 1);
  }
}

function wait_for_read2() {
  if (wait_cycles++ > 100) {
    alert('Something went wrong, sorry.');
    return;
  }

  if (!frame_ready) {
    setTimeout(wait_for_read2, 1);
  } else {
    frames.f.stop();
    setTimeout(navigate_to_target, 1);
  }
}

/* Navigate the frame to the target URL. */
function navigate_to_target() {
  cycles = 0;

  setTimeout(wait_for_noread, 1);

  urls++;
  document.getElementById("f").src = current_url;
}

/* The browser is now trying to load the destination URL. Let's see if
   we lose SOP access before we hit TIME_LIMIT. If yes, we have a cache
   hit. If not, seems like cache miss. In both cases, abort pending
   navigation by pointing the frame back to about:blank when done. */
function wait_for_noread() {
  try {
    if (frames.f.location.href === undefined) throw 1;

    if (cycles++ >= TIME_LIMIT) {
      maybe_test_next();
      return;
    }
    setTimeout(wait_for_noread, 1);
  } catch (e) {
    confirmed_visited = true;
    maybe_test_next();
  }
}

/* Decides what to do next. May schedule another attempt for the same target,
   select a new target, or wrap up the scan. */
function maybe_test_next() {
  frame_ready = false;

  document.getElementById('f').src = 'about:blank';

  if (target_off < targets.length) {
    if (confirmed_visited) {
      var url = $('#update').data('url');
      $.ajax(url, {
        type: 'PUT',
        data: { app_ids: [targets[target_off].id] }
      });
    }

    if (confirmed_visited || attempt == MAX_ATTEMPTS * targets[target_off].urls.length) {
      confirmed_visited = false;
      target_off++;
      attempt = 0;

      maybe_test_next();
    } else {
      current_url = targets[target_off].urls[attempt % targets[target_off].urls.length];

      attempt++;

      perform_check();
    }
  }
}

/* The handler for "run the test" button on the main page. Dispenses
   advice, resets state if necessary. */
function start_stuff() {
  target_off = 0;
  attempt = 0;
  confirmed_visited = false;

  urls = 0;

  maybe_test_next();
}

$(function() {
  start_stuff();
});
