import pandas as pd

def find_products(products: pd.DataFrame) -> pd.DataFrame:
    result = products.query("(low_fats == 'Y') and (recyclable == 'Y')")
    return result[['product_id']]
