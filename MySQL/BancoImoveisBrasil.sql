create database BDimovel;
use BDimovel;

CREATE TABLE faixa_imovel(

cd_faixa INTEGER NOT NULL PRIMARY KEY auto_increment,
nm_faixa VARCHAR(100) NOT NULL,
vl_minimo DECIMAL(8,2) NOT NULL,
vl_maximo DECIMAL(8,2) NOT NULL


);

CREATE TABLE estado(

sg_estado VARCHAR(2) NOT NULL PRIMARY KEY,
nm_estado VARCHAR(100) NOT NULL

);

CREATE TABLE cidade(

cd_cidade INTEGER NOT NULL PRIMARY KEY auto_increment,
nm_cidade VARCHAR(100) NOT NULL,
sg_estado VARCHAR(2) NOT NULL,
FOREIGN KEY(sg_estado)
REFERENCES estado(sg_estado)
);


CREATE TABLE bairro(

cd_bairro INTEGER NOT NULL PRIMARY KEY auto_increment,
nm_bairro VARCHAR(100) NOT NULL,
sg_estado VARCHAR(2) NOT NULL,
cd_cidade INTEGER NOT NULL,
FOREIGN KEY(cd_cidade)
REFERENCES cidade(cd_cidade),
FOREIGN KEY(sg_estado)
REFERENCES estado(sg_estado)

);

CREATE TABLE compradores(

cd_comprador INTEGER NOT NULL PRIMARY KEY auto_increment,
nm_comprador VARCHAR(100) NOT NULL,
nm_enderecoComprador VARCHAR(100) NOT NULL,
nr_cpfComprador VARCHAR(100) NOT NULL,
tel_comprador VARCHAR(100) NOT NULL,
cd_cidade INTEGER NOT NULL,
cd_bairro INTEGER NOT NULL,
sg_estado VARCHAR(2) NOT NULL,
FOREIGN KEY (cd_cidade)
REFERENCES cidade(cd_cidade),
FOREIGN KEY (cd_bairro)
REFERENCES bairro(cd_bairro),
FOREIGN KEY (sg_estado)
REFERENCES estado(sg_estado)

);

CREATE TABLE vendedor(

cd_vendedor INTEGER NOT NULL PRIMARY KEY auto_increment,
nm_vendedor VARCHAR(100) NOT NULL,
nm_endereco VARCHAR(100) NOT NULL,
nr_cpfVendedor VARCHAR(100) NOT NULL,
tel_vendedor VARCHAR(100) NOT NULL,
data_nascVendedor DATE NOT NULL,
cd_cidade INTEGER NOT NULL,
cd_bairro INTEGER NOT NULL,
sg_estado VARCHAR(2) NOT NULL,
FOREIGN KEY (cd_cidade)
REFERENCES cidade(cd_cidade),
FOREIGN KEY (cd_bairro)
REFERENCES bairro(cd_bairro),
FOREIGN KEY (sg_estado)
REFERENCES estado(sg_estado)

);


CREATE TABLE imovel(

cd_imovel INTEGER NULL PRIMARY KEY auto_increment,
nm_endereco VARCHAR(100) NOT NULL,
nr_areautil DECIMAL(8,2) NOT NULL,
Nr_areatotal DECIMAL(8,2) NOT NULL,
vl_preco DECIMAL(10,2) NOT NULL,
st_vendido VARCHAR(100) NOT NULL,
data_lancto DATE NOT NULL,
cd_comprador INTEGER NOT NULL,
cd_vendedor INTEGER NOT NULL,
cd_bairro INTEGER NOT NULL,
cd_cidade INTEGER NOT NULL,
cd_oferta INTEGER NOT NULL,
sg_estado VARCHAR(2) NOT NULL,
FOREIGN KEY (cd_vendedor)
REFERENCES vendedor(cd_vendedor),
FOREIGN KEY (cd_bairro)
REFERENCES bairro(cd_bairro),
FOREIGN KEY (sg_estado)
REFERENCES estado(sg_estado),
FOREIGN KEY(cd_comprador)
REFERENCES compradores(cd_comprador),
FOREIGN KEY (cd_cidade)
REFERENCES cidade(cd_cidade)

);

CREATE TABLE oferta(

cd_oferta INTEGER NULL PRIMARY KEY auto_increment,
vl_oferta DECIMAL(8,2) NOT NULL,
dt_oferta DATE,
cd_imovel INTEGER NOT NULL,
cd_comprador INTEGER NOT NULL,
FOREIGN KEY (cd_comprador)
REFERENCES compradores(cd_comprador),
FOREIGN KEY (cd_imovel)
REFERENCES imovel(cd_imovel)

);

ALTER TABLE imovel
ADD FOREIGN KEY(cd_oferta)
REFERENCES oferta(cd_oferta);


INSERT INTO estado (sg_estado, nm_estado) VALUES 
	('AC', 'Acre'),
    ('AL', 'Alagoas'),
    ('AP', 'Amapá'),
    ('AM', 'Amazonas'),
    ('BA', 'Bahia'),
    ('CE', 'Ceará'),
    ('ES', 'Espírito Santo'),
    ('GO', 'Goiás'),
    ('MA', 'Maranhâo'),
    ('MT', 'Mato Grosso '),
    ('MS', 'Mato Grosso do Sul'),
    ('MG', 'Minas Gerais'),
    ('PA', 'Pará'),
    ('PB', 'Paraíba'),
    ('PR', 'Paraná'),
    ('PE', 'Pernambuco'),
    ('PI', 'Piauí'),
    ('RJ', 'Rio de Janeiro'),
    ('RN', 'Rio Grande do Norte'),
    ('RS', 'Rio Grande do Sul'),
    ('RO', 'Rondônia'),
    ('RR', 'Roraima'),
    ('SC', 'Santa Catarina'),
    ('SP', 'SãoPaulo'),
    ('SE', 'Sergipe'),
    ('TO', 'Tocantins'),
    ('DF', 'Distrito Federal');
    

    
INSERT INTO cidade (nm_cidade, sg_estado) VALUES
('Rio Branco', 'AC'),
('Cruzeiro do Sul', 'AC'),
('Sena Madureira', 'AC'),
('Maceió', 'AL'),
('Arapiraca', 'AL'),
('Rio Largo', 'AL'),
('Macapá', 'AP'),
('Santana', 'AP'),
('Laranjal do Jari', 'AP'),
('Manaus', 'AM'),
('Parintins','AM'),
('Itacoatiara', 'AM'),
('Salvador', 'BA'),
('Feira de Santana', 'BA'),
('Vitória da Conquista', 'BA'),
('Fortaleza', 'CE'),
('Caucaia', 'CE'),
('Juzeiro do Norte', 'CE'),
('Vitória', 'ES'),
('Serra', 'ES'),
('Vila Velha', 'ES'),
('Goiânia', 'GO'),
('Aparecida de Goiânia', 'GO'),
('Anápolis', 'GO'),
('São Luiz', 'MA'),
('Imperatriz', 'MA'),
('São José de Ribamar', 'MA'),
('Cuiabá', 'MT'),
('Várzea Grande', 'MT'),
('Rondonópolis', 'MT'),
('Campo Grande', 'MS'),
('Dourados', 'MS'),
('Três Lagoas', 'MS'),
('Belo Horizonte', 'MG'),
('Uberlândia', 'MG'),
('Contagem', 'MG'),
('Belém', 'PA'),
('Abaetetuba', 'PA'),
('Altamira', 'PA'),
('João Pessoa', 'PB'),
('Campina Grande', 'PB'),
('Santa Rina', 'PB'),
('Curitiba', 'PR'),
('Londrina', 'PR'),
('Maringá', 'PR'),
('Recife', 'PE'),
('Jaboatão dos Guararapes', 'PE'),
('Olinda', 'PE'),
('Teresina', 'PI'),
('Parnaíba', 'PI'),
('Picos', 'PI'),
('Rio de Janeiro', 'RJ'),
('São Gonçalo', 'RJ'),
('Duque de Caxias', 'RJ'),
('Natal', 'RN'),
('Mossoró', 'RN'),
('Parnamirim', 'RN'),
('Porto Alegre', 'RS'),
('Caxias do Sul', 'RS'),
('Canoas', 'RS'),
('Porto Velho', 'RO'),
('Ji-Paraná', 'RO'),
('Ariquemes', 'RO'),
('Boa Vista', 'RR'),
('Rorainópolis', 'RR'),
('Caracaraí', 'RR'),
('Florianópolis', 'SC'),
('JoinVille', 'SC'),
('Blumenau', 'SC'),
('São Paulo', 'SP'),
('Guarulhos', 'SP'),
('Campinas', 'SP'),
('Aracaju', 'SE'),
('Nossa Senhora do Socorro', 'SE'),
('Lagarto', 'SE'),
('Palmas', 'TO'),
('Araguaína', 'TO'),
('Gurupi', 'TO'),
('Brasília', 'DF'),
('Brazlândia', 'DF'),
('Candangolândia', 'DF');



INSERT INTO bairro(nm_bairro, sg_estado, cd_cidade) VALUES
('Abraão Alab', 'AC', '1'),
('Adalberto Aragão', 'AC', '1'), 
('Aeroporto Velho', 'AC', '1'),
('Alumínio', 'AC', '2'),
('Tiro ao Alvo', 'AC', '2'),
('Remanso', 'AC', '2'),
('Ana Vieira', 'AC', '3'),
('Bom Sucesso', 'AC', '3'),
('Bosque', 'AC', '3'),
('Antares', 'AL', '4'),
('Barro Duro', 'AL', '4'),
('Bom Parto', 'AL', '4'),
('Alto Cruzeiro', 'AL', '5'),
('Baixao', 'AL', '5'),
('Baixa Grande', 'AL', '5'),
('Alto do São Miguel', 'AL', '6'),
('Antônio Lins de Souza', 'AL', '6'),
('Brasil Novo', 'AL', '6'),
('Buritizal', 'AP', '7'),
('Cabralzinho', 'AP', '7'),
('Central', 'AP', '7'),
('Água Fria', 'AP', '8'),
('Chora Menino', 'AP', '8'),
('Imirim', 'AP', '8'),
('Centro', 'AP', '9'),
('Samaúma', 'AP', '9'),
('Malvinas', 'AP', '9'),
('Adrianópolis', 'AM', '10'),
('Aleixo', 'AM', '10'),
('Alfredo Nascimento', 'AM', '10'),
('Itaúna II', 'AM', '11'),
('Palmares', 'AM', '11'),
('Itaúna I', 'AM', '11'),
('Centro', 'AM', '12'),
('Colônia', 'AM', '12'),
('Iraci', 'AM', '12'),
('Acupe', 'BA', '13'),
('Aeroporto', 'BA', '13'),
('Águas Claras', 'BA', '13'),
('Sim', 'BA', '14'),
('Tomba', 'BA', '14'),
('Mangabeira', 'BA', '14'),
('Alto Maron', 'BA', '15'),
('Ayrton Senna', 'BA', '15'),
('Bateias', 'BA', '15'),
('Adelota', 'CE', '16'),
('Meireles', 'CE', '16'),
('Cocó', 'CE', '16'),
('Açude', 'CE', '17'),
('Alto de Garrote', 'CE', '17'),
('Antônio Bezerra', 'CE', '17'),
('Pirajá', 'CE', '18'),
('Frei Damião', 'CE', '18'),
('Salesianos', 'CE', '18'),
('Jardim Camburi', 'ES', '19'),
('Praia do Canto', 'ES', '19'),
('Barro Vermelho', 'ES', '19'),
('Porto Canoa', 'ES', '20'),
('Bairro de Fátima', 'ES', '20'),
('Laranjeiras', 'ES', '20'),
('Alecrim', 'ES', '21'),
('Alvorada', 'ES', '21'),
('Araçás', 'ES', '21'),
('Alto da Glória', 'GO', '22'),
('Areião', 'GO', '22'),
('Setor Bueno', 'GO', '22'),
('Chacará Bela Vista', 'GO', '23'),
('Chacará Santa Luiza', 'GO', '23'),
('Chacará São Pedro', 'GO', '23'),
('Cidade Universitária', 'GO', '24'),
('Vila Formosa', 'GO', '24'),
('Vila Jaiara', 'GO', '24'),
('Maracanã', 'MA', '25'),
('Cidade Olímpica', 'MA', '25'),
('Conjunto São Raimundo', 'MA', '25'),
('Água Boa', 'MA', '26'),
('Alto Bonito', 'MA', '26'),
('Asa Norte', 'MA', '26'),
('Residencial Nova Aurora', 'MA', '27'),
('Rio São João', 'MA', '27'),
('Vila Sarney Filho', 'MA', '27'),
('Centro-Sul', 'MT', '28'),
('Centro-Norte', 'MT', '28'),
('Dom Aquino', 'MT', '28'),
('7 de Maio', 'MT', '29'),
('24 de Dezembro', 'MT', '29'),
('Água Limpa', 'MT', '29'),
('Jd. Liberdade', 'MT', '30'),
('Vila Aurora', 'MT', '30'),
('Parque Residencial Universitário', 'MT', '30'),
('Cabreuvá', 'MS', '31'),
('Cachoeirinha', 'MS', '31'),
('Carandá', 'MS', '31'),
('Região Parque das Nações II', 'MS', '32'),
('Região Vila Industrial', 'MS', '32'),
('Região Canaã III', 'MS', '32'),
('Alto Boa Vista', 'MS', '33'),
('Jardim das Acácias', 'MS', '33'),
('Jardim das Américas', 'MS', '33'),
('Aarão Reis', 'MG', '34'),
('Adalberto Ferraz', 'MG', '34'),
('Aeroporto', 'MG', '34'),
('Presidente Roosevelt', 'MG', '35'),
('Jardim Brasília', 'MG', '35'),
('São José', 'MG', '35'),
('Água Branca', 'MG', '36'),
('Área Industrial de Contagem I', 'MG', '36'),
('Bela Vista', 'MG', '36'),
('Aurá', 'PA', '37'),
('Baia do Sol', 'PA', '37'),
('Barreiro', 'PA', '37'),
('Abaetetuba', 'PA', '38'),
('Algodão', 'PA', '38'),
('Algodoal', 'PA', '38'),
('Aeroporto', 'PA', '39'),
('Alberto Soares', 'PA', '39'),
('Aparecida', 'PA', '39'),
('Aeroclube', 'PB', '40'),
('Água Fria', 'PB', '40'),
('Altiplano', 'PB', '40'),
('Bela Vista', 'PB', '41'),
('Bodocongó', 'PB', '41'),
('Centenário', 'PB', '41'),
('Barra da Lagoa', 'PB', '42'),
('Cachoeira do Bom Jesus', 'PB', '42'),
('Campeche', 'PB', '42'),
('Centro', 'PR', '43'),
('Centro Cívidco', 'PR', '43'),
('Batel', 'PR', '43'),
('Cinco Conjunto', 'PR', '44'),
('Centro Histórico', 'PR', '44'),
('União da Vitória', 'PR', '44'),
('Vila Operária', 'PR', '45'),
('Maringá Velho', 'PR', '45'),
('Jardim Alvorada', 'PR', '45'),
('Aflitos', 'PE', '46'),
('Afogados', 'PE', '46'),
('Água Fria', 'PE', '46'),
('Jaboatão', 'PE', '47'),
('Cavaleiro', 'PE', '47'),
('Curado', 'PE', '47'),
('Águas Compridas', 'PE', '48'),
('Aguazinha', 'PE', '48'),
('Alto da Bondade', 'PE', '48'),
('Jockey', 'PI', '49'),
('Fátima', 'PI', '49'),
('Horto', 'PI', '49'),
('Alto Santa Maria', 'PI', '50'),
('Bairro de Fátima', 'PI', '50'),
('Bebedouro', 'PI', '50'),
('Picos', 'PI', '51'),
('Centro', 'PI', '51'),
('São José', 'PI', '51'),
('Bairro Imperial de São Cristóvão', 'RJ', '52'),
('Benfica', 'RJ', '52'),
('Caju', 'RJ', '52'),
('Alcântara', 'RJ', '53'),
('Anaia Grande', 'RJ', '53'),
('Arsenal', 'RJ', '53'),
('Campos Elíseos', 'RJ', '54'),
('Centro', 'RJ', '54'),
('Chácaras Rio-Petrópolis', 'RJ', '54'),
('Nova Descoberta', 'RN', '55'),
('Bom Pastor', 'RN', '55'),
('Cidade Nova', 'RN', '55'),
('Bairro Santo Antônio', 'RN', '56'),
('Santa Helena', 'RN', '56'),
('Independência', 'RN', '56'),
('Emaús', 'RN', '57'),
('Jardim Planalto', 'RN', '57'),
('Liberdade', 'RN', '57'),
('Auxiliadora', 'RS', '58'),
('Azenha', 'RS', '58'),
('Bela Vista', 'RS', '58'),
('São Peregrino', 'RS', '59'),
('Madureira', 'RS', '59'),
('Altos do Juvenil', 'RS', '59'),
('Brigadeira', 'RS', '60'),
('Centro', 'RS', '60'),
('Estãncia Velha', 'RS', '60'),
('Aponiã', 'RO', '61'),
('Pedrinhas', 'RO', '61'),
('Agenor de Carvalho', 'RO', '61'),
('Açai', 'RO', '62'),
('Aeroporto', 'RO', '62'),
('Alto Alegre', 'RO', '62'),
('Jardim América', 'RO', '63'),
('Setor Industrial', 'RO', '63'),
('Bairro Marechal Rondon', 'RO', '63'),
('Asa Branca', 'RR', '64'),
('Alvorada', 'RR', '64'),
('Professora Araceli Souto Maior', 'RR', '64'),
('Andaraí', 'RR', '65'),
('Campolandia', 'RR', '65'),
('Cidade Nova', 'RR', '65'),
('Centro', 'RR', '66'),
('São Franscisco', 'RR', '66'),
('Santa Luzia', 'RR', '66'),
('Barra da Lagoa', 'SC', '67'),
('Cachoeira do Bom Jesus', 'SC', '67'),
('Campeche', 'SC', '67'),
('Adhemar Garcia', 'SC', '68'),
('América', 'SC', '68'),
('Anita Garibaldi', 'SC', '68'),
('Valparaíso', 'SC', '69'),
('Velha Grande', 'SC', '69'),
('Passo Manso', 'SC', '69'),
('Pinheiros', 'SP', '70'),
('Vila Nova Conceição', 'SP', '70'),
('Barra Funda', 'SP', '70'),
('Vila Galvão', 'SP', '71'),
('Maia', 'SP', '71'),
('Macedo', 'SP', '71'),
('Bosque', 'SP', '72'),
('Botafogo', 'SP', '72'),
('Cambuí', 'SP', '72'),
('Centro', 'SE', '73'),
('Getúlio Vargas', 'SE', '73'),
('Cirurgia', 'SE', '73'),
('Parque dos Faróis', 'SE', '74'),
('Taicoca de Dentro', 'SE', '74'),
('Lamarão', 'SE', '74'),
('Ademar Carvalho', 'SE', '75'),
('Coqueiro de Biaxo', 'SE', '75'),
('Jardim Campo Novo', 'SE', '75'),
('Taquaralto', 'TO', '76'),
('Jardim Aureny I', 'TO', '76'),
('Jardim Taquari', 'TO', '76'),
('Araguaína Sul', 'TO', '77'),
('São João', 'TO', '77'),
('Centro', 'TO', '77'),
('Casego', 'TO', '78'),
('Jardim Bouvelard', 'TO', '78'),
('Jardim Guanabara', 'TO', '78'),
('Asa Norte', 'DF', '79'),
('Asa Sul', 'DF', '79'),
('Lago Norte', 'DF', '79'),
('Dois Irmaãos', 'DF', '80'),
('Engenho Queimado', 'DF', '80'),
('Barreiro', 'DF', '80'),
('Ceilandia', 'DF', '81'),
('Cidade Nova', 'DF', '81'),
('Paranoá', 'DF', '81');



INSERT INTO compradores (nm_comprador, nm_enderecoComprador, nr_cpfComprador, tel_comprador, cd_cidade, cd_bairro, sg_estado) VALUES
('Gustavo de Melo', 'Rua Pedro Alvares Cabaral', '111.111.111-11', '1111-1111', 70, 210, 'SP'),
('Jonathan Pereira', 'Rua Domingues', '222.222.222-22', '2222-2222', 81, 243, 'DF'),
('Carlos Eduardo', 'Rua Presidente', '333.333.333-33', '3333-3333', 23, 67, 'GO'),
('Lucas Albuquerque', 'Rua Cabloco', '444.444.444-44', '4444-4444', 28, 84, 'MT'),
('Nicole Barros', 'Rua Pompeia', '555.555.555-55', '5555-5555', 31, 92, 'MS'),
('Alexandre Silva', 'Rua Sol', '666.666.666-66', '6666-6666', 37, 110, 'PA'),
('Aline Constantino', 'Rua Tarsília do Amaral', '7777.777.777-77', '7777-7777', 42, 126, 'PR'),
('Bruno Henrique', 'Rua Luar', '888.888.888-88', '8888-8888', 49, 145, 'PI'),
('Kayc Santana', 'Rua Imperial', '999.999.999-99', '9999-9999', 52, 154, 'RJ'),
('Rodrigo Caetano', 'Rua Elenice', '101.101.101-10', '1010-1010', 56, 167, 'RN');


INSERT INTO vendedor(nm_vendedor, nm_endereco, nr_cpfVendedor, tel_vendedor, data_nascVendedor, cd_cidade, cd_bairro, sg_estado) VALUES
('Gabriel Mendes', 'Rua Camundongo', '000.000.000-00', '0000-0000', '1984-07-02', 1, 1, 'AC'),
('Kamila Alves', 'Rua Broto', '010.010.010.01', '0101-0101', '2000-12-24', 80, 241, 'DF'),
('Clodoaldo', 'Rua Vasconcelos', '020.020.020-02', '0202-0202', '1996-05-08', 73, 218, 'SE'),
('Nathan Monaco', 'Rua Tribalista', '030.030.030-03', '0303-0303', '2002-03-06', 63, 187, 'RO'),
('Yago Machado', 'Rua Joy', '040.040.040-04', '0404-0404', '1959-06-21', 7, 20, 'AL'),
('Igor Menezes', 'Rua Paulista', '050.050.050-05', '0505-0505', '1972-01-30', 14, 41, 'BA'),
('Joelma Barros', 'Rua Paulo Pereira', '060.060.060-06', '0606-0606', '2001-01-01', 15, 44, 'BA'),
('Renan Gabriel', 'Rua Esmeralda', '070.070.070-07', '0707-0707', '2002-05-26', 39, 116, 'PA'),
('Rodrigo Caldeira', 'Rua Pôr do Sol', '080.080.080-08', '0707-0707', '1974-09-07', 59, 177, 'RS'),
('Tales Almeida', 'Rua Oligarquia', '090.090.090-09', '0707-0707', '1992-12-20', 56, 167, 'RN');




INSERT INTO 
faixa_imovel(nm_faixa, vl_minimo, vl_maximo) VALUES
('Baixo', 0.00, 10500.00),
('Médio', 105001.00, 180000.00),
('Alto', 180001.00, 999999.00);


INSERT INTO
imovel(nm_endereco,nr_areautil,Nr_areatotal,vl_preco,st_vendido,data_lancto,cd_comprador,cd_vendedor,cd_bairro,cd_cidade,sg_estado, cd_oferta) VALUES
('Anita Garibaldi', 100000.00, 200000.00, 40000000.00, 'Á venda', '2007-02-21', 3, 3, 204, 68, 'SC', 1);

INSERT INTO 
oferta(vl_oferta,dt_oferta,cd_imovel,cd_comprador) VALUES
(500000.00,'2008-05-04', 1, 1);
