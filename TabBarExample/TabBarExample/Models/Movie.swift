import Foundation

struct Movie {
    let id: Int
    let imageName: String
    let name: String
    let description: String
    let duration: Int
    let category: Category
}

extension Movie {
    
    static func getMovies() -> [Movie] {
        return [
            .init(
                id: 1,
                imageName: "doutorEstranho",
                name: "Doutor Estranho no Multiverso",
                description: "Em Doutor Estranho no Multiverso da Loucura, do Marvel Studios, o MCU liberta o multiverso e explora seus limites como nunca foi feito antes. Viaje pelo desconhecido com Doutor Estranho, que, com a ajuda de novos e velhos aliados, atravessa insanas e perigosas realidades do Multiverso para confrontar um misterioso novo adversário",
                duration: 120,
                category: .action
            ),
            .init(
                id: 2,
                imageName: "uncharted",
                name: "Uncharted: Fora do Mapa",
                description: "Nathan Drake e seu parceiro canastrão Victor Sully Sullivan embarcam em uma perigosa busca para encontrar o maior tesouro jamais encontrado. Enquanto isso, eles também rastreiam pistas que podem levar ao irmão perdido de Nathan.",
                duration: 116,
                category: .adventure
            ),
            .init(
                id: 3,
                imageName: "morbius",
                name: "Morbius",
                description: "Um dos personagens mais interessantes e conflituosos da Marvel chega à tela grande com o vencedor do Oscar Jared Leto se transformando no enigmático anti-herói Michael Morbius. Gravemente adoecido com um raro distúrbio sanguíneo e determinado a salvar outros que sofrem do mesmo destino, o Dr. Morbius arrisca tudo numa aposta desesperada. E embora a princípio tudo pareça um sucesso absoluto, surge uma escuridão que se desencadeia dentro dele. O bem superará o mal - ou Morbius sucumbirá aos seus novos e misteriosos desejos?",
                duration: 104,
                category: .horror
            ),
            .init(
                id: 4,
                imageName: "minions",
                name: "Minions 2: A Origem de Gru",
                description: "Origem de Gru é a continuação das aventuras dos Minions, sempre em busca de um líder tirânico. Desta vez, eles ajudam um Gru ainda criança, descobrindo como ser vilão. Confira a classificação indicativa no Portal Online da Cultura Digital.",
                duration: 90,
                category: .comedy
            ),
            .init(
                id: 5,
                imageName: "batman",
                name: "BATMAN",
                description: "Batman é do mesmo diretor dos sucessos Planeta dos Macacos: A Guerra (2017) e Planeta dos Macacos: O Confronto (2014). Bruce Wayne (Robert Pattinson) ainda sofre com o assassinato de seus pais. Enquanto isso, o comissário Gordon (Jeffrey Wright) segue em pânico com a cidade de Gotham nas mãos de criminosos como Carmine Falcone (John Turturro), Pinguim (Colin Farrell) e Charada (Paul Dano). Chegou a hora do milionário vigilante, Batman, lutar por justiça. Para isso, ele contará com a ajuda do fiel escudeiro Alfred (Andy Serkis) e também da Mulher-Gato (Zoë Kravitz), ainda dividida entre seu legado de crimes e a paixão pelo homem-morcego. Décimo terceiro filme com o personagem do Universo DC.",
                duration: 176,
                category: .action
            ),
            .init(
                id: 6,
                imageName: "agente-das-sombras",
                name: "AGENTE DAS SOMBRAS",
                description: "Agente das Sombras é do mesmo criador da bem sucedida série Ozark (2017-2022). Travis Block (Liam Neeson) trabalha para o FBI, mas não é um agente qualquer. Suas ações não têm registro e sua especialidade é mover-se pelos bastidores. Apesar de gostar do que faz, Block pensa em se aposentar para dar atenção à netinha. O diretor do FBI Gabriel Robinson (Aidan Quinn) não aprova a ideia. Para piorar a relação de amizade e confiança entre os dois, Block tem acesso a informações que colocam seu velho amigo a frente de um operação obscura e, possivelmente, com vítimas. Ele pede para sair da organização, mas sua filha e neta desaparecem. Agora, o bicho vai pegar porque Block não conhece limites.",
                duration: 108,
                category: .action
            ),
            .init(
                id: 7,
                imageName: "belfast",
                name: "BELFAST",
                description: "Em Belfast, no final dos tumultuosos anos de 1960 na Irlanda do Norte, o jovem Buddy (Jude Hill) percorre a paisagem das lutas da classe trabalhadora, em meio de mudanças culturais e violência extrema. Buddy sonha em um futuro melhor, glamoroso, que vai tirá-lo dos problemas que enfrenta no momento, mas, enquanto isso não acontece, ele se consola com o carismático Pa (Jamie Dornan) e a Ma (Caitríona Balfe), junto com seus avós (Judie Dench e Ciarán Hins) que contam histórias maravilhosas.",
                duration: 98,
                category: .drama
            ),
            .init(
                id: 8,
                imageName: "bts-permission-to-dance-on-stage-seoul",
                name: "BTS PERMISSION TO DANCE ON STAGE - SEOUL",
                description: "O fenômeno BTS começou em 2013. Desde então, o sucesso do grupo de K-Pop só cresceu com suas músicas, coreografias animadas e o apoio aos jovens. Em novembro passado, eles fizeram os primeiros shows presenciais, em Los Angeles, após a pandemia. Em 2022, chegou a hora dos fãs da terra natal, Coreia do Sul, curtirem shows presenciais. E os fãs brasileiros não ficarão de fora dessa. Um dos shows, programado para acontecer no dia 12 de março, será exibido em cinemas do mundo inteiro e o Kinoplex proporciona para você essa oportunidade única. Devido a diferença de fuso horário, a exibição acontecerá algumas horas após o show ao vivo da boy band sul-coreana.",
                duration: 195,
                category: .musical
            ),
            .init(
                id: 9,
                imageName: "casa-gucci",
                name: "CASA GUCCI",
                description: "Casa Gucci é do premiado diretor de inúmeros sucessos como os oscarizados Gladiador (2000) e Falcão Negro em Perigo (2001). Baseado no livro Casa Gucci: Uma História de Glamour, Cobiça, Loucura e Morte, o filme revela os bastidores de três décadas da família fundadora da famosa marca de moda italiana, envolvida em polêmicas. No final dos anos 1980, Maurizio Gucci (Adam Driver), filho de Rodolfo (Jeremy Irons) e sobrinho de Aldo (Al Pacino), dá um golpe na família e toma o controle da empresa. Entre os pilares dessa reviravolta está sua esposa Patrizia (Lady Gaga), por quem era apaixonado. Em 1995, ela acabaria acusada de conspirar contra o marido, assassinado por um matador de aluguel.",
                duration: 158,
                category: .drama
            ),
            .init(
                id: 10,
                imageName: "coracao-ardente",
                name: "CORAÇÃO ARDENTE",
                description: "Coração Ardente é do diretor, produtor e roteirista do filme religioso Fátima, O Último Mistério (2017). Escritora de sucesso, Lupe Valdés (Karyme Lozano) procura inspiração para seu próximo livro e decide investigar as aparições do Sagrado Coração de Jesus. Para isso, ela contará com a experiência de Maria (María Vallejo-Nágera), uma perita em mistérios. Assim, Lupe descobrirá revelações de Jesus a Santa Margarida Maria de Alacoque (Wendy Gara), e muito mais sobre santos, papas, exorcistas, assassinos, conspiradores, presidentes, crimes e milagres. Durante sua pesquisa, a escritora encontrará ainda segredos do próprio coração, abatido pelas feridas do passado e carente de cura.",
                duration: 89,
                category: .fiction
            ),
            .init(
                id: 11,
                imageName: "exorcismo-sagrado",
                name: "EXORCISMO SAGRADO",
                description: "Exorcismo Sagrado é do mesmo diretor do premiado terror A Casa do Fim dos Tempos (2013). No passado, o padre americano Peter Williams (Will Beinbrink) estava sediado no México. Enfraquecido ao ser possuído por um demônio, durante um exorcismo, ele cometeu um grave sacrilégio. Dezoito anos se passaram e muitas pessoas o consideram um santo pela bondade que praticou ao longo do tempo. Só que o religioso volta a ser assombrado pelo pecado cometido naquela época. Dividido entre a devoção a Deus e a antiga relação com o diabo, ele começará uma nova batalha entre o Bem e o Mal. Agora, somente sua crença maior poderá significar a verdadeira vitória.",
                duration: 109,
                category: .horror
            )
        ]
    }
    
}
