# Encrypt method
#INPUT ask user for input -String
#shift letters of string to the next position
#OUTPUT letters shifted -String . lowercase
def encrypt_loop(encrypt)
    index = 0
    while index < encrypt.length
        if encrypt[index] != " "
            encrypt[index] = encrypt[index].next
            index += 1
        else
            index+=1
        end
    end
    p encrypt
end

def decrypt_loop(decrypt)
    new_string = ""
    i = 0
    #iderate through the String
    while i < decrypt.length
        if decrypt[i] != " "
            # get the index of the alphabet String
            str ="abcdefghijklmnopqrstuvwxyz"
            new_value = str.index(decrypt[i])
            #change to the new letter
            new_value =new_value -1
            str[new_value]
            #add letter to new string
            new_string = new_string + str[new_value]
            i += 1
        else
            new_string = new_string + " "
            i += 1
        end
    end
    p new_string
end

decrypt_loop(encrypt_loop("swordfish"))
