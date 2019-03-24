package org.yolo.holo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.yolo.holo.vo.Review;

public class ReviewsDAOImpl implements ReviewsDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}// setSession end

	public List<Review> reviewList(int no) {

		return session.selectList("review.reviewList", no);
	}

	public List<Review> reviewTogetherList(int no) {

		return session.selectList("review.reviewTogetherList", no);
	}

	public int insert(Review review) {

		return session.insert("review.insert", review);
	}

	public List<Review> selectProTogetherReviewTourList(int no) {

		return session.selectList("review.selectProTogetherReviewTourList", no);
	}// selectProTogetherReviewTourList end

	public List<Review> selectProTogetherReviewfoodList(int no) {

		return session.selectList("review.selectProTogetherReviewfoodList", no);
	}// selectProTogetherReviewfoodList end

	public List<Review> selectProReviewList(int no) {

		return session.selectList("review.selectProReviewList", no);
	}// selectProReviewList end

	public Review selectProReviewPic(Review review) {

		return session.selectOne("review.selectProReviewPic", review);
	}// selectProReviewList end

	public int selectProReviewTotal(int no) {

		return session.selectOne("review.selectProReviewTotal", no);
	}// selectProReviewTotal end

	public int selectProReviewCount(int no) {

		return session.selectOne("review.selectProReviewCount", no);
	}// selectProReviewCount end

	public int selectProReviewFoodHice(int no) {

		return session.selectOne("review.selectProReviewFoodHice", no);
	}// selectProReviewFoodHice end

	public int selectProReviewTourHice(int no) {

		return session.selectOne("review.selectProReviewTourHice", no);
	}// selectProReviewTourHice end

}// ReviewsDAOImpl end
