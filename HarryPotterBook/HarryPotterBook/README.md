# Objective - 해리포터 시리즈 책(Lv1 ~ Lv7)
- json형태의 데이터를 활용하여 해리포터 시리즈 책에 정보를 열람할 수 있는 앱입니다.

## 폴더 구조
```
|ㅡ App # AppDelegate & SceneDelegate 
|ㅡ Core # DTO, Entity, Service
|ㅡ Presentation # UI 관련 코드(UIViewController, UI 컴포넌트, ViewModel)
|ㅡ Resources # json 파일 및 Image
```

## 스택
- Snapkit
- MVVM


# Key Result
## 1. json decoding
- json decoding 후 BookDTO에서 Book이라는 Entity를 생성할 때 seriesNumber를 추가 (추후 series 별 버튼에 사용)
```
struct BookDTO: Decodable {
    let title: String
    let author: String
    let pages: Int
    let releaseDate: String
    let dedication: String
    let summary: String
    let wiki: String
    let chapters: [ChaptersResponse]
    
    enum CodingKeys: String, CodingKey {
        case title
        case author
        case pages
        case releaseDate = "release_date"
        case dedication
        case summary
        case wiki
        case chapters
    }
}

extension BookDTO{
    func toEntity(offset: Int) -> Book{
        return Book(seriesNumber: offset,
                    title: title,
                    author: author,
                    pages: pages,
                    releaseDate: convertReleaseDateString(releasDate: releaseDate),
                    dedication: dedication,
                    summary: summary,
                    wiki: URL(string: wiki),
                    chapters: chapters.map{$0.title})
    }
    ...
}

struct Book{
    let seriesNumber: Int // 추가
    let title: String
    let author: String
    let pages: Int
    let releaseDate: String
    let dedication: String
    let summary: String
    let wiki: URL?
    let chapters: [String]
}
```
 
## 2. 최대한 UIStackView 활용하기
- 하나의 큰 UIStackView 내부에 UIStackView를 추가
![Image](https://github.com/user-attachments/assets/fa414369-cbfc-4bfc-b988-5c316e271ba1)

- 더보기 버튼도 UIStackView 내부에 추가하여 버튼 숨기기 시 높이 반영

더보기 있을 경우
![Image](https://github.com/user-attachments/assets/de54741d-53f0-46b1-b813-fe1caf5580dd)

더보기 없을 경우
![Image](https://github.com/user-attachments/assets/0223e76f-23c3-4f59-8000-a083900c019c)
## 3. 더보기 버튼 활성화 유무 값 앱을 종료해도 유효하도록 하기
- UserDefaults 사용
- 시리즈 번호 별로 더보기 활성화 상태를 저장하기 위해 배열로 저장 
```
final class DataService {
    
    enum DataError: Error {
        .
        .
        .
        case NotFoundedUserDefaults
    }
    
    func uploadSummaryToggleState(states: [Bool]){
        UserDefaults.standard.set(states, forKey: "summaryToggleState")
    }
    
    func loadSummaryToggleState(completion: @escaping (Result<[Bool],Error>) -> Void){
        if let states = UserDefaults.standard.array(forKey: "summaryToggleState") as? [Bool]{
            completion(.success(states) )
        }else{
            completion(.failure(DataError.NotFoundedUserDefaults))
        }
    }
}
```

- ViewModel init에서 더보기 버튼 상태를 불러올 수 있도록 구현
- UserDefaults에서 값을 불러올 수 없을 때는 앱이 최초 실행될 경우이므로 시리즈 전체 갯수인 7로 초기화하여 저장
- summaryToggleButtonStates의 데이터가 변경될 경우 didSet{}을 활용하여 업데이트된 데이터가 UserDefaults에 반영될 수 있도록 구현
```
final class MainViewModel{
    .
    .
    .
    
    private var summaryToggleButtonStates: [Bool] = [] {
        didSet{
            // summary 더보기 toggle 버튼 State가 업데이트 될 때마다 UserDefaults에 저장
            dataService.uploadSummaryToggleState(states: summaryToggleButtonStates)
        }
    }
    
    init(){
        // ViewModel init 시 summary 더보기 버튼 상태 값 불러오기
        dataService.loadSummaryToggleState { [weak self] result in
            guard let self = self else { return }
            
            switch result{
            case .success(let states):
                self.summaryToggleButtonStates = states
            case .failure(_):
                // UserDefaults에서 찾을 수 없는 값이라면(앱 최초 실행 시) 디폴트 값
                let defaultStates = Array(repeating: false, count: 7)
                self.summaryToggleButtonStates = defaultStates
            }
        }
    }
}    
```

## 4. 시리즈 번호 버튼 클릭 시 해당 정보로 UI 업데이트하기
- UICollectionView로 시리즈 번호를 구현
- UICollectionViewDelegate의 메소드를 사용하여 시리즈 버튼(UICollectionViewCell)을 클릭 시 UI 업데이트 되도록 구현

```
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 시리즈 숫자 클릭 시 UI 업데이트
        .
        .
        .
    }
```

## 5. 디바이스 회전 시에도 layout 대응하기
- Autolayout 적용하여 대응
- 디바이스 회전 시 UICollectionView의 ContentOffset 가운데로 정렬되지 않아 viewDidLayoutSubviews()를 활용하여 해결
```
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // layout 변경 시(디바이스 회전) collectionView layout 업데이트
        CollectionView.collectionViewLayout.invalidateLayout()
    }
```  
