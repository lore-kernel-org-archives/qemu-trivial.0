Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dO4cX-0000yG-Nl
	for mharc-qemu-trivial@gnu.org; Thu, 22 Jun 2017 12:06:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1dO4cV-0000xC-KD
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 12:06:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1dO4cQ-0004D8-MJ
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 12:06:11 -0400
Received: from 17.mo5.mail-out.ovh.net ([46.105.56.132]:51935)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1dO4cQ-0004CD-G7
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 12:06:06 -0400
Received: from player695.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 78D8E107145
	for <qemu-trivial@nongnu.org>; Thu, 22 Jun 2017 18:06:04 +0200 (CEST)
Received: from [192.168.0.243] (gar31-1-82-66-74-139.fbx.proxad.net
	[82.66.74.139]) (Authenticated sender: groug@kaod.org)
	by player695.ha.ovh.net (Postfix) with ESMTPA id B2816460081;
	Thu, 22 Jun 2017 18:06:00 +0200 (CEST)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Date: Thu, 22 Jun 2017 18:06:00 +0200
Message-ID: <149814756006.27338.8723356702388175951.stgit@bahia>
User-Agent: StGit/0.17.1-20-gc0b1b-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 16927905100276996587
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrledvgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.56.132
Subject: [Qemu-trivial] [PATCH] Separate function types from opaque types in
 include/qemu/typedefs.h
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
X-List-Received-Date: Thu, 22 Jun 2017 16:06:12 -0000

Function types cannot reside in the same sorted list as opaque types since
they may depend on a type which would be defined later.

Of course, the same problem could arise if a function type depends on
another function type with greater alphabetical order. Hopefully we
don't have that at this time.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/qemu/typedefs.h |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index f745d5faf7fd..cd3e369ae01a 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -1,10 +1,9 @@
 #ifndef QEMU_TYPEDEFS_H
 #define QEMU_TYPEDEFS_H
 
-/* A load of opaque types so that device init declarations don't have to
-   pull in all the real definitions.  */
-
-/* Please keep this list in alphabetical order */
+/* First list is for opaque types only, second one for function types.
+ * Please keep both lists in alphabetical order.
+ */
 typedef struct AdapterInfo AdapterInfo;
 typedef struct AddressSpace AddressSpace;
 typedef struct AioContext AioContext;
@@ -96,7 +95,8 @@ typedef struct uWireSlave uWireSlave;
 typedef struct VirtIODevice VirtIODevice;
 typedef struct Visitor Visitor;
 typedef struct node_info NodeInfo;
+
+typedef int  LoadStateHandler(QEMUFile *f, void *opaque, int version_id);
 typedef void SaveStateHandler(QEMUFile *f, void *opaque);
-typedef int LoadStateHandler(QEMUFile *f, void *opaque, int version_id);
 
 #endif /* QEMU_TYPEDEFS_H */


