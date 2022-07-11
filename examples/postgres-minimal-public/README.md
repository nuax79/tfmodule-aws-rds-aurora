# AWS RDS PostgreSQL Example

AWS RDS Aurora PostgreSQL cluster 생성 샘플입니다.

기능 검증용 테스트를 목적으로 하기위한 예제로 작은 크기의 클러스터를 public 에서 액세스 가능하도록 계획 되었습니다.

**!주의** 보안에 취약 하므로 production 환경에서 사용하지 말것을 권고합니다.

Prerequisite
----------
- AWS RDS Aurora 클러스터를 확인할 Postgresql 클라이언트를 설치해 주세요. RDS 클러스터가 Private 서브넷에 있다면 Bastion 을 통한 SSH 터널링 설청이 필요할 수 있습니다. [SSH 터널링 참고](https://aws.amazon.com/ko/premiumsupport/knowledge-center/rds-connect-ec2-bastion-host/)
- [main.tf](./main.tf) 의 local 변수 중 my_public_cidr 의 CIDR 값을 확인하여 입력해 주세요. [myipaddress](http://www.myipaddress.com/show-my-ip-address/) 에서 IP 주소를 확인 할 수 있습니다.

```hcl
locals {
  my_public_cidr = [ "211.196.197.138/32" ]
}
```

Build
----------

```bash
git clone https://github.com/nuax79/tfmodule-aws-rds-aurora.git

cd tfmodule-aws-rds-aurora/examples/aurora-postgres

terraform init
terraform plan
terraform apply
```

Destroy
----------

```bash
terraform destroy
```

Variables
----------
<table>
<thead>
    <tr>
        <th>Name</th>
        <th>Description</th>
    </tr>
</thead>
<tbody>
    <tr>
        <td>context</td>
        <td>Project, Team, Environment 등 모듈간 공유하는 컨텍스트 변수 입니다.</td>
    </tr>
    <tr>
        <td>engine</td>
        <td>RDS 엔진 입니다. ("aurora-postgresql")</td>
    </tr>
    <tr>
        <td>engine_version</td>
        <td>RDS 엔진 버전 입니다. ("12.4")</td>
    </tr>
    <tr>
        <td>engine_version</td>
        <td>RDS 엔진 버전 입니다. ("12.4")</td>
    </tr>
    <tr>
        <td>instance_type</td>
        <td>RDS 인스턴스 타입 입니다. ("db.r5.large")</td>
    </tr>
    <tr>
        <td>instance_type_replica</td>
        <td>RDS Read 노드 인스턴스 타입 입니다. ("db.t3.medium")</td>
    </tr>
    <tr>
        <td>vpc_id</td>
        <td>참조 VPC 아이디 입니다. (module.vpc.vpc_id)</td>
    </tr>
    <tr>
        <td>db_subnet_group_name</td>
        <td>참조 RDS 서브넷 명 입니다. (module.vpc.database_subnet_group_name)</td>
    </tr>
    <tr>
        <td>create_security_group</td>
        <td>RDS 용 보안 그룹 생셩 여부 입니다. (default: true)</td>
    </tr>
    <tr>
        <td>publicly_accessible</td>
        <td>외부 접속 허용 여부를 활성화 합니다. (default: false)</td>
    </tr>
    <tr>
        <td>allowed_cidr_blocks</td>
        <td>RDS 에 액세스를 허용할 subnets 입니다. (module.vpc 의 cidr 블록 참조)</td>
    </tr>
    <tr>
        <td>replica_count</td>
        <td>Read Node 갯수 입니다.</td>
    </tr>
    <tr>
        <td>iam_database_authentication_enabled</td>
        <td>IAM 데이터베이스 인증을 활성화할지 여부를 지정합니다. 모든 버전과 인스턴스가 지원되는 것은 아닙니다. 지원되는 버전을 확인하려면 AWS 설명서를 참조하십시오. (default: false)</td>
    </tr>
    <tr>
        <td>username</td>
        <td>RDS 사용자 이름 입니다.</td>
    </tr>
    <tr>
        <td>password</td>
        <td>RDS 패스워드 입니다.</td>
    </tr>
    <tr>
        <td>apply_immediately</td>
        <td>DB 수정 사항을 즉시 적용할지 또는 유지 관리 기간 동안 적용할지를 결정 (default: false)</td>
    </tr>
    <tr>
        <td>skip_final_snapshot</td>
        <td>DB 클러스터를 삭제하기 전에 최종 DB 스냅 샷을 생성할지 여부를 결정합니다. true를 지정하면 DB 스냅 샷이 생성되지 않습니다.</td>
    </tr>
    <tr>
        <td>db_parameter_group_name</td>
        <td>사용할 DB 파라미터 그룹의 이름 입니다.</td>
    </tr>
    <tr>
        <td>db_cluster_parameter_group_name</td>
        <td>DB 클러스터가 사용하는 파라미터 그룹 이름 입니다.</td>
    </tr>
    <tr>
        <td>enabled_cloudwatch_logs_exports</td>
        <td>CloudWatch 로그를 출력하는 로그 유형 목록 - audit, error, general, slowquery, postgresql (예: ["audit", "error", ...])</td>
    </tr>
</tbody>
</table>