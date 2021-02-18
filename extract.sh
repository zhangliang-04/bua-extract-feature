# python -u  extract_features_faster.py --mode caffe \
#          --num-cpus 8 --gpu '0' \
#          --extract-mode 'roi_feats' \
#          --config-file configs/bua-caffe/extract-bua-caffe-r101.yaml \
#          --image-dir <image_dir> --bbox-dir <pre_compute_bbox_dir> --out-dir <output_dir>  --resume 



# info = {
#     'image_id': im_file.split('.')[0],
#     'image_h': np.size(im, 0),
#     'image_w': np.size(im, 1),
#     'num_boxes': len(keep_boxes),
#     'objects_id': image_objects,
#     'objects_conf': image_objects_conf
#     }

# np.savez_compressed(x=image_feat, 
#                     bbox=image_bboxes, 
#                     num_bbox=len(keep_boxes), 
#                     image_h=np.size(im, 0), 
#                     image_w=np.size(im, 1), 
#                     info=info)



python -u extract_features_faster.py --mode caffe \
         --num-cpus 32 --gpu '2,5,7' \
         --config-file configs/bua-caffe/extract-bua-caffe-r152.yaml \
         --image-dir '/data7/syq/multi30k/flickr30k_images' --bbox-dir test_extract/bbox --resume \
         --out-dir '/data8/zl/multi30k/bua_feature_with_softlabels'
         #--out-dir '/data8/zl/multi30k/bbox_bua_feature' 