Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSSvK-0002AC-4j
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jun 2018 15:56:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fSSvH-00028V-VK
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 15:56:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fSSvH-0007bk-5Z
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 15:56:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33194)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fSSvC-0007W8-VG; Mon, 11 Jun 2018 15:56:11 -0400
Received: from smtp.corp.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com
	[10.5.11.26])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF33B30001E0;
	Mon, 11 Jun 2018 19:56:09 +0000 (UTC)
Received: from localhost (ovpn-116-19.gru2.redhat.com [10.97.116.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 429C630001EC;
	Mon, 11 Jun 2018 19:56:08 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Sergio Andres Gomez Del Real <sergio.g.delreal@gmail.com>
Date: Mon, 11 Jun 2018 16:56:07 -0300
Message-Id: <20180611195607.3015-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Mon, 11 Jun 2018 19:56:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] qemu-options: Add missing newline to -accel
 help text
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jun 2018 19:56:16 -0000

The newline was removed by commit c97d6d2c, and broke -help output:

Before this patch:

  $ qemu-system-x86_64 -help | grep smp
                  thread=single|multi (enable multi-threaded TCG)-smp [...]

After this patch:

  $ qemu-system-x86_64 -help  | grep smp
  -smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,sockets=sockets]

Fixes: c97d6d2cdf97edb4aebe832fdba65d701ad7bcb6
Cc: Sergio Andres Gomez Del Real <sergio.g.delreal@gmail.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index c0d3951e9f..6364cf3f94 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -130,7 +130,7 @@ ETEXI
 DEF("accel", HAS_ARG, QEMU_OPTION_accel,
     "-accel [accel=]accelerator[,thread=single|multi]\n"
     "                select accelerator (kvm, xen, hax, hvf, whpx or tcg; use 'help' for a list)\n"
-    "                thread=single|multi (enable multi-threaded TCG)", QEMU_ARCH_ALL)
+    "                thread=single|multi (enable multi-threaded TCG)\n", QEMU_ARCH_ALL)
 STEXI
 @item -accel @var{name}[,prop=@var{value}[,...]]
 @findex -accel
-- 
2.18.0.rc1.1.g3f1ff2140


