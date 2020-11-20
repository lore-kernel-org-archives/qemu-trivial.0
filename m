Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfxEo-0001dp-9z
	for mharc-qemu-trivial@gnu.org; Thu, 19 Nov 2020 22:37:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kfxEh-0001c2-OX; Thu, 19 Nov 2020 22:37:23 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kfxEf-0006uw-DU; Thu, 19 Nov 2020 22:37:23 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Ccj05049fzhZNJ;
 Fri, 20 Nov 2020 11:36:53 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Fri, 20 Nov 2020
 11:37:02 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <quintela@redhat.com>, <pbonzini@redhat.com>, <philmd@redhat.com>
CC: <alex.chen@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-trivial@nongnu.org>, <zhang.zhanghailiang@huawei.com>,
 <peter.maydell@linaro.org>
Subject: [PATCH v2 0/2] Optimized some code for display/vmware_vga
Date: Fri, 20 Nov 2020 03:25:15 +0000
Message-ID: <20201120032517.104486-1-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 20 Nov 2020 03:37:24 -0000

Optimized some code for vmware_vga:
patch1 fixes a bad printf format specifier and
patch2 replaces fprintf(stderr, "*\n") with error_report()

Alex Chen (2):
  display/vmware_vga: Fix bad printf format specifiers
  display/vmware_vga: Replace fprintf(stderr, "*\n") with error_report()

 hw/display/vmware_vga.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

-- 
2.19.1


