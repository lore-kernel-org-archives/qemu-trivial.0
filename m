Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6PgV-0007Ai-Mw
	for mharc-qemu-trivial@gnu.org; Mon, 24 Feb 2020 21:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38516)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6PgP-0006ur-Fo
 for qemu-trivial@nongnu.org; Mon, 24 Feb 2020 21:10:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6PgO-00089D-4O
 for qemu-trivial@nongnu.org; Mon, 24 Feb 2020 21:10:49 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3245 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j6PgL-0007zU-CX; Mon, 24 Feb 2020 21:10:45 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9E7248434096C9F3081A;
 Tue, 25 Feb 2020 10:10:42 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 25 Feb 2020
 10:10:35 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <peter.maydell@linaro.org>, <zhang.zhanghailiang@huawei.com>, Chen Qun
 <kuhn.chenqun@huawei.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH 13/13] monitor/hmp-cmds: Remove redundant statement in
 hmp_rocker_of_dpa_groups()
Date: Tue, 25 Feb 2020 10:09:37 +0800
Message-ID: <20200225020937.25028-14-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.14.1.windows.1
In-Reply-To: <20200225020937.25028-1-kuhn.chenqun@huawei.com>
References: <20200225020937.25028-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Feb 2020 02:10:51 -0000

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
monitor/hmp-cmds.c:2867:17: warning: Value stored to 'set' is never read
                set = true;
                ^     ~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
---
 monitor/hmp-cmds.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 53bc3f76c4..84f94647cd 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2864,7 +2864,6 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const QDict *qdict)
 
         if (group->has_set_eth_dst) {
             if (!set) {
-                set = true;
                 monitor_printf(mon, " set");
             }
             monitor_printf(mon, " dst %s", group->set_eth_dst);
-- 
2.23.0



