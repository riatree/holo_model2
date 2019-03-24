package org.yolo.holo.dao;

import org.yolo.holo.vo.TourGrade;

public interface TourGradesDAO {
	public double selectTourHice(int no);
	public TourGrade selectTourReview(int no);
	public int insert(TourGrade tourGrade);
}//TourGradesDAO end
