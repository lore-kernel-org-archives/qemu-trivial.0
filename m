Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kc2iG-0003e7-H5
	for mharc-qemu-trivial@gnu.org; Mon, 09 Nov 2020 03:39:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kc2iE-0003bH-Q1; Mon, 09 Nov 2020 03:39:42 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kc2iC-0004a6-T6; Mon, 09 Nov 2020 03:39:42 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CV4DC68GDzLtwp;
 Mon,  9 Nov 2020 16:39:23 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Mon, 9 Nov 2020
 16:39:26 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <alex.bennee@linaro.org>, <mjt@tls.msk.ru>, <laurent@vivier.eu>
CC: <alex.chen@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-trivial@nongnu.org>, <zhang.zhanghailiang@huawei.com>,
 <zhengchuan@huawei.com>
Subject: [PATCH v3 1/2] plugins: Fix resource leak in connect_socket()
Date: Mon, 9 Nov 2020 08:28:28 +0000
Message-ID: <20201109082829.87496-2-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20201109082829.87496-1-alex.chen@huawei.com>
References: <20201109082829.87496-1-alex.chen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 03:39:34
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
X-List-Received-Date: Mon, 09 Nov 2020 08:39:43 -0000

Close the fd when the connect() fails.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 contrib/plugins/lockstep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index a696673dff..319bd44b83 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -292,6 +292,7 @@ static bool connect_socket(const char *path)
 
     if (connect(fd, (struct sockaddr *)&sockaddr, sizeof(sockaddr)) < 0) {
         perror("failed to connect");
+        close(fd);
         return false;
     }
 
-- 
2.19.1


