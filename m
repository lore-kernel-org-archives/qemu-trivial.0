Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zugvv-0003BN-Fa
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 08:19:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zugvq-00032G-Od
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 08:19:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zugvi-0002H7-V1
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 08:19:54 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58680)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Zugve-0002Cp-D2; Fri, 06 Nov 2015 08:19:42 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BB7E740DD8;
	Fri,  6 Nov 2015 16:19:39 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 93E43ABC;
	Fri,  6 Nov 2015 15:44:04 +0300 (MSK)
Received: (nullmailer pid 31696 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:43:49 +0300
Message-Id: <374ec0669a1aa3affac7850a16c6cad18221c439.1446813769.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 12/24] bt: fix use of uninitialized variable
	seqlen
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
X-List-Received-Date: Fri, 06 Nov 2015 13:19:56 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

sdp_svc_match, sdp_attr_match and sdp_svc_attr_match read the last
argument.  The only sensible way to change the code is to make that last
argument "len" instead of "seqlen" which is the length of a subsequence
in the previous "if" branch.

To make the structure of the code clearer, use "else" instead of
"else if".

Reported by Coverity.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


