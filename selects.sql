SELECT 
	pe.*, pro. *
FROM 
   pedidos pe
JOIN
	produtos_pedidos pro_pe ON pro_pe.pedido_id = pe.id
JOIN
   produtos pro ON pro_pe.produto_id = pro.id;

  
SELECT 
	pe.id
FROM 
   pedidos pe
JOIN
	produtos_pedidos pro_pe ON pro_pe.pedido_id = pe.id
JOIN
   produtos pro ON pro_pe.produto_id = pro.id
WHERE
   pro.nome ILIKE 'FRITAS';

  
SELECT 
	cli.nome
FROM 
   pedidos pe
JOIN
	produtos_pedidos pro_pe ON pro_pe.pedido_id = pe.id
JOIN
   produtos pro ON pro_pe.produto_id = pro.id
JOIN 
   clientes cli ON cli.id = pe.cliente_id
WHERE
   pro.nome ILIKE 'FRITAS';
  

SELECT 
   SUM(pro.preco)
FROM 
   pedidos pe
JOIN
	produtos_pedidos pro_pe ON pro_pe.pedido_id = pe.id
JOIN
   produtos pro ON pro_pe.produto_id = pro.id
JOIN 
   clientes cli ON cli.id = pe.cliente_id
WHERE
   cli.nome ILIKE 'Laura';


SELECT 
   pro.nome, COUNT(pro) 
FROM 
   pedidos pe
JOIN
	produtos_pedidos pro_pe ON pro_pe.pedido_id = pe.id
JOIN
   produtos pro ON pro_pe.produto_id = pro.id
GROUP BY 
	pro.nome
ORDER BY 
	pro.nome ASC;

   