Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1Rya-0002iC-4o
	for mharc-qemu-trivial@gnu.org; Tue, 01 Nov 2016 01:51:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c1RyV-0002gl-Pq
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 01:51:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1c1RyV-0006Vl-2y
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 01:51:07 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:3819)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1c1RyO-0006RS-Q0; Tue, 01 Nov 2016 01:51:01 -0400
Received: from 172.24.1.136 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.1.136])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CKQ93362; Tue, 01 Nov 2016 13:50:48 +0800 (CST)
Received: from localhost (10.177.24.212) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.235.1; Tue, 1 Nov 2016
	13:50:37 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <quintela@redhat.com>, <amit.shah@redhat.com>
CC: <qemu-devel@nongnu.org>, <dgilbert@redhat.com>, <qemu-trivial@nongnu.org>, 
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Date: Tue, 1 Nov 2016 13:50:05 +0800
Message-ID: <1477979405-16264-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 2.7.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.24.212]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: [Qemu-trivial] [PATCH] migration: fix missing assignment for
 has_x_checkpoint_delay
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Nov 2016 05:51:08 -0000

We forgot to assign true to params->has_x_checkpoint_delay parameter
in qmp_query_migrate_parameters.

Without this, qmp command 'query-migrate-parameters' doesn't show the
default value for x-checkpoint-delay option.
It doesn't influence output of hmp command 'info migrate_parameters'.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 hmp.c                 | 1 +
 migration/migration.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hmp.c b/hmp.c
index b5e3f54..02103df 100644
--- a/hmp.c
+++ b/hmp.c
@@ -318,6 +318,7 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, " %s: %" PRId64 " milliseconds",
             MigrationParameter_lookup[MIGRATION_PARAMETER_DOWNTIME_LIMIT],
             params->downtime_limit);
+        assert(params->has_x_checkpoint_delay);
         monitor_printf(mon, " %s: %" PRId64,
             MigrationParameter_lookup[MIGRATION_PARAMETER_X_CHECKPOINT_DELAY],
             params->x_checkpoint_delay);
diff --git a/migration/migration.c b/migration/migration.c
index e331f28..f498ab8 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -593,6 +593,7 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
     params->max_bandwidth = s->parameters.max_bandwidth;
     params->has_downtime_limit = true;
     params->downtime_limit = s->parameters.downtime_limit;
+    params->has_x_checkpoint_delay = true;
     params->x_checkpoint_delay = s->parameters.x_checkpoint_delay;
 
     return params;
-- 
1.8.3.1



