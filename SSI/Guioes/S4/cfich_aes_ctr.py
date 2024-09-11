import sys
import struct, os
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes


counter = 0

def setup(outfile):
    iv = os.urandom(32)
    with open(outfile, 'wb') as file:
        file.write(iv)
    
    
def encode(in_file,chave_file):
    global counter
    
    with open(chave_file, 'rb') as chave_file_read, open(in_file, 'rb') as in_file_read:
        chave = chave_file_read.read()
        mensagem = in_file_read.read()
        
    counter += 1
    iv = os.urandom(16)
    algorithm = algorithms.AES(chave)
    cipher = Cipher(algorithm,modes.CTR(iv))
    encryptor = cipher.encryptor()
    ct = encryptor.update(mensagem)
    with open(in_file + ".enc", 'wb') as out_f:
        out_f.write(iv)
        out_f.write(ct)
    pass

def decode(in_file,chave_file):
    global counter
    
    with open(chave_file, 'rb') as chave_file_read, open(in_file, 'rb') as in_file_read:
        chave = chave_file_read.read()
        iv = in_file_read.read(16)
        cifra = in_file_read.read()
    
    counter += 1
    algorithm = algorithms.AES(chave)
    cipher = Cipher(algorithm,modes.CTR(iv))
    decryptor = cipher.decryptor()
    mensagem = decryptor.update(cifra)
    
    with open(in_file + ".dec", 'wb') as out_f:
        out_f.write(mensagem)   
    pass

def main(inp):
    if (len(inp) < 3):
        print("Sem argumentos suficientes")
    else:
        if(inp[1]=='enc'):
            encode(inp[2],inp[3])
        if(inp[1]=='dec'):
            decode(inp[2],inp[3])
        if(inp[1]=='setup'):
            setup(inp[2])
            
# Se for chamada como script...
if __name__ == "__main__":
    main(sys.argv)