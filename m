Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kcr1S-0004Du-P7
	for mharc-qemu-trivial@gnu.org; Wed, 11 Nov 2020 09:22:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kcr1Q-0004De-Qe; Wed, 11 Nov 2020 09:22:52 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kcr1D-0000br-4a; Wed, 11 Nov 2020 09:22:52 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CWRl337pXz15NwY;
 Wed, 11 Nov 2020 22:22:23 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Wed, 11 Nov 2020
 22:22:23 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <peter.maydell@linaro.org>, <zhang.zhanghailiang@huawei.com>,
 <ganqixin@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>
Subject: [PATCH v2 0/5] fix uninitialized variable warning
Date: Wed, 11 Nov 2020 22:21:58 +0800
Message-ID: <20201111142203.2359370-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 07:50:46
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 11 Nov 2020 14:22:53 -0000

Hi all,
  There are some variables initialized warnings reported by the GCC_9.3 compiler.
This serial has added some default values or changed the assignment places for the variablies to fix them.

v1->v2:
--patch1: Drop it base on Max Filippov comment.
--patch2->patch1: Add Marcel Apfelbaum and  Yuval Shaia review comment.
--patch3->patch2: Add Philippe Mathieu-Daudé review comment.
--patch6->patch5: Add Philippe Mathieu-Daudé review comment.


Chen Qun (5):
  hw/rdma/rdma_backend: fix uninitialized variable warning in
    rdma_poll_cq()
  util/qemu-timer: fix uninitialized variable warning in
    timer_mod_anticipate_ns()
  util/qemu-timer: fix uninitialized variable warning for expire_time
  plugins/loader: fix uninitialized variable warning in
    plugin_reset_uninstall()
  migration: fix uninitialized variable warning in
    migrate_send_rp_req_pages()

 hw/rdma/rdma_backend.c | 2 +-
 migration/migration.c  | 2 +-
 plugins/loader.c       | 2 +-
 util/qemu-timer.c      | 8 +++-----
 4 files changed, 6 insertions(+), 8 deletions(-)

-- 
2.27.0


