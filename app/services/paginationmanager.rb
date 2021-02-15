
class Paginationmanager


  def paginationOrders(projectId ,page, limitByPage=30)

    setOffset = (page-1) * limitByPage

    if projectId.eql?('all')
      return order = Order.limit(limitByPage).offset(setOffset)
    else
      return order = Order.where(project: projectId).limit(limitByPage).offset(setOffset)
    end
  end

  def pageMaxOrders(projectid, limitBypage =30)
    if projectid.eql?('all')
      orderQuantity = Order.count
    else
       orderQuantity = Order.where(project: projectid).count
    end

    return ((orderQuantity / limitBypage).round(half: :up)) +1
  end

  def paginationDevices(page, limitByPage=30)

    setOffset = (page-1) * limitByPage
    return order = Device.limit(limitByPage).offset(setOffset)

  end

  def pageMaxDevice(limitBypage =30)

      orderQuantity = Device.count
    
    return ((orderQuantity / limitBypage).round(half: :up)) +1
  end

  def paginationAddresses(page, limitByPage=30)

    setOffset = (page-1) * limitByPage
    return order = Addresse.limit(limitByPage).offset(setOffset)

  end

  def pageMaxAddresses(limitBypage =30)

      orderQuantity = Addresse.count
    
    return ((orderQuantity / limitBypage).round(half: :up)) +1
  end

  


end
