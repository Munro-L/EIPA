nx = 50;
ny = 50;
G = zeros(nx*ny, nx*ny);
for i = 1:nx
    for j = 1:ny
        n = j + (i - 1) * ny;
        nxm = j + (i - 2) * ny;
        nxp = j + i * ny;
        nyp = (j + 1) + (i - 1) * ny;
        nym = (j - 1) + (i - 1) * ny; 
        if i == 1 || i == nx || j == 1 || j == ny
            G(n, n) = 1;
        elseif i > 10 && i < 20 && j > 10 && j < 20
            G(n, n) = -2;
            G(n, nxm) = 1;
            G(n, nxp) = 1;
            G(nyp, n) = 1;
            G(nym, n) = 1;
        else      
            G(n, n) = -4;
            G(n, nxm) = 1;
            G(n, nxp) = 1;
            G(nyp, n) = 1;
            G(nym, n) = 1;
            
        end
    end
end

spy(G)
[E, D] = eigs(G, 9, 'SM');

for solution = 1:9
    i = 1;
    j = 1;
    map = zeros(nx,ny);
    for count = 1:nx*ny
        map(i, j) = E(count, solution);
        if j == 50
            j = 1;
            i = i + 1;
        else
            j = j + 1;
        end
    end
    figure(solution)
    surf(map)
end
