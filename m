Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kiEWF-0004d7-Dl
	for mharc-qemu-trivial@gnu.org; Thu, 26 Nov 2020 05:28:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kiEWD-0004cu-T9; Thu, 26 Nov 2020 05:28:53 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kiEWB-0001Ee-Ha; Thu, 26 Nov 2020 05:28:53 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ChYr72FFNzhhch;
 Thu, 26 Nov 2020 18:28:23 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Thu, 26 Nov 2020
 18:28:37 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <groug@kaod.org>, <qemu_oss@crudebyte.com>
CC: <alex.chen@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-trivial@nongnu.org>, <zhang.zhanghailiang@huawei.com>
Subject: [PATCH] virtfs-proxy-helper: Fix a resource leak in main()
Date: Thu, 26 Nov 2020 10:16:24 +0000
Message-ID: <20201126101624.55714-1-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 26 Nov 2020 10:28:54 -0000

Only one of the options -s and -f can be used. When -f is used,
the fd is created externally and does not need to be closed.
When -s is used, a new socket fd is created, and this socket fd
needs to be closed at the end of main().

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 fsdev/virtfs-proxy-helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index 15c0e79b06..339d477169 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -1154,6 +1154,9 @@ int main(int argc, char **argv)
     process_requests(sock);
 error:
     g_free(rpath);
+    if (sock_name) {
+        close(sock);
+    }
     g_free(sock_name);
     do_log(LOG_INFO, "Done\n");
     closelog();
-- 
2.19.1


