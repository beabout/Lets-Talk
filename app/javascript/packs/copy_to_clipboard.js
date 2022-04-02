// https://www.w3schools.com/howto/howto_js_copy_clipboard.asp

console.log("we are inside copy_to_clipboard")

window.copyToClipboard = function() {
  /* Get the text field */
  let inviteCode = document.getElementById('inviteCode');
  console.log(inviteCode);

  /* Copy the text inside the text field */
  navigator.clipboard.writeText(inviteCode.innerText);

  /* Alert the copied text */
  alert("Copied the text: " + inviteCode.innerText);
} 