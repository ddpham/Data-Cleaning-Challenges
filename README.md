# Data-Cleaning-Challenges

Bài viết này xoay quanh những vấn đề về dữ liệu mà [Rachael Tatman](https://www.kaggle.com/rtatman) đã viết trên trang web của Kaggle bao gồm:

1) Ngày 1: Xử lý dữ liệu bị thiếu (Bài viết của Rachel [tại đây](https://www.kaggle.com/rtatman/data-cleaning-challenge-handling-missing-values/notebook))
2) Ngày 2: Chia tỷ lệ (scaling) và tiêu chuẩn hóa (normalization)(Bài viết của Rachel [tại đây](https://www.kaggle.com/rtatman/data-cleaning-challenge-scale-and-normalize-data))
3) Ngày 3: Xử lý dữ liệu ngày (parsing dates) (Bài viết của Rachel [tại đây](https://www.kaggle.com/rtatman/data-cleaning-challenge-parsing-dates/))
4) Ngày 4: Mã hóa ký tự (Character encodings) (Bài viết của Rachel [tại đây](https://www.kaggle.com/rtatman/data-cleaning-challenge-character-encodings/))
5) Ngày 5: Dữ liệu không nhất quán (Inconsistent Data Entry) (Bài viết của Rachel [tại đây](https://www.kaggle.com/rtatman/data-cleaning-challenge-inconsistent-data-entry/))

Các bài viết của Rachel được code trên Python, do đó, bài viết của mình sẽ được viết lại trên R, mục đích là để thực hiện lại các bước xử lý dữ liệu nói trên, đồng thời, thực hành những kỹ năng xử lý dữ liệu và khả năng codeing trên R. 

**Lưu ý:** trong tất cả các bài viết trên đều có dữ liệu ví dụ mà chúng ta cần download để có thể thực hành được. Để download được các dữ tập dữ liệu này, bạn cần đăng ký thành viên của Kaggle và đồng ý với các điều lệ bảo mật dữ liệu từ trang web. Ở đây mình chỉ lấy sample các tập dữ liệu này để mọi người có thể nhìn qua dữ liệu sẽ được sử dụng.

## Dữ liệu sử dụng:

1) Ngày 1: 
  - Dữ liệu giải bóng bầu dục Mỹ (NFL Play by Play 2009-2017 (v4).csv): [tại đây](https://www.kaggle.com/maxhorowitz/nflplaybyplay2009to2016)
  - Dữ liệu cấp phép xây dựng tại San Francisco (Mỹ)(Building_Permits.csv): [tại đây](https://www.kaggle.com/aparnashastry/building-permit-applications-data)
  
2) Ngày 2: 
  - Dữ liệu về các dự án Kickstarter(ks-projects-201801.csv): [tại đây](https://www.kaggle.com/kemical/kickstarter-projects)
  - Dữ liệu về giấy phép nuôi thú tại Seattle (Mỹ)(seattle_pet_licenses.csv): [tại đây](https://www.kaggle.com/aaronschlegel/seattle-pet-licenses)
  
3) Ngày 3:
  - Dữ liệu về lở đất trên thế giới: [tại đây](https://www.kaggle.com/nasa/landslide-events)
  - Dữ liệu về các vụ động đất lớn trên thế giới: [tại đây](https://www.kaggle.com/usgs/earthquake-database)
  - Dữ liệu về núi lửa phùn trào: [tại đây](https://www.kaggle.com/smithsonian/volcanic-eruptions)
  
4) Ngày 4:
  - Dữ liệu về các vụ nổ súng của cảnh sát Mỹ: [tại đây](https://www.kaggle.com/kwullum/fatal-police-shootings-in-the-us)
  - Dữ liệu về các dự án Kickstarter: [tại đây](https://www.kaggle.com/kemical/kickstarter-projects)
  
5) Ngày 5:
  - Dữ liệu về các vụ đánh bom cảm tử tại Parkistan: [tại đây](https://www.kaggle.com/zusmani/pakistansuicideattacks)
