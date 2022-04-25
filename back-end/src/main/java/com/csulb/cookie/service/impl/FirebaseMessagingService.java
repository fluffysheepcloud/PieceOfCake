//package com.csulb.cookie.service.impl;
//
//import com.csulb.cookie.bean.NoteData;
//import com.google.firebase.messaging.FirebaseMessaging;
//import com.google.firebase.messaging.FirebaseMessagingException;
//import com.google.firebase.messaging.Message;
//import com.google.firebase.messaging.Notification;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import java.util.HashMap;
//import java.util.Map;
//
//@Service
//public class FirebaseMessagingService {
//
//    FirebaseMessaging firebaseMessaging;
//
//
//    public String sendNotification(NoteData note, String topic) throws FirebaseMessagingException {
//
//        Notification notification = Notification
//                .builder()
//                .setTitle(note.getSubject())
//                .setBody(note.getContent())
//                .build();
//
//        Message message = Message
//                .builder()
//                .setTopic(topic)
//                .setNotification(notification)
//                .putAllData(note.getData())
//                .build();
//
//        return firebaseMessaging.send(message);
//    }
//
//    @Autowired
//    public void setFirebaseMessaging(FirebaseMessaging firebaseMessaging) {
//        this.firebaseMessaging = firebaseMessaging;
//    }
//
//}
