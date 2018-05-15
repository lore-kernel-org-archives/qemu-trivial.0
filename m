Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIW70-0004KK-En
	for mharc-qemu-trivial@gnu.org; Tue, 15 May 2018 05:19:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fIW6w-0004F9-Kz
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 05:19:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fIW6v-0001XV-Ia
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 05:19:10 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34878 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fIW6r-0001UA-4e; Tue, 15 May 2018 05:19:05 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1A5A41AE7CC;
	Tue, 15 May 2018 09:19:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-49.ams2.redhat.com
	[10.36.116.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 55B4C2166BAD;
	Tue, 15 May 2018 09:19:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id E45893F120; Tue, 15 May 2018 11:19:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Date: Tue, 15 May 2018 11:18:59 +0200
Message-Id: <20180515091901.27774-9-kraxel@redhat.com>
In-Reply-To: <20180515091901.27774-1-kraxel@redhat.com>
References: <20180515091901.27774-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 15 May 2018 09:19:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 15 May 2018 09:19:04 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PULL 08/10] ui: document non-qapi parser cases.
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

Add comments to the cases not (yet) switched
over to parse_display_qapi().

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20180507095539.19584-5-kraxel@redhat.com
---
 vl.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/vl.c b/vl.c
index 5f1734d851..3b39bbd7a8 100644
--- a/vl.c
+++ b/vl.c
@@ -2114,6 +2114,16 @@ static void parse_display(const char *p)
     const char *opts;
 
     if (strstart(p, "sdl", &opts)) {
+        /*
+         * sdl DisplayType needs hand-crafted parser instead of
+         * parse_display_qapi() due to some options not in
+         * DisplayOptions, specifically:
+         *   - frame
+         *     Already deprecated.
+         *   - ctrl_grab + alt_grab
+         *     Not clear yet what happens to them long-term.  Should
+         *     replaced by something better or deprecated and dropped.
+         */
         dpy.type = DISPLAY_TYPE_SDL;
         while (*opts) {
             const char *nextopt;
@@ -2179,6 +2189,10 @@ static void parse_display(const char *p)
             opts = nextopt;
         }
     } else if (strstart(p, "vnc", &opts)) {
+        /*
+         * vnc isn't a (local) DisplayType but a protocol for remote
+         * display access.
+         */
         if (*opts == '=') {
             vnc_parse(opts + 1, &error_fatal);
         } else {
-- 
2.9.3


