#valores de teste
$valores_x = [0, 8, 16, 24, 32, 40, 48, 56, 64]
$valores_y = [0.00001, 0.0000079, 0.0000062, 0.0000049, 0.0000038, 0.000003, 0.0000024, 0.0000019, 0.0000015]
$n = 9

def calcula_somatorio(lista_numeros)
	somatorio = lista_numeros.inject(0, :+)
	return somatorio
end

def calcula_media(lista_numeros)
	media = lista_numeros / $n
	return media
end

def calcula_log_natural(lista_numeros)
	new_numbers = []
	new_numbers = lista_numeros.map do |number|
		Math.log(number,Math::E)
	end
	return new_numbers
end

def calcula_valores_intermediarios(lista_numeros, media)
	new_numbers = []
	new_numbers = lista_numeros.map do |number|
		number - media
	end
	return new_numbers
end

def calcula_produto_matricial(lista_numeros_1, lista_numeros_2)
	resultado = lista_numeros_1.size.times.collect {|i| lista_numeros_1[i] * lista_numeros_2[i]}
	return resultado
end

def calcula_quadrado_lista(lista_numeros)
	new_numbers = []
	new_numbers = lista_numeros.map do |number|
		number ** 2
	end
	return new_numbers
end

def calcula_divisao(x, y)
	resultado_divisao = x / y
	return resultado_divisao
end

def calcula_exponencial(numero)
	exponencial = Math::E ** numero
	return exponencial
end

resultado_somatorio_x = calcula_somatorio($valores_x)
media_x = calcula_media(resultado_somatorio_x)

resultado_somatorio_y = calcula_somatorio($valores_y)
media_y = calcula_media(resultado_somatorio_y)

lista_y_linha = calcula_log_natural($valores_y)
resultado_somatorio_lny = calcula_somatorio(lista_y_linha)
media_y_linha = calcula_media(resultado_somatorio_lny)

valores_intermediarios_x = calcula_valores_intermediarios($valores_x, media_x)
produto_matricial = calcula_produto_matricial(valores_intermediarios_x, lista_y_linha)
somatorio_produto_matricial = calcula_somatorio(produto_matricial)

quadrado_valores_intermediarios_x = calcula_quadrado_lista(valores_intermediarios_x)
somatorio_quadrado_valores_intermediarios_x = calcula_somatorio(quadrado_valores_intermediarios_x)

a_linha = calcula_divisao(somatorio_produto_matricial, somatorio_quadrado_valores_intermediarios_x)
b_linha = media_y_linha - a_linha * media_x
a = a_linha
b = calcula_exponencial(b_linha)

puts a
puts b



