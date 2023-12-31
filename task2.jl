#Робот - в произвольной клетке поля (без внутренних перегородок и маркеров)
#Робот - в исходном положении, и все клетки по периметру внешней рамки промакированы
function mark_frame_perimetr!(r::Robot)
    num_vert = moves!(r, Sud)
    num_hor = moves!(r, West)
    #Робот - в Юго-Западном углу

    for Side in (Nord, Ost, Sud, West)
        putmarkers!(r, Side)
    end
    #По всему периметру стоят маркеры

    moves!(r, Nord, num_vert)
    moves!(r, Ost, num_hor)
    #Робот - в исходном положении
end
function moves!(r::Robot, side::HorizonSide)
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
    end
    return num_steps
end

function moves!(r::Robot,side::HorizonSide,num_steps::Int)
    for _ in 1:numsteps 
        move!(r,side)
    end
end
function putmarkers!(r::Robot, side::HorizonSide)
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end
end