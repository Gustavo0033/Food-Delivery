//
//  ProfileViewController.swift
//  Food Delivery
//
//  Created by Gustavo Mendonca on 23/04/24.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage
import FirebaseStorageUI


class ProfileViewController: UIViewController {
    
    @IBOutlet weak var btnValidarNumero: UIButton!
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var labelTelefone: UILabel!
    
    var firestore: Firestore!
    var idUsuario: String!
    var auth: Auth!
    var imagePicker = UIImagePickerController()
    var storage: Storage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        firestore = Firestore.firestore()
        auth = Auth.auth()
        storage = Storage.storage()
        
        if let id = auth.currentUser?.uid{
            self.idUsuario = id
            
            recuperarDadosUser()
        }
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Recuperando os dados do usuário e mostrando na tela
    func recuperarDadosUser(){
        let usuarioRef = self.firestore.collection("usuarios").document(idUsuario)
        
        usuarioRef.getDocument { snapshot, erro in
            if let dados = snapshot?.data(){
                let nomeUsuario = dados["Nome"] as? String
                let emailUsuario = dados["Email"] as? String
                let telefoneUsuario = dados["Telefone"] as? String
                
                
                self.labelNome.text = nomeUsuario
                self.labelEmail.text = emailUsuario
                self.labelTelefone.text = telefoneUsuario
                
                //recuperando a foto do perfil do usuárop
                if let urlImagem = dados["urlImagem"] as? String{
                    self.imageProfile.sd_setImage(with: URL(string: urlImagem), completed: nil)
                    
                }
            }
        }
    }
    
    
    @IBAction func btnUploadPhoto(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
}



//MARK: - Fazendo o upload da imagem no Firebase
extension ProfileViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    //selecionando a mostrando a imagem do perfil
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        
        let imagemRecuperada = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.imageProfile.image = imagemRecuperada
        imagePicker.dismiss(animated: true)
        
        let imagens = storage.reference().child("imagens")
        
        //configurando para fazer o upload
        if let imagemUpload = imagemRecuperada.jpegData(compressionQuality: 0.5){
            if let usuarioLogado = auth.currentUser{
                let idUsuario = usuarioLogado.uid
                
                let nomeImagem = "\(idUsuario).jpg"
                
                
                let imagePerfilRef = imagens.child("perfil").child(nomeImagem)
                imagePerfilRef.putData(imagemUpload, metadata: nil){
                    (metaData, error) in
                    
                    if error == nil{
                        imagePerfilRef.downloadURL { url, error in
                            if let urlImagem = url?.absoluteString{
                                self.firestore.collection("usuarios").document(idUsuario).updateData(["urlImagem":urlImagem])
                                print("Sucesso ao realizar o upload da sua imagem!")
                            }
                        }
                    }else{
                        print("Erro ao realizar o upload da sua imagem.")

                    }
                }
            }
        }
    }
}



