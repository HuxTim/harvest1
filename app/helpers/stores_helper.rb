module StoresHelper
  def isStoreOwner(user, store)
    if(store.vendor.id == current_user.vendor.id)
      return true
    else
      return false
    end
  end
end
