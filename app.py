from flask import Flask, render_template, request, redirect, url_for
import mysql.connector
import config

app = Flask(__name__)

db = mysql.connector.connect(**config.db_config)


@app.route("/login")
def login():
    return render_template("login.html")


@app.route("/")
def index():
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM player")
    players = cursor.fetchall()

    cursor.execute("SELECT * FROM team")
    teams = cursor.fetchall()

    cursor.execute("SELECT * FROM matches")
    matches = cursor.fetchall()

    cursor.execute("SELECT * FROM umpire")
    umpires = cursor.fetchall()

    return render_template(
        "index.html", players=players, teams=teams, matches=matches, umpires=umpires
    )


@app.route("/player/<player_id>")
def player(player_id):
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM player WHERE player_id = %s", (player_id,))
    player = cursor.fetchone()

    return render_template("player.html", player=player)

@app.route("/team/<team_id>")
def team(team_id):
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM team WHERE team_id = %s", (team_id,))
    team = cursor.fetchone()

    return render_template("team.html", team=team)

@app.route("/match/<match_id>")
def match(match_id):
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM matches WHERE match_id = %s", (match_id,))
    match = cursor.fetchone()

    return render_template("match.html", match=match)

@app.route("/umpire/<umpire_id>")
def umpire(umpire_id):
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM umpire WHERE umpire_id = %s", (umpire_id,))
    umpire = cursor.fetchone()

    return render_template("umpire.html", umpire=umpire)


if __name__ == "__main__":
    app.run(debug=True)
