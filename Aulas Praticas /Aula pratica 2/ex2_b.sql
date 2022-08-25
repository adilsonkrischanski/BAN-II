--incompleto

create table public.veterinario(
    crmnome character varying(15) not null,
    convenio integer not null,
);

ALTER TABLE ONLY public.veterinario
ADD CONSTRAINT "crmnome_pkey" PRIMARY KEY (crmnome)

create table public.animal(
    identificao integer not null,
    nome character varying(15) not null,
    raca character varying(15) not null,
    sexo character varying(15) not null,
    
);

ALTER TABLE ONLY public.animal
ADD CONSTRAINT "identificao_pkey" PRIMARY KEY (identificacao)

create table public.consulta(
    idconsulta numeric not null,
    data date not null,
    resultado character varying(300) not null
    idanimal integer not null,
    idveterinario integer not null
);

ALTER TABLE ONLY public.consulta
ADD CONSTRAINT "idconsulta_pkey" PRIMARY KEY (idconsulta)
ADD CONSTRAINT consulta_idanimal_fkey REFERENCES public.animal (identificacao)
ADD CONSTRAINT idveterinario_idanimal_fkey REFERENCES public.veterinario (crmnome)

create table public.semen(
    idanimal integer not null, -- primaria e estrangeira
    tipo character varying(10) not null
    caracteristica character varying(10) not null
);

ALTER TABLE ONLY public.semen 
ADD CONSTRAINT "idanimal_pkey" PRIMARY KEY (idanimal)
ADD CONSTRAINT semen_idanimal_fkey REFERENCES public.animal (identificacao)

create table public.inseminacao(
    idinseminacao integer not null,
    idanimalfemia integer not null,
    idanimalmacho integer not null,
    numerocurral integer not null  
);

ALTER TABLE ONLY public.inseminacao
ADD CONSTRAINT "idinseminacao_pkey" PRIMARY KEY (idinseminacao)
ADD CONSTRAINT inseminacao_idanimalfemia_fkey REFERENCES public.animal (identificacao)
ADD CONSTRAINT inseminacao_idanimalmacho_fkey REFERENCES public.animal (identificacao)

create table public.curral(
    numero integer not null,
    localizacao character varying(30), not null
);

ALTER TABLE ONLY puclic.curral
ADD CONSTRAINT "numero_pkey" PRIMARY KEY (numero)

