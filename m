Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j2p7B-0004Vn-8K
	for mharc-qemu-trivial@gnu.org; Fri, 14 Feb 2020 23:31:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47572)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j2p78-0004UB-PL
 for qemu-trivial@nongnu.org; Fri, 14 Feb 2020 23:31:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j2p77-000441-T7
 for qemu-trivial@nongnu.org; Fri, 14 Feb 2020 23:31:34 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:41510 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j2p74-0003sf-9z; Fri, 14 Feb 2020 23:31:30 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 0CEC5421EFC3463572B1;
 Sat, 15 Feb 2020 12:31:20 +0800 (CST)
Received: from HGHY4C002233111.china.huawei.com (10.133.205.93) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Sat, 15 Feb 2020 12:31:13 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <ehabkost@redhat.com>, <quintela@redhat.com>,
 <thuth@redhat.com>
CC: <zhang.zhanghailiang@huawei.com>, <qemu-trivial@nongnu.org>, Chen Qun
 <kuhn.chenqun@huawei.com>
Subject: [PATCH] test-vmstate: Fix memleaks in test_load_qlist
Date: Sat, 15 Feb 2020 12:31:09 +0800
Message-ID: <20200215043109.13688-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.14.1.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
X-List-Received-Date: Sat, 15 Feb 2020 04:31:35 -0000

From: Chen Qun <kuhn.chenqun@huawei.com>

We may forget to free fload. ASAN spotted it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
 tests/test-vmstate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/test-vmstate.c b/tests/test-vmstate.c
index cea363dd69..5b2743121b 100644
--- a/tests/test-vmstate.c
+++ b/tests/test-vmstate.c
@@ -1395,6 +1395,7 @@ static void test_load_qlist(void)
     compare_containers(orig_container, dest_container);
     free_container(orig_container);
     free_container(dest_container);
+    qemu_fclose(fload);
 }
 
 typedef struct TmpTestStruct {
-- 
2.23.0



