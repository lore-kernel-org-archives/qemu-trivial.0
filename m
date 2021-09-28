Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVDP0-00013X-Bt
	for mharc-qemu-trivial@gnu.org; Tue, 28 Sep 2021 09:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVBxY-0007ud-72; Tue, 28 Sep 2021 08:11:44 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVBxV-0000eh-MX; Tue, 28 Sep 2021 08:11:43 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HJdXh1v5nz8yml;
 Tue, 28 Sep 2021 20:07:00 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 20:11:37 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 20:11:37 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Andrew Jones" <drjones@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v2 2/2] qemu-options: Add missing "sockets=2,
 maxcpus=2" to CLI "-smp 2"
Date: Tue, 28 Sep 2021 20:11:34 +0800
Message-ID: <20210928121134.21064-3-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210928121134.21064-1-wangyanan55@huawei.com>
References: <20210928121134.21064-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 28 Sep 2021 09:43:58 -0400
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
X-List-Received-Date: Tue, 28 Sep 2021 12:11:44 -0000

There is one numa config example in qemu-options.hx currently
using "-smp 2" and assuming that there will be 2 sockets and
2 cpus totally. However now the actual calculation logic of
missing sockets and cores is not immutable and is considered
liable to change. Although we will get maxcpus=2 finally based
on current parser, it's always stable to specify it explicitly.

So "-smp 2,sockets=2,maxcpus=2" will be optimal when we expect
multiple sockets and 2 cpus totally.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index dcd9595650..ff8917c5e1 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -395,7 +395,7 @@ SRST
         -m 2G \
         -object memory-backend-ram,size=1G,id=m0 \
         -object memory-backend-ram,size=1G,id=m1 \
-        -smp 2 \
+        -smp 2,sockets=2,maxcpus=2 \
         -numa node,nodeid=0,memdev=m0 \
         -numa node,nodeid=1,memdev=m1,initiator=0 \
         -numa cpu,node-id=0,socket-id=0 \
-- 
2.19.1


