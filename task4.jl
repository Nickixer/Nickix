
function begin!(r)
    for side in (West,Sud)
        while !isborder(r,side)
            move!(r,side)
        end
    end
end

function step(r)
    num = 0
    begin!(r)
    while !isborder(r,Ost)
        move!(r,Ost)
        num+=1
    end
    return num
    begin!(r)
end

function craska!(r)
    a = step(r)
    begin!(r)
    while a!=0
        for _ in 1:a
            putmarker!(r)
            move!(r,Ost)
        end
        putmarker!(r)
        a = a - 2
        move!(r,Nord)
        while !isborder(r,West)
            move!(r,West)
        end
    end
end





            





    
