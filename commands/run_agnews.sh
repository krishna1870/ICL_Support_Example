echo "CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES"
diversity_score_scale=4
ptm_name="mistralai/Mistral-7B-Instruct-v0.1"

for template_idx in 0 1 2 3
do
for method in direct
do
for direct_plus in 0 1
do


task=agnews \
template_idx=$template_idx \
method=$method \
progressive_p=3 \
initial_indication_set_size=4 \
CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES \
ptm_name=$ptm_name \
final_candidate_size=50 \
label_balance=1 \
candidate_example_num_total=-1 \
candidate_example_num_every_label=3 \
direct_plus=$direct_plus \
diversity_score_scale=$diversity_score_scale \
bash commands/run_filter_and_search.sh

done
done
done
done
