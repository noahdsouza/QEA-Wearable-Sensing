function output = ma_filter(window,data)
%{
window is an odd integer representing the moving average's window size
data is the column vector that is to be filtered
%}
    win = [];
    output = zeros(1,length(data));
    for n = 1:length(data)
        for k = ((window-1)/2)
            try
                pn = data(n+k)*(1/window);
            catch
                pn = 0;
            end
            
            try
                mn = data(n-k)*(1/window);
            catch
                mn = 0;
            end
            win = [win,pn+mn];
        end
        output(n) = sum(win)+data(n);
    end
end