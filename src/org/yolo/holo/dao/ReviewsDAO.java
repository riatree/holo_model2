package org.yolo.holo.dao;

import java.util.List;

import org.yolo.holo.vo.Review;

public interface ReviewsDAO {

	public List<Review> reviewList(int no);

	public List<Review> reviewTogetherList(int no);

	public int insert(Review review);

	public List<Review> selectProTogetherReviewTourList(int no);

	public List<Review> selectProTogetherReviewfoodList(int no);

	public List<Review> selectProReviewList(int no);

	public Review selectProReviewPic(Review review);

	public int selectProReviewTotal(int no);

	public int selectProReviewCount(int no);

	public int selectProReviewFoodHice(int no);

	public int selectProReviewTourHice(int no);

}// ReviewsDAO end
