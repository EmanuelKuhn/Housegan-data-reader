RPLAN_PATH = "rplan_dataset/floorplan_dataset"

rplan_ids, = glob_wildcards("rplan_dataset/floorplan_dataset/{rplan_id}.png")

rplan_ids = rplan_ids[:20000]

rule all:
    input:
        expand("rplan_json/{rplan_id}.json", rplan_id=rplan_ids)

rule to_json:
    input:
        "rplan_dataset/floorplan_dataset/{rplan_id}.png"
    output:
        "rplan_json/{rplan_id}.json"
    shell:
        "python raster_to_json.py --path {input}"
