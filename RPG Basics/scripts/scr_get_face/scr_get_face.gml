/// get face
face = round( dir/90 ); 
//四舍五入到最近的整数值，特殊的.5约成最近偶数，2.5约为2，3.5约为4 
if (face  == 4 ){
	//特殊的360=0
	face = RIGHT;
}