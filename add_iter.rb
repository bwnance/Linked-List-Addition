#node class
class Node
    attr_accessor :val, :next
    def initialize(val = nil)
        @val = val
        @next = nil
    end
end

def add(h1, h2)
    current = Node.new()
    parent = nil
    head = current
    remainder = 0
    while(h1 || h2)
        h1_val = h1 ? h1.val : 0
        h2_val = h2 ? h2.val : 0
        sum = h1_val + h2_val + remainder
        if sum >= 10
            remainder = sum / 10
            sum = sum - 10
        else
            remainder = 0
        end
        h1 = h1 ? h1.next : nil
        h2 = h2 ? h2.next : nil
        current.val = sum
        parent = current
        current.next = Node.new()
        current = current.next
    end
    # copy_nodes!(h1, parent) if(h1)
    # copy_nodes!(h2, parent) if(h2)
    if remainder != 0
        current.val = remainder
        
    else
        parent.next = nil;
    end
    head
end

#helpers for making linked lists, etc
def linked_list_from_num(n)
    current = Node.new()
    head = current
    parent = nil
    n.digits.each do |d|
        current.val = d 
        parent = current
        current.next = Node.new()
        current = current.next
    end
    parent.next = nil
    head
end
def num_from_linked_list(head)
    res_node = head
    result = []
    while res_node
        result << res_node.val
        res_node = res_node.next
    end
    result.reverse().join().to_i
end




n1 = 99999
n2 = 111
h1 = linked_list_from_num(n1)
h2 = linked_list_from_num(n2)
result = num_from_linked_list(add(h1, h2))
result


