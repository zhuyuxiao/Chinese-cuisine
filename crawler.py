
import requests
from lxml import html

'''
1) fench all recipes urls for each cuisine
2) fench all ingredients for each recipe
3) write all results for each cuisine
Input: String cuisineName, String cuisineUrl, int pageNum
OutPut: txt
'''
def getRecipes(cuisineName, cuisineUrl, pageNum):
    resFile = cuisineName + ".txt"
    f = open(resFile, "w")
    for i in range(1, pageNum + 1):
        url = cuisineUrl + "/" + "?&page=" + str(i)
        page = requests.Session().get(url)
        tree = html.fromstring(page.text)
        recipeName = tree.xpath('//div[contains(@class, "listtyle1_list clearfix")]/div/a/@title')
        recipeUrl = tree.xpath('//div[contains(@class, "listtyle1_list clearfix")]/div/a/@href')
        for i in range(len(recipeName)):
            name = recipeName[i]
            url = recipeUrl[i]
            [ing, value] = getIngredients(url)
            f.write( ",".join([name] + ing + value ) )
            f.write("\n") #
    f.close()

'''
fench ingredients and its value for each recipe
Input: String recipeUrl
Output: [ingredient, value]
'''
def getIngredients(recipeUrl): 
    page=requests.Session().get(recipeUrl)
    tree=html.fromstring(page.text)
    ingredient = tree.xpath('//div[contains(@class, "yl zl clearfix")]/ul/li//h4/a/text()') 
    value = tree.xpath('//div[contains(@class, "yl zl clearfix")]/ul/li//h4/span/text()')
    ingredient += tree.xpath('//div[contains(@class, "yl fuliao clearfix")]/ul/li//h4/a/text()') 
    value += tree.xpath('//div[contains(@class, "yl fuliao clearfix")]/ul/li/span/text()')
    return [ingredient, value]

if __name__ == '__main__':
    cuisine = {"chuancai":56,"xiangcai":14,"yuecai":24,"dongbeicai":11,"lucai":21,"zhecai":11,"sucai":15,"qingzhencai":5,"mincai":17,"hucai":13,"jingcai":12,"hubeicai":7,"huicai":7,"yucai":5,"xibeicai":9,"yunguicai":5,"jiangxicai":3,"shanxicai":6,"guangxicai":1,"gangtaicai":4,"other":56}
    baseurl = "https://www.meishij.net/china-food/caixi"
    for (name, page) in cuisine.items():
        url = baseurl + "/" + name
        getRecipes(name, url, page)



