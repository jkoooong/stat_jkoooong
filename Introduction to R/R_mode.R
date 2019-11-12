### Object Mode
#Numeric
a <- 3        # integer
b <- -100     # integer
c <- 0.34982  # double
mode(c)       # numeric ���

#Character
d <- "black_pink"
e <- "Hit you with that ddu-du ddu-du du"
f <- "3"
mode(f) # ���ڰ� ����ǥ �ȿ� �� �����Ƿ�, Character�� �ν�

#Logical
d <- "black_pink"       # ���� ����
d == "black_pink" # ���� d�� ���� black_pink���� Ȯ��, d = black_pink�̹Ƿ� TRUE ���
d == "Wannaone" # d = black_pink�̹Ƿ� FALSE ���


### Converting Object Mode
# ������ -> ������
f <- "3"
ff <- as.numeric(f)
mode(ff)
ff

# ������ -> logical
mode("TRUE")
t <- as.logical("TRUE")
t
mode(t)

### Bitwise Operators
TRUE & TRUE # TRUE
TRUE & FALSE # FALSE
TRUE | FALSE  # TRUE
FALSE | FALSE # FALSE


### ���� ���
obj<-50
#obj�� 50�� ������, �ٸ��� ���ϱ�
obj==50
obj!=50
#obj�� 30���� ū��, ������ ���ϱ�
obj>30
obj<30
#obj�� 40���� ũ��(and) 60���� ������ ���ϱ�
obj>40 & obj<60
#obj�� 40���� �۰ų�(or) 60���� ū�� ���ϱ�
obj<40 | obj>60


                