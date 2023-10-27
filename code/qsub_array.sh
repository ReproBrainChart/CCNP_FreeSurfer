#!/bin/bash
#$ -S /bin/bash
#$ -l h_vmem=8G
#$ -l h_rt=16:00:00
#$ -N fstabulate
#$ -cwd
#$ -tc 100
#$ -t 1-195
#$ -e /cbica/projects/RBC/freesurfer_stats/CCNP/fs-tabulate/analysis/logs
#$ -o /cbica/projects/RBC/freesurfer_stats/CCNP/fs-tabulate/analysis/logs
dssource=ria+file:///cbica/projects/RBC/freesurfer_stats/CCNP/fs-tabulate/input_ria#76b9b53e-1ea6-465c-97c0-5c518c0e83fb
pushgitremote=/cbica/projects/RBC/freesurfer_stats/CCNP/fs-tabulate/output_ria/76b/9b53e-1ea6-465c-97c0-5c518c0e83fb
export DSLOCKFILE=/cbica/projects/RBC/freesurfer_stats/CCNP/fs-tabulate/analysis/.SGE_datalad_lock

MAXWAIT=2700
sleeptime=$((RANDOM % MAXWAIT))
echo Sleeping for ${sleeptime}
sleep ${sleeptime}

batch_file_name=subject_ids.txt
subid=$(head -n ${SGE_TASK_ID} ${PWD}/code/${batch_file_name} | tail -n 1)
bash ${PWD}/code/participant_job.sh ${dssource} ${pushgitremote} ${subid}
