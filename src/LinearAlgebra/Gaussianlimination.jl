"""
INPUT: Número de equações ou variáveis (n), a matriz A e o vetor coluna b,
A=[A,b]

OUTPUT: Solução x_1, x_2, ..., x_n := x do sistema Ax=b
"""

function solve_system(matrix_A::Matrix{Float64}, vector_b::Vector{Float64})

    n_digits=8
    
    n = length(vector_b)

    dimension_faiture(matrix_A,n) && return

    A = [copy(matrix_A) copy(vector_b)]

    for i=1:n-1 #Step 1

        #Step 2: Tome p o menor inteiro em [i,n] tal que a_pi !=0
        
        p = i
        msg_erro = false

        for k=i:n

            if round(A[k,i], digits= n_digits) !=0
                p=k
                break
            end

            if k==n
                msg_erro = true
            end
        end
        
        if msg_erro
            println("Sistema não admite única solução")
            return
        end

        #Step 3 se p != 1 então E_p <-> E_i
        if p != i
            v = copy(A{p,:})
            A[p,:] = A[i,:]
            A[i,:] = v
        end

        #Step 4 atualização das linhas
        for j = i+1:n
            m = A[j,i]/A[i,i] #Step 5

            #Step 6: E_j - m E_1 -> E_j

            A[j,:] = A[j,:]-m*A[i,:]
        end
    end

    #Step 7
    if round(A[n,n], digits=n_digits) == 0
        println("Sistema não admite única solução")
        return
    end

    #Step 8
    x = Vector{Float64}(undef,n)
    x[n]=A[n, n+1]/ A[n,n]

    #Step 9 subbstituição reversa
    for i = n-1:-1:1
        soma=0
        for j = i+1:n
            soma += A[i,j]*x[j]
        end

        x[i]=(A[1,n+1] - soma)/A[i,i]
    end

    return x
    
end




function dimension_faiture(A::Matrix{Float64}, number_of_variables::Int64)

    if number_of_variables != size(A)[1]
       printinln("O tamanho da matriz A e do vetor b são incompatíveis")
       return true
    end
    if size(A)[1] != size(A)[2]
       println("Matriz A precisa ser quadrada")
       return true
    end
    return false
end
