var currentStep = 1;
var updateProgressBar;

function displayStep(stepNumber) {
    if (stepNumber >= 1 && stepNumber <= 3) {
        $(".step-" + currentStep).hide();
        $(".step-" + stepNumber).show();
        currentStep = stepNumber;
        updateProgressBar();
    }
}

$(document).ready(function () {
    $('#multi-step-form').find('.step').slice(1).hide();

    $(".next-step").click(function () {
        validateForm();
        if (currentStep < 3) {
            $(".step-" + currentStep).addClass("animate__animated animate__fadeOutLeft");
            currentStep++;
            setTimeout(function () {
                $(".step").removeClass("animate__animated animate__fadeOutLeft").hide();
                $(".step-" + currentStep).show().addClass("animate__animated animate__fadeInRight");
                updateProgressBar();
            }, 500);
        }
    });

    $(".prev-step").click(function () {
        validateForm();
        if (currentStep > 1) {
            $(".step-" + currentStep).addClass("animate__animated animate__fadeOutRight");
            currentStep--;
            setTimeout(function () {
                $(".step").removeClass("animate__animated animate__fadeOutRight").hide();
                $(".step-" + currentStep).show().addClass("animate__animated animate__fadeInLeft");
                updateProgressBar();
            }, 500);
        }
    });

    updateProgressBar = function () {
        var progressPercentage = ((currentStep - 1) / 2) * 100;
        $(".progress-bar").css("width", progressPercentage + "%");
    }
});
$("#importerBtn").click(function () {
    $("#formTitle").text("Register - Importer");
    $("input[name='Input.IsImporter']").val("true");
    $("input[name='Input.IsExporter']").val("false");
    $(".ImporterFields").show();
    $(".ExporterFields").hide();
    $("#formContainer").show();
    $("#btnContainer").hide();
});

$("#exporterBtn").click(function () {
    $("#formTitle").text("Register - Exporter");
    $("input[name='Input.IsImporter']").val("false");
    $("input[name='Input.IsExporter']").val("true");
    $(".ImporterFields").hide();
    $(".ExporterFields").show();
    $("#formContainer").show();
    $("#btnContainer").hide();
});
function validateForm() {
    var form = $('#multi-step-form');
    $.validator.unobtrusive.parse(form);
    var validate = form.validate().form();
}