//
//  ScanBarcode.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/03/16.
//
//  JIN
//
//
//

import SwiftUI
import AVFoundation

struct BarcodeScannerView: UIViewControllerRepresentable{
    class Coordinator: NSObject, AVCaptureMetadataOutputObjectsDelegate{
        var parent: BarcodeScannerView
        
        init(parent: BarcodeScannerView){
            self.parent = parent
        }
        func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection){
            if let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
               let stringValue = metadataObject.stringValue{
                DispatchQueue.main.async{
                    self.parent.scannedCode = stringValue
                }
            }
        }
    }
    
    @Binding var scannedCode: String?
    
    func getCamera(position: AVCaptureDevice.Position) -> AVCaptureDevice?{
        if let ultraWideCamera = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInUltraWideCamera],
                                                                  mediaType: .video,
                                                                  position: position).devices.first{
            return ultraWideCamera
        }
        
        return AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInUltraWideCamera],
                                           mediaType: .video,
                                           position: position).devices.first
    }
    
    func makeCoordinator() -> Coordinator{
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController{
        let viewController = UIViewController()
        let captureSession = AVCaptureSession()
        
        let videoCaptureDevice = getCamera(position: .back) ?? AVCaptureDevice.default(for: .video)
        guard let device = videoCaptureDevice else { return viewController }
        
        let videoInput: AVCaptureDeviceInput
                
                do{
                    videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice!)
                } catch{
                    return viewController
                }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        if captureSession.canAddOutput(metadataOutput){
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(context.coordinator, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr, .code39,.ean13,.upce,.code39Mod43,.ean13,.ean8,.code93,.pdf417,.aztec,.interleaved2of5,.itf14,.dataMatrix,.code128]
        }
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = viewController.view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        viewController.view.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
        
        return viewController
    }
    
    func updateUIViewController(_ uiVIewController: UIViewController, context: Context){}
}


