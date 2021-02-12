
function eventSaveModule()
{
    
    dataform = new FormData();
    dataform.append('codearticle', $("input[name='codearticle']").val())
    console.log(dataform)
    //sendAjaxrequeteSaveModule(data);
}


function sendAjaxrequeteSaveModule(data)
{
    dataform = new FormData();
    $.ajax({
        url : '/ajax/defxmlrequeteSlectform/'+id,
        type : 'POST',
        dataType : 'json',
        success : function(data){
            dataToObject = JSON.parse(data)
            addHtmlinputSelect(dataToObject);    
        
        },
    
        error : function(resultat, statut, erreur){
          
        },
    
        complete : function(resultat, statut){
    
        }
    
     });
}

$("#formModuleSave").submit(function(e){
    e.preventDefault();
});