-- 2.17 ---
SELECT SKU, SKU_Description
FROM INVENTORY;

-- 2.18 ---
SELECT SKU_Description, SKU
FROM INVENTORY;

-- 2.19 ---
SELECT WarehouseID
fROM INVENTORY;

-- 2.20 ---
SELECT DISTINCT WarehouseID
FROM INVENTORY;

-- 2.21 ---
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand, QuantityOnOrder
FROM INVENTORY;

-- 2.22 ---
SELECT *
FROM INVENTORY;

-- 2.23 ---
SELECT *
FROM INVENTORY
WHERE QuantityOnHand > 0;

-- 2.24 ---
SELECT SKU, SKU_Description
FROM INVENTORY
WHERE QuantityOnHand = 0;


-- 2.25 ---
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0
ORDER BY WarehouseID ASC;

-- 2.26 ---
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand > 0
ORDER BY WarehouseID DESC, SKU ASC;

-- 2.27 ---
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0
  AND QuantityOnOrder > 0
ORDER BY WarehouseID DESC, SKU ASC;

-- 2.28 ---
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0
	AND QuantityOnOrder = 0
Order BY WarehouseID DESC, SKU ASC;

-- 2.29 ---
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM INVENTORY
WHERE QuantityOnHand > 1
  AND QuantityOnHand < 10;

-- 2.30 ---
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM INVENTORY
WHERE QuantityOnHand BETWEEN 2 AND 9;

-- 2.31 ---
SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE 'Half-Dome%';

-- 2.32 ---
SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE '%Climb%';

-- 2.33 ---
SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE '__d%';

-- 2.34 ---
SELECT 
    COUNT(QuantityOnHand) AS TotalRows,
    SUM(QuantityOnHand)   AS TotalQuantity,
    AVG(QuantityOnHand)   AS AverageQuantity,
    MIN(QuantityOnHand)   AS MinimumQuantity,
    MAX(QuantityOnHand)   AS MaximumQuantity
FROM INVENTORY;

-- 2.35 ---
-- The differences is that: 
-- COUNT
-- Counts the number of rows that meet a condition.
-- When used on a column, it ignores rows where that column is `NULL`.
-- It’s used to find “how many” items, records, or entries exist.

-- WHILE

-- SUM
-- Adds up all numeric values in a column or expression.
-- It ignores `NULL` values and only sums actual numbers.
-- It’s used to find “how much” in total for a set of records.

-- 2.36 ---
SELECT WarehouseID,
       SUM(QuantityOnHand) AS TotalItemsOnHand
FROM INVENTORY
GROUP BY WarehouseID
ORDER BY TotalItemsOnHand DESC;

-- 2.37 ---
SELECT WarehouseID,
       SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
ORDER BY TotalItemsOnHandLT3 DESC;


-- 2.38 ---
SELECT WarehouseID,
       SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
HAVING COUNT(SKU) < 2
ORDER BY TotalItemsOnHandLT3 DESC;

-- 2.39  ---
-- WHERE
-- Happens before the data is grouped.
-- It decides which rows even make it into the group.
-- Think of it like picking which cards to keep before sorting them into piles.

-- HAVING
-- Happens after the data is grouped.
-- It decides which groups to keep based on the totals or averages.
-- Think of it like looking at each pile and throwing away the ones that are too small or too big.

-- In 2.38  exercise:
-- WHERE** removes SKUs with `QuantityOnHand >= 3` before grouping by warehouse.
-- HAVING** then removes warehouses that don’t meet the “fewer than two SKUs” rule after the grouping is done.


