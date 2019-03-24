package org.yolo.holo.service;

import org.yolo.holo.dao.ReviewsDAO;

public class ReviewsServiceImpl implements ReviewsService {
	private ReviewsDAO reviewsDAO;
	public void setReviewsDAO(ReviewsDAO reviewsDAO) {
		this.reviewsDAO = reviewsDAO;
	}//setReviewsDAO() end
	
}//ReviewsServiceImpl end
