let isEmpty  = function(value){
  
  if(null === value || value == undefined){
    return true;
  }
  
  if(typeof value === 'string' && value.trim() === ''){
    return true;
  }
  
  if(Array.isArray(value) && value.length === 0){
    return true;
  }
  
  return false;
}