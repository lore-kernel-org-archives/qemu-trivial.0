Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJiB4-0000yu-Tg
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2011 04:52:38 -0400
Received: from eggs.gnu.org ([140.186.70.92]:34296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RJiB1-0000n6-M7
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 04:52:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RJiB0-0002ej-Jz
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2011 04:52:35 -0400
Received: from oxygen.pond.sub.org ([78.46.104.156]:47091)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1RJiAy-0002dj-GU; Fri, 28 Oct 2011 04:52:32 -0400
Received: from blackfin.pond.sub.org (p5B32C8B0.dip.t-dialin.net
	[91.50.200.176])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id DA7F4A3DEA;
	Fri, 28 Oct 2011 10:52:27 +0200 (CEST)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 4594A60069; Fri, 28 Oct 2011 10:52:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 28 Oct 2011 10:52:26 +0200
Message-Id: <1319791946-15602-3-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1319791946-15602-1-git-send-email-armbru@redhat.com>
References: <1319791946-15602-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org, jvrao@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH 2/2] hw/9pfs: Supply missing va_end()
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
X-List-Received-Date: Fri, 28 Oct 2011 08:52:36 -0000

C99 7.15.1: Each invocation of the va_start and va_copy macros shall
be matched by a corresponding invocation of the va_end macro in the
same function.

Spotted by Coverity.  Harmless on the (common) systems where va_end()
does nothing.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/9pfs/virtio-9p.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/hw/9pfs/virtio-9p.c b/hw/9pfs/virtio-9p.c
index aab3beb..1e22696 100644
--- a/hw/9pfs/virtio-9p.c
+++ b/hw/9pfs/virtio-9p.c
@@ -231,6 +231,7 @@ v9fs_string_alloc_printf(char **strp, const char *fmt, va_list ap)
                 arg_ulong = va_arg(ap2, unsigned long);
                 len += number_to_string((void *)&arg_ulong, 'U');
             } else {
+                va_end(ap2);
                 return -1;
             }
             break;
@@ -244,11 +245,14 @@ v9fs_string_alloc_printf(char **strp, const char *fmt, va_list ap)
         default:
             fprintf(stderr,
 		    "v9fs_string_alloc_printf:Incorrect format %c", *iter);
+            va_end(ap2);
             return -1;
         }
         iter++;
     }
 
+    va_end(ap2);
+
 alloc_print:
     *strp = g_malloc((len + 1) * sizeof(**strp));
 
-- 
1.7.6.4


