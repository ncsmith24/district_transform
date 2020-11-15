=begin
Read the raw json file

Parse the JSON

assign every county their appropriate ARES district

Group by district attribute

New object (based on grouping) 
	Takes all the points inside the district coordinate group
	
Look for duplicate arrays
	(remove extras if exists)

Final GEOJSON object 
=end
	
require 'json'

geojson_raw = File.read("./ODOT_County_Boundaries.geojson")
geojson = JSON.parse(geojson_raw)

COUNTY_NAMES_TO_DISTRICTS = {
    "LUC" => 1,
    "WOO" => 1,
    "HAN" => 1,
    "HAR" => 1,
    "OTT" => 1,
    "SAN" => 1,
    "SEN" => 1,
    "WYA" => 1,
    "ERI" => 1,
    "HUR" => 1,
    "WIL" => 2,
    "DEF" => 2,
    "PAU" => 2,
    "VAN" => 2,
    "MER" => 2,
    "FUL" => 2,
    "HEN" => 2,
    "PUT" => 2,
    "ALL" => 2,
    "AUG" => 2,
    "DAR" => 3,
    "PRE" => 3,
    "SHE" => 3,
    "MIA" => 3,
    "MOT" => 3,
    "LOG" => 3,
    "CHP" => 3,
    "CLA" => 3,
    "GRE" => 3,
    "BUT" => 4,
    "HAM" => 4,
    "WAR" => 4,
    "CLE" => 4,
    "CLI" => 4,
    "BRO" => 4,
    "HIG" => 4,
    "ADA" => 4,
    "SUM" => 5,
    "STA" => 5,
    "CAR" => 5,
    "POR" => 5,
    "TRU" => 5,
    "MAH" => 5,
    "COL" => 5,
    "CRA" => 6,
    "RIC" => 6,
    "MRW" => 6,
    "ASD" => 6,
    "WAY" => 6,
    "HOL" => 6,
    "MAR" => 7,
    "UNI" => 7,
    "MAD" => 7,
    "FAY" => 7,
    "DEL" => 7,
    "FRA" => 7,
    "PIC" => 7,
    "KNO" => 7,
    "LIC" => 7,
    "FAI" => 7,
    "ROS" => 8,
    "PIK" => 8,
    "SCI" => 8,
    "HOC" => 8,
    "VIN" => 8,
    "JAC" => 8,
    "LAW" => 8,
    "PER" => 8,
    "ATH" => 8,
    "MEG" => 8,
    "GAL" => 8,
    "COS" => 9,
    "MUS" => 9,
    "MRG" => 9,
    "TUS" => 9,
    "GUE" => 9,
    "NOB" => 9,
    "WAS" => 9,
    "HAS" => 9,
    "BEL" => 9,
    "MOE" => 9,
    "JEF" => 9,
    "LOR" => 10,
    "CUY" => 10,
    "MED" => 10,
    "LAK" => 10,
    "GEA" => 10,
    "ASB" => 10,
}

counties = geojson["features"]

# assign every county their appropriate ARES district

# Array#group_by
pp counties.first

district_counties = [{}]
geojson_district_counties = {
    "type": "FeatureCollection",
    "name": "ARES_District_Boundaries",
    "crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
    "features": district_counties
}
File.write("./ARES_District_Boundaries.geojson", geojson_district_counties.to_json)