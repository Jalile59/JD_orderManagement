
class Paginationmanager


  def paginationOrders(projectId ,page, limitByPage=30)

    setOffset = (page-1) * limitByPage

    if projectId.eql?('all')
      return order = Order.limit(limitByPage).offset(setOffset)
    else
      return order = Order.where(project: projectId).limit(limitByPage).offset(setOffset)
    end
  end

  def pageMax(projectid, limitBypage =30)

    if projectid.eql?('all')
      orderQuantity = Order.count
    else
       orderQuantity = Order.where(project: projectid).count
    end

    return ((orderQuantity / limitBypage).round(half: :up)) +1
  end


end
