# Робот находится в произвольной клетке ограниченного прямоугольного поля без внутренних перегородок и маркеров.
# Робот — в исходном положении в центре прямого креста из маркеров, расставленных вплоть до внешней рамки.
function mark_kross!(r::Robot) # - главная функция  
    for side in (Nord,West,Sud,Ost) 
        putmarkers!(r,side)
        move_by_markers(r,inverse(side))
    end
    putmarker!(r)
end

# Всюду в заданном направлении ставит маркеры вплоть до перегородки
putmarkers!(r::Robot,side::HorizonSide) = 
    while isborder(r,side)==false 
        move!(r,side)
        putmarker!(r)
    end

# Перемещает робота в заданном направлении пока, пока он находится в клетке с маркером 
move_by_markers(r::Robot,side::HorizonSide) = 
    while ismarker(r)==true 
        move!(r,side) 
    end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4)) 