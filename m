Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfM5l-00013y-Gx
	for mharc-qemu-trivial@gnu.org; Wed, 18 Nov 2020 06:57:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kfM5j-00011P-G7; Wed, 18 Nov 2020 06:57:39 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kfM5h-00084L-Pr; Wed, 18 Nov 2020 06:57:39 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CbhB53prxzLpjP;
 Wed, 18 Nov 2020 19:57:01 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Wed, 18 Nov 2020
 19:57:10 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <wuhaotsh@google.com>, <hskinnemoen@google.com>,
 <peter.maydell@linaro.org>, <zhang.zhanghailiang@huawei.com>,
 <thuth@redhat.com>, <lvivier@redhat.com>, Chen Qun <kuhn.chenqun@huawei.com>
Subject: [PATCH-for-5.2? 0/2] two qtest bugfix
Date: Wed, 18 Nov 2020 19:56:44 +0800
Message-ID: <20201118115646.2461726-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 06:57:21
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
X-List-Received-Date: Wed, 18 Nov 2020 11:57:39 -0000

Hi folks,
  There are two bug caused by recent testcase code merge.
EulerRobot found them, and this series fixed them.

Thanks,
Chen Qun

Chen Qun (2):
  tests/qtest: variable defined by g_autofree need to be initialized
  tests/qtest: fix memleak in npcm7xx_watchdog_timer-test

 tests/qtest/npcm7xx_timer-test.c          | 8 +++-----
 tests/qtest/npcm7xx_watchdog_timer-test.c | 6 ++++--
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.23.0


