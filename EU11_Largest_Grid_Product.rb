#Problem: Only considering from row 2 to row 18... or just reject returned arrays under length 4 

class GridProduct
  #create an array to hold maximums generated for each direction 
@@maximums = []

#Find the diagonal line of 4 that multiplies out to the highest product

  def diagonals(arr)
    
    #define slices of array where diagonal lines can be drawn 
    slices = [arr[23..36],arr[43..56],arr[63..76],arr[83..96],arr[103..116],arr[123..136],arr[143..156],arr[163..176]]
    
    #define holders for results  
    diagonal_ans = []
    helper_hash = {}

    slices.map do |slice|
      for i in slice
        #make two sets of diagonals for each index currently selected
        #because the number of elements in each diagonal is 4, so there is no center element
        key_num1 = (arr[i-19]*arr[i]*arr[i+21]*arr[i+42])
        key_num2 = (arr[i-38]*arr[i-19]*arr[i]*arr[i+21])
        val_arr1 = [arr[i-19],arr[i],arr[i+21],arr[i+42]]
        val_arr2 = [arr[i-38],arr[i-19],arr[i],arr[i+21]]
        
        #retain the larger of the two possible diagonals for a given element 
        key_num1 > key_num2 ? helper_hash[key_num1] = val_arr1 : helper_hash[key_num2] = val_arr2
      
      end
      diagonal_ans = helper_hash.max_by{|k,v| v}
      end
      @@maximums << diagonal_ans
      puts "Diagonal max is"
      p diagonal_ans

  end

#Find the vertical line of 4 that multiplies out to the highest product 

    def verticals(arr)
      #You can cull vertical lines going from top to bottom from all but the last 4 lines
      #so lines 1-16 = array elements from index 0 to 319 
      slice = arr[0..319]

      #define holders for results 
      vertical_ans = []
      helper_hash = {}

      for i in slice
        key_num = (arr[i]*arr[i+20]*arr[i+40]*arr[i+60])
        val_arr = [arr[i],arr[i+20],arr[i+40],arr[i+60]]

        helper_hash[key_num] = val_arr

      end

      vertical_ans = helper_hash.max_by{|k,v| v}
      @@maximums << vertical_ans
      puts "Vertical max is"
      p vertical_ans

    end

#Find the horizontal line of 4 that multiplies out to the largest product 

     def horizontals(arr)
      #You can cull vertical lines going from top to bottom from all but the last 4 lines
      #so lines 1-16 = array elements from index 0 to 319 
      slices = [arr[0..15],arr[20..35],arr[40..55],arr[60..75],arr[80..95],arr[100..115],arr[120..135],arr[140..155],arr[160..175],arr[180..185],arr[200..215],arr[0..15],arr[300..315],arr[320..335],arr[340..355],arr[360..375],arr[38..395]]

      #define holders for results 
      horizontal_ans = []
      helper_hash = {}
      slices.map do |slice|
        for i in slice
          key_num = (arr[i]*arr[i+1]*arr[i+2]*arr[i+3])
          val_arr = [arr[i],arr[i+1],arr[i+2],arr[i+3]]

          helper_hash[key_num] = val_arr

        end

      horizontal_ans = helper_hash.max_by{|k,v| v}
      end
      @@maximums << horizontal_ans
      puts "Horizontal max is"
      p horizontal_ans
  end 

#run the program and return the overall maximum product of 4 elements in a line

  def run(arr)
    self.diagonals(arr)
    self.verticals(arr)
    self.horizontals(arr)
    puts "Overall max is"
    p @@maximums.max
  end 

end 





#process the given 20x20 grid into an array accepted by Ruby 

arr = "08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08
49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00
81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65
52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91
22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80
24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50
32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70
67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21
24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72
21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95
78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92
16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57
86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58
19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40
04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66
88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69
04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36
20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16
20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54
01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48".split(" ").map{|num| num.gsub(/[0*]/, 0 => "")}.map{|num| num.to_i}

#run the program 

grid = GridProduct.new
grid.run(arr)