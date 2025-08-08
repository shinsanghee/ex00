<c:forEach>
</c:forEach>
<table>
</table>

<div class='row'>
	<div class="col-lg-12">

		<form id='searchForm' action="/board/list" method='get'>
			<select name='type'>
				<option value="">--</option>
				<option value="T">제목</option>
				<option value="C">내용</option>
				<option value="W">작성자</option>
				<option value="TC">제목 or 내용</option>
				<option value="TW">제목 or 작성자</option>
				<option value="TWC">제목 or 내용 or 작성자</option>
			</select> <input type='text' name='keyword' /> <input type='hidden'
				name='pageNum' value='${pageMaker.cri.pageNum}'> <input
				type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			<button class='btn btn-default'>Search</button>
		</form>
	</div>
</div>