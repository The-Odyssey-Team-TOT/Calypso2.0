document.addEventListener('turbo:load', () => {
  const messageForm = document.getElementById('message_form');
  const messageContent = document.getElementById('message_content');

  if (messageForm && messageContent) {
    messageContent.addEventListener('keydown', (event) => {
      if (event.key === 'Enter' && !event.shiftKey) {
        event.preventDefault();
        messageForm.submit();
      }
    });
  }
});
