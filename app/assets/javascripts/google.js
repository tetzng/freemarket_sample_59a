function validateRecaptcha ( code ) {
  if ( !!code ) {
    var form = document.querySelector('.recaptcha');
    form.removeAttribute('disabled');
  }
}