function [T,N,B,kappa,tau] = TNB(x,y,z)
	
	if(nargin == 2)
		z = zeros(size(x));
	end
	
	dr = [gradient(x(:)) , gradient(y(:)) , gradient(z(:))];
	ds = sum(dr.^2,2).^(0.5); % Arc length associated with each point. ||dr||.
	
	T = dr ./ ds; % Unit tangent vector.
	
	dT = [gradient(T(:,1)) , gradient(T(:,2)) , gradient(T(:,3))]; % T'(t).
	dTds = dT ./ ds;
	
	kappa = sum((dT./ds).^2,2).^(0.5);
	
	N = dTds ./ kappa; % Unit normal vector.
	
	B = cross(T,N); % Unit bi-normal vector.
	
	dB = [gradient(B(:,1)) , gradient(B(:,2)) , gradient(B(:,3))];
	
	tau = dot(-dB./ds,N,2); % Torsion.
end