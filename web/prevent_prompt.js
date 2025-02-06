let deferredPrompt;

window.addEventListener('beforeinstallprompt', (e) => {
  // Prevent the mini-infobar from appearing on mobile
  e.preventDefault();
  // Stash the event so it can be triggered later if needed
  deferredPrompt = e;
  // Optionally, you can log or handle the prompt here if needed
});
