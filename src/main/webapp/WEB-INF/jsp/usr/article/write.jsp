<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE WRITE"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<!-- <form action="../article/doWrite" method="POST">
			<table class="write-box table-box-1" border="1">
				<tbody>
					<tr>
						<th>제목</th>
						<td><input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="제목을 입력해주세요" name="title" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
							placeholder="내용을 입력해주세요" name="body" /></td>
					</tr>


					<tr>
						<th></th>
						<td><input class="btn btn-outline btn-info" type="submit" value="작성" /></td>
					</tr>
				</tbody>
			</table>
		</form> -->

		<div style="width: 1920px; height: 1080px; position: relative; overflow: hidden; background: #fff;">
			<img src="unsplash:eoda_8ctofo.jpeg"
				style="width: 1920px; height: 1080px; position: absolute; left: -1px; top: -1px; object-fit: cover;" />
			<div style="width: 1920px; height: 759px;">
				<div style="width: 1920px; height: 759px; position: absolute; left: -0.5px; top: 320.5px; background: #1c1334;"></div>
				<div style="width: 930.19px; height: 67.04px;">
					<div
						style="width: 930.19px; height: 59.74px; position: absolute; left: 71.8px; top: 470.64px; border-radius: 1px; background: #1c1334; border-width: 1.5px; border-color: #fff;"></div>
					<p
						style="width: 180px; height: 55.1px; position: absolute; left: 86px; top: 464.09px; font-size: 32px; text-align: left; color: rgba(255, 255, 255, 0.5);">
						제목없음</p>
				</div>
				<div style="width: 930.19px; height: 319.76px;">
					<p
						style="width: 321px; height: 55.1px; position: absolute; left: 86px; top: 530.75px; font-size: 32px; text-align: left; color: rgba(255, 255, 255, 0.5);">
						내용을 적어주세요 :)</p>
				</div>
				<div
					style="display: flex; flex-direction: column; justify-content: center; align-items: center; width: 298.14px; height: 65.36px; position: absolute; left: 72.55px; top: 365.98px; overflow: hidden; gap: 8px; padding-left: 59px; padding-right: 59px; padding-top: 11px; padding-bottom: 11px; border-radius: 10px; background: #4c4462;">
					<div
						style="display: flex; flex-direction: column; justify-content: flex-start; align-items: center; flex-grow: 0; flex-shrink: 0; position: relative;">
						<p style="flex-grow: 0; flex-shrink: 0; font-size: 24px; text-align: left; color: #fff;">2024년 2월 23일</p>
						<p style="flex-grow: 0; flex-shrink: 0; font-size: 24px; text-align: left; color: #fff;">금요일</p>
					</div>
				</div>
				<div
					style="display: flex; justify-content: center; align-items: center; width: 594.29px; height: 68.17px; position: absolute; left: 408.45px; top: 364.57px; overflow: hidden;">
					<div
						style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start; flex-grow: 0; flex-shrink: 0; overflow: hidden; gap: 8px; padding-left: 112px; padding-right: 112px; padding-top: 14px; padding-bottom: 14px; background: #4c4462; border-top-width: 0px; border-right-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-color: #000;">
						<div
							style="display: flex; flex-direction: column; justify-content: flex-start; align-items: center; flex-grow: 0; flex-shrink: 0; position: relative; gap: 12px;">
							<p style="flex-grow: 0; flex-shrink: 0; font-size: 16px; text-align: left; color: #fff;">취침 시간</p>
							<p style="flex-grow: 0; flex-shrink: 0; font-size: 24px; text-align: left; color: #fff;">01 : 00</p>
						</div>
					</div>
					<div
						style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start; flex-grow: 0; flex-shrink: 0; overflow: hidden; gap: 8px; padding-left: 112px; padding-right: 112px; padding-top: 14px; padding-bottom: 14px; background: #4c4462; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-color: #000;">
						<div
							style="display: flex; flex-direction: column; justify-content: flex-start; align-items: center; flex-grow: 0; flex-shrink: 0; position: relative; gap: 12px;">
							<p style="flex-grow: 0; flex-shrink: 0; font-size: 16px; text-align: left; color: #fff;">기상시간</p>
							<p style="flex-grow: 0; flex-shrink: 0; font-size: 24px; text-align: left; color: #fff;">11 : 00</p>
						</div>
					</div>
				</div>
				<div style="width: 194.78px; height: 35.14px;">
					<img src="paint.png"
						style="width: 49.69px; height: 35.14px; position: absolute; left: 155.52px; top: 804.71px; object-fit: contain;" />
					<img src="story-book.png"
						style="width: 49.69px; height: 35.14px; position: absolute; left: 228.07px; top: 804.71px; object-fit: contain;" />
					<img src="picture.png"
						style="width: 49.69px; height: 35.14px; position: absolute; left: 82.98px; top: 804.71px; object-fit: contain;" />
				</div>
				<div
					style="width: 227.58px; height: 35.14px; position: absolute; left: 72.05px; top: 865.86px; border-radius: 10px; background: #433c6f;"></div>
				<div
					style="display: flex; justify-content: flex-start; align-items: flex-end; width: 907.33px; height: 34.44px; position: absolute; left: 72.55px; top: 933.16px; gap: 10px;">
					<div style="flex-grow: 0; flex-shrink: 0; width: 100px; height: 49px;">
						<div
							style="width: 100px; height: 49px; position: absolute; left: -0.5px; top: -15.06px; border-radius: 30px; background: #433c6f;"></div>
						<p
							style="position: absolute; left: 21px; top: -8.56px; font-size: 32px; text-align: left; color: rgba(255, 255, 255, 0.5);">
							개꿈</p>
					</div>
					<div style="flex-grow: 0; flex-shrink: 0; width: 100px; height: 49px;">
						<div
							style="width: 100px; height: 49px; position: absolute; left: 109.5px; top: -15.06px; border-radius: 30px; background: #433c6f;"></div>
						<p
							style="position: absolute; left: 130px; top: -9.56px; font-size: 32px; text-align: left; color: rgba(255, 255, 255, 0.5);">
							악몽</p>
					</div>
					<div style="flex-grow: 0; flex-shrink: 0; width: 130px; height: 49px;">
						<div
							style="width: 123.81px; height: 49px; position: absolute; left: 219.5px; top: -15.06px; border-radius: 30px; background: #433c6f;"></div>
						<p
							style="width: 110.19px; position: absolute; left: 239.81px; top: -9.56px; font-size: 32px; text-align: left; color: rgba(255, 255, 255, 0.5);">
							예지몽</p>
					</div>
					<div style="flex-grow: 0; flex-shrink: 0; width: 100px; height: 49px;">
						<div
							style="width: 100px; height: 49px; position: absolute; left: 359.5px; top: -15.06px; border-radius: 30px; background: #433c6f;"></div>
						<p
							style="position: absolute; left: 376px; top: -9.56px; font-size: 32px; text-align: left; color: rgba(255, 255, 255, 0.5);">
							가위</p>
					</div>
					<div style="flex-grow: 0; flex-shrink: 0; width: 130px; height: 49px;">
						<div
							style="width: 123.81px; height: 49px; position: absolute; left: 469.5px; top: -15.06px; border-radius: 30px; background: #433c6f;"></div>
						<p
							style="width: 110.19px; position: absolute; left: 489.81px; top: -9.56px; font-size: 32px; text-align: left; color: rgba(255, 255, 255, 0.5);">
							자각몽</p>
					</div>
					<div style="flex-grow: 0; flex-shrink: 0; width: 100px; height: 49px;">
						<div
							style="width: 100px; height: 49px; position: absolute; left: 609.5px; top: -15.06px; border-radius: 30px; background: #433c6f;"></div>
						<p
							style="position: absolute; left: 626px; top: -9.56px; font-size: 32px; text-align: left; color: rgba(255, 255, 255, 0.5);">
							태몽</p>
					</div>
					<div style="flex-grow: 0; flex-shrink: 0; width: 193px; height: 49px;">
						<div
							style="width: 193px; height: 49px; position: absolute; left: 719.5px; top: -15.06px; border-radius: 30px; background: #433c6f;"></div>
						<p
							style="position: absolute; left: 736px; top: -9.56px; font-size: 32px; text-align: left; color: rgba(255, 255, 255, 0.5);">
							거짓 깨어남</p>
					</div>
				</div>
				<p
					style="width: 156px; height: 27.41px; position: absolute; left: 122px; top: 870.57px; font-size: 32px; text-align: left; color: #fff;">
					카테고리</p>
				<div
					style="width: 74.53px; height: 25.73px; position: absolute; left: 780.62px; top: 444.19px; background: #d9d9d9;"></div>
				<div
					style="width: 73.54px; height: 25.73px; position: absolute; left: 855.15px; top: 444.19px; background: #d9d9d9;"></div>
				<p
					style="width: 43.73px; height: 14.06px; position: absolute; left: 799.01px; top: 450.31px; font-size: 20px; text-align: left; color: #000;">
					공개</p>
				<p
					style="width: 66.58px; height: 14.06px; position: absolute; left: 865.59px; top: 450.31px; font-size: 20px; text-align: left; color: #000;">
					비공개</p>
				<svg width="2" height="22" viewBox="0 0 2 22" fill="none" xmlns="http://www.w3.org/2000/svg"
					style="position: absolute; left: 854.16px; top: 444.19px;" preserveAspectRatio="none">
      <line x1="1.15845" y1="0.688599" x2="1.15845" y2="21.7719" stroke="black"></line>
    </svg>
				<div style="width: 149.07px; height: 49.19px;">
					<div
						style="width: 149.07px; height: 49.19px; position: absolute; left: 1074.78px; top: 364.78px; border-radius: 10px; background: #433c6f;"></div>
					<p
						style="width: 84px; height: 27.41px; position: absolute; left: 1120px; top: 376.52px; font-size: 32px; text-align: left; color: #fff;">
						태그</p>
				</div>
				<div style="width: 149.07px; height: 49.19px;">
					<div
						style="width: 149.07px; height: 49.19px; position: absolute; left: 1074.78px; top: 432.24px; border-radius: 10px; background: #433c6f;"></div>
					<p
						style="width: 84px; height: 27.41px; position: absolute; left: 1120px; top: 443.99px; font-size: 32px; text-align: left; color: rgba(255, 255, 255, 0.5);">
						인물</p>
				</div>
				<div style="width: 149.07px; height: 49.19px;">
					<div
						style="width: 149.07px; height: 49.19px; position: absolute; left: 1264.59px; top: 432.24px; border-radius: 10px; background: #433c6f;"></div>
					<p
						style="width: 85px; height: 27.41px; position: absolute; left: 1310px; top: 443.99px; font-size: 32px; text-align: left; color: rgba(255, 255, 255, 0.5);">
						동물</p>
				</div>
				<div style="width: 149.07px; height: 49.19px;">
					<div
						style="width: 149.07px; height: 49.19px; position: absolute; left: 1454.41px; top: 432.24px; border-radius: 10px; background: #433c6f;"></div>
					<p
						style="width: 92px; height: 27.41px; position: absolute; left: 1500px; top: 443.99px; font-size: 32px; text-align: left; color: rgba(255, 255, 255, 0.5);">
						사물</p>
				</div>
				<div style="width: 149.28px; height: 49.19px;">
					<div
						style="width: 149.07px; height: 49.19px; position: absolute; left: 1644.22px; top: 432.24px; border-radius: 10px; background: #433c6f;"></div>
					<p
						style="width: 105px; height: 27.41px; position: absolute; left: 1689px; top: 443.99px; font-size: 32px; text-align: left; color: rgba(255, 255, 255, 0.5);">
						장소</p>
				</div>
				<div
					style="width: 686.71px; height: 432.91px; position: absolute; left: 1085.71px; top: 515.17px; background: #4f315e;"></div>
				<div
					style="width: 212.67px; height: 47.79px; position: absolute; left: 1644.22px; top: 1009.92px; background: #d9d9d9;"></div>
				<p
					style="width: 97.39px; height: 27.41px; position: absolute; left: 1702.36px; top: 1020.97px; font-size: 32px; text-align: left; color: #000;">
					글 등록</p>
			</div>
			<div style="width: 358px; height: 150px;">
				<p
					style="width: 158px; height: 100px; position: absolute; left: 247px; top: 108px; font-size: 60px; text-align: left; color: #fff;">
					<span style="width: 158px; height: 100px; font-size: 60px; text-align: left; color: #fff;">Dream</span>
					<br />
					<span style="width: 158px; height: 100px; font-size: 60px; text-align: left; color: #fff;">diary</span>
				</p>
				<img src="image-10.png"
					style="width: 200px; height: 139.21px; position: absolute; left: 46.5px; top: 57.5px; object-fit: cover;" />
			</div>
			<div style="width: 200px; height: 78px; position: absolute; left: 66px; top: 237px; background: #725a99;"></div>
			<div
				style="display: flex; justify-content: flex-start; align-items: flex-start; position: absolute; left: 128px; top: 253px; gap: 150px;">
				<p style="flex-grow: 0; flex-shrink: 0; font-size: 42px; text-align: left; color: #000;">일지</p>
				<p style="flex-grow: 0; flex-shrink: 0; font-size: 42px; text-align: left; color: #000;">마이페이지</p>
			</div>
		</div>
		<div class="btns">
			<button class="btn btn-outline" class="" type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>