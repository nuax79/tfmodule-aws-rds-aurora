# tfmodule-aws-rds-aurora

## AWS RDS Aurora 사용을 위한 동적 Terraform 자동화 도구 

## Installation

```
git clone https://gitlab.com/nua/tfmodule-aws-rds-aurora.git
```

## RDS Aurora for Build

```
terraform init
terraform plan
terraform apply
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
        <td>allow_major_version_upgrade</td>
        <td>엔진 버전 변경시 주요 엔진 업그레이드 허용 여부 결정 (default: false)</td>
    </tr>
    <tr>
        <td>allowed_cidr_blocks</td>
        <td>데이터베이스에 액세스 할 수있는 CIDR 블록 목록 (예: ["172.111.1.0/24"])</td>
    </tr>
    <tr>
        <td>allowed_security_groups</td>
        <td>액세스를 허용할 보안 그룹 ID 목록 (ex: ["sg34923474234"])</td>
    </tr>
    <tr>
        <td>apply_immediately</td>
        <td>DB 수정 사항을 즉시 적용할지 또는 유지 관리 기간 동안 적용할지를 결정 (default: false)</td>
    </tr>
    <tr>
        <td>auto_minor_version_upgrade</td>
        <td>유지 관리 창에서 소규모 엔진 업그레이드를 자동으로 수행할지 여부를 결정 (default: true)</td>
    </tr>
    <tr>
        <td>backtrack_window</td>
        <td>대상 역 추적 시간(초)입니다. 현재는 aurora 엔진에서만 사용할 수 있습니다. 역 추적을 사용하지 않으려면이 값을 0으로 설정하십시오. 0에서 259200 (72 시간) 사이 여야합니다. (default: 0)</td>
    </tr>
    <tr>
        <td>backup_retention_period</td>
        <td>백업 보관 기간 (일) (default: 7)</td>
    </tr>
    <tr>
        <td>ca_cert_identifier</td>
        <td>DB 인스턴스에 대한 CA 인증서의 식별자 (예: "rds-ca-2019")</td>
    </tr>
    <tr>
        <td>cluster_tags</td>
        <td>RDS 클러스터에만 추가 할 태그 입니다. AWS 인스턴스 스케줄러 태깅에 사용될 수 있습니다.</td>
    </tr>
    <tr>
        <td>copy_tags_to_snapshot</td>
        <td>모든 클러스터 태그를 스냅 샷에 복사. (default: false)</td>
    </tr>
    <tr>
        <td>create_cluster</td>
        <td>Aurora RDS 클러스터 및 관련 리소스의 생성 여부 (default: true)</td>
    </tr>
    <tr>
        <td>create_monitoring_role</td>
        <td>RDS 향상된 모니터링을 위한 IAM 역할 생성 여부 (default: true)</td>
    </tr>
    <tr>
        <td>create_security_group</td>
        <td>Aurora RDS 보안 그룹의 생성 여부 (default: true)</td>
    </tr>
    <tr>
        <td>database_name</td>
        <td>클러스터 생성시 자동으로 생성 된 데이터베이스의 이름 (default: null)</td>
    </tr>
    <tr>
        <td>db_cluster_parameter_group_name</td>
        <td>사용할 DB 파라미터 그룹의 이름 (default: null)</td>
    </tr>
    <tr>
        <td>db_parameter_group_name</td>
        <td>사용할 DB 파라미터 그룹의 이름 입니다.</td>
    </tr>
    <tr>
        <td>db_subnet_group_name</td>
        <td>사용할 RDS 서브넷 그룹 이름</td>
    </tr>
    <tr>
        <td>deletion_protection</td>
        <td>DB 인스턴스에 삭제 보호를 활성화 할지 여부 (default: false)</td>
    </tr>
    <tr>
        <td>enable_http_endpoint</td>
        <td>서버리스 Aurora 데이터베이스 엔진에 대해 데이터 API를 활성화할지 여부 (default: false)</td>
    </tr>
    <tr>
        <td>enabled_cloudwatch_logs_exports</td>
        <td>CloudWatch 로그를 출력하는 로그 유형 목록 - audit, error, general, slowquery, postgresql (예: ["audit", "error", ...])</td>
    </tr>
    <tr>
        <td>engine</td>
        <td>Aurora 데이터베이스 엔진 유형, 현재 aurora, aurora-mysql 또는 aurora-postgresql (예: ["audit", "error", ...])</td>
    </tr>
    <tr>
        <td>engine_mode</td>
        <td>데이터베이스 엔진 모드. 유효한 값 : global, parallelquery, provisioned, serverless, multimaster</td>
    </tr>
    <tr>
        <td>engine_version</td>
        <td>Aurora 데이터베이스 [엔진 버전](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.Updates.20180305.html)</td>
    </tr>
    <tr>
        <td>final_snapshot_identifier_prefix</td>
        <td>클러스터 제거시에 최종 스냅 샷을 생성 할 때 사용할 접두사 이름을 정의 합니다. (임의의 8 자리 숫자를 추가하여 고유함을 보장)</td>
    </tr>
    <tr>
        <td>global_cluster_identifier</td>
        <td>aws_rds_global_cluster에 지정된 전역 클러스터 식별자</td>
    </tr>
    <tr>
        <td>iam_database_authentication_enabled</td>
        <td>IAM 데이터베이스 인증을 활성화할지 여부를 지정합니다. 모든 버전과 인스턴스가 지원되는 것은 아닙니다. 지원되는 버전을 확인하려면 AWS 설명서를 참조하십시오. (default: false)</td>
    </tr>
    <tr>
        <td>iam_role_description</td>
        <td>IAM 역할에 대한 설명</td>
    </tr>
    <tr>
        <td>iam_role_force_detach_policies</td>
        <td>역할을 제거하기 전에 역할에있는 정책을 강제로 분리할지 여부</td>
    </tr>
    <tr>
        <td>iam_role_managed_policy_arns</td>
        <td>IAM 역할에 연결하여 액세스 권한을 부여할 IAM 관리형 정책 ARN 세트</td>
    </tr>
    <tr>
        <td>iam_role_max_session_duration</td>
        <td>역할에 설정할 최대 세션 기간 (초)</td>
    </tr>
    <tr>
        <td>iam_role_path</td>
        <td>IAM 역할 경로</td>
    </tr>
    <tr>
        <td>iam_role_permissions_boundary</td>
        <td>역할에 대한 권한 경계를 설정하는 데 사용되는 정책의 ARN</td>
    </tr>
    <tr>
        <td>iam_roles</td>
        <td>RDS 클러스터에 연결할 IAM 역할의 ARN 목록</td>
    </tr>
    <tr>
        <td>instance_type</td>
        <td>마스터 인스턴스에서 사용할 인스턴스 유형</td>
    </tr>
    <tr>
        <td>instance_type_replica</td>
        <td>복제본 인스턴스에서 사용할 인스턴스 유형 (이 값이 설정되지 않은 경우 instance_type 타입과 동일한 유형을 사용합니다.)</td>
    </tr>
    <tr>
        <td>instances_parameters</td>
        <td>커스텀 데이터베이스 인스턴스 파라미터값의 설정. (지원 키 : instance_name, instance_type, instance_promotion_tier,publicly_accessible, ...)</td>
    </tr>
    <tr>
        <td>is_primary_cluster</td>
        <td>기본 클러스터 생성 여부 (default: true, 글로벌 데이터베이스의 일부가 되려면 false로 설정)</td>
    </tr>
    <tr>
        <td>kms_key_id</td>
        <td>KMS 암호화 키 (클러스터로 설정된 경우)에 대한 ARN</td>
    </tr>
    <tr>
        <td>monitoring_interval</td>
        <td>Enhanced Monitoring 지표가 수집 될 때 포인트 사이의 간격 (초)</td>
    </tr>
    <tr>
        <td>monitoring_role_arn</td>
        <td>RDS에서 CloudWatch에 향상된 모니터링 지표를 보내기 위해 사용하는 IAM 역할</td>
    </tr>
    <tr>
        <td>password</td>
        <td>마스터 DB 비밀번호</td>
    </tr>
    <tr>
        <td>performance_insights_enabled</td>
        <td>성능 개선 도우미의 사용 여부를 지정합니다.(default: false)</td>
    </tr>
    <tr>
        <td>performance_insights_kms_key_id</td>
        <td>Performance Insights 데이터를 암호화하기위한 KMS 키의 ARN</td>
    </tr>
    <tr>
        <td>port</td>
        <td>연결을 수락 할 서비스 포트(postgresql: 5432, mysql: 3306)</td>
    </tr>
    <tr>
        <td>predefined_metric_type</td>
        <td>확장 할 메트릭 유형입니다. 유효한 값은 RDSReaderAverageCPUUtilization 및 RDSReaderAverageDatabaseConnections 입니다.</td>
    </tr>
    <tr>
        <td>preferred_backup_window</td>
        <td>DB 백업을 수행하는 경우.</td>
    </tr>
    <tr>
        <td>preferred_maintenance_window</td>
        <td>DB 유지 보수 수행시기.</td>
    </tr>
    <tr>
        <td>publicly_accessible</td>
        <td>DB에 공용 IP 주소가 있어야하는지 여부.</td>
    </tr>
    <tr>
        <td>replica_count</td>
        <td>몇 개의 읽기 전용 노드를 생성할지 갯수 설정 (replica_scale_enable 값이 true 이면 replica_scale_min 값이 이 값 대신 사용 됩니다.) </td>
    </tr>
    <tr>
        <td>replica_scale_connections</td>
        <td>자동 확장을 시작할 평균 연결 수 임계 값입니다. 기본값은 db.r4.large의 기본 max_connections의 70 %입니다. </td>
    </tr>
    <tr>
        <td>replica_scale_cpu</td>
        <td>자동 확장을 시작할 CPU 임계 값 (default: 70)</td>
    </tr>
    <tr>
        <td>replica_scale_enabled</td>
        <td>RDS Aurora (MySQL) 읽기 전용 복제본에 대한 자동 확장을 활성화할지 여부 (default: false)</td>
    </tr>
    <tr>
        <td>replica_scale_in_cooldown</td>
        <td>scale-in 이후 추가 확장 작업을 허용 하기전 휴지 시간 (초)(default: false)</td>
    </tr>
    <tr>
        <td>replica_scale_min</td>
        <td>자동 확장이 활성화 된 경우 허용되는 최소 읽기 전용 복제본 수</td>
    </tr>
    <tr>
        <td>replica_scale_max</td>
        <td>자동 확장이 사용 설정된 경우 허용되는 최대 읽기 전용 복제본 수</td>
    </tr>
    <tr>
        <td>replica_scale_out_cooldown</td>
        <td>scale-out 이후 추가 확장 작업을 허용하기 전 휴지 시간 (초)</td>
    </tr>
    <tr>
        <td>replication_source_identifier</td>
        <td>DB 클러스터를 읽기 전용 복제본으로 생성 할 경우 원본 DB 클러스터 또는 DB 인스턴스의 ARN</td>
    </tr>
    <tr>
        <td>scaling_configuration</td>
        <td>스케일링 속성이있는 중첩 된 속성의 맵. engine_mode가 다음으로 설정된 경우에만 유효합니다.serverless</td>
    </tr>
    <tr>
        <td>security_group_description</td>
        <td>보안 그룹에 대한 설명입니다. 값이 빈 문자열로 설정되면 설명에 클러스터 이름이 포함됩니다.</td>
    </tr>
    <tr>
        <td>security_group_tags</td>
        <td>보안 그룹에 대한 추가 태그</td>
    </tr>
    <tr>
        <td>skip_final_snapshot</td>
        <td>DB 클러스터를 삭제하기 전에 최종 DB 스냅 샷을 생성할지 여부를 결정합니다. true를 지정하면 DB 스냅 샷이 생성되지 않습니다.</td>
    </tr>
    <tr>
        <td>snapshot_identifier</td>
        <td>현재 데이터베이스를 생성 할 DB 스냅 샷</td>
    </tr>
    <tr>
        <td>source_region</td>
        <td>암호화 된 복제본 DB 클러스터의 소스 리전</td>
    </tr>
    <tr>
        <td>storage_encrypted</td>
        <td>기본 스토리지 계층을 암호화할지 여부를 지정합니다.</td>
    </tr>
    <tr>
        <td>username</td>
        <td>마스터 DB 사용자 이름</td>
    </tr>
    <tr>
        <td>vpc_id</td>
        <td>VPC ID</td>
    </tr>
    <tr>
        <td>vpc_security_group_ids</td>
        <td>현재 모듈에서 생성 한 SG 외에 클러스터에 연결할 VPC 보안 그룹 목록</td>
    </tr>
</tbody>
</table>



Build Reference
----------
[postgres-simple](examples/postgres-simple/README.md) example 
