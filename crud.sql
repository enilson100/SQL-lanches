-- Criação
INSERT INTO 
 	clientes(nome, lealdade)
VALUES
    ('Georgia', 0);

INSERT INTO 
	pedidos(status, cliente_id)
VALUES
    ('Recebido', 6);  

INSERT INTO 
	produtos_pedidos (pedido_id, produto_id)
VALUES
    (6, 1),
    (6, 2),
    (6, 6),
    (6, 8),
    (6, 8);


-- Leitura
SELECT 
   cli, pe, pro
FROM 
   pedidos pe
JOIN
	produtos_pedidos pro_pe ON pro_pe.pedido_id = pe.id
JOIN
   produtos pro ON pro_pe.produto_id = pro.id
JOIN 
   clientes cli ON cli.id = pe.cliente_id
WHERE
   cli.nome = 'Georgia';

-- Atualização
UPDATE 
	clientes cli
SET
	lealdade = (
		SELECT 
		    SUM(pro.pts_de_lealdade)
		FROM 
  			 pedidos pe
		JOIN
		  	produtos_pedidos pro_pe ON pro_pe.pedido_id = pe.id
		JOIN
             produtos pro ON pro_pe.produto_id = pro.id
		JOIN 
   			 clientes cli ON cli.id = pe.cliente_id
   		WHERE
           cli.nome = 'Georgia'
  	  )
WHERE
    cli.nome = 'Georgia' ;

-- Deleção
DELETE FROM 
	clientes cli
WHERE 
	cli.nome = 'Marcelo';


