//
//  CameraViewController.swift
//  Day4 - Snapchat Menu
//
//  Created by 刘乙灏 on 2017/4/17.
//  Copyright © 2017年 刘乙灏. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationBarDelegate {

    @IBOutlet weak var caneraView: UIView!
    @IBOutlet weak var tempImageView: UIImageView!

    
    var captureSession: AVCaptureSession?
    var stillImageOutput: AVCaptureStillImageOutput?
    var previewLayout: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        let backCamera = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        var error: NSError?
        var input: AVCaptureDeviceInput!
    
        do {
            input = try AVCaptureDeviceInput(device: backCamera)
        } catch let error1 as NSError {
            error = error1
            input = nil
        }
        
        if (error == nil && captureSession?.canAddInput(input) != nil) {
            captureSession?.addInput(input)
            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput?.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
            
            if captureSession?.canAddOutput(stillImageOutput) != nil {
                captureSession?.addOutput(stillImageOutput)
                
                previewLayout = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayout?.videoGravity = AVLayerVideoGravityResizeAspect
                previewLayout?.connection.videoOrientation = AVCaptureVideoOrientation.portrait
                caneraView.layer.addSublayer(previewLayout!)
                captureSession?.startRunning()
            }
        }
        
        previewLayout?.frame = caneraView.bounds
        // Do any additional setup after loading the view.
    }

    func didPreTakePhoto() {
        if let videoConnection = stillImageOutput?.connection(withMediaType: AVMediaTypeVideo) {œ
            videoConnection.videoOrientation = AVCaptureVideoOrientation.portrait
            stillImageOutput?.captureStillImageAsynchronously(from: videoConnection, completionHandler: {
                (sampleBuffer, error) in
                if sampleBuffer != nil {
                    let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
                    let dataProvider = CGDataProvider(data: imageData! as CFData)
                    let cgImageRef = CGImage(jpegDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: CGColorRenderingIntent.defaultIntent)
                    
                    let image = UIImage(cgImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.right)
                    
                    
                    self.tempImageView.image = image
                    self.tempImageView.isHidden = false
                }
            })
        }
    }
    
    var didTakePhoto = Bool()
    
    func didPressTakeAnother(){
        if didTakePhoto == true {
            tempImageView.isHidden = true
            didTakePhoto = false
        }
        else {
            captureSession?.startRunning()
            didTakePhoto = true
            didPreTakePhoto()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        didPressTakeAnother()
    }
    
}
