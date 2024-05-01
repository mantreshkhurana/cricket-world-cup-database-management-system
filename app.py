from flask import Flask, jsonify, render_template, request, redirect, url_for
import mysql.connector
import config

app = Flask(__name__)

db = mysql.connector.connect(**config.db_config)

ADMIN_USERNAME = "admin"
ADMIN_PASSWORD = "admin"


@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]
        if username == ADMIN_USERNAME and password == ADMIN_PASSWORD:

            return redirect(url_for("admin"))
        else:

            return render_template("login.html", error="Invalid username or password")
    return render_template("login.html")


@app.route("/admin")
def admin():

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
        "admin.html", players=players, teams=teams, matches=matches, umpires=umpires
    )


@app.route("/edit_player", methods=["POST"])
def edit_player():
    if request.method == "POST":
        player_id = request.form.get("player_id")
        player_name = request.form.get("player_name")
        dob = request.form.get("dob")
        type_of_player = request.form.get("type_of_player")
        total_runs = request.form.get("total_runs")
        t20 = request.form.get("t20")
        test = request.form.get("test")
        odi = request.form.get("odi")
        batting_average = request.form.get("batting_average")
        no_of_sixes = request.form.get("no_of_sixes")
        no_of_fours = request.form.get("no_of_fours")
        economy = request.form.get("economy")
        no_of_wickets = request.form.get("no_of_wickets")
        highest_score = request.form.get("highest_score") 

        cursor = db.cursor()
        try:
            cursor.execute(
                """
                UPDATE player
                SET player_name = %s, dob = %s, type_of_player = %s, total_runs = %s, t20 = %s, test = %s, odi = %s, batting_average = %s, no_of_sixes = %s, no_of_fours = %s, economy = %s, no_of_wickets = %s, highest_run_scored = %s
                WHERE player_id = %s
            """,
                (player_name, dob, type_of_player, total_runs, t20, test, odi, batting_average, no_of_sixes, no_of_fours, economy, no_of_wickets, highest_score, player_id),
            )
            db.commit()
        except mysql.connector.Error as err:
            db.rollback()
        finally:
            cursor.close()

        return redirect(url_for("admin"))


@app.route("/add_player", methods=["POST"])
def add_player():
    if request.method == "POST":
        player_name = request.form.get("player_name")
        dob = request.form.get("dob")
        type_of_player = request.form.get("type_of_player")
        total_runs = request.form.get("total_runs")
        t20 = request.form.get("t20")
        test = request.form.get("test")
        odi = request.form.get("odi")
        batting_average = request.form.get("batting_average")
        no_of_sixes = request.form.get("no_of_sixes")
        no_of_fours = request.form.get("no_of_fours")
        economy = request.form.get("economy")
        no_of_wickets = request.form.get("no_of_wickets")
        highest_score = request.form.get("highest_score")

        cursor = db.cursor()
        cursor.execute("SELECT MAX(player_id) FROM player")
        result = cursor.fetchone()
        max_player_id = result[0]

        next_player_id = int(max_player_id[1:]) + 1

        new_player_id = "P" + str(next_player_id).zfill(3)

        cursor.execute(
            "INSERT INTO player (player_id, player_name, dob, type_of_player, total_runs, t20, test, odi, batting_average, no_of_sixes, no_of_fours, economy, no_of_wickets, highest_run_scored) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
            (new_player_id, player_name, dob, type_of_player, total_runs, t20, test, odi, batting_average, no_of_sixes, no_of_fours, economy, no_of_wickets, highest_score),
        )
        db.commit()

        return redirect(url_for("admin"))


@app.route("/delete_player/<player_id>", methods=["DELETE"])
def delete_player(player_id):
    cursor = db.cursor()
    try:
        cursor.execute("DELETE FROM player WHERE player_id = %s", (player_id,))
        db.commit()
        return "Player deleted successfully", 200
    except mysql.connector.Error as err:
        db.rollback()
        return f"Failed to delete player: {str(err)}", 500
    finally:
        cursor.close()

@app.route("/edit_team", methods=["POST"])
def edit_team():
    if request.method == "POST":

        team_id = request.form.get("team_id")

        return redirect(url_for("admin"))


@app.route("/edit_umpire", methods=["POST"])
def edit_umpire():
    if request.method == "POST":

        umpire_id = request.form.get("umpire_id")

        return redirect(url_for("admin"))


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
