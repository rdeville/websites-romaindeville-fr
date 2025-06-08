//"use strict";
// Auto hide nav drop-down when on mobil
const navLinks = document.querySelectorAll('.nav-item')
const menuToggle = document.getElementById('top-nav-items')
var lastSkillFilter = "all"

// Put content of egg in page
// $("#egg").load("egg.html")


// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0; // For Safari
  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}

function toggleSkillDetail(id) {
  var card_body = document.getElementById("skill-card-body-" + id);
  var detail_icon = document.getElementById("skill-card-detail-" + id);
  if (card_body.classList.contains('d-block')) {
    card_body.classList.remove('d-block');
    card_body.classList.add('d-none');
    detail_icon.innerHTML = '<span style="font-size:1.5em" class="fa-angle-right fas"></span>'
  } else {
    card_body.classList.remove('d-none');
    card_body.classList.add('d-block');
    detail_icon.innerHTML = '<span style="font-size:1.5em" class="fa-angle-down fas"></span>'
  }
  filter_btn = document.getElementById("skill-btn-filter-" + lastSkillFilter).click()
}

function toggleSkillPositionDetail(id) {
  var card_body = document.getElementById("card-position-skill-" + id);
  var detail_icon = document.getElementById("skill-card-detail-" + id);
  if (card_body.classList.contains('d-block')) {
    card_body.classList.remove('d-block');
    card_body.classList.add('d-none');
    detail_icon.innerHTML = '<span style="font-size:1.5em" class="fa-angle-right fas"></span>'
  } else {
    card_body.classList.remove('d-none');
    card_body.classList.add('d-block');
    detail_icon.innerHTML = '<span style="font-size:1.5em" class="fa-angle-down fas"></span>'
  }
};

function updateLastSkillFilter(filter) {
  lastSkillFilter = filter;
}


function openDataPrivacy() {
    var cdiv = document.getElementById("data-privacy-overlay");
    cdiv.setAttribute("class","d-block")
}

function closeDataPrivacy() {
    var cdiv = document.getElementById("data-privacy-overlay");
    cdiv.setAttribute("class","d-none")
}
