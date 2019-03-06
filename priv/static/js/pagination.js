$(document).ready(function() {
  var CLASS_DISABLED = 'disabled'
  var CLASS_ACTIVE = 'active'
  var CLASS_SIBLING_ACTIVE = 'active-sibling'
  var DATA_KEY = 'pagination'

  $('.pagination').each(initPagination)

  function initPagination() {
    let $this = $(this)
    var indexOfActiveElt = $this.find('li.active')
    $this.data(DATA_KEY, $this.find('li').index(indexOfActiveElt))

    $this.find('.prev').on('click', navigateSinglePage)
    $this.find('.next').on('click', navigateSinglePage)
    $this.find('li').on('click', function() {
      let $parent = $(this).closest('.pagination')
      $parent.data(DATA_KEY, $parent.find('li').index(this))
      changePage.apply($parent)
    })
    changePage.apply($this)
  }

  function navigateSinglePage() {
    if (!$(this).hasClass(CLASS_DISABLED)) {
      let $parent = $(this).closest('.pagination')
      let currActive = parseInt($parent.data('pagination'), 10)

      currActive += 1 * ($(this).hasClass('prev') ? -1 : 1)
      $parent.data(DATA_KEY, currActive)

      changePage.apply($parent)
    }
  }

  function changePage(currActive) {
    let $list = $(this).find('li')
    currActive = parseInt($(this).data(DATA_KEY), 10)

    $list.filter('.' + CLASS_ACTIVE).removeClass(CLASS_ACTIVE)
    $list.filter('.' + CLASS_SIBLING_ACTIVE).removeClass(CLASS_SIBLING_ACTIVE)

    $list.eq(currActive).addClass(CLASS_ACTIVE)

    if (currActive === 0) {
      $(this).find('.prev').addClass(CLASS_DISABLED)
    } else {
      $list.eq(currActive - 1).addClass(CLASS_SIBLING_ACTIVE)
      $(this).find('.prev').removeClass(CLASS_DISABLED)
    }

    if (currActive === ($list.length - 1)) {
      $(this).find('.next').addClass(CLASS_DISABLED)
    } else {
      $(this).find('.next').removeClass(CLASS_DISABLED)
    }
  }
})