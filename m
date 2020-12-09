Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmpuO-00051p-Rz
	for mharc-qemu-trivial@gnu.org; Tue, 08 Dec 2020 22:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kmpuM-0004wH-Kj; Tue, 08 Dec 2020 22:12:50 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kmpu7-0008N5-I4; Tue, 08 Dec 2020 22:12:50 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CrMXd4G5Kzhpbc;
 Wed,  9 Dec 2020 11:12:01 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Wed, 9 Dec 2020
 11:12:17 +0800
From: zhouyang <zhouyang789@huawei.com>
To: <alex.bennee@linaro.org>
CC: <qemu-devel@nongnu.org>, <alex.chen@huawei.com>, <hunongda@huawei.com>,
 <qemu-trivial@nongnu.org>
Subject: [PATCH v2 3/5] contrib: Add spaces around operator
Date: Wed, 9 Dec 2020 11:04:45 +0800
Message-ID: <20201209030447.2135652-4-zhouyang789@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201209030447.2135652-1-zhouyang789@huawei.com>
References: <20201209030447.2135652-1-zhouyang789@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=zhouyang789@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 09 Dec 2020 03:12:51 -0000

I am reading contrib related code and found some style problems while
check the code using checkpatch.pl. This commit fixs the issue below:
ERROR: spaces required around that '*'

Signed-off-by: zhouyang <zhouyang789@huawei.com>
---
 contrib/ivshmem-server/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/ivshmem-server/main.c b/contrib/ivshmem-server/main.c
index ee08c4ced0..224dbeb547 100644
--- a/contrib/ivshmem-server/main.c
+++ b/contrib/ivshmem-server/main.c
@@ -17,7 +17,7 @@
 #define IVSHMEM_SERVER_DEFAULT_PID_FILE       "/var/run/ivshmem-server.pid"
 #define IVSHMEM_SERVER_DEFAULT_UNIX_SOCK_PATH "/tmp/ivshmem_socket"
 #define IVSHMEM_SERVER_DEFAULT_SHM_PATH       "ivshmem"
-#define IVSHMEM_SERVER_DEFAULT_SHM_SIZE       (4*1024*1024)
+#define IVSHMEM_SERVER_DEFAULT_SHM_SIZE       (4 * 1024 * 1024)
 #define IVSHMEM_SERVER_DEFAULT_N_VECTORS      1
 
 /* used to quit on signal SIGTERM */
-- 
2.23.0


