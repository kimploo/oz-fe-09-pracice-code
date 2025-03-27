# prisma hands on

## 사전 학습

- Node.js 설치
- npm 사용법
- REST API에 대한 이해
- express.js

## prisma 설치

https://www.prisma.io/docs/getting-started/setup-prisma/start-from-scratch/relational-databases-node-postgresql
https://supabase.com/partners/integrations/prisma

```bash
# npm 초기 세팅
# 자, 여기부터는 이제 Node.js 관련 패키지를 가지고 뭔가 만들꺼야
npm init -y

# prisma 설치
npm install prisma --save-dev

# prisma 초기 세팅
npx prisma
npx prisma init
```

```bash
# .env
DATABASE_URL="postgres://[db-user].[project-ref]:[db-password]@aws-0-[aws-region].pooler.supabase.com:6543/[db-name]?pgbouncer=true&connection_limit=1" # Set this to the Transaction connection pooler string you copied in Step 1
DIRECT_URL="postgres://[db-user].[project-ref]:[db-password]@aws-0-[aws-region].pooler.supabase.com:5432/[db-name]"  # Set this to the Session connection pooler string you copied in Step 1
```

## prisma

```bash
# 파일 변경 확인을 위해 git init
git init

# prisma 스키마로 떙겨온다 -> Supabase의 postgresql에 접근해서 데이터베이스 스키마를 불러온다.
npx prisma db pull

# prisma/migrations/0_init 디렉터리 생성

# prisma 스키마 기반 마이그레이션 sql 생성
npx prisma migrate diff \
--from-empty \
--to-schema-datamodel prisma/schema.prisma \
--script > prisma/migrations/0_init/migration.sql

# 마이그레이션 정보 확인
npx prisma migrate status

# 마이그레이션 정보 적용
npx prisma migrate resolve --applied 0_init

# 스키마 변경 (ex, NOT NULL, CURRENT TIMESTAMP 적용)

# 마이그레이션 시작
npx prisma migrate dev

# Note: npx prisma migrate dev는 개발용 데이터베이스에 적용하는 명령어다.
# 개발용 데이터베이스는 git staging area와 비슷한 개념으로 보면 된다.
# 배포용 데이터베이스에 적용하는 것은 위험! 잘 되는지 충분히 확인하고 npx prisma migrate deploy로 배포를 할 것.
# Futher Reading: https://www.prisma.io/docs/orm/prisma-migrate/understanding-prisma-migrate/mental-model
```

## 서버 설정

```sql
# 서버 초기 설정
npm i express morgan dotenv cors cookie-parser
npm i -D nodemon
```

## Post CRUD

```sql
src
├── feature
│   ├── post
│   │   ├── controller.mjs
│   │   ├── model.mjs
│   │   └── router.mjs
├── index.mjs
```
