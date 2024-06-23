var currentStep = 1;
var updateProgressBar;
function displayStep(stepNumber) {
    if (IsValidateForm()) {
        if (stepNumber >= 1 && stepNumber <= 3) {
            $(".step-" + currentStep).hide();
            $(".step-" + stepNumber).show();
            currentStep = stepNumber;
            updateProgressBar();
        }
    }
}

$(document).ready(function () {

    $('#multi-step-form').find('.step').slice(1).hide();

    $(".next-step").click(function () {
        if (IsValidateForm()) {
            if (currentStep < 3) {
                $(".step-" + currentStep).addClass("animate__animated animate__fadeOutLeft");
                currentStep++;
                setTimeout(function () {
                    $(".step").removeClass("animate__animated animate__fadeOutLeft").hide();
                    $(".step-" + currentStep).show().addClass("animate__animated animate__fadeInRight");
                    updateProgressBar();
                }, 500);
            }
        }
    });

    $(".prev-step").click(function () {
        if (IsValidateForm()) {
            if (currentStep > 1) {
                $(".step-" + currentStep).addClass("animate__animated animate__fadeOutRight");
                currentStep--;
                setTimeout(function () {
                    $(".step").removeClass("animate__animated animate__fadeOutRight").hide();
                    $(".step-" + currentStep).show().addClass("animate__animated animate__fadeInLeft");
                    updateProgressBar();
                }, 500);
            }
        }
    });

    updateProgressBar = function () {
        var progressPercentage = ((currentStep - 1) / 2) * 100;
        $(".progress-bar").css("width", progressPercentage + "%");
    }
});
$("#importerBtn").click(function () {
    $('#importerBtn').addClass('bg-primary text-white');
    $('#exporterBtn').removeClass('bg-primary text-white');

    SetExporterFieldsNull();
    //$("#formTitle").text("Register - Importer");
    $("input[name='Input.IsImporter']").val("true");
    $("input[name='Input.IsExporter']").val("false");
    $(".ImporterFields").show();
    $(".ExporterFields").hide();
    $("#formContainer").show();
    //$("#btnContainer").hide();
});
function SetImporterFieldsNull() {
    $('#Input_StateProvinceId').val('0');
    $('#Input_CompanyCountryId').val('0');
}
function SetExporterFieldsNull() {
    $('#Input_WilayaID').val('0');
}
$("#exporterBtn").click(function () {
    $('#exporterBtn').addClass('bg-primary text-white');
    $('#importerBtn').removeClass('bg-primary text-white');

    SetImporterFieldsNull();
    //$("#formTitle").text("Register - Exporter");
    $("input[name='Input.IsImporter']").val("false");
    $("input[name='Input.IsExporter']").val("true");
    $(".ImporterFields").hide();
    $(".ExporterFields").show();
    $("#formContainer").show();
    //$("#btnContainer").hide();
});
function IsValidateForm() {
    return $('#multi-step-form').valid();
}
$('.btn-reset').click(function () {
    $('#multi-step-form')[0].reset();
});