class CashRegister
    attr_accessor :discount, :items, :total, :last_item

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.items.fill(title, self.items.size, quantity)
        self.last_item = [price, quantity]
        self.total = self.total + price * quantity
    end

    def apply_discount
        if discount != 0
            self.total = self.total - (self.total * discount / 100)
            "After the discount, the total comes to $#{self.total}."
        else "There is no discount to apply."
        end
    end

    def void_last_transaction
        price = self.last_item[0]
        quantity = self.last_item[-1]
        self.items.pop(quantity)
        self.total = self.total - price * quantity
    end
end