function toggleHeart(button) {
    button.classList.toggle('active');
    const heartIcon = button.querySelector('.bi-heart');
    // Toggle between outline and filled heart icons
    heartIcon.classList.toggle('bi-heart-fill', button.classList.contains('active'));
    }

function toggleSave(button) {
button.classList.toggle('active');
const saveIcon = button.querySelector('.bi-bookmark');

// Toggle between outline and filled save icons
saveIcon.classList.toggle('bi-bookmark-fill', button.classList.contains('active'));
}