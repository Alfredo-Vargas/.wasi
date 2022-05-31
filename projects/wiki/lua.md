# Comment in lua
```lua
    -- one-line comment
    --[[
        multi-line comment
    --]]
```
# Variables and flow control
    1. All numbers are doubles
    2. Multi-line strings can be declared using  double brackets:
    ```lua
        u = [[ here your multi-line string ]]
    ```
    3. To undefine a variable (Lua has garbage collection):
    ```lua
        t = nil
    ```
    4. Lua has no ++ or += type operations, just use:
    ```lua
        x = x + 1
    ```
    5. The not equal operator is: ` 1 ~= 2`{:.lua}
    6. The stdout and stdin functions are respectively:
    ```lua
        io.write("hello world!\n")
        local line = io.read()
    ```
    7. String concatenation uses .. operator:
    ```lua
        print('Winter is comming, ' .. line)
    ```
    8. The for range includes both ends:
    ```lua
        for i = 1, 100 do
            sum = sum + i
        end
    ```
# Metatables and metamethods
    A table can have a metatable that gives the table operator-overloadish behaviour
    ```lua
        f1 = {a = 1, b = 2}     -- represents fraction a/b
        f2 = {a = 2, b = 3}
        -- s = f1 + f2 -- will fail

        metafraction = {}
        function metafraction.__add(f1, f2)
            sum = {}
            sum.b = f1.b * f2.b
            sum.a = f1.a * f2.b + f2.a * f1.b
            return sum
        end

        setmetatable(f1, metafraction)
        setmetatable(f2, metafraction)

        s = f1 + f2     -- this call will use __add(f1, f2) on the above metatable
    ```

