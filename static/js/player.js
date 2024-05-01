function editPlayer(playerId, playerName, dob, typeOfPlayer, totalRuns, t20, test, odi, battingAverage, noOfSixes, noOfFours, economy, noOfWickets, highestRunScored) {
    document.getElementById("edit-player-id").value = playerId;
    document.getElementById("edit-player-name").value = playerName;
    document.getElementById("edit-player-dob").value = dob;
    document.getElementById("edit-player-type").value = typeOfPlayer;
    document.getElementById("edit-player-total-runs").value = totalRuns;
    document.getElementById("edit-player-t20").value = t20;
    document.getElementById("edit-player-test").value = test;
    document.getElementById("edit-player-odi").value = odi;
    document.getElementById("edit-player-batting-average").value = battingAverage;
    document.getElementById("edit-player-no-of-sixes").value = noOfSixes;
    document.getElementById("edit-player-no-of-fours").value = noOfFours;
    document.getElementById("edit-player-economy").value = economy;
    document.getElementById("edit-player-no-of-wickets").value = noOfWickets;
    document.getElementById("edit-player-highest-run-scored").value = highestRunScored;
}


function deletePlayer(playerId) {
if (confirm("Are you sure you want to delete this player?")) {
    fetch(`/delete_player/${playerId}`, {
        method: 'DELETE',
    })
    .then(response => {
        if (response.ok) {
            location.reload();
        } else {
            throw new Error('Failed to delete player');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Failed to delete player');
    });
}
}