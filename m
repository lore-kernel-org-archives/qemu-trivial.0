Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZoB7O-0004dK-HQ
	for mharc-qemu-trivial@gnu.org; Mon, 19 Oct 2015 10:08:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZoB7K-0004Xt-14
	for qemu-trivial@nongnu.org; Mon, 19 Oct 2015 10:08:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZoB7I-0000pI-S1
	for qemu-trivial@nongnu.org; Mon, 19 Oct 2015 10:08:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53643)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZoB7G-0000oX-HI; Mon, 19 Oct 2015 10:08:46 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 247C6C0C1883;
	Mon, 19 Oct 2015 14:08:46 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-64.ams2.redhat.com
	[10.36.112.64])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9JE8e6x026368; Mon, 19 Oct 2015 10:08:44 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Oct 2015 16:08:40 +0200
Message-Id: <1445263720-6765-3-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] bt: fix use of uninitialized variable seqlen
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
X-List-Received-Date: Mon, 19 Oct 2015 14:08:51 -0000

sdp_svc_match, sdp_attr_match and sdp_svc_attr_match read the last
argument.  The only sensible way to change the code is to make that last
argument "len" instead of "seqlen" which is the length of a subsequence
in the previous "if" branch.

To make the structure of the code clearer, use "else" instead of
"else if".

Reported by Coverity.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/bt/sdp.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/hw/bt/sdp.c b/hw/bt/sdp.c
index c903747..b9bcdcc 100644
--- a/hw/bt/sdp.c
+++ b/hw/bt/sdp.c
@@ -150,12 +150,14 @@ static ssize_t sdp_svc_search(struct bt_l2cap_sdp_state_s *sdp,
         if (seqlen < 3 || len < seqlen)
             return -SDP_INVALID_SYNTAX;
         len -= seqlen;
-
         while (seqlen)
             if (sdp_svc_match(sdp, &req, &seqlen))
                 return -SDP_INVALID_SYNTAX;
-    } else if (sdp_svc_match(sdp, &req, &seqlen))
-        return -SDP_INVALID_SYNTAX;
+    } else {
+        if (sdp_svc_match(sdp, &req, &len)) {
+            return -SDP_INVALID_SYNTAX;
+        }
+    }
 
     if (len < 3)
         return -SDP_INVALID_SYNTAX;
@@ -278,8 +280,11 @@ static ssize_t sdp_attr_get(struct bt_l2cap_sdp_state_s *sdp,
         while (seqlen)
             if (sdp_attr_match(record, &req, &seqlen))
                 return -SDP_INVALID_SYNTAX;
-    } else if (sdp_attr_match(record, &req, &seqlen))
-        return -SDP_INVALID_SYNTAX;
+    } else {
+        if (sdp_attr_match(record, &req, &len)) {
+            return -SDP_INVALID_SYNTAX;
+        }
+    }
 
     if (len < 1)
         return -SDP_INVALID_SYNTAX;
@@ -393,8 +398,11 @@ static ssize_t sdp_svc_search_attr_get(struct bt_l2cap_sdp_state_s *sdp,
         while (seqlen)
             if (sdp_svc_match(sdp, &req, &seqlen))
                 return -SDP_INVALID_SYNTAX;
-    } else if (sdp_svc_match(sdp, &req, &seqlen))
-        return -SDP_INVALID_SYNTAX;
+    } else {
+        if (sdp_svc_match(sdp, &req, &len)) {
+            return -SDP_INVALID_SYNTAX;
+        }
+    }
 
     if (len < 3)
         return -SDP_INVALID_SYNTAX;
@@ -413,8 +421,11 @@ static ssize_t sdp_svc_search_attr_get(struct bt_l2cap_sdp_state_s *sdp,
         while (seqlen)
             if (sdp_svc_attr_match(sdp, &req, &seqlen))
                 return -SDP_INVALID_SYNTAX;
-    } else if (sdp_svc_attr_match(sdp, &req, &seqlen))
-        return -SDP_INVALID_SYNTAX;
+    } else {
+        if (sdp_svc_attr_match(sdp, &req, &len)) {
+            return -SDP_INVALID_SYNTAX;
+        }
+    }
 
     if (len < 1)
         return -SDP_INVALID_SYNTAX;
-- 
2.5.0


