Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kBFiJ-0004iM-7L
	for mharc-qemu-trivial@gnu.org; Thu, 27 Aug 2020 07:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kBFiG-0004dS-7m; Thu, 27 Aug 2020 07:05:00 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4717 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kBFiA-0007ZQ-LJ; Thu, 27 Aug 2020 07:04:59 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 494F1E29ACC98C5A2225;
 Thu, 27 Aug 2020 19:04:51 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Thu, 27 Aug 2020
 19:04:42 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <pannengyuan@huawei.com>, <zhang.zhanghailiang@huawei.com>, Chen Qun
 <kuhn.chenqun@huawei.com>, Euler Robot <euler.robot@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Li Qiang
 <liq3ea@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang
 <jasowang@redhat.com>
Subject: [PATCH v3 06/10] hw/net/virtio-net:Remove redundant statement in
 virtio_net_rsc_tcp_ctrl_check()
Date: Thu, 27 Aug 2020 19:03:07 +0800
Message-ID: <20200827110311.164316-7-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200827110311.164316-1-kuhn.chenqun@huawei.com>
References: <20200827110311.164316-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=kuhn.chenqun@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 02:09:23
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Thu, 27 Aug 2020 11:05:01 -0000

Clang static code analyzer show warning:
hw/net/virtio-net.c:2077:5: warning: Value stored to 'tcp_flag' is never read
    tcp_flag &= VIRTIO_NET_TCP_FLAG;
    ^           ~~~~~~~~~~~~~~~~~~~

The 'VIRTIO_NET_TCP_FLAG' is '0x3F'. The last ‘tcp_flag’ assignment statement is
 the same as that of the first two statements.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
---
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
---
 hw/net/virtio-net.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index a1fe9e9285..cb0d27084c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -2075,7 +2075,6 @@ static int virtio_net_rsc_tcp_ctrl_check(VirtioNetRscChain *chain,
     tcp_flag = htons(tcp->th_offset_flags);
     tcp_hdr = (tcp_flag & VIRTIO_NET_TCP_HDR_LENGTH) >> 10;
     tcp_flag &= VIRTIO_NET_TCP_FLAG;
-    tcp_flag = htons(tcp->th_offset_flags) & 0x3F;
     if (tcp_flag & TH_SYN) {
         chain->stat.tcp_syn++;
         return RSC_BYPASS;
-- 
2.23.0


