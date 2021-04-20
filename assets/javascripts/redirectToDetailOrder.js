
function redirectToderail(data)
{
    id = data.getAttribute('ids')
    projects = data.getAttribute('project')
    window.location.href = "http://192.168.1.26:3000/projects/"+projects+"/order/"+id;

}