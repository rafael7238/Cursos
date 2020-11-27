import React,{useEffect,useState} from 'react'
import Tmbd from './Tmdb'
import MovieRow from 

export default() =>{


  const[movieList,setMovieList] = useState([]);

  useEffect(()=>{
const loadAll = async() =>{
//Pegando a lista total
let list = await Tmbd.getHomeList();
setMovieList(list);
}
loadAll();
  });

  return(
<div className='page'>
  <section className='list'>
    {movieList.map((item,key)=>(
<div>{item.title}</div>
    ))}

  </section>

</div>
//  Header
//Destaque
//As Listas
//Rodapé
  );
}