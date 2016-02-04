Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aRHhv-0007nS-25
	for mharc-qemu-trivial@gnu.org; Thu, 04 Feb 2016 06:04:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40600)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aRHht-0007ku-8L
	for qemu-trivial@nongnu.org; Thu, 04 Feb 2016 06:04:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aRHhp-0007fL-HE
	for qemu-trivial@nongnu.org; Thu, 04 Feb 2016 06:04:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44670)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1aRHhg-0007dw-Ni; Thu, 04 Feb 2016 06:04:00 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 4D58E92A49;
	Thu,  4 Feb 2016 11:04:00 +0000 (UTC)
Received: from donizetti.brq.redhat.com (dhcp129-233.brq.redhat.com
	[10.34.129.233])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u14B3wwI017417; Thu, 4 Feb 2016 06:03:59 -0500
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  4 Feb 2016 12:03:58 +0100
Message-Id: <1454583838-22272-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] migration: move page_cache.c to migration/
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
X-List-Received-Date: Thu, 04 Feb 2016 11:04:14 -0000

page_cache.c is part of the XBZRLE implementation, move it to the right
directory.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile.objs                          | 1 -
 migration/Makefile.objs                | 2 +-
 page_cache.c => migration/page_cache.c | 0
 3 files changed, 1 insertion(+), 2 deletions(-)
 rename page_cache.c => migration/page_cache.c (100%)

diff --git a/Makefile.objs b/Makefile.objs
index 06b95c7..f950b0f 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -51,7 +51,6 @@ common-obj-$(CONFIG_LINUX) += fsdev/
 
 common-obj-y += migration/
 common-obj-y += qemu-char.o #aio.o
-common-obj-y += page_cache.o
 common-obj-y += qjson.o
 
 common-obj-$(CONFIG_SPICE) += spice-qemu-char.o
diff --git a/migration/Makefile.objs b/migration/Makefile.objs
index 0cac6d7..e5778de 100644
--- a/migration/Makefile.objs
+++ b/migration/Makefile.objs
@@ -1,7 +1,7 @@
 common-obj-y += migration.o tcp.o
 common-obj-y += vmstate.o
 common-obj-y += qemu-file.o qemu-file-buf.o qemu-file-unix.o qemu-file-stdio.o
-common-obj-y += xbzrle.o postcopy-ram.o
+common-obj-y += xbzrle.o page_cache.o postcopy-ram.o
 
 common-obj-$(CONFIG_RDMA) += rdma.o
 common-obj-$(CONFIG_POSIX) += exec.o unix.o fd.o
diff --git a/page_cache.c b/migration/page_cache.c
similarity index 100%
rename from page_cache.c
rename to migration/page_cache.c
-- 
2.5.0


