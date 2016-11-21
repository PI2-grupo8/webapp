
$valores_y = [2.1, 3.02, 4.75, 7.18, 11.21, 17.17, 26.33, 41.01, 62.22, 96]
$valores_x = [8, 16, 24, 32, 40, 48, 56, 64]
$n = 9

def calcula_somatorio(lista_numeros)
	somatorio = lista_numeros.inject(0, :+)
	return somatorio
end

def calcula_media(lista_numeros)
	media = lista_numeros / $n
	return media
end



def calcula_media_valores_x
	values = [8, 16, 24, 32, 40, 48, 56, 64]
	n = 9

	somatorio = values.inject(0, :+)

	resultado = somatorio / n

	return resultado
end

def calcula_media_valores_y
	somatorio = $valores_y.inject(0, :+)
	resultado = somatorio / $m
	return resultado
end

def calcula_log_natural(lista_numeros)
	new_numbers = []
	new_numbers = lista_numeros.map do |number|
		Math.log(number,Math::E)
	end
	return new_numbers
end

#esse método pode ser integrado com o método calcula_media_valores_y, inicialmente está duplicado, a melhorar!!
def calcula_media_valores_lny
	somatorio = calcula_log_natural_y.inject(0, :+)
	resultado = somatorio / 8 #aqui o denominador receberá a quantidade de valores do array de y
	return resultado
end

def calcula_x_intermediario
	values = [8, 16, 24, 32, 40, 48, 56, 64]
	media_de_x = calcula_media_valores_x
	new_numbers = []
	new_numbers = values.map do |number|
		number - media_de_x
	end
	return new_numbers
end

def calcula_ajuste_angular
	x_intermediario = calcula_x_intermediario
	log_natural_y = calcula_log_natural_y
	resultado = x_intermediario.size.times.collect {|i| x_intermediario[i] * log_natural_y[i]}
	return resultado
end

def calcula_quadrado_x_intermediario
	x_intermediario = calcula_x_intermediario
	new_numbers = []
	new_numbers = x_intermediario.map do |number|
		number ** 2
	end
	return new_numbers
end

def calcula_media_ajuste_angular
	ajuste_angular = calcula_ajuste_angular
	somatorio = ajuste_angular.inject(0, :+)
	media = somatorio / 8
	return media
end

def calcula_media_quadrado_x_intermediario
	quadrado_x_intermediario = calcula_quadrado_x_intermediario
	somatorio = quadrado_x_intermediario.inject(0, :+)
	media = somatorio / 8
	return media
end


resultado_somatorio_x = calcula_somatorio($valores_x)
media_x = calcula_media(resultado_somatorio_x)

resultado_somatorio_y = calcula_somatorio($valores_y)
media_y = calcula_media(resultado_somatorio_y)

lista_y_linha = calcula_log_natural($valores_y)
resultado_somatorio_lny = calcula_somatorio(lista_y_linha)
media_y_linha = calcula_media(resultado_somatorio_lny)

puts media_y_linha



