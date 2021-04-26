
function redirectToderail(data)
{
    id = data.getAttribute('ids')
    projects = data.getAttribute('project')
    window.location.href = "http://89.83.75.145:3000//projects/"+projects+"/order/"+id;

}