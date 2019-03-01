# used ruby
$answer = []

def rank(n)

 case n
 when 0 then [[]]
 when 1 then [[[0,0]]]
 else        new_function(rank(n-1))
 end

end

def new_function(answer_array)
  answer_array.each{|i| function_x(i) } 
  $answer.uniq 
end

def function_x(shape)
                                                    
  shape.each{|x,y|
       neighbors(x,y).each{|new_square|
        if !shape.include?(new_square)
         $answer <<  shape + [new_square]
        end          
       }
  }  
end

# the neighbors' squares that are touching the square that was choosen 
def neighbors(x,y)
 [[x - 1, y], [x + 1, y], [x, y - 1], [x, y + 1]]
end

def create_poly(n)
  rank(n)
  answer2 = []
  $answer.each{|shape|
    if shape.length == n
      answer2 << shape
    end
  }

   remove_copy(answer2).sort.each{|poly| puts text_representation(poly),""} 
   
end


def text_representation(poly)
  table = Hash.new(' ')
  poly.each{|x,y| table[[x,y]] = '#'}
  maxx = poly.map(&:first).max
  maxy = poly.map(&:last).max
  minx = poly.map(&:first).min
  miny = poly.map(&:last).min
  (minx..maxx).map{|x| (miny..maxy).map{|y| table[[x,y]]}.join}
end



def remove_copy(ans)
  answer3 = []
  answer4 = []
    ans.each{|shape| 
      shape.each{|x,y| answer4 << x }
    }
  min_x = answer4.min
    

  ans.each{|shape|
     new_shape = []
     minx2 = shape.map(&:first).min
     shape.each{|x,y|
      
      new_shape << [x - (minx2 - min_x), y] } 
     
     answer3 << new_shape 
  }
 
#y 
  answer7 = []
  answer8 = []
    ans.each{|shape| 
      shape.each{|x,y| answer8 << y }
    }
    
  min_y = answer8.min
    

  answer3.each{|shape|
     new_shape = []
     miny2 = shape.map(&:last).min
     shape.each{|x,y|
      
      new_shape << [x , y - (miny2 - min_y)] } 
     
     answer7 << new_shape 
  }
   

    answer6 = answer7.map{|shape| shape.sort} 
     
    answer6 = answer6.uniq

   puts "length #{answer6.length}"

    return answer6
    
 end

create_poly(4)
