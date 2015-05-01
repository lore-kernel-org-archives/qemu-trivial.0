Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yo8RN-0000jo-9r
	for mharc-qemu-trivial@gnu.org; Fri, 01 May 2015 06:45:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1Yo8RI-0000e4-4e
	for qemu-trivial@nongnu.org; Fri, 01 May 2015 06:45:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1Yo8RH-0006oK-3J
	for qemu-trivial@nongnu.org; Fri, 01 May 2015 06:45:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39711)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1Yo8RB-0006nA-3K; Fri, 01 May 2015 06:44:53 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 99B32B6A2F;
	Fri,  1 May 2015 10:44:52 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-4-77.ams2.redhat.com
	[10.36.4.77])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t41AiopM012086; Fri, 1 May 2015 06:44:51 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  1 May 2015 11:44:46 +0100
Message-Id: <1430477086-26830-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH] ui: remove check for failure of
	qemu_acl_init()
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
X-List-Received-Date: Fri, 01 May 2015 10:45:03 -0000

The qemu_acl_init() function has long since stopped being able
to return NULL, since g_malloc will abort on OOM. As such the
checks for NULL were unreachable code.

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 ui/vnc.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index cffb5b7..6bfe228 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3602,10 +3602,6 @@ void vnc_display_open(const char *id, Error **errp)
             aclname = g_strdup_printf("vnc.%s.x509dname", vs->id);
         }
         vs->tls.acl = qemu_acl_init(aclname);
-        if (!vs->tls.acl) {
-            fprintf(stderr, "Failed to create x509 dname ACL\n");
-            exit(1);
-        }
         g_free(aclname);
     }
 #endif
@@ -3619,10 +3615,6 @@ void vnc_display_open(const char *id, Error **errp)
             aclname = g_strdup_printf("vnc.%s.username", vs->id);
         }
         vs->sasl.acl = qemu_acl_init(aclname);
-        if (!vs->sasl.acl) {
-            fprintf(stderr, "Failed to create username ACL\n");
-            exit(1);
-        }
         g_free(aclname);
     }
 #endif
-- 
2.1.0


