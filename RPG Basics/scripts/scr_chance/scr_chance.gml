/// scr_chance(percentage)

var percent = argument[0]; //between 0 and 1 
percent = clamp(percent, 0, 1);//限制输入区间为0待1，包含区间端点，超过1为1，小于0为0
return  (random(1) < percent) ;//输入0.5，则有50%几率返回true
