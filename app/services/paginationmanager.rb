
class Paginationmanager


  def paginationOrders(projectId ,page, limitByPage=30)

    setOffset = (page-1) * limitByPage

    if projectId.eql?('all')
      return order = OrderTrack.limit(limitByPage).offset(setOffset)
    else
      return order = OrderTrack.where(project: projectId).limit(limitByPage).offset(setOffset)
    end
  end

  def pageMax(projectid, limitBypage =30)

    if projectid.eql?('all')
      orderQuantity = OrderTrack.count
    else
       orderQuantity = OrderTrack.where(project: projectid).count
    end

    return ((orderQuantity / limitBypage).round(half: :up)) +1
  end


end
