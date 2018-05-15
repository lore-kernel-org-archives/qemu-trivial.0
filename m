Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIW6y-0004IK-Tl
	for mharc-qemu-trivial@gnu.org; Tue, 15 May 2018 05:19:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fIW6w-0004FT-Sx
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 05:19:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fIW6v-0001XH-By
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 05:19:10 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34838 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fIW6q-0001TG-1W; Tue, 15 May 2018 05:19:04 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8DF8441AE7CB;
	Tue, 15 May 2018 09:19:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-49.ams2.redhat.com
	[10.36.116.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B4622024CAB;
	Tue, 15 May 2018 09:19:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id AB5E831F23; Tue, 15 May 2018 11:19:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Date: Tue, 15 May 2018 11:18:52 +0200
Message-Id: <20180515091901.27774-2-kraxel@redhat.com>
In-Reply-To: <20180515091901.27774-1-kraxel@redhat.com>
References: <20180515091901.27774-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 15 May 2018 09:19:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 15 May 2018 09:19:03 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PULL 01/10] sdl2: move opts assignment into loop
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
X-List-Received-Date: Tue, 15 May 2018 09:19:11 -0000

So the opts pointer is set for all sdl2_consoles.

Fixes: 844fd50dbbcfc9e401895274bf4fb8da8e8d3f64
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/sdl2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index da037248c2..a0f9b16bc1 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -804,7 +804,6 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
         return;
     }
     sdl2_console = g_new0(struct sdl2_console, sdl2_num_outputs);
-    sdl2_console->opts = o;
     for (i = 0; i < sdl2_num_outputs; i++) {
         QemuConsole *con = qemu_console_lookup_by_index(i);
         assert(con != NULL);
@@ -812,6 +811,7 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
             sdl2_console[i].hidden = true;
         }
         sdl2_console[i].idx = i;
+        sdl2_console[i].opts = o;
 #ifdef CONFIG_OPENGL
         sdl2_console[i].opengl = display_opengl;
         sdl2_console[i].dcl.ops = display_opengl ? &dcl_gl_ops : &dcl_2d_ops;
-- 
2.9.3


