#!/usr/bin/env bash

# 실패 시 즉시 종료
set -e

# 생성할 파일 목록
files=(
  "index.qmd"

  "part1/데이터 로드 및 구조 점검.qmd"
  "part1/탐색적 데이터 분석(EDA).qmd"
  "part1/결측치 처리.qmd"
  "part1/이상치 탐지.qmd"
  "part1/스케일링.qmd"
  "part1/데이터 분포 변환.qmd"
  "part1/범주형 데이터 인코딩.qmd"
  "part1/연속형 데이터 범주화.qmd"
  "part1/불균형 데이터 처리.qmd"
  "part1/피처 엔지니어링.qmd"

  "part2/확률분포와 표본.qmd"
  "part2/정규성 검정.qmd"
  "part2/등분산 검정.qmd"
  "part2/적합성 및 독립성 검정.qmd"
  "part2/평균 비교 검정.qmd"
  "part2/분산 분석.qmd"
  "part2/비모수 검정.qmd"
  "part2/상관 분석.qmd"

  "part3/데이터 분할 및 검정.qmd"
  "part3/특성 선택.qmd"
  "part3/차원 축소.qmd"
  "part3/회귀 모델.qmd"
  "part3/분류 모델.qmd"
  "part3/군집 분석.qmd"
  "part3/서포트 벡터 머신.qmd"
  "part3/모델 성능 평가.qmd"
  "part3/파이프라인 및 자동화.qmd"
  "part3/모델 해석.qmd"
)

for file in "${files[@]}"; do
  dir=$(dirname "$file")
  filename=$(basename "$file")
  title="${filename%.qmd}"

  # 디렉터리 생성
  if [[ "$dir" != "." ]]; then
    mkdir -p "$dir"
  fi

  # 파일이 없을 때만 생성 + 제목 추가
  if [[ ! -f "$file" ]]; then
    {
      echo "# $title"
      echo
    } > "$file"

    echo "Created with title: $file"
  else
    echo "Skipped (already exists): $file"
  fi
done

echo "✅ Quarto book용 qmd 파일 및 H1 제목 생성 완료"
