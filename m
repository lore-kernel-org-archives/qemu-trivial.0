Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kl6Di-0006qe-Uw
	for mharc-qemu-trivial@gnu.org; Fri, 04 Dec 2020 03:13:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kl6Dg-0006q7-LZ; Fri, 04 Dec 2020 03:13:36 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kl6De-00072P-2r; Fri, 04 Dec 2020 03:13:36 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CnQS85M4JzhlRC;
 Fri,  4 Dec 2020 16:12:56 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Fri, 4 Dec 2020
 16:13:17 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <thuth@redhat.com>, <david@gibson.dropbear.id.au>,
 <peter.maydell@linaro.org>, <kuhn.chenqun@huawei.com>,
 <zhang.zhanghailiang@huawei.com>, Gan Qixin <ganqixin@huawei.com>
Subject: [PATCH 0/3] Fix some memleaks caused by timer_new_ns
Date: Fri, 4 Dec 2020 16:12:06 +0800
Message-ID: <20201204081209.360524-1-ganqixin@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=ganqixin@huawei.com;
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
X-List-Received-Date: Fri, 04 Dec 2020 08:13:37 -0000

Hi all,

When running device-introspect-test, I found some memory leaks caused by
timer_new_ns in the init function, so I free it in the finalize function.

Gan Qixin (3):
  pl031: Use timer_free() in the finalize function to avoid memleaks
  misc/mos6522: Use timer_free() in the finalize function to avoid
    memleak
  s390x/cpu: Use timer_free() in the finalize function to avoid memleaks

 hw/misc/mos6522.c  | 11 +++++++++++
 hw/rtc/pl031.c     | 19 ++++++++++++++-----
 target/s390x/cpu.c |  5 +++++
 3 files changed, 30 insertions(+), 5 deletions(-)

-- 
2.27.0


