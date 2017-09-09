/// enemy wander
scr_check_for_player();
phy_position_x += sign(targetx - x) * spd ; 
//sign返回的是-1，0，1，这回返回是向右还是向左移动
phy_position_y += sign(targety - y) * spd ; 
//不直接使用obj_player.x作为目标点，而是由外部设定targetx，保持该脚本的独立性