Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f99Un-0004y4-8c
	for mharc-qemu-trivial@gnu.org; Thu, 19 Apr 2018 09:21:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1f99Uf-0004qI-QE
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2018 09:21:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1f99Uc-0006UQ-KN
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2018 09:20:57 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50728 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1f99UQ-0006Ki-Oa; Thu, 19 Apr 2018 09:20:42 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 027E78185335;
	Thu, 19 Apr 2018 13:20:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-151.ams2.redhat.com
	[10.36.117.151])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 52998215CDC8;
	Thu, 19 Apr 2018 13:20:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 76AC93EBAE; Thu, 19 Apr 2018 15:20:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Date: Thu, 19 Apr 2018 15:20:25 +0200
Message-Id: <20180419132026.5494-4-kraxel@redhat.com>
In-Reply-To: <20180419132026.5494-1-kraxel@redhat.com>
References: <20180419132026.5494-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 19 Apr 2018 13:20:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 19 Apr 2018 13:20:38 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH 3/4] ui: switch gtk display to qapi parser
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
X-List-Received-Date: Thu, 19 Apr 2018 13:21:03 -0000

Drop the gtk option parser from parse_display(), so parse_display_qapi()
will handle it instead.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 vl.c | 32 --------------------------------
 1 file changed, 32 deletions(-)

diff --git a/vl.c b/vl.c
index 39303d6b55..1123cd792e 100644
--- a/vl.c
+++ b/vl.c
@@ -2188,38 +2188,6 @@ static void parse_display(const char *p)
             error_report("VNC requires a display argument vnc=<display>");
             exit(1);
         }
-    } else if (strstart(p, "gtk", &opts)) {
-        dpy.type = DISPLAY_TYPE_GTK;
-        while (*opts) {
-            const char *nextopt;
-
-            if (strstart(opts, ",grab_on_hover=", &nextopt)) {
-                opts = nextopt;
-                dpy.u.gtk.has_grab_on_hover = true;
-                if (strstart(opts, "on", &nextopt)) {
-                    dpy.u.gtk.grab_on_hover = true;
-                } else if (strstart(opts, "off", &nextopt)) {
-                    dpy.u.gtk.grab_on_hover = false;
-                } else {
-                    goto invalid_gtk_args;
-                }
-            } else if (strstart(opts, ",gl=", &nextopt)) {
-                opts = nextopt;
-                dpy.has_gl = true;
-                if (strstart(opts, "on", &nextopt)) {
-                    dpy.gl = true;
-                } else if (strstart(opts, "off", &nextopt)) {
-                    dpy.gl = false;
-                } else {
-                    goto invalid_gtk_args;
-                }
-            } else {
-            invalid_gtk_args:
-                error_report("invalid GTK option string");
-                exit(1);
-            }
-            opts = nextopt;
-        }
     } else {
         parse_display_qapi(p);
     }
-- 
2.9.3


