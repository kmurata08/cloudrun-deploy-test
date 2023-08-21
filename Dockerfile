# Goの公式イメージを使用
FROM golang:1.16 AS builder

# ワークディレクトリを設定
WORKDIR /app

# 依存関係のコピーとビルド
COPY go.* ./
RUN go mod download
COPY . ./
RUN go build -o cat-server ./cmd/cat/
RUN go build -o dog-server ./cmd/dog/

# cat用の最終イメージ
FROM gcr.io/distroless/base-debian10 AS cat
COPY --from=builder /app/cat-server /server
CMD ["/server"]

# dog用の最終イメージ
FROM gcr.io/distroless/base-debian10 AS dog
COPY --from=builder /app/dog-server /server
CMD ["/server"]