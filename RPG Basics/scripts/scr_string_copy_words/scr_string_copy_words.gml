/// scr_string_copy_words( string, index, count);
var  str = argument0; 
var  index = argument1;
var  count = ceil(argument2);

var char = string_char_at(str, count);
while ( char != " " and char != ""){
  //如果得到的字符不为空，或者无
  count++;
  char = string_char_at(str,count);
  //返回str字符串在count位置的字符,注意索引是从1开始的
  //string_char_at("Hello", 2)返回的是字符“e"
  
}

var return_str = string_copy(str,index,count);
// 从str字符串从截取从index到count的片段，如从1到5，截取前5个字符
return return_str;
