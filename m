Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ljMLk-00046h-21
	for mharc-qemu-trivial@gnu.org; Wed, 19 May 2021 09:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alishir@routerhosting.com>)
 id 1ljGIL-0000x7-Oi
 for qemu-trivial@nongnu.org; Wed, 19 May 2021 03:07:05 -0400
Received: from box.routerhosting.com ([37.10.113.220]:53659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alishir@routerhosting.com>)
 id 1ljGIJ-0006X2-VR
 for qemu-trivial@nongnu.org; Wed, 19 May 2021 03:07:05 -0400
Received: from authenticated-user (box.routerhosting.com [37.10.113.220])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by box.routerhosting.com (Postfix) with ESMTPSA id D69634D68B;
 Wed, 19 May 2021 11:36:51 +0430 (+0430)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=routerhosting.com;
 s=mail; t=1621408012;
 bh=OcAM4gQf3GQM8j3nHLIqeMJf+/r+97+HCT6LGWV5oH8=;
 h=From:To:Cc:Subject:Date:From;
 b=Q3BdBy00KPGhB5j5djZ19fSb0dQeSwLCqd/u75jJfkLptMarmLlTftJZHY8uhjCpr
 vBfffd8up7fFfkscIJR+Ex4nrfND0OJRhtViJvDIb4tSqyEsyPoAkyfikvEx/Jyf/5
 yWIJYGjVZIXsBvR4YkBolwTf4SxlEfV+SlErdF26DC/R0/EZi1CYaM6d/fhmAX6Qbq
 /W3oFVrz8Vazfkb3Giqn9AMjEPBI7rIZGlXhUF1irdqxKgXGo2Fb99hnNGUp0iU3I7
 R+uf1ue9/XCfSahXalANj6gwtADo37crm9SnslcYKkUCplFL9/AsjrLjbbHPiQhkJA
 7FeQOx8tyk3JA==
From: Ali Shirvani <alishir@routerhosting.com>
To: qemu-devel@nognu.org
Cc: qemu-trivial@nongnu.org,
	stefanha@redhat.com
Subject: [PATCH] doc: Add notes about -mon option mode=control argument.
Date: Wed, 19 May 2021 11:36:02 +0430
Message-Id: <0799f0de89ad2482672b5d61d0de61e6eba782da.1621407918.git.alishir@routerhosting.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.10.113.220;
 envelope-from=alishir@routerhosting.com; helo=box.routerhosting.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 19 May 2021 09:34:58 -0400
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
X-List-Received-Date: Wed, 19 May 2021 07:07:06 -0000

The mode=control argument configures a QMP monitor.

Signed-off-by: Ali Shirvani <alishir@routerhosting.com>
---
 qemu-options.hx | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index e22fb94d99..292c6f6bdc 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3787,8 +3787,11 @@ DEF("mon", HAS_ARG, QEMU_OPTION_mon, \
     "-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]\n", QEMU_ARCH_ALL)
 SRST
 ``-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]``
-    Setup monitor on chardev name. ``pretty`` is only valid when
-    ``mode=control``, turning on JSON pretty printing to ease
+    Setup monitor on chardev name. ``mode=control`` configures 
+    a QMP monitor (a JSON RPC-style protocol) and it is not the
+    same as HMP, the human monitor that has a "(qemu)" prompt.
+    ``pretty`` is only valid when ``mode=control``, 
+    turning on JSON pretty printing to ease
     human reading and debugging.
 ERST
 
-- 
2.30.2


