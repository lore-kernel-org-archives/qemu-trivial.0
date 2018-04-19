Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f99Ud-0004n2-3H
	for mharc-qemu-trivial@gnu.org; Thu, 19 Apr 2018 09:20:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1f99UW-0004fp-6J
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2018 09:20:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1f99UV-0006Pd-AV
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2018 09:20:48 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41580 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1f99UQ-0006Kk-OV; Thu, 19 Apr 2018 09:20:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 21DB211D299;
	Thu, 19 Apr 2018 13:20:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-151.ams2.redhat.com
	[10.36.117.151])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E03E10F1C02;
	Thu, 19 Apr 2018 13:20:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 6E66F3EB9D; Thu, 19 Apr 2018 15:20:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Date: Thu, 19 Apr 2018 15:20:24 +0200
Message-Id: <20180419132026.5494-3-kraxel@redhat.com>
In-Reply-To: <20180419132026.5494-1-kraxel@redhat.com>
References: <20180419132026.5494-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 19 Apr 2018 13:20:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 19 Apr 2018 13:20:39 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH 2/4] ui: switch trivial displays to qapi
 parser
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
X-List-Received-Date: Thu, 19 Apr 2018 13:20:53 -0000

Drop the option-less display types (egl-headless, curses, none) from
parse_display(), so they'll be handled by parse_display_qapi().

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 vl.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/vl.c b/vl.c
index 784c3fb795..39303d6b55 100644
--- a/vl.c
+++ b/vl.c
@@ -2188,10 +2188,6 @@ static void parse_display(const char *p)
             error_report("VNC requires a display argument vnc=<display>");
             exit(1);
         }
-    } else if (strstart(p, "egl-headless", &opts)) {
-        dpy.type = DISPLAY_TYPE_EGL_HEADLESS;
-    } else if (strstart(p, "curses", &opts)) {
-        dpy.type = DISPLAY_TYPE_CURSES;
     } else if (strstart(p, "gtk", &opts)) {
         dpy.type = DISPLAY_TYPE_GTK;
         while (*opts) {
@@ -2224,8 +2220,6 @@ static void parse_display(const char *p)
             }
             opts = nextopt;
         }
-    } else if (strstart(p, "none", &opts)) {
-        dpy.type = DISPLAY_TYPE_NONE;
     } else {
         parse_display_qapi(p);
     }
-- 
2.9.3


