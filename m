Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfgCW-0000fF-Fz
	for mharc-qemu-trivial@gnu.org; Thu, 19 Nov 2020 04:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruc_gongyuanjun@163.com>)
 id 1kfgCR-0000d0-Dn
 for qemu-trivial@nongnu.org; Thu, 19 Nov 2020 04:25:56 -0500
Received: from mail-m972.mail.163.com ([123.126.97.2]:53126)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ruc_gongyuanjun@163.com>)
 id 1kfgCK-0000Ep-1J
 for qemu-trivial@nongnu.org; Thu, 19 Nov 2020 04:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=FhJqm6LMcknrGDFitb
 gA+AMYsMPo0SRChj3tSH47gjI=; b=Gs2HDL6uV9id0fCDi7CM0GjGwSPkPw8QEV
 NTCwfrYTgo4nerItc5bwR3OVwc5JcUY3wewG6+LzQlZXgv4yvMdHDjb0vV0S6mev
 23juGgSZNybNxpWYzx5NnhSM6ifc/om7w0XpBu8ixECAXyk4Xizr3ky6SEF6mk5x
 8c45RkILs=
Received: from localhost.localdomain (unknown [218.106.182.234])
 by smtp2 (Coremail) with SMTP id GtxpCgDX+pgOOrZfTZWYCA--.19328S4;
 Thu, 19 Nov 2020 17:25:35 +0800 (CST)
From: ruc_gongyuanjun@163.com
To: qemu-trivial@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
	yuanjungong <ruc_gongyuanjun@163.com>
Subject: [PATCH 1/1] /net/tap.c: Fix a memory leak
Date: Thu, 19 Nov 2020 17:25:32 +0800
Message-Id: <20201119092532.20215-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: GtxpCgDX+pgOOrZfTZWYCA--.19328S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr47tw18JrW7Ww45Xw13urg_yoW3WwcEgw
 n7ZFWDGrZ8AF9akrsrZ395KryUCw4UWF97Kw1YyFyfCa1xXws2krs7JF93ZFyxWryakr90
 kF9Ivayq9ay0kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRNBTY5UUUUU==
X-Originating-IP: [218.106.182.234]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/xtbB0B-h5VUMOtJh-gAAsl
Received-SPF: pass client-ip=123.126.97.2;
 envelope-from=ruc_gongyuanjun@163.com; helo=mail-m972.mail.163.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 04:25:36
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 19 Nov 2020 09:25:56 -0000

From: yuanjungong <ruc_gongyuanjun@163.com>

Close fd before returning.

Buglink: https://bugs.launchpad.net/qemu/+bug/1904486
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


