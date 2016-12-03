class CalibrationController < ApplicationController
	
	$valores_y = [0.05, 0.010, 0.015, 0.020, 0.025, 0.030, 0.040, 0.050, 0.060]
	$n = 9

	def index
		print "\n\n\n\n\n$$$$$$$$$$$$$$$"
		print params
	end

	def create
		valores_x = []
		valores = params[:calibration]
		valores.each do |chave, valor|
			if valor != ""
				valores_x.append(valor)
			end
		end
		puts valores_x.inspect
		return valores_x
	end

	def calibration
		valores_x = create
		resultado_somatorio_x = calcula_somatorio(valores_x)
		media_x = calcula_media(resultado_somatorio_x)

		resultado_somatorio_y = calcula_somatorio($valores_y)
		media_y = calcula_media(resultado_somatorio_y)

		lista_y_linha = calcula_log_natural($valores_y)
		resultado_somatorio_lny = calcula_somatorio(lista_y_linha)
		media_y_linha = calcula_media(resultado_somatorio_lny)

		valores_intermediarios_x = calcula_valores_intermediarios(valores_x, media_x)
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
	end

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
end
