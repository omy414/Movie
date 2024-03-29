package com.movie.ace.wishlist;

import java.util.List;

public interface WishListMapper {

	public List<WishList> getWishList(WishList wishlist); 
	public WishList getDetail(WishList moviecd);
	public void setMovieReply(ModalWrite modalwrite);
	public List<ModalGetReplys> getMovieReply(ModalGetReplys modalgetreplys);
	public void delWishList(WishList wishlist);
}
