function task_16(r::Robot)
    path = go_to_west_south_corner_and_return_path!(r; go_around_barriers = true)

    side = Ost
    while !isborder(r,Nord)
        go_to_border_and_return_path!(r, side; markers = true, go_around_barriers = true)
        side = inverse_side(side)
        go!(r, Nord)
    end

    go_to_border_and_return_path!(r, side; markers = true, go_around_barriers = true)

    go_to_west_south_corner_and_return_path!(r, go_around_barriers = true)
    go_by_path!(r, path)
end