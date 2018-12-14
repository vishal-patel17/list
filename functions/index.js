const functions = require('firebase-functions');
// The Firebase Admin SDK to access the Firebase Realtime Database.
const admin = require('firebase-admin');
admin.initializeApp();

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });

exports.createItem = functions.firestore.document('shopping_list/{shopping_listID}').onCreate((snap, context) => {
    const newValue = snap.data();

    const name = newValue.name;

    const payload = {
        notification: {
            title: 'List',
            body: name + ' Added',
            badge: '1',
            sound: 'default'
        }
    }
    return admin.messaging().sendToTopic('shopping_list', payload);
});

exports.deleteItem = functions.firestore.document('shopping_list/{shopping_listID}').onDelete((snap, context) => {
    const deletedValue = snap.data();

    const name = deletedValue.name;


    const payload = {
        notification: {
            title: 'List',
            body: name + ' Deleted',
            badge: '1',
            sound: 'default'
        }
    }
    return admin.messaging().sendToTopic('shopping_list', payload);
});

exports.createTask = functions.firestore.document('task_list/{task_listID}').onCreate((snap, context) => {
    console.log('onCreate');
    const newValue = snap.data();

    const name = newValue.name;

    const payload = {
        notification: {
            title: 'List',
            body: 'New Task: ' + name,
            badge: '1',
            sound: 'default'
        }
    }
    return admin.messaging().sendToTopic('task_list', payload);
});

exports.deleteTask = functions.firestore.document('task_list/{task_listID}').onDelete((snap, context) => {
    const deletedValue = snap.data();

    const name = deletedValue.name;


    const payload = {
        notification: {
            title: 'List',
            body: 'Completed Task: ' + name,
            badge: '1',
            sound: 'default'
        }
    }
    return admin.messaging().sendToTopic('task_list', payload);
});
