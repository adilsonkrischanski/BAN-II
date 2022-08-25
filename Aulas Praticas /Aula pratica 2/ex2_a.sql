--incompleto
create Table public.pessoas(
	pnome character varying(10) not null,
	minicial character varying(1) not null,
	unome character varying(10) not null,
	ssn integer not null,
	dtnascimento character varying(10) not null,
	sexo character varying(10) not null,
	num integer not null,
	rua character varying(20) not null,
	numapto integer not null,
	cidade character varying(20) not null,
	estado character varying(20) not null,
	cep numeric(8) not null
);

ALTER TABLE ONLY public.pessoas
    ADD CONSTRAINT "pessoas_pkey" PRIMARY KEY (ssn);


create table public.docentes(
	ssn integer not null, -- primaria e estrangeira
	idescritorio integer not null,
	categoria character varying(10) not null,
	salario real not null,
	fone character varying(11) not null, --dd number
	idinstrutorpesquisador integer
);

ALTER TABLE ONLY public.docentes
ADD CONSTRAINT "docentes_pkey" PRIMARY KEY (ssn);

ALTER TABLE ONLY public.docentes
ADD CONSTRAINT docentes_ssn_fkey FOREIGN KEY (ssn) REFERENCES public.pessoas (ssn);

create table public.aluno(
	ssn integer not null, -- primaria e estrangeira
	turma character varying(10) not null,
	habitadept character varying(10) not null,
	oprtadepto character varying(10) not null
);
ALTER TABLE ONLY public.alunos
ADD CONSTRAINT "alunos_pkey" PRIMARY KEY (ssn);

ALTER TABLE ONLY public.docentes
ADD CONSTRAINT alunos_ssn_fkey FOREIGN KEY (ssn) REFERENCES public.pessoas (ssn);


create table public.alunosgraduacao(

	idalunograduacao numeric not null,
	ssnorientador integer not null,
	ssnaluno integer not null,
	idinstrutorpesquisador integer
	
);
ALTER TABLE ONLY public.alunograduacao
ADD CONSTRAINT "alunosgraduacao_pkey" PRIMARY KEY (idalunograduacao)

ALTER TABLE ONLY public.alunograduacao
ADD CONSTRAINT alunograduacao_ssnorientador_fkey REFERENCES public.docentes (ssn)

ALTER TABLE ONLY public.alunograduacao
ADD CONSTRAINT alunograduacao_ssnaluno_fkey REFERENCES public.alunos(ssn)

create table public.formacoes(
	idformacoes integer not null,
	ssnalunograduacao integer, -- referencia alunograduacao
	faculdade character varying(10) not null, 
	grau character varying(10) not null,
	ano date not null
);

ALTER TABLE ONLY public.formacoes
ADD CONSTRAINT "formacoes_pkey" PRIMARY KEY (idformacoes)

ALTER TABLE ONLY public.formacoes
ADD CONSTRAINT formacoes_ssnalunograduacao_ fkey REFERENCES public.alunograduacao (ssnaluno)


create table public.bancacomposicao(
	idbanca integer not null, --primaria
	ssnaluno integer not null, --estrangeira
	ssndocente integer not null --estrangeira

);

ALTER TABLE public.bancacomposicao
ADD CONSTRAINT "idbanca_pkey" PRIMARY KEY (idbanca)

ALTER TABLE public.bancacomposicao
ADD CONSTRAINT bancacomposicao_ssnaluno_fkey REFERENCES public.alunograduacao (ssnalunograduacao)

ALTER TABLE public.bancacomposicao
ADD CONSTRAINT bancacomposicao_ssndocente_fkey REFERENCES public.docentes (ssn)

create table public.faculdades(
	escritorio character varying(15) not null,
	nomeReitor character varying(15) not null,
	fnome character varying(15) not null,--primaria
);

ALTER TABLE ONLY public.faculdades
ADD CONSTRAINT "fnome_pkey" PRIMARY KEY (fnome)


create table public.departamerto(
	dnome character varying(10) not null, -- primaria
	dfone character varying(11) not null,
	escritorio character varying(15) not null,
	fnome character varying(20) not null -- estrangeira
);

ALTER TABLE ONLY public.departamento
ADD CONSTRAINT "dnome_pkey" PRIMARY KEY (dnome);

ALTER TABLE ONLY public.departamento
ADD CONSTRAINT departamento_nome_fkey REFERENCES public.faculdades (fnome)


create table public.bolca(
	titulo character varying(10) not null,
	num integer not null, --primaria
	agencia character varying(10) not null,
	dtincio date,
);

ALTER TABLE ONLY public.bolca
ADD CONSTRAINT "num_pkey" PRIMARY KEY (num)


create table public.subsidio(
numsubsidio integer not null, --primaria
dtincio date not null,
prazo integer not null,
fim date not null,
bolcanum integer not null, -- estrangeira
instrutorPesquisador integer not null --estrangeira

);

ALTER TABLE ONLY public.subsidio
ADD CONSTRAINT "numsubsidio_pkey" PRIMARY KEY (numsubsidio)

ALTER TABLE ONLY public.subsidio
ADD CONSTRAINT subsidio_bolcanum_fkey REFERENCES public.bolca (num)

ALTER TABLE ONLY public.subsidio
ADD CONSTRAINT subsidio_instrutorPesquisador_fkey REFERENCES public.instrutorPesquisador (idinstrutorPesquisador)


create table public.instrutorPesquisador(
idinstrutorpesquisador integer --primaria
);
ALTER TABLE ONLY public.instrutorPesquisador
ADD CONSTRAINT "instrutorPesquisador_pkey" PRIMARY KEY (instrutorPesquisador)


create table public.cursos(
cod integer not null, --primaria
unome character varying(15) not null,
cdesc character varying(15) not null
);

ALTER TABLE ONLY public.cursos
ADD CONSTRAINT "cod_pkey" PRIMARY KEY (cod)

create table public.diciplinas(
diciplina character varying(10), -- primaria
ano date,
tri character varying(10),
codcurso integer --estrangeira
idinstrutorpesquisador integer -- estrangeira

);

ALTER TABLE ONLY public.disciplinas
ADD CONSTRAINT "disciplina_pkey" PRIMARY KEY (disciplina)

ALTER TABLE ONLY public.disciplinas
ADD CONSTRAINT disciplinas_codcurso_fkey REFERENCES public.cursos (cod)

ALTER TABLE ONLY public.disciplinas
ADD CONSTRAINT disciplinas_idinstrutorpesquisador_fkey REFERENCES public.instrutorpesquisador (idinstrutorpesquisador)


create table public.historico(
idhistorioco integer not null, --primaria
diciplina character varying(10) not null, -- estrangeira
ssnaluno integer not null, --estrangeira
nota real not null
);

ALTER TABLE ONLY public.historico
ADD CONSTRAINT "idhistorico" PRIMARY KEY (idhistorico)

ALTER TABLE ONLY public.historico
ADD CONSTRAINT historico_diciplina_fkey REFERENCES public.disciplinas (diciplina)

ALTER TABLE ONLY public.historico
ADD CONSTRAINT historico_ssnaluno_fkey REFERENCES public.alunograduacao (ssn)


create table puclic.disciplinacorrente(
iddisciplinacorrente integer not null --primaria
ssnaluno integer not null, --  estrangeira
disciplina character varying(10) not null -- estrangeira
);


ALTER TABLE ONLY public.disciplinacorrente
ADD CONSTRAINT "iddisciplinacorrente_pkey" PRIMARY KEY (iddisciplinacorrente)

ALTER TABLE ONLY public.disciplinacorrente
ADD CONSTRAINT disciplinacorrente_ssnaluno_fkey REFERENCES public.alunograduacao (ssnalunograduacao)

ALTER TABLE ONLY public.disciplinacorrente
ADD CONSTRAINT disciplinacorrente_disciplina_fkey REFERENCES public.disciplinas (disciplina)



