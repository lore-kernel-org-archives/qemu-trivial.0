Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kcMy1-0005i7-3k
	for mharc-qemu-trivial@gnu.org; Tue, 10 Nov 2020 01:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kcMxr-0005dF-LR; Tue, 10 Nov 2020 01:17:11 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kcMxp-0003YD-2r; Tue, 10 Nov 2020 01:17:11 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CVd1F2Sjmz73Gc;
 Tue, 10 Nov 2020 14:16:49 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Tue, 10 Nov 2020
 14:16:45 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <pbonzini@redhat.com>, <kwolf@redhat.com>, <mreitz@redhat.com>,
 <stefanha@redhat.com>, <dnbrdsky@gmail.com>,
 <zhang.zhanghailiang@huawei.com>, <kuhn.chenqun@huawei.com>, Gan Qixin
 <ganqixin@huawei.com>
Subject: [PATCH 0/4] Use lock guard macros in block
Date: Mon, 9 Nov 2020 23:43:23 +0800
Message-ID: <20201109154327.325675-1-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=ganqixin@huawei.com;
 helo=szxga07-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 01:02:06
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 10 Nov 2020 06:17:12 -0000

Hi all,
  I saw some tasks to replace manual lock()/unlock() calls with lock guard macros in BiteSizedTasks.
I am very interested in this and modified some of the files under block. Could someone help me check the code?

Thanks,
Gan Qixin

Gan Qixin (4):
  block/accounting.c: Use lock guard macros
  block/curl.c: Use lock guard macros
  block/throttle-groups.c: Use lock guard macros
  block/iscsi.c: Use lock guard macros

 block/accounting.c      | 32 +++++++++++++--------------
 block/curl.c            | 28 ++++++++++++------------
 block/iscsi.c           | 28 +++++++++++-------------
 block/throttle-groups.c | 48 ++++++++++++++++++++---------------------
 4 files changed, 65 insertions(+), 71 deletions(-)

-- 
2.23.0


