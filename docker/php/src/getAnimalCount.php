<?php
//These are the defined authentication environment in the db service

// The MySQL service named in the docker-compose.yml.
$host = 'db';
// Database use name
$user = 'rootD3nkQxZnG';
//database user password
$pass = '862cMuAkp3u3ZHKc';
//database name
$dbname = "animalTinder";

// check the MySQL connection status
$conn = new mysqli($host, $user, $pass, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// echo "Connected to MySQL server successfully!";

$kingdomParameter = $_GET['kingdom'];
$environmentParameter = $_GET['environment'];
$kindParameter = $_GET['kind'];
$genderParameter = $_GET['gender'];
$ageParameter = $_GET['age'];

//convertParameter($kindParameter);
//convertParameter($genderParameter);


$sql = "SELECT a.animalId FROM animals as a, province as p where a.provinceId = p.provinceId AND a.taken = 0 ";
$sql .= "AND p.provinceName = '".$kingdomParameter."' ";
$sql .= "AND a.environment IN (".convertParameter($environmentParameter).") ";
$sql .= "AND a.breed IN (".convertParameter($kindParameter).") ";
$sql .= "AND a.sex IN (".convertParameter($genderParameter).") ";
$sql .= "AND a.age between 0 AND ".$ageParameter.";";


$result = $conn->query($sql);


$rows = array();
while($r = mysqli_fetch_assoc($result)) {
    $rows[] = $r;
}
print json_encode($rows);


function convertParameter($parameter){
    $explodeParameter = explode(',', $parameter);
    $correctName = '';

    for($i=0;$i<count($explodeParameter);$i++){
        if($i != count($explodeParameter) - 1)
            $correctName .= "'" . $explodeParameter[$i] . "',";
        else
            $correctName .= "'" . $explodeParameter[$i] . "'";
    }
    return $correctName;
}


$conn->close();
?>