import pandas as pd

df = pd.read_csv("figure 3 data.csv")
df.head()

import matplotlib.pyplot as plt

plt.figure(figsize=(10,6))

for business in df["kind_of_business"].unique():
    subset = df[df["kind_of_business"] == business]
    plt.plot(
        subset["sales_year"],
        subset["sales"],
        marker='o',
        label=business
    )

plt.xlabel("Year")
plt.ylabel("Total Sales")
plt.title("Yearly Sales Comparison by Retail Business Type")
plt.legend()

plt.show()
