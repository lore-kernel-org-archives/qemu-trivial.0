Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfOxX-0005WY-EV
	for mharc-qemu-trivial@gnu.org; Wed, 18 Nov 2020 10:01:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruc_gongyuanjun@163.com>)
 id 1kfD7c-00076u-Ct
 for qemu-trivial@nongnu.org; Tue, 17 Nov 2020 21:23:00 -0500
Received: from mail-m975.mail.163.com ([123.126.97.5]:33902)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ruc_gongyuanjun@163.com>)
 id 1kfD7Z-00008N-2D
 for qemu-trivial@nongnu.org; Tue, 17 Nov 2020 21:22:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=KUGKcghz5aftqbUb2v
 XbT8YMF6hW21A1SCqZL6/yazw=; b=arXLY4wnvGwaGD8YAhHVaIgY0+kz4kB24L
 odfj6ItMmyOovd3cj94PW7w/rsT+pz1v9gQK3tasDSZyJlltE3ud3NY4hOk0B3Hy
 XBwtwoCw2CzIapqUT0JrsKsp+/on2OM5/ekr5lV5FU+MF7teTJ4f33qdOWd1u2V6
 LIE7Ha77c=
Received: from localhost.localdomain (unknown [218.106.182.234])
 by smtp5 (Coremail) with SMTP id HdxpCgAXV4vKgbRf3jTaAQ--.7817S4;
 Wed, 18 Nov 2020 10:07:08 +0800 (CST)
From: ruc_gongyuanjun@163.com
To: qemu-trivial@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
	yuanjungong <ruc_gongyuanjun@163.com>
Subject: [PATCH 1/1] /net/tap.c: Fix a memory leak Close fd before returning.
 Buglink: https://bugs.launchpad.net/qemu/+bug/1904486
Date: Wed, 18 Nov 2020 10:07:03 +0800
Message-Id: <20201118020703.26987-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: HdxpCgAXV4vKgbRf3jTaAQ--.7817S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr1kZw1UWF17Ww45Kr13XFb_yoWxZFbEgw
 1kXF4DGrs8JF9akr4UZ3yvqryUuw48WF97Gw12yFyfCa1xXw1I9rs7JF93ZryxWryakr90
 kFyFvayjkay0kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRE8sgUUUUUU==
X-Originating-IP: [218.106.182.234]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/xtbBiAzg5VaD9Hwc+QAAs5
Received-SPF: pass client-ip=123.126.97.5;
 envelope-from=ruc_gongyuanjun@163.com; helo=mail-m975.mail.163.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 21:07:11
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 18 Nov 2020 10:01:21 -0500
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
X-List-Received-Date: Wed, 18 Nov 2020 02:23:00 -0000

From: yuanjungong <ruc_gongyuanjun@163.com>

Signed-off-by: yuanjungong <ruc_gongyuanjun@163.com>
---
 net/tap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/tap.c b/net/tap.c
index c46ff66..fe95fa7 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -817,6 +817,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
         if (ret < 0) {
             error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
                              name, fd);
+            close(fd);
             return -1;
         }
 
@@ -831,6 +832,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
                          vhostfdname, vnet_hdr, fd, &err);
         if (err) {
             error_propagate(errp, err);
+            close(fd);
             return -1;
         }
     } else if (tap->has_fds) {
-- 
2.17.1


