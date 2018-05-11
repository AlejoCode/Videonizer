var facebookProfile = {
    name: "Alejandro",
    friends: 8,
    messages:[],
    postMessage: function(message) {
        facebookProfile.messages.push(message);
    },
    deleteMessage: function(index) {
        facebookProfile.messages.splice(index,1);
    },
    addFriend: function() {
        facebookProfile.friends++;
    },
    removeFriend: function() {
        facebookProfile.friends--;
    }
};