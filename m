Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIW75-0004RN-Qb
	for mharc-qemu-trivial@gnu.org; Tue, 15 May 2018 05:19:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fIW72-0004Ml-8D
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 05:19:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fIW6w-0001YD-E4
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 05:19:16 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45988 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fIW6r-0001U1-1p; Tue, 15 May 2018 05:19:05 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ACBBAD39CF;
	Tue, 15 May 2018 09:19:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-49.ams2.redhat.com
	[10.36.116.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 527D32024CAB;
	Tue, 15 May 2018 09:19:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id D3F883F11E; Tue, 15 May 2018 11:19:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Date: Tue, 15 May 2018 11:18:57 +0200
Message-Id: <20180515091901.27774-7-kraxel@redhat.com>
In-Reply-To: <20180515091901.27774-1-kraxel@redhat.com>
References: <20180515091901.27774-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 15 May 2018 09:19:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 15 May 2018 09:19:04 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PULL 06/10] ui: switch trivial displays to qapi
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
X-List-Received-Date: Tue, 15 May 2018 09:19:18 -0000

Drop the option-less display types (egl-headless, curses, none) from
parse_display(), so they'll be handled by parse_display_qapi().

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20180507095539.19584-3-kraxel@redhat.com
---
 vl.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/vl.c b/vl.c
index c56f7f8046..6b8f946d58 100644
--- a/vl.c
+++ b/vl.c
@@ -2185,10 +2185,6 @@ static void parse_display(const char *p)
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
@@ -2221,8 +2217,6 @@ static void parse_display(const char *p)
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


