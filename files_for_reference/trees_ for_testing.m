%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

alphabet = 3;

t1 = {0 , 2 , [0 1], [1 1]};

e = 0.25;

PM = zeros(size(t1,2),alphabet);

PM(1,2 )= 1;
PM(2,1)= 1;
PM(3, 2)= e; PM(3, 3)= 1-e;
PM(4, 1)= 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t2 = {0 , 2, [0 0 1], [1 0 1], [2 0 1], [1 1]};

e = 0.25;

PM(1,1) = e; PM(1,2) = 1 - e;
PM(2,1) = 1;
PM(3,1) = 1;
PM(4,2) = 1;
PM(5,2) = 1;
PM(6,3) = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alphabet = 3;

t3 = {[ 0 0], [1 0], [2 0], 1, [0 2], [1 2], [2 2]};

e = 0.2;

PM = zeros(size(t1,2),alphabet);

PM(1,2) = 1;
PM(2,3) = 1;
PM(3,1) = 1;
PM(4,1) = 1- e; PM(4,3) = e;
PM(5,3) = 1;
PM(6,1) = 1;
PM(7,2) = 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

alphabet = 3;

t4 = {0 , [0 1] , [2 1], 2};

e = 0.2;

PM = zeros(size(t4,2),alphabet);

PM(1,1)= 1-e; PM(1,2 )= e;
PM(2,3)= 1;
PM(3, 1)= 1; 
PM(4, 2)= e; PM(4, 3)= 1-e;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

alphabet = 3;

t5 = {2, [2 1], [2 0], [1 0], [0 1], [2 0 0], [1 0 0], [0 0 0]};

e = 0.2;

PM = zeros(size(t5,2),alphabet);

PM(1,1 )= e;PM(1,2 )= 1-e;
PM(2,1)= 1;
PM(3, 1)= 1; 
PM(4, 1)= e; PM(4, 2)= 1-e;
PM(5, 3)= 1;
PM(6, 1)= e; PM(6, 2)= 1-e;
PM(7, 3)= 1;
PM(8, 3)= 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

alphabet = 3;

t6 = {2 , [2 1], [2 0], [1 1], [1 0], [0 1], [0 0]};

e = 0.2;

PM = zeros(size(t6,2),alphabet);

PM(1,1 )= e;PM(1,2 )= 1- e;
PM(2,1)= e;PM(2,2 )= 1-e;
PM(3, 1)= e; PM(3,2 )= 1-e;
PM(4, 3)= 1;
PM(5, 3)= 1;
PM(6, 3)= 1;
PM(7, 3)= 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% tree 7

alphabet = 3;

t7 = {0, [0 1], [1 1], [2 1], 2};

e = 0.2;

PM = zeros(size(t7,2),alphabet);

PM(1,1 )= e/2 ;PM(1,2 )= 1-e; PM(1,3 )= e/2;
PM(2,2 )= 1; 
PM(3, 1)= 1; 
PM(4, 1)= 1;
PM(5,2 )= 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% tree 8

alphabet = 3;

t8 = {0, 1, [0 2], [1 2], [2 2]};

e = 0.2;

PM = zeros(size(t8,2),alphabet);

PM(1,1 )= 0.1;PM(1,2 )= 0.8;PM(1,3 )= 0.1;
PM(2,1 )= 1-e; PM(2,3 )= e; 
PM(3,1 )= e/2;PM(3,2 )= 1-e;PM(3,3 )= e/2;
PM(4,1 )= 1-e; PM(4,3 )= e; 
PM(5,1 )= e/2;PM(5,2 )= 1-e;PM(5,3 )= e/2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%