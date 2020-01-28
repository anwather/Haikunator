$adjectiveString = @"
autumn hidden bitter misty silent empty dry dark summer icy delicate quiet white cool spring winter patient twilight dawn crimson wispy weathered blue billowing broken cold damp falling frosty green long late lingering bold little morning muddy old red rough still small sparkling throbbing shy wandering withered wild black young holy solitary fragrant aged snowy proud floral restless divine polished ancient purple lively nameless
"@

$nounString = @"
waterfall river breeze moon rain wind sea morning snow lake sunset pine shadow leaf dawn glitter forest hill cloud meadow sun glade bird brook butterfly bush dew dust field fire flower firefly feather grass haze mountain night pond darkness snowflake silence sound sky shape surf thunder violet water wildflower wave water resonance sun wood dream cherry tree fog frost voice paper frog smoke star
"@

function getNoun($nounString, $index) {
    return $nounString.Split(' ')[$index]
}

function getAdjective($adjectiveString, $index) {
    return $nounString.Split(' ')[$index]
}

function randomIndex {
    $value = Get-Random -Minimum 1 -Maximum 57
    return $value
}

function token($range) {
    $value = Get-Random -Maximum $range
    return $value
}

function Haikunate {
    <#
.SYNOPSIS
Generate Heroku-like memorable random names to use in your apps or anywhere else. Based on https://github.com/usmanbashir/haikunator

.EXAMPLE
C:>Haikunate
sun-cloud-1944
#>
    Param ([string]$Delimeter = '-', [int]$TokenRange = 9999)
    $noun = getNoun -nounString $nounString -index (randomIndex)
    $adjective = getAdjective -adjectiveString $adjectiveString -index (randomIndex)
    $token = token -range $TokenRange
    $string = "{0}{2}{1}{2}{3}" -f $noun, $adjective, $Delimeter, $token
    return $string
}



