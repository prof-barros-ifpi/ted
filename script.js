// Dados simples (poderia vir de um JSON/API futuramente)
[{ id:8, titulo:"Clássicos Pulp #3", autor:"H. Cardoso", preco:34.90, categoria:"Clássico", capa:"https://picsum.photos/seed/hq8/400/560" }];


const grid = document.getElementById('grid');
const search = document.getElementById('search');
const categoria = document.getElementById('categoria');
const cartCount = document.getElementById('cart-count');


let carrinho = 0;


function cardHTML(p){
return `
<article class="card" data-categoria="${p.categoria}" data-preco="${p.preco}">
<img src="${p.capa}" alt="Capa HQ: ${p.titulo}" />
<h4>${p.titulo}</h4>
<p class="autor">${p.autor}</p>
<p class="preco">R$ ${p.preco.toFixed(2)}</p>
<button class="btn" data-id="${p.id}">Adicionar ao carrinho</button>
</article>`;
}


function render(lista){
grid.innerHTML = lista.map(cardHTML).join('');
}


function filtrar(){
const q = (search.value || '').toLowerCase();
const cat = categoria.value;
const out = produtos.filter(p => {
const texto = (p.titulo + ' ' + p.autor).toLowerCase();
const okBusca = !q || texto.includes(q);
const okCat = !cat || p.categoria === cat;
return okBusca && okCat;
});
render(out);
}


function addEventos(){
grid.addEventListener('click', (e)=>{
const btn = e.target.closest('button.btn');
if(!btn) return;
carrinho++;
cartCount.textContent = carrinho;
btn.textContent = 'Adicionado!';
setTimeout(()=> btn.textContent = 'Adicionar ao carrinho', 900);
});
search.addEventListener('input', filtrar);
categoria.addEventListener('change', filtrar);
}


// Inicialização
render(produtos);
addEventos();