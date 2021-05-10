
function redirectToderail(data)
{
    id = data.getAttribute('ids')
    projects = data.getAttribute('project')
    url = data.getAttribute('url')
    window.location.href = url+"/projects/"+projects+"/order/"+id;

}