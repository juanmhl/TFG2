function [r, error] = resolver_inecuacion(A,B,C,invertir,mayorQue,lims)
%This function solves for inequations of the form A·cos(th)-B·sin(th) >= C
%and returns the range of th in which the inequation is met, asuring it
%belongs at least partialy to lims.

    ALPHA = atan2(B,A);
    error = 0;
    
    % No hay solucion a la inecuacion si:
    if ( norm(C/sqrt(A^2+B^2)) > 1 )
        % Probamos si se cumple la inecuacion para un punto cualquiera
        phi = -pi/2;

        if(mayorQue)    % El signo de la inecuacion es >=
            if ( A*cos(phi)-B*sin(phi) > C )    % Si cumple para todo angulo
                r = [0, 2*pi];
            else                                % No cumple para ningun angulo
                r = [0, 0];
                error = -1;     % Flag que señaliza que no hay solucion posible
            end
        else            % El signo de la inecuacion es <=
            if ( A*cos(phi)-B*sin(phi) < C )    % Si cumple para todo angulo
                r = [0, 2*pi];
            else                                % No cumple para ningun angulo
                r = [0, 0];
                error = -1;     % Flag que señaliza que no hay solucion posible
            end
        end
        
    else 
        % En caso de haber solucion se encuentran 2
        s1 = wrapTo2Pi (acos(   C/sqrt(A^2+B^2)) - ALPHA );
        s2 = wrapTo2Pi (-acos(C/sqrt(A^2+B^2)) - ALPHA );
        sols = sort([s1, s2]);
    
        % Probamos con el valor del medio a ver si cumple
        phi = mean(sols);
        
        if mayorQue     % El signo de la inecuacion es >=
            if ~invertir
                if ( (A*cos(phi)-B*sin(phi) > C) )    % Si cumple para ese angulo
                    r = [sols(1), sols(2)];
                else                                % No cumple para ese angulo
                    r = realinarRango(sols, lims);
                end
            elseif invertir
                if ( (A*cos(phi)-B*sin(phi) < C) )    % Si cumple para ese angulo
                    r = [sols(1), sols(2)];
                else                                % No cumple para ese angulo
                    r = realinarRango(sols, lims)
                end
            end
        else            % El signo de la inecuacion es <=
            if ~invertir
                if ( (A*cos(phi)-B*sin(phi) < C) )    % Si cumple para ese angulo
                    r = [sols(1), sols(2)];
                else                                % No cumple para ese angulo
                    r = realinarRango(sols, lims)
                end
            elseif invertir
                if ( (A*cos(phi)-B*sin(phi) > C) )    % Si cumple para ese angulo
                    r = [sols(1), sols(2)];
                else                                % No cumple para ese angulo
                    r = realinarRango(sols,lims)
                end
            end
        end
    
    end

end


function r = realinarRango(sols, lims)
    % Esta funcion devuelve el rango, cuando da la vuelta por fuera de la
    % circunferencia, y remapea de [0 2pi] a [0 4pi] o a [-2pi 2pi] segun
    % convenga de forma que el rango de salida r tenga interseccion no nula
    % con el rango limite lims. En esta aplicacion se esta usando el tercer
    % cuadrante como rango lims pero se mete desde fuera.
    if (sols(2) < lims(2))
        r = [sols(2), sols(1)+2*pi];
    else
        r = [sols(2)-2*pi, sols(1)];
    end
end