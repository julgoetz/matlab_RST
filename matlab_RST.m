% If an error "package is missing" occurs, run "pkg load control" in the command window.

% Clean up
close all
clear


% User input:
% Define the transfer function G(s)
s = tf('s');
G = 12 / (4 * (2*s+1) * ((5/4) * s + 1));
% End of user input


% Transfer function G(s)
disp("Transfer function:");
G


% Preset options
opts = bodeoptions('cstprefs');
opts.PhaseWrapping = 'on';
bode(G, opts);

% Feedback of G(s) with K=1
G_fb = feedback(G, 1);
disp("Feedback function:")
G_fb

% Step response
figure;
step(G_fb);
grid on;

% Nyquist plot
figure;
nyquist(G);

% Root locus plot
figure;
rlocus(G);

% Pole-zero map
figure;
pzmap(G);

% Damping factor and poles
damp(G);

% Zeros
disp("Zeros:");
disp(zero(G));