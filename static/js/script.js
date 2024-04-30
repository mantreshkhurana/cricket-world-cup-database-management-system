function showTab(tabName) {
    var i, tabContent;
    tabContent = document.getElementsByClassName("tab-content");
    for (i = 0; i < tabContent.length; i++) {
        tabContent[i].style.display = "none";
    }
    document.getElementById(tabName).style.display = "block";
}

function searchPlayers() {
    var input, filter, table, tr, td, i, txtValue;
    var filterType = document.getElementById("playerFilter").value;
    input = document.getElementById("playerSearch");
    filter = input.value.toUpperCase();
    table = document.getElementById("playerTable");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[getIndexByFilterType(filterType)];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

function searchTeams() {
    var input, filter, table, tr, td, i, txtValue;
    var filterType = document.getElementById("teamFilter").value;
    input = document.getElementById("teamSearch");
    filter = input.value.toUpperCase();
    table = document.getElementsByTagName("table")[1]; 
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[getIndexByFilterType(filterType)];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

function searchMatches() {
    var input, filter, table, tr, td, i, txtValue;
    var filterType = document.getElementById("matchFilter").value;
    input = document.getElementById("matchSearch");
    filter = input.value.toUpperCase();
    table = document.getElementsByTagName("table")[2]; 
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[getIndexByFilterType(filterType)];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

function searchUmpires() {
    var input, filter, table, tr, td, i, txtValue;
    var filterType = document.getElementById("umpireFilter").value;
    input = document.getElementById("umpireSearch");
    filter = input.value.toUpperCase();
    table = document.getElementsByTagName("table")[3]; 
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[getIndexByFilterType(filterType)];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

function getIndexByFilterType(filterType) {
    switch (filterType) {
        case 'country':
            return 1; 
        case 'batsmen':
            return 2; 
        case 'bowlers':
            return 3; 
        case 'team1':
            return 1; 
        case 'team2':
            return 2; 
        case 'result':
            return 3; 
        case 'name':
            return 1; 
        case 'matches':
            return 2; 
        default:
            return 1; 
    }
}
