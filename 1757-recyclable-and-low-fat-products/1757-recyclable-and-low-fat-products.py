import pandas as pd

def find_products(products: pd.DataFrame) -> pd.DataFrame:
    result = products.loc[[(products.low_fats == 'Y') & (products.recyclable == 'Y')]]
    print(result[['product_id']])



