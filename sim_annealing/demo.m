function [] = demo()
%% Simulated Annealing 
% for finding the global optimum of a peaky 2D surface
% based on Kevin Murphy's saDemoPeaks

clear all; close all;
rng('default');
findMAX = true;

%% generate data
[XX, YY]=meshgrid(1:49,1:49);
Z = peaks; % 49x49 surface
m = min(Z(:));
Zpos = Z+abs(m)+1;

% plot the surface at different temperatures
temps = [1.5, 1, 0.2];
for ti=1:length(temps)
    t = temps(ti);
    Zt = Zpos.^(1/t);
    figure;
    surf(XX,YY,Zt); title(sprintf('temp %5.3f', t));
    xlabel('x'); ylabel('y')    
    if 1
    figure;
    imagesc(Zt); axis xy;
    colorbar; title(sprintf('temp %5.3f', t));    
    end
end

%% find optimum by exhaustive search
M = max(Z(:)); % 8.0752
[row,col] = find(Z==M); % max  row 38, col 25
fprintf('max =%5.3f at r=%d,c=%d\n', M, row, col);
M = min(Z(:)); % -6.54566
[row,col] = find(Z==M); % min  row 12, col 27
fprintf('min =%5.3f at r=%d,c=%d\n', M, row, col);

%% simulated annealing
% initial state is in middle of grid
xinit = [25,25];
Sigma_prop = 2^2 * eye(2);
Nsamples  = 1000;
opts = struct(...
    'proposal', @(x) (x+(gaussSample(zeros(2,1), Sigma_prop, 1))), ...
    'maxIter', Nsamples, ...
    'minIter', Nsamples, ...
    'temp', @(T,iter) (0.995*T), ...
    'verbose', 0);

[xopt, fval, samples, energies, acceptRate, temp] = simAnneal(@target, xinit, opts);

xopt
fval

%% generate plots
figure; plot(temp); title('temperature vs iteration');
figure; plot(energies); title('energy vs iteration')

% plot the histogram of samples
N_bins = 20;
Nsamples = size(samples, 1);
Ns = round(linspace(100, Nsamples, 3));
for i=1:length(Ns)
    T = Ns(i);
    figure;
    hist3(samples(1:T,:), [N_bins N_bins], 'FaceAlpha', 0.65);
    xlabel('x'); ylabel('y')
    title(sprintf('iter %d, temp %5.3f', T, temp(T)));
    set(get(gca, 'child'), 'FaceColor', 'interp', 'CDataMode', 'auto');
    
    if 1
    figure;
    hh= hist3(samples(1:T,:), [N_bins N_bins]);
    imagesc(hh'); axis xy;  colorbar;
    title(sprintf('iter %d, temp %5.3f', T, temp(T)));
    end
end


%% peaks target
function p = target2(xy)
    x = xy(1); y = xy(2);
    p =  3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) ...
         - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) ...
         - 1/3*exp(-(x+1).^2 - y.^2);
    if findMAX, p = -p; end
end

function  p = target(x)
    if findMAX
        Z = -peaks;
    else
        Z = peaks;
    end
    r = round(x(1)); c = round(x(2));
    if r >= 1 && r <= size(Z,1) && c >= 1 && c <= size(Z,2)
        p = Z(r,c);
    else
        p = inf; % invalid
    end
end

end
