
Dataset description:
This dataset is what we used in paper <<Geography and similarity of regional cuisines in China>>. 
The raw dataset is crawled in April 2012 from http://www.meishij.net/, which categorizes all recipes into 20 regional cuisines.
The dataset we shared is the cleaned dataset.


1) component_id.txt:
<ingredient_id, ingredient_name>
Note: This ingredient id is unified in all regional cuisines.

2) floder "recipe_id": Each file contains the recipe information of certain regional cuisine. 
<recipe_id, recipe_name(url_id).txt>

Note: This recipe_id is the id in the certain regional cuisines. It means that all regional cuisines will
have its id==0/1/2/3 recipe. 

3) folder "cuisine_recipe_ingredient": Each file contains the recipe and ingredient information of ceartin regional cuisine.
<recipe_id, ingredient_id>

4) folder "zuofa": Each file contains the cooking methods of recipes in ceartin regional cuisine.


Note: 
1) The name of file in the three folders describes the name of regional cuisine. 
2) Some information, like recipe_name, ingredient_name, cooking methods are all in Chinese.

Please cite Yu-Xiao Zhu, Junming Huang, Zi-Ke Zhang, Qian-Ming Zhang, Tao Zhou, Yong-Yeol Ahn, Geography and similarity of regional cuisines in China,
(2013), arxiv:1307.3185 if you use our dataset. Thanks.


Updated by Yuxiao Zhu, 7/31/2013
