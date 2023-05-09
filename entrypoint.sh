#!/bin/bash

latex_dir="$1"
latex_filename="$2"
jobname="$3"
outdir="$4"
max_iterations="$5"

pushd "${latex_dir}" || (echo "failed to move to ${latex_dir} with pushd"; exit 1);
if [[ ! -f $latex_filename ]]; then
    echo "${latex_filename} not found" >&2;
    exit 1;
fi

cluttex --max-iterations "${max_iterations}" -e uplatex --jobname "${jobname}" "${latex_filename}"
result=$?
if [[ $result -ne 0 ]]; then
    echo "cluttex failed" >&2;
    exit 1;
fi
popd || (echo "failed to move back with popd"; exit 1);
if [[ ! -d $outdir ]]; then
    mkdir -p "${outdir}";
fi
mv "${latex_dir}/${jobname}.pdf" "${outdir}/";