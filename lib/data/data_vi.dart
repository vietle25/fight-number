class DataVI {
  static List<String> truth = [
    "Bạn đã hôn bao nhiêu chàng trai/cô gái cho đến nay?",
    "Bây giờ bạn có đang yêu không?",
    "Bây giờ bạn có người yêu không?",
    "Bạn đã bao giờ hẹn hò với một người khác giới chưa?",
    "Giấc mơ cuối cùng mà bạn nhớ là gì?",
    "Bạn đã bao giờ ăn cắp một cái gì đó? Kể tên nếu có",
    "Ngày tốt nhất của bạn là gì?",
    "Ngày tồi tệ nhất của bạn là gì?",
    "Bạn thấy ai thú vị nhất trong nhóm?",
    "Bạn muốn dành kỳ nghỉ với ai nhất?",
    "Bạn muốn đi du lịch với ai nhất?",
    "Bạn đã từng phạm tội chưa?",
    "Bạn đã có nụ hôn đầu tiên với ai?",
    "Bạn sẽ làm gì nếu bạn là người khác giới trong một ngày?",
    "Bạn muốn trở thành con vật nào nhất?",
    "Bạn thấy ai hấp dẫn nhất trong nhóm?",
    "Điều cuối cùng bạn tìm kiếm trên Google là gì?",
    "Ai là người mặc đẹp nhất trong nhóm và tại sao?",
    "Bài hát yêu thích hiện tại của bạn là gì?",
    "Bạn đã nhận được quà cuối cùng của mình từ ai?",
    "Điều tồi tệ nhất bạn từng làm là gì?",
    "Điều tội lỗi nhất mà bạn từng làm là gì?",
    "Bạn có muốn hôn một người mà bạn vừa gặp không?",
    "Bạn thấy điều gì quyến rũ nhất về bản thân?",
    "Gần đây bạn đã xấu hổ về điều gì?",
    "Bạn nhìn gì đầu tiên khi gặp ai đó?",
    "Bạn sẽ làm gì nếu bạn tàng hình trong một ngày?",
    "Ai trong nhóm có đôi môi đẹp nhất?",
    "Ai trong vòng có mông đẹp nhất?",
    "Buổi hẹn hò trong mơ của bạn trông như thế nào?",
    "Bạn muốn trao đổi cuộc sống với ai trong một ngày?",
    "Bạn có crush ai trong nhóm không?",
    "Lời nói dối cuối cùng của bạn là gì",
    "Bạn đã bao giờ lừa dối ai đó chưa?",
    "Bạn sẽ thay đổi điều gì trên cơ thể mình? Đó là gì?",
    "Bạn sẽ làm gì nếu chỉ còn một giờ để sống?",
    "Điều gì khiến bạn hứng thú ở phụ nữ/nam giới?",
    "Sai lầm lớn nhất trong cuộc đời bạn là gì?",
    "Bạn đã hôn bao nhiêu người?",
    "Bài hát yêu thích của bạn là gì?",
    "Lần cuối cùng bạn xỉn là khi nào?",
    "Bạn còn zin không?",
    "Bạn muốn hôn ai nhất trong nhóm và tại sao?",
    "Bạn đã bao giờ là người thứ 3?",
    "Lần cuối cùng bạn thủ dâm là khi nào?",
    "Cách tốt nhất để đánh thức bạn là gì?",
    "Bạn đã bao giờ ngủ hoặc làm tình với ai đó trong nhóm chưa?",
    "Bộ phận cơ thể nào khiến bạn thích thú nhất?",
    "Bạn muốn nhìn thấy ai khỏa thân nhất?",
    "Có bao giờ bạn đã có một tình một đêm?",
    "Bạn đã quan hệ tình dục với bao nhiêu người?",
    "Tại sao bạn tốt trên giường?",
    "Bạn nghĩ gì: Bạn giống con vật nào?",
    "Bạn muốn tên gì?",
    "Nếu bạn có thể trở thành bất kỳ ai (người thật hoặc nhân vật hư cấu) trong một ngày bạn sẽ chọn ai?",
    "Bạn gửi nhiều tin nhắn nhất cho thành viên nào trong nhóm?",
    "Ai trong nhóm hiểu bạn nhất?",
    "Thứ kinh khủng nhất bạn từng ăn là gì?",
    "Bạn đã bao giờ thử giảm cân chưa?",
    "Bạn đã thực hiện hành động (đáng xấu hổ) nào để thu hút sự chú ý của ai đó?",
    "Điều dũng cảm nhất bạn đã làm trong cuộc sống cho đến nay là gì?",
    "Tin đồn tồi tệ nhất mà bạn từng nghe về bản thân là gì?",
    "Điều đáng xấu hổ nhất mà bạn đã làm để gây ấn tượng với ai đó là gì?",
    "Bạn đã bao giờ nói dối về tuổi của mình chưa và tại sao?",
    "Bạn đã bao giờ yêu giáo viên hoặc sếp của mình chưa?",
    "Bạn có còn tình cảm với người yêu cũ không?",
    "Bạn có bao nhiêu ứng dụng chỉnh sửa ảnh trên điện thoại của mình?",
    "Bạn đã từng tham gia Thử thách TikTok nào trước đây?",
    "Nếu bạn có thể thay đổi một điều trong cuộc sống của mình thì đó sẽ là gì?",
    "Ngày tốt nhất trong cuộc sống của bạn cho đến nay là gì?",
    "Bạn đã hôn bao nhiêu người?",
    "Bạn sẽ gọi cho ai đầu tiên sau một tai nạn?",
    "Bạn tiếp tục nói dối bố mẹ về điều gì?",
    "Bạn thích bài hát nào?",
    "Bạn thích ca sĩ nào?",
    "Video YouTube cuối cùng bạn xem là gì??",
    "Bạn đã bao giờ nhắn tin cho ai đó trong nhóm khi đang ngồi trong nhà vệ sinh chưa?",
    "Bạn không thích bộ phận nào trên cơ thể mình?",
    "Ký ức tuổi thơ đáng xấu hổ nhất của bạn là gì?",
    "Bạn đã đưa ra lời khuyên tồi nào cho người khác trước đây?",
    "Bạn thầm thích mùi lạ hoặc mùi kinh tởm nào?",
    "Bạn đã bao giờ nghĩ đến phẫu thuật thẩm mỹ chưa?",
    "Bạn có đi tè khi tắm không?",
    "Điều gì người khác nghĩ về bạn không đúng chút nào?",
    "Bạn có tin vào người ngoài hành tinh",
    "Bạn có tin vào ma quỷ?",
    "Bạn cảm thấy tội lỗi về điều gì?",
    "Điều xấu hổ nhất mà bạn đã nói với một người lạ là gì?",
    "Bạn muốn thực hiện ba điều ước nào?",
    "Nếu bạn đột nhiên có một 1 tỷ - bạn sẽ tiêu nó như thế nào?",
    "Bạn sẽ làm gì (bất hợp pháp) nếu bạn biết mình sẽ không bị trừng phạt vì điều đó?",
    "Bạn đã bao giờ bị đuổi khỏi nơi nào chưa? Đó là nơi nào?",
    "Bạn đã bao giờ xì hơi và đổ lỗi cho người khác chưa? Ai mà xui vậy?",
    "Bạn đã bao giờ có một trải nghiệm tâm linh? Đó là gì",
    "Nếu bạn có thể chọn tên của chính mình nó sẽ là gì?",
    "Bạn ghen tị với những người nào trong cuộc sống của mình?",
    "Nói cho tôi biết chính xác nụ hôn đầu tiên của bạn diễn ra như thế nào.",
    "Bạn muốn bia mộ của mình nói gì?",
    "Bạn đã giữ bí mật gì với cha mẹ khi còn nhỏ?",
    "Lý do cho cuộc chiến lớn nhất với cha mẹ của bạn cho đến nay là gì?",
    "Thứ kinh khủng nhất bạn từng ăn là gì?",
    "Bạn đã bao giờ phá hoại công việc của người khác chưa?",
    "Điều xấu hổ nhất đã xảy ra với bạn ở nơi công cộng là gì?",
    "Bạn có tài khoản giả trên mạng xã hội để theo dõi người khác mà không bị phát hiện không?",
    "Đã bao giờ xe cấp cứu phải đến đón bạn chưa?",
    "Bạn đã bao giờ làm hỏng thứ gì đó thực sự đắt tiền chưa?",
    "Điều tồi tệ nhất mà bạn từng nói với người khác là gì?",
    "Điều tồi tệ nhất mà bạn từng nói về người khác là gì?",
    "Bạn thực sự thích làm điều gì nhưng sẽ không bao giờ làm điều đó trước mặt người mà bạn thích?",
    "Ai là người lớn tuổi nhất bạn từng hẹn hò?",
    "Bạn thích bộ phim nào - nhưng những người khác lại cho rằng nó ngu ngốc?",
    "Lần cuối cùng bạn phải xin lỗi là khi nào và ở đâu?",
    "Lần cuối cùng bạn nói cám ơn là khi nào và ở đâu",
    "Bạn đã bao giờ lừa dối trong một mối quan hệ?",
    "Bạn dành (quá) nhiều thời gian cho ứng dụng/trang web nào?",
    "Bạn dã hẹn hò lúc bao nhiêu tuổi?",
    "Bạn sợ điều gì nhất trong một mối quan hệ?",
    "Điều gì làm bạn khó chịu nhất về người bên trái bạn?",
    "Điều gì làm bạn khó chịu nhất về người bên phải bạn?",
    "Điều gì làm bạn khó chịu nhất về người đối diện bạn?",
    "Bạn đã bao giờ lấy cắp thứ gì đó từ trường học/cơ quan chưa?",
    "Bạn hối tiếc điều gì nhất trong cuộc đời?",
    "Bạn KHÔNG BAO GIỜ muốn nhìn thấy ai khỏa thân?",
    "Bạn muốn nhìn thấy ai khỏa thân nhất?",
    "Bạn đã bao giờ tặng quà chưa?",
    "Sự bất an lớn nhất của bạn là gì?",
    "Bạn có cảm tình với món đồ nào?",
    "Bạn sẽ cứu ai trong căn phòng này trước trong ngày tận thế?",
    "Bạn có thể làm công việc gì mà không có lương trên thế giới?",
    "Bộ phận/bộ phận nào trên cơ thể bạn không thấy hấp dẫn chút nào?",
    "Bộ phận/bộ phận cơ thể nào bạn thấy đẹp nhất về bản thân?",
    "Lần cuối cùng bạn từ chối là khi nào và với ai?",
    "Bạn đã bao giờ hẹn hò với hai người cùng một lúc chưa?",
    "Bộ quần áo đáng xấu hổ nhất của bạn là gì?",
    "Ai là tình yêu thời thơ ấu của bạn?",
    "Điều giờ khiến bạn nhớ về thời thơ ấu của bạn?",
    "Bạn vẫn muốn hẹn hò với tình yêu thời thơ ấu của mình hôm nay chứ?",
    "Có bao giờ bạn đã có một tình một đêm?",
    "Ai sẽ là người đầu tiên bạn gọi nếu bạn bị bắt?",
    "Nhờ lời nói dối nào mà bạn đã từng đạt được một mục tiêu nhất định?",
    "Bạn nghĩ gì về cha mẹ của người yêu?",
    "Tại sao bạn lại yêu/crush người hiện tại?",
    "Những phẩm chất nào bạn thấy đặc biệt tuyệt vời ở người yêu của mình - và những phẩm chất nào là không?",
    "Điều cuối cùng khiến bạn thực sự tức giận là gì?",
    "Kỷ niệm/trải nghiệm trường học tồi tệ nhất của bạn là gì?",
    "Nếu nhà bạn bị cháy bạn sẽ cứu 3 thứ nào? (tất cả các sinh vật trong nhà đã được an toàn)",
    "Bạn đã từng phải đi tiểu ở nơi nào khác thường?",
    "Lời nói dối cuối cùng mà bạn bị bắt quả tang là gì?",
    "Đã bao nhiêu ngày liên tiếp bạn chưa tắm?",
    "Điều ngu ngốc nhất mà bạn từng tiêu tiền vào là gì?",
    "Bộ phim gần đây nhất khiến bạn khóc là gì?",
    "Điều cuối cùng bạn tìm kiếm trên Google là gì?",
    "Bạn nghĩ ai là người ăn mặc xấu nhất trong nhóm này?",
    "Bạn nghĩ gì khi ngồi trong nhà vệ sinh?",
    "Tin nhắn cuối cùng bạn viết là gì - và gửi cho ai?",
    "Điều ngu ngốc nhất bạn từng làm là gì?",
    "Bạn thấy ai đẹp nhất trong nhóm này?",
    "Bạn đang giấu điều gì trong phòng mà không muốn bố mẹ biết?",
    "Bạn đã bao giờ viết một bức thư tình cho ai đó chưa? Nếu có cho ai?",
    "Nếu bạn phải nghe một bài hát trong suốt quãng đời còn lại thì đó sẽ là bài hát nào?",
    "Bạn bí mật làm gì trước gương khi không có ai nhìn?",
    "Bạn đã bao giờ đổ lỗi cho người khác về điều gì đó khi đó là lỗi của bạn chưa?",
    "Bạn muốn hoán đổi mạng sống với ai trong nhóm này và tại sao?",
    "Bạn đã nhận được biệt danh nào từ người khác khi còn nhỏ?",
    "Bạn đã từ chối bao nhiêu chàng trai/cô gái?",
    "Bạn đã bao giờ làm hoặc thử làm điều gì đó ngu ngốc chỉ để trông ngầu hơn chưa? Đó là cái gì?",
    "Ai đã cho bạn tình yêu tồi tệ nhất?",
    "Bạn có nhìn vào bồn cầu trước khi xả nước không?",
    "Bạn đã bao giờ chụp màn hình lịch sử trò chuyện với ai đó trong nhóm này và chuyển tiếp chúng cho người khác chưa?",
    "Bạn đã bao nhiêu ngày chưa tắm?",
    "Bạn có hình ảnh của một người trong nhóm này trên điện thoại của mình mà họ không biết không?",
    "Bạn đã bao giờ cố ý bỏ qua tin nhắn từ ai đó trong nhóm này chưa?",
    "Nói với mọi người trong nhóm này một điều họ nhất thiết phải thay đổi về bản thân!",
    "Lần cuối cùng bạn ghen là khi nào và tại sao?",
    "Bạn sẽ hẹn hò với người hơn bạn năm tuổi chứ?",
    "Bạn sẽ làm quen với người bạn mới gặp chứ?",
    "Bạn có hẹn hò với ai đó thấp hơn bạn cái đầu không?",
    "Bạn nhìn gì đầu tiên khi gặp ai đó?",
    "Điều xấu hổ nhất từng xảy ra với bạn trước mặt bố mẹ là gì?",
    "Hiện tại bạn có đang yêu không? Anh ấy/cô ấy có mặt không?",
    "Điều dũng cảm nhất bạn từng làm là gì?",
    "Bạn không bỏ được thói quen khó chịu nào?",
    "Bạn muốn thử điều gì nhưng không dám?",
    "Bí mật mà bạn chưa bao giờ nói với ai là gì?",
    "Bạn mừng vì mẹ bạn không biết về bạn vì điều gì?",
    "Nơi kỳ lạ nhất mà bạn từng đi vệ sinh là ở đâu?",
    "Bạn sẽ làm gì nếu bạn là người khác giới trong một tuần?",
    "Điều điên rồ nhất bạn đã làm trên phương tiện giao thông công cộng là gì?",
    "Bạn muốn hôn ai trong căn phòng này?",
    "Trong số tất cả những người trong phòng bạn sẽ đồng ý hẹn hò với chàng trai/cô gái nào?",
    "Bạn đã bao giờ nói dối với người bạn thân nhất của mình và nói rằng bạn bị ốm để tránh đi chơi với họ chưa?",
    "Bạn có một biệt danh đáng xấu hổ từ thời thơ ấu của mình không?",
    "Bạn đã gian lận trong một bài kiểm tra?",
    "Bạn muốn trở thành gì khi lớn lên?",
    "Bạn thích cuốn sách nào nhất và tại sao?",
    "Bạn có anh chị em yêu thích nào không và nếu có thì tại sao bạn lại yêu thích họ?",
    "Cha mẹ bạn đã làm điều gì đáng xấu hổ với bạn trước mặt mọi người?",
    "Cho phép tôi kiểm tra lịch sử duyệt web trên điện thoại của bạn?",
    "Bạn đã bao giờ cảm thấy bị thu hút bởi một người cùng giới chưa?",
    "Bạn đã bao giờ chia tay với người yêu cũ ngay trước ngày sinh nhật của họ để tránh mua quà sinh nhật cho họ chưa?",
    "Bạn đã bao giờ hẹn hò với ai đó chỉ vì tình dục chưa?",
    "Bạn đã bao giờ tán tỉnh anh chị em của một người bạn thân chưa?",
    "Bạn đã bao giờ tập hôn trong gương chưa?",
    "Nếu bạn phải xóa một ứng dụng khỏi điện thoại của mình đó sẽ là gì?",
    "Bạn nghĩ ai là người ăn mặc đẹp nhất trong căn phòng này?",
    "Nếu phải quay lại với người yêu cũ bạn sẽ chọn ai?",
    "Kể tên hai thú vui tội lỗi của bạn.",
    "Kể tên một điều bạn sẽ thay đổi về mọi người trong căn phòng này.",
    "Nếu bạn có thể kết hôn với một giáo viên ở trường hoặc một người nào đó ở nơi làm việc bạn sẽ chọn ai và tại sao?",
    "Bạn mất trinh ở tuổi nào?",
    "Bạn đã ngủ với bao nhiêu người?",
    "Bạn đang mặc đồ lót màu gì?",
    "Bạn có bao giờ thả rông khi đi ngoài đường chưa?",
    "Bạn đã bao giờ ăn trộm thứ gì chưa?",
    "Lần cuối bạn khóc là khi nào? Vì cái gì?",
    "Nỗi sợ lớn nhất của bạn là gì?",
    "Tưởng tượng đen tối bí mật nhất của bạn là gì?",
    "Bây giờ bạn muốn tỏa sáng ở đâu?",
    "Bạn sẽ đưa ai đến đảo hoang?",
    "Bạn đã từng phạm tội gì?",
    "Bạn đã từng hút thuốc chưa?",
    "Ai trong nhóm nên đến tiệm làm tóc khẩn cấp nhất?",
    "Bố mẹ bạn không biết gì về bạn?",
    "Bạn có tài năng tiềm ẩn?",
    "Điều đáng xấu hổ nhất trong tủ quần áo của bạn là gì?",
    "Giấc mơ điên rồ nhất bạn từng có là gì?",
    "Bạn có thường xuyên thay ga trải giường không?",
    "Bạn đã bao giờ thả rông ở nơi công cộng chưa?",
    "Bạn đã làm điều gì biến thái nhất?",
    "Hiện tại bạn có người yêu không? Và người đó có ở đây không?",
    "Bạn có crush ai trong nhóm này không?",
    "Tại sao bạn khóc lần gần đây nhất?",
    "Bạn có bao nhiêu tiền trong tài khoản ngân hàng?",
    "Bạn đã từng mất đồ gì chưa? Đó là món nào?",
    "Món đồ nào kỉ niệm và ý nghĩa nhất đối với bạn?",
    "Bạn đã tặng quà cho ba mẹ mình chưa?",
    "Bạn đã từng nói xin lỗi ba mẹ mình chưa?",
    "Bạn đã từng nói cám ơn ba mẹ mình chưa?",
    "Bạn đã từng bị cảnh sát giao thông bắt chưa? Nếu có thì lỗi gì?",
    "Bạn đã bị cảnh sát giao thông bắt mấy lần?",
    "Bạn đã từng đánh nhau chưa?",
    "Bạn từng chửi nhau chưa?",
    "Bạn chạy xe có hay bốc đầu không?",
    "Tốc độ lớn nhất bạn đã từng chạy xe là bao nhiêu?",
    "Bạn từng bao giờ mắc ẻ khi đang chạy xe chưa?",
    "Nếu bạn được tái sinh thành một con vật bạn muốn trở thành con vật nào?",
    "Bạn hiện đang yêu ai?",
    "Ai trong nhóm ăn mặc sành điệu nhất?",
    "Đôi khi bạn có ước mình có một cuộc sống khác không?",
    "Khi bạn nhìn lại cuộc sống của mình cho đến nay, đâu là sai lầm lớn nhất mà bạn đã mắc phải?",
    "Bạn đi Đà Lạt bao giờ chưa?",
    "Bạn đã du lịch nước ngoài chưa?",
    "Bạn đã đi những đâu trên đất nước này?",
    "Nếu bạn là nữ, bạn có thích một chàng trai nghèo nhưng có ý chí không? Nếu bạn là nam, bạn có thích một cô gái không xinh đẹp nhưng dịu dàng, đảm đang không?",
    "Bạn đã từng dùng những chất kích thích nào?",
    "Bạn có tỉa/cạo lông vùng kín?",
    "Hình phạt tồi tệ nhất của cha mẹ bạn là gì?",
    "Bạn đã bao giờ tè trong bể bơi chưa?",
    "Bạn không thích điều gì ở bản thân?",
    "Khoảnh khắc đẹp nhất trong cuộc đời bạn cho đến nay là gì?",
    "Bạn đã bao giờ yêu ai đó có mặt ở đây chưa?",
    "Trên thang điểm từ 1-10 bạn nghĩ mình ưa nhìn đến mức nào?",
    "Có điều gì đáng xấu hổ từng xảy ra với bạn trong một buổi hẹn hò không?",
    "Bạn muốn nói gì với ai đó nhưng không dám?",
    "Bạn có đọc sách không? Bạn thích quyển sách nào nhất?",
    "Bạn thích bài hát nào nhất?",
    "Trường Sa, Hoàng Sa là của Việt Nam! (1 phút yêu nước)",
    "Trường Sa, Hoàng Sa là của Việt Nam! (1 phút yêu nước)",
    "Trường Sa, Hoàng Sa là của Việt Nam! (1 phút yêu nước)",
    "Trường Sa, Hoàng Sa là của Việt Nam! (1 phút yêu nước)",
    "Trường Sa, Hoàng Sa là của Việt Nam! (1 phút yêu nước)",
    "Trường Sa, Hoàng Sa là của Việt Nam! (1 phút yêu nước)",
    "Trường Sa, Hoàng Sa là của Việt Nam! (1 phút yêu nước)",
    "Trường Sa, Hoàng Sa là của Việt Nam! (1 phút yêu nước)",
    "Bạn thích mèo hay chó? Hay cả 2? Hay không thích con nào?",
    "Đồ lót của bạn màu gì?",
    "Trên thang điểm từ 0-10 bạn nghĩ mình đẹp đến mức nào?",
    "Bạn có thích đi sở thú không?",
    "Bạn có thích động vật không?",
    "Bạn muốn làm gì với người chơi ở hai bên của bạn?",
    "Nếu bạn sở hữu một doanh nghiệp những người chơi khác sẽ có vai trò gì với tư cách là nhân viên trong doanh nghiệp của bạn?",
    "Bạn đã bao giờ bị rách quần nơi công cộng chưa?",
    "Sở thích của bạn là gì?",
    "Bạn có khả năng quyên góp nhất cho cái gì?",
    "Bạn thích chó hay mèo hơn?",
    "Lần cuối cùng ai khóc vì bạn?",
    "Bạn đã trốn học bao nhiêu lần?",
    "Lần cuối cùng bạn nói dối là khi nào?",
    "Bạn mặc gì khi đi ngủ? À có mặc đồ không?",
    "Bạn muốn trở nên giàu có và không hấp dẫn hay nghèo và hấp dẫn?",
    "Bạn hối tiếc điều gì đã không làm trong năm nay?",
    "Bạn hối hận vì đã làm gì trong năm nay?",
    "Bạn đã bao giờ vô tình vào nhà vệ sinh của người khác giới chưa?",
    "Món quà thú vị nhất mà bạn nhận được là gì?",
    "Bạn sẽ thay đổi điều gì nếu bạn là vua/nữ hoàng?",
    "Bạn có điện thoại di động đầu tiên khi nào?",
    "Bạn muốn trở thành gì sau này?",
    "Bạn thích ba phẩm chất nào nhất ở người chơi bên trái bạn?",
    "Lần cuối cùng bạn thực sự căng thẳng là khi nào và tại sao?",
    "Bạn đã bao giờ làm điều gì bị cấm chưa?",
    "Bạn muốn có con vật nào sau này?",
    "Hành vi nào của người khác làm bạn khó chịu?",
    "Bạn đặc biệt giỏi về điều gì?",
    "Bạn đặc biệt tệ ở điểm nào?",
    "Tình bạn hay tiền quan trọng hơn với bạn?",
    "Bạn đã bao giờ cười tè ra quần chưa?",
    "Bạn có ngáy khi ngủ không?",
    "Ai trong vòng có thân hình đẹp nhất?",
    "Ai trong nhóm có khuôn mặt đẹp nhất?",
    "Ai trong nhóm cắt tóc đẹp nhất?",
    "Bạn có biết bơi?",
    "Bạn nói được ngoại ngữ nào?",
    "Bạn muốn nói được ngoại ngữ nào?",
    "Bạn có xem phim hoạt hình không - Nếu vậy thì cái nào là hay nhất?",
    "Bạn có bằng lái xe chưa?",
    "Bạn muốn có một hình xăm hoặc xỏ lỗ trên cơ thể?",
    "Bạn muốn có một hình xăm hoặc xỏ lỗ trên cơ thể?",
    "Nếu bạn có một hình xăm nó sẽ ở đâu và trông như thế nào?",
    "Bạn đã mất những thứ gì?",
    "Bạn sợ con vật nào nhất?",
    "Nếu bạn có thể có một siêu năng lực đó sẽ là gì?",
    "Thành tựu lớn nhất trong cuộc đời bạn là gì?",
    "Ký ức đáng sợ nhất của bạn là gì?",
    "Bạn muốn xóa suy nghĩ/ký ức nào khỏi tâm trí mình?",
    "Bạn cảm thấy thế nào về mối quan hệ với mẹ của bạn?",
    "Bạn cảm thấy thế nào về mối quan hệ với cha mình?",
  ];

  static List<String> dare = [
    "'Hôn lên người bên trái/phải của bạn",
    "Cho chúng tôi xem lịch sử tìm kiếm trên Google của bạn",
    "Bắt chước một con nai đang chạy",
    "Trao đổi áo của bạn với người chơi bên trái/phải của bạn",
    "Nằm ở giữa, nhắm mắt lại và để mọi người cù bạn trong một phút",
    "Thực hiện 10 lần chống đẩy",
    "Chụp ảnh selfie của nhóm và đăng lên Instagram/Facebook/Tiktok",
    "Dành cho người bên trái/phải của bạn một lời khen chân thành",
    "Kiểm tra xem tóc của ai có mùi thơm nhất",
    "Mạo danh ai đó trong nhóm. Những người khác phải đoán xem đó là ai",
    "Uống đồ uống từ người chơi bên trái/phải của bạn (Nếu có đồ uống, không có thì thui ^^)",
    "Nhảy sexy theo một bài hát trong 60 giây",
    "Xúc phạm người bên trái/phải của bạn",
    "Gửi lời khen cho người đầu tiên trong Messenger",
    "Cho mọi người xem bức ảnh thứ 5 trong album ảnh của bạn",
    "Cho mọi người thấy tin nhắn SMS cuối cùng của bạn",
    "Cho mọi người xem bức ảnh mới nhất bạn chụp",
    "Ôm người đối diện với bạn càng nồng nhiệt càng tốt",
    "Tán tỉnh người ở bên trái/phải của bạn",
    "Nói với người bên trái/phải điều bạn thấy hấp dẫn nhất ở họ",
    "Hét lên 10 từ chửi thề tồi tệ",
    "Lấy một viên nước đá và nhét nó vào quần của bạn",
    "Gọi đến số thứ năm gần đây nhất mà bạn đã gọi, hỏi người đó tên của bài hát sau đây và hát cho họ nghe cho đến khi họ đọc tên bài hát",
    "Bạn là nhân viên phục vụ. Đảm bảo rằng tất cả mọi người luôn có đủ đồ uống và đối xử với họ với sự tôn trọng như nhà hàng 5 sao.",
    "Bạn là đồ tồi, hãy đứng úp mặt vô tường và tự kiểm điểm đi.",
    "Để một người chơi ngửi nách của bạn",
    "Trao đổi áo phông của bạn với người bên phải của bạn",
    "Hú như sói trong 30 giây - không cười!",
    "Đứng ở giữa, nhắm mắt lại và để một người chơi ngẫu nhiên hôn bạn",
    "Mở ví của bạn ra.",
    "Hôn người chơi ở bên trái/phải của bạn",
    "Đi bằng bốn chân và bị tát vào mông",
    "Đặt một vật vào miệng của bạn và đặt nó vào miệng của người chơi bên trái/phải của bạn",
    "Cho người bên trái xem một bức ảnh gợi cảm của bạn",
    "Khiêu vũ với người bên trái/phải của bạn",
    "Thì thầm điều gì đó 'hư hỏng' vào tai người đối diện",
    "Chọn ai đó để đấp bóp vai lưng cho họ",
    "Nhấp một ngụm nhỏ đồ uống của từng người chơi của bạn",
    "Đọc tin nhắn tán tỉnh cuối cùng của bạn!",
    "Người bên trái bạn có thể vẽ gì đó lên mặt bạn",
    "Thực hiện một điệu nhảy ba lê chuyên nghiệp trong một phút!",
    "Chụp ảnh tự sướng khi ngồi trong nhà vệ sinh và đăng nó",
    "Nói chuyện trong 10 phút mà không được phép ngậm miệng",
    "Ăn một thìa mù tạt! (hoặc cái gì đó cay cay)",
    "Bạn có 5 phút để viết một bài hát về một người chơi - sau đó hát cho mọi người nghe",
    "Hiển thị cho mọi người lịch sử tìm kiếm của bạn trên google",
    "Một người chơi khác sẽ tạo cho bạn bất kỳ kiểu tóc nào bạn thích và bạn phải để kiểu tóc đó trong phần còn lại của trò chơi",
    "Giả vờ như bạn đã thắng cuộc bầu cử chủ tịch thành phố và có bài phát biểu chiến thắng!",
    "Đặt ngôn ngữ của điện thoại sang tiếng Thái Lan và để nguyên như vậy cho đến hết buổi tối",
    "Gọi cho số thứ 2 trong nhật ký và hát Chúc mừng sinh nhật.",
    "Thè lưỡi ra – và cũng giữ nó trong 3 phút tiếp theo!",
    "Tạo nên một câu chuyện cổ tích lãng mạn của Disney về người bên phải bạn và bạn",
    "Hét thật to từ đầu tiên xuất hiện trong đầu bạn!",
    "Hãy để bất kỳ người chơi nào khác cù bạn trong 30 giây!",
    "Đưa điện thoại của bạn cho người bên trái bạn, người hiện có thể đăng nội dung nào đó lên Instagram Story của bạn",
    "Hãy thử rap như MCK (hoặc một rapper khác)!",
    "Nói nội dung trong Neewfeed đầu tiên trong Facebook của bạn, bằng giọng Quảng Ngãi (hãy tôn trọng đa dạng vùng miền)!",
    "Diễn lại một cảnh trong bộ phim yêu thích của bạn!",
    "Trò chuyện với một chiếc ghế và giả vờ như nó đang trả lời",
    "Cho mọi người khác thấy bức ảnh thứ 20 trong album của bạn",
    "Nói với người đối diện bạn những điều tuyệt vời về anh ấy/cô ấy!",
    "Cạo một phần cơ thể của bạn!",
    "Bắt chước ai đó trong nhóm. Những người khác phải đoán xem đó là ai!",
    "Nhảy theo một bài hát mà nhóm chọn cho bạn",
    "Bắt chước một em bé sơ sinh",
    "Đặt một viên đá vào trong áo của bạn",
    "Vỗ má theo nhịp bài hát cho đến khi người khác đoán được",
    "Cố gắng bán thứ gì đó từ trong túi của bạn cho ai đó trong nhóm! Sử dụng tất cả tài năng bán hàng của bạn!",
    "Đăng một bức ảnh về đôi chân của bạn trên Facebook story của bạn",
    "Tạo dáng như vận động viên thể hình trong 30 giây",
    "Gửi một bức ảnh tự sướng nhăn mặt cho người cuối cùng bạn nhắn tin trên Instagram",
    "Mở bất kỳ món ăn nhẹ nào chỉ bằng răng và miệng của bạn. Tay và chân bị cấm!",
    "Gọi đến số thứ 7 trong lịch sử điện thoại của bạn và hát cho họ nghe một bài hát mà cả nhóm có thể chọn trong 30 giây",
    "Cho mọi người thấy bạn có gì trong ví",
    "Kết thúc mỗi câu bằng từ 'ahihi' cho đến khi đến lượt tiếp theo của bạn",
    "Hét lên rằng bạn yêu mẹ nhiều như thế nào!",
    "Viết một bài thơ tình về ai đó trong nhóm",
    "Hét lên, Tôi yêu cái mông của tôi!",
    "Thực hiện 15 lần chống đẩy",
    "Hành động như một con khỉ trong 1 phút",
    "Thực hiện động tác trồng cây chuối đếm ngược từ 20"
        "Hôn người bên trái bạn!",
    "Gọi cho một người bạn và nói chuyện với anh ấy/cô ấy bằng tiếng Anh!",
    "Đứng trong góc trong 1 phút! bạn thật xấu xa",
    "Bạn phải ngửi nách của người chơi khác và giả vờ rằng đó là thứ đẹp nhất trên thế giới",
    "Nói bằng tiếng địa phương của bạn cho đến lượt tiếp theo",
    "Hãy để mọi người sơn móng tay cho bạn",
    "Hát 1 bài hát của Sơn Tùng MTP",
    "Trong năm phút tiếp theo, hãy giả vờ như bạn có một người bạn vô hình",
    "Lấy toàn bộ đồ trong túi xách/ba lô/túi quần của bạn và giải thích tất cả các đồ vật",
    "Lặp lại tất cả những gì người bên trái bạn nói cho đến khi đến lượt bạn",
    "Truy cập trang cá nhân Facebook của người bạn thích và nhấn like một bức ảnh cách đây hơn mười tuần",
    "Đứng bên ngoài và chào mọi người đi ngang qua - bạn phải vẫy tay với những người lái xe",
    "Trang điểm mà không soi gương",
    "Gọi ngẫu nhiên cho ai đó và nói với anh ấy/cô ấy rằng bạn sắp đi xa",
    "Giả vờ bạn là con mèo của người bên phải bạn",
    "Dùng lưỡi chạm vào mũi. Nếu không thành công, bạn phải dùng lưỡi chạm vào mũi của người bên trái",
    "Thay đổi tên Instagram của bạn thành tên của một idol của bạn",
    "Khen ngợi mọi người xung quanh",
    "Chửi bới mọi người xung quanh (chửi cho đều %&#)",
    "Nắm tay ai đó trong nhóm - cho đến khi 10 vòng chơi kết thúc",
    "Đọc một tờ báo/tin tức/bài viết trực tuyến bằng một giọng gợi cảm và quyến rũ",
    "Hành động như một em bé phấn khích trong 2 phút",
    "Uống như một con chó từ một cái bát",
    "Ngửi tóc của mọi người trong nhóm và mô tả mùi hương",
    "Thực hiện 10 lần nhảy cóc",
    "Nói hai điều trung thực về những người khác trong nhóm",
    "Tự beatbox và nhảy trong 1 phút",
    "Nhảy không nhạc trong 1 phút",
    "Hôn người bên trái bạn",
    "Yêu cầu người bên phải bạn vẽ lên mặt bạn bằng bút",
    "Nhắn tin cho ai đó mà bạn đã không nói chuyện trong một năm và gửi ảnh chụp màn hình",
    "Cho mọi người xem ảnh chụp màn hình thứ 5 trong máy của bạn",
    "Hôn lên trán người bên trái bạn",
    "Đọc to những gì bạn đã tìm kiếm trên điện thoại của mình trong 1 ngày qua",
    "Kêu như một con vịt cho đến khi đến lượt bạn một lần nữa",
    "Mạo danh một người nổi tiếng mỗi khi bạn nói",
    "Hét lên từ đầu tiên xuất hiện trong đầu",
    "Hãy thử điệu nhảy TikTok đầu tiên trên app Tiktok của bạn",
    "Cố gắng không cười trong 10 phút tiếp theo",
    "Chỉ mở túi đồ ăn nhẹ hoặc kẹo bằng miệng, không dùng tay hoặc chân",
    "Bây giờ, hãy mát-xa chân cho 1 người trong nhóm trong 3 phút",
    "Cập nhật trạng thái mối quan hệ của bạn thành đã đính hôn trên Facebook",
    "Cho đá viên vào quần",
    "Trang điểm mà không nhìn vào gương và sau đó để như vậy cho đến hết trò chơi",
    "Hành động như một con gà cho đến lượt tiếp theo của bạn",
    "Quay nhanh 10 lần, sau đó cố gắng đi theo một đường thẳng",
    "Nhắn tin cho người bạn thích và rủ họ đi chơi",
    "Nhờ ai đó sơn móng tay theo cách họ muốn",
    "Đứng trước cửa nhà bạn và vẫy tay chào bất cứ ai sẽ đi ngang qua trong phút tới",
    "Yêu cầu người chơi khác đăng trạng thái trên mạng xã hội của bạn",
    "Ngửi chân trần của người chơi khác",
    "Chọn ai đó trong nhóm để đánh đòn bạn",
    "Mở Instagram hoặc Facebook của bạn và thích mọi bài đăng mà người yêu cũ của bạn đã đăng",
    "Đưa điện thoại của bạn cho một người chơi khác có thể gửi một tin nhắn cho bất kỳ ai",
    "Cho nhóm xem tin nhắn văn bản cuối cùng bạn nhận được trên điện thoại của mình",
    "Ăn một miếng tỏi",
    "Hãy cư xử như một con chó",
    "Hú như một con sói trong mười giây",
    "Khiêu vũ mà không cần chơi nhạc",
    "Ôm người đối diện của bạn",
    "Hét ra ngoài cửa sổ, Tên tôi là ... và tôi là một con chó",
    "Thực hiện năm lần chống đẩy",
    "Hát 1 bài hát mà bạn không thích.",
    "Hát 1 bài hát mà bạn đang bị ám ảnh",
    "Thực hiện một cú nhào lộn",
    "Hành động như một con gà",
    "Kết thúc mỗi câu bằng ...meo meo!",
    "Cho đá viên vào quần",
    "Biểu diễn một vở hài kịch độc thoại dài ba phút",
    "Kể tên một điều về bản thân mà bạn đã nhận được lời khen",
    "Cho mọi người xem số dư tài khoản ngân hàng của bạn nào ^^",
    "Tìm ra mái tóc của ai có mùi thơm nhất",
    "Ăn một cái gì đó mà không cần dùng tay để giúp đỡ",
    "Hôn người khác giới bên phải bạn",
    "Hành động như một con bò trong hai phút",
    "Mở messenger của bạn, lấy ra 1 ticker bạn đã dùng gần đây, và bắt chước ticker đó",
    "Cởi bỏ một vật trên người",
    "Hãy thả boom thúi 1 cái",
    "Nhóm có thể chọn một bài hát, bạn phải nhảy theo bài hát đó!",
    "Dành một lời khen chân thành cho người ngồi bên phải bạn",
    "Trao cho người đối diện bạn một cái ôm thật lâu",
    "Hãy khóc đi khóc đi đừng ngại ngùng",
    "Nhắn tin cho người yêu cũ của bạn rằng bạn muốn cả 2 quay lại",
    "Gọi điện cho người yêu cũ và khóc lóc",
    "Gọi điện cho ba/me, và nói rằng bạn cám ơn họ",
    "Kể tên tỉnh bắt đầu bằng chữ H",
    "Gọi cho mẹ, và xin mẹ 5 triệu",
    "Gọi cho ba, và hỏi ba dạo này khỏe không?",
    "Gọi cho mẹ, và hỏi mẹ dạo này khỏe không?",
    "Gọi cho anh/chị/em/bạn bè, và hỏi mượn tiền",
    "Gọi cho người yêu cũ, và hỏi thăm sức khỏe của họ",
    "Gọi cho người yêu cũ và mượn 5 triệu",
    "Khoe cơ bụng sáu múi",
    "Gọi cho ba/mẹ, và nói rằng bạn yêu họ nhất",
    "Gọi/nhắn tin cho anh/chị/em và nói rằng bạn thấy hạnh phúc khi có họ",
    "Hãy thả thính một câu",
    "Nhắn cho crush và rủ đi xem phim",
    "Đọc 5 điều Bác Hồ dạy",
    "Tạo tiếng xì hơi",
    "Gọi cho một người bạn và nói với họ rằng bạn đang mang thai",
    "Hôn người khác giới ngồi đầu tiên bên phải bạn",
    "Khoe cơ bắp tay của bạn",
    "Trao cho người bên trái bạn một cái nhìn quyến rũ",
    "Bạn phải nắm tay người bạn chọn trong năm phút",
    "Nhóm có thể chọn một bài hát, bạn phải hát theo bài hát đó!",
    "Cho chúng tôi xem bụng của bạn",
    "Hát to bài hát yêu thích hiện tại của bạn trước mặt nhóm",
    "Đăng một bức ảnh của người bên trái bạn lên Facebook",
    "Hãy ngáp và cố gắng để ít nhất 1 người cũng ngáp theo",
    "Đối với con trai: trang điểm. Đối với một cô gái: tẩy trang",
    "Tái hiện màn trình diễn trên sân khấu của Miley Cyrus tại VMAs!",
    "Cầm tờ giấy trên tay và vẽ người đàn ông trong mơ hoặc người phụ nữ trong mơ của bạn",
    "Đóng giả một con khỉ trong ba vòng tiếp theo",
    "Phát bài hát cuối cùng bạn nghe trên điện thoại và nhảy cuồng nhiệt theo nó",
    "Rap một bài của Đen Vâu (dè de)",
    "Bạn phải làm cho người ngồi đối diện bạn cười",
    "Đề xuất kết hôn với một người bạn chọn trong nhóm",
    "Hãy thử một trò ảo thuật",
    "Giả một trận cười sảng khoái",
    "Cười thật to trong 10 giây",
    "Nín thở trong 30 giây",
    "Hít vào, thở ra, hít vào và nín thở trong 1 phút",
    "Tát người bên trái/phải",
    "Để 1 người trong nhóm tát bạn",
    "Gọi cho ai đó và chúc họ một năm mới hạnh phúc",
    "Đi xung quanh nhóm và sủa như một con chó",
    "Mát-xa đầu cho đồng đội trong 2 phút",
    "Lắc mông!",
    "Nhờ ai đó dán băng keo lên bất kỳ bộ phận nào trên cơ thể bạn và xé nó ra",
    "Quay khoảng 10 lần và cố gắng đi thẳng",
    "Đội khăn xếp làm từ giấy vệ sinh",
    "Nói theo câu này thật nhanh: Nếu nói lầm lẫn lần này thì nói lại. Nói lầm lẫn lần nữa thì lại nói lại. Nói cho đến lúc luôn luôn lưu loát hết lầm lẫn mới thôi",
    "Khen ngợi mọi người trong nhóm",
    "Hãy để những người chơi khác lướt qua điện thoại của bạn trong một phút",
    "Lấy hết đồ trong ví, ba lô hoặc túi của bạn và cho mọi người thấy những gì bạn có",
    "Uống ba ly nước",
    "Kể chuyện cười hay nhất của bạn!",
    "Kể một câu chuyện vui!",
    "Làm động tác đang đi 'ẻ' ",
    "Cố gắng làm cho những người khác cười trong 30 giây!",
    "Bạn không thể nói gì thêm cho đến lượt tiếp theo của bạn. Nếu thất bại, bạn phải thực hiện 25 lần chống đẩy!",
    "Vỗ đầu mỗi người chơi",
    "Xoa bóp vai của người chơi bên trái của bạn",
    "Phát bài hát yêu thích của bạn",
    "Cho những người chơi khác biết bạn đã đăng ký kênh nào trên YouTube",
    "Đi mua nước cho mọi người",
    "Hành động như người khác giới trong ba vòng tiếp theo",
    "Cho thấy một vết sẹo và kể câu chuyện của nó",
    "Có ai đói không? - Đi mua hoặc đặt đồ ăn cho mọi người",
    "Nói ngược tên của từng người chơi nhanh nhất có thể",
    "Trong bốn vòng tiếp theo, bạn chỉ được phép trả lời Có",
    "Trong bốn vòng tiếp theo, bạn chỉ được phép trả lời Không",
    "Đổi chỗ cho người chơi bên trái của bạn!",
    "Đổi chỗ cho người chơi bên trái của bạn!",
    "Đổi chỗ cho người chơi bên phải của bạn!",
    "Đổi chỗ cho người chơi bên phải của bạn!",
    "Đổi chỗ cho người chơi đối diện của bạn!",
    "Đổi chỗ cho người chơi bên trái 2 người!",
    "Đổi chỗ cho người chơi bên phải 2 người!",
    "Ngửi nách của người chơi bên phải bạn, sau đó sử dụng loại trái cây mô tả mùi hương chính xác nhất",
    "Tạo một sự sắp xếp chỗ ngồi mới cho nhóm theo nhu cầu của bạn",
    "Tạo một sự sắp xếp chỗ ngồi mới cho nhóm theo nhu cầu của bạn",
    "Nhận một cú đánh vào mông từ người chơi đối diện với bạn",
    "Đặt báo thức trên điện thoại của bạn lúc 4 giờ chiều",
    "Bây giờ bạn là một con mèo, hãy thử gãi tai bằng chân của bạn",
    "Bây giờ bạn là một con chó, hãy làm hành động nếu bạn cần ị",
    "Cho thấy bạn mạnh mẽ như thế nào! Vật tay với người bên trái của bạn",
    "Khoe cơ bắp và tạo dáng như vận động viên thể hình trong 30 giây",
    "Giữ tay trên đầu trong ba vòng tiếp theo",
    "Ôm người chơi bên trái của bạn giống như bạn là một cặp",
    "Hãy dành cho mọi người trong nhóm một lời khen chân thành",
    "Rap tự do trong 30 giây",
    "Đứng trong hai vòng tiếp theo",
    "Nằm trong hai vòng tiếp theo",
    "Đổ một cốc nước lên đầu",
    "Đọc tin nhắn tiếp theo mà bạn nhận được thành tiếng",
    "Cho những người chơi khác thấy đôi chân của bạn và để họ đánh giá vẻ đẹp của chúng",
    "Đánh nhau bằng gối với người chơi bên phải của bạn",
    "Cố gắng dọa ai đó",
    "Người chơi bên phải của bạn phải ngồi trên đùi bạn trong vòng tiếp theo",
    "Ngồi trên đùi của người chơi đối diện với bạn",
    "Cõng người chơi nhẹ nhất trong 30 giây",
    "Hãy thử tô son cho người chơi đối diện mà không dùng tay",
    "Chụp một bức ảnh nhóm vui vẻ và đăng nó lên một trang mạng xã hội",
    "Chụp một bức ảnh nhóm vui vẻ và đăng nó lên một trang mạng xã hội",
    "Làm bất cứ điều gì bạn được yêu cầu làm trong phút tiếp theo",
    "Xóa hai ứng dụng bất kỳ trên điện thoại của bạn",
    "Hãy là một quý ông/quý bà trong phần còn lại của ngày",
    "Nhảy sexy trong 30 giây",
    "Tán tỉnh chính mình trong gương",
    "Trong 5 vòng chơi, hãy kêu như một con vịt trước khi nói",
    "Chạy tại chỗ trong khi kêu gâu trong 1 phút",
    "Xoa ngón tay dưới nách rồi ngửi",
    "Vẽ một khuôn mặt xung quanh rốn của bạn",
    "Nhắm mắt lại và để bạn bè của bạn đưa thức ăn họ chọn vào miệng bạn",
    "Cố gắng không chớp mắt trong một phút",
    "Đưa cho ai đó trong nhóm tất cả số tiền bạn có trong ví",
    "Cười thật to với bất cứ điều gì người bên trái bạn nói cho đến khi đến lượt bạn",
    "Giả vờ say trong phần còn lại của trò chơi",
    "Từ bây giờ cho đến khi đến lượt bạn, mỗi khi ai đó nói, hãy ngắt lời người đó bằng cách nói: Xạooo ",
    "Bắt chước công việc mơ ước của bạn",
    "Gọi cho bất kỳ người nào và hát chúc mừng sinh nhật họ",
    "Hành động như một con lợn cho đến khi đến lượt bạn một lần nữa",
    "Đặt tên cho một người chơi là “Bệ hạ” trong 5 vòng",
    "Đứng bằng bốn chân và hành động như một con chó cho đến bước tiếp theo của bạn",
    "Gọi cho crush của bạn và meo meo như một con mèo",
    "Bắt chước người bên phải của bạn trong 10 phút tới",
    "Cho đến khi kết thúc trò chơi, bạn không được nói lại cho đến khi ai đó gọi tên bạn",
    "Gửi tin nhắn văn bản cho ba người với nội dung Tôi yêu bạn.",
    "Đóng vai một người đàn ông gắt gỏng khó chịu về giới trẻ ngày nay và nói về những ngày xưa tốt đẹp",
    "Hành động như một bức tượng cho đến khi đến lượt bạn (không nói chuyện hoặc di chuyển)",
    "Hãy mặc ngược quần áo của bạn và giữ nguyên như vậy trong suốt trò chơi",
    "Biểu diễn múa cột với một cây cột tưởng tượng",
    "Đóng giả một nhân vật hoạt hình hoặc siêu nhân/siêu anh hùng tốt nhất có thể",
    "Trường Sa, Hoàng Sa là của Việt Nam! (1 phút yêu nước)",
    "Trường Sa, Hoàng Sa là của Việt Nam! (1 phút yêu nước)",
    "Trường Sa, Hoàng Sa là của Việt Nam! (1 phút yêu nước)",
    "Trường Sa, Hoàng Sa là của Việt Nam! (1 phút yêu nước)",
    "Trường Sa, Hoàng Sa là của Việt Nam! (1 phút yêu nước)",
    "Trường Sa, Hoàng Sa là của Việt Nam! (1 phút yêu nước)",
    "Trường Sa, Hoàng Sa là của Việt Nam! (1 phút yêu nước)",
    "Trường Sa, Hoàng Sa là của Việt Nam! (1 phút yêu nước)",
  ];
}
