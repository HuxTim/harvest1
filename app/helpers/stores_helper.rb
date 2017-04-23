module StoresHelper
  def isStoreOwner(user, store)
    if(current_user.vendor and store.vendor.id == current_user.vendor.id)
      return true
    else
      return false
    end
  end
end
