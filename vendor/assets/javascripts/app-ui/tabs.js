/*
 * app-ui/tabs.js
 *
 * Support JavaScript for tabs displayed in the UI.
 */

$.fn.tabNavigation = function() {

  var tabContainers = $(this);
  tabContainers.each(function() {

    var tabContainer = $(this);
    var nextElement = tabContainer.next()

    // Check if the next element in the DOM is a tab content container. If it's
    // not, we don't do anything special in Javascript to handle those.
    if (nextElement.is('div') && nextElement.hasClass('tab-content')) {
      
      var tabPanes = nextElement;

      $('a', tabContainer).live('click', function(e) {

        e.preventDefault()

        var tab = $(this);
        var tabClass = tab.attr('href').replace(/^\#/, '');

        // Hide all tab panes in the container.
        $('.tab-pane', tabPanes).removeClass('current');

        // Unselect all tabs.
        $('li', tabContainer).removeClass('current');

        // Mark the clicked tab as current.
        tab.closest('li').addClass('current');

        // Show the pane for the tab.
        $('.tab-pane.' + tabClass, tabPanes).addClass('current');

      });

      // Set the first tab as active by default.
      var firstTab = $('a:first', tabContainer);
      firstTab.click();

    }

  });

}

$(document).ready(function() {

  // Enable tabs for all tab navigations.
  $('nav.tabs').tabNavigation();

});
