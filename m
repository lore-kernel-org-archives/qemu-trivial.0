Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZXwgk-000536-6s
	for mharc-qemu-trivial@gnu.org; Fri, 04 Sep 2015 15:30:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51550)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZXwgg-0004wJ-T7
	for qemu-trivial@nongnu.org; Fri, 04 Sep 2015 15:30:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZXwgg-0007Ij-3R
	for qemu-trivial@nongnu.org; Fri, 04 Sep 2015 15:30:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45169)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1ZXwgd-0007Fk-4G; Fri, 04 Sep 2015 15:30:11 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id D544BA86;
	Fri,  4 Sep 2015 19:30:10 +0000 (UTC)
Received: from thinkpad.redhat.com (vpn1-6-7.ams2.redhat.com [10.36.6.7])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t84JU6Lp026875; Fri, 4 Sep 2015 15:30:09 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org, marcandre.lureau@gmail.com, eblake@redhat.com,
	qemu-trivial@nongnu.org
Date: Fri,  4 Sep 2015 21:30:04 +0200
Message-Id: <1441395005-14907-3-git-send-email-lvivier@redhat.com>
In-Reply-To: <1441395005-14907-1-git-send-email-lvivier@redhat.com>
References: <1441395005-14907-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v4 2/3] help: fix typo
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Sep 2015 19:30:15 -0000

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 77f5853..ab1af02 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3510,7 +3510,7 @@ DEF("dump-vmstate", HAS_ARG, QEMU_OPTION_dump_vmstate,
     "                Output vmstate information in JSON format to file.\n"
     "                Use the scripts/vmstate-static-checker.py file to\n"
     "                check for possible regressions in migration code\n"
-    "                by comparing two such vmstate dumps.",
+    "                by comparing two such vmstate dumps.\n",
     QEMU_ARCH_ALL)
 STEXI
 @item -dump-vmstate @var{file}
-- 
2.1.0


