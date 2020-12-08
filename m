Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmedB-00082W-DY
	for mharc-qemu-trivial@gnu.org; Tue, 08 Dec 2020 10:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kmc7U-00056u-GJ; Tue, 08 Dec 2020 07:29:28 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kmc7S-0007oU-7v; Tue, 08 Dec 2020 07:29:28 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CqzxK5dRcz15Z0n;
 Tue,  8 Dec 2020 20:28:37 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Tue, 8 Dec 2020
 20:29:01 +0800
From: "zhouyang (T)" <zhouyang789@huawei.com>
To: <alex.bennee@linaro.org>
CC: <qemu-devel@nongnu.org>, <alex.chen@huawei.com>, <hunongda@huawei.com>,
 <qemu-trivial@nongnu.org>
Subject: [PATCH 0/5]  Fix some style problems in contrib
Date: Tue, 8 Dec 2020 20:21:29 +0800
Message-ID: <20201208122134.3308101-1-zhouyang789@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhouyang789@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 08 Dec 2020 10:10:18 -0500
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
X-List-Received-Date: Tue, 08 Dec 2020 12:29:28 -0000

I found some style problems while check the code using checkpatch.pl and fixed them, please review.

zhouyang (T) (5):
  contrib: Don't use '#' flag of printf format
  contrib: Fix some code style problems, ERROR: "foo * bar" should be
    "foo *bar"
  contrib: Add spaces around operator
  contrib: space required after that ','
  contrib: Open brace '{' following struct go on the same line

 contrib/ivshmem-server/main.c |  2 +-
 contrib/plugins/hotblocks.c   |  2 +-
 contrib/plugins/hotpages.c    |  2 +-
 contrib/plugins/howvec.c      | 19 +++++++++----------
 contrib/plugins/lockstep.c    |  6 +++---
 5 files changed, 15 insertions(+), 16 deletions(-)

-- 
2.23.0


