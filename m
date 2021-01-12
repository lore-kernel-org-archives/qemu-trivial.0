Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGna-0006B6-AK
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jan 2021 05:21:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kzGnX-00065N-SK; Tue, 12 Jan 2021 05:21:11 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kzGnU-0003PX-Iw; Tue, 12 Jan 2021 05:21:11 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DFRQd03ybz15my6;
 Tue, 12 Jan 2021 18:19:53 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Tue, 12 Jan 2021
 18:20:43 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <peter.maydell@linaro.org>, <david@gibson.dropbear.id.au>,
 <kuhn.chenqun@huawei.com>, <zhang.zhanghailiang@huawei.com>, Gan Qixin
 <ganqixin@huawei.com>
Subject: [PATCH v2 0/2] Fix some memleaks caused by timer_new_ns
Date: Tue, 12 Jan 2021 18:17:44 +0800
Message-ID: <20210112101746.379517-1-ganqixin@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=ganqixin@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 12 Jan 2021 10:21:12 -0000

v1->v2:

patch1:
  Delete the modification of unrelated whitespace.
patch2:
  Add David Gibson acked tag.
patch3:
  Has been applied, so delete it.

Gan Qixin (2):
  pl031: Use timer_free() in the finalize function to avoid memleaks
  misc/mos6522: Use timer_free() in the finalize function to avoid
    memleak

 hw/misc/mos6522.c | 11 +++++++++++
 hw/rtc/pl031.c    |  9 +++++++++
 2 files changed, 20 insertions(+)

-- 
2.27.0

