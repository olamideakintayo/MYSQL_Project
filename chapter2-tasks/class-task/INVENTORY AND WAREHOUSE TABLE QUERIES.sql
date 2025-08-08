-- 2.40 --
SELECT 
    Inventory.SKU,
    Inventory.SKU_Description, 
    Warehouse.WarehouseID, 
    Warehouse.WarehouseCity, 
    Warehouse.WarehouseState
FROM 
    Inventory, Warehouse
WHERE 
    Inventory.WarehouseID = Warehouse.WarehouseID
    AND (
        Warehouse.WarehouseCity = 'Atlanta'
        OR Warehouse.WarehouseCity = 'Bangor'
        OR Warehouse.WarehouseCity = 'Chicago'
    );

-- 2.41 ---
