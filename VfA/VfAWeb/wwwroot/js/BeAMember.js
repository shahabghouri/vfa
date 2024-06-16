function validateForm() {
    debugger;
    var form = $('#multi-step-form');
    $.validator.unobtrusive.parse(form);
    var validate = form.validate().form();
}