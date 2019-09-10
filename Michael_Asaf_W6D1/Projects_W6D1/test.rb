root = [0,0]
children = [1, 2], [2, 1]

  parent = [2, 1]
    children = [4, 5], [3, 4]

      parent =[4, 5]
        children = [5, 7], [5, 5]


        parents/moves = [4,5  5, 7]
        que = []
        method_que = que << [4,5].parent