
function fileupdataInInput(data){
    id = data['value'];
    if(id)
    {
    ajxfunctionGetData(id)

    }else{
        console.log('id null');
    }
    initField();
}



function addHtmlinputSelect(data){

    //console.log(document.getElementById('device'));
    console.log(data);
    
     $("[data=codearticle]").val(data['id']);
     $("[data=name]").val(data['id']);
     $("[data=designation]").val(data['id']);
}

function initField()
{
     $("[data=codearticle]").val($("[data=codearticle] option:first"));
     $("[data=name]").val($("[data=name] option:first"));
     $("[data=designation]").val($("[data=codearticle] option:first"));
}

function addinputElement()
{
    indice = Date.now();

    dataCodeArticle = $("[data=codearticle]").find(":selected").text();
    dataName = $("[data=name]").find(":selected").text()
    dataQuantity = $("[data=quantity]").val();

    elem = "<div id="+indice+" style='margin-top: 15px' class='row'> <div class='col-3'> <input class='form-control' type='text' name='codearticle[]' value="+ dataCodeArticle+" readonly> </div><div class='col-3'> <input class='form-control' type='text' name='name[]' value="+dataName+" readonly> </div> <div class='col-3'> <input class='form-control' type='number' value='"+ dataQuantity+ "' placeholder='Quantity' name='quantity[]' readonly> </div> <div class='col-3'> <input class='form-control' type='text' placeholder='Indiquez numéro de serie' name='serial[]'> </div> <div class='col-1'><button type='button' onclick='removeDiv("+ indice+")'>-</button> </div> </div> ";
    $('#inputs').append(elem);

}

function ajxfunctionGetData(id, idproject)
{

    $.ajax({
        url : '/ajax/defxmlrequeteSlectform/'+id,
        type : 'GET',
        dataType : 'html',
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

function removeDiv(id)
{
    $('#'+id).remove();

}
