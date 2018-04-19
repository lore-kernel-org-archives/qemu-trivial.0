Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f99Uc-0004ml-SA
	for mharc-qemu-trivial@gnu.org; Thu, 19 Apr 2018 09:20:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1f99UW-0004h3-ID
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2018 09:20:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1f99UV-0006Pp-IK
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2018 09:20:48 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54444 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1f99UQ-0006Kj-OM; Thu, 19 Apr 2018 09:20:42 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D131C43362F1;
	Thu, 19 Apr 2018 13:20:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-151.ams2.redhat.com
	[10.36.117.151])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4BDCC215CDA7;
	Thu, 19 Apr 2018 13:20:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 665613EB9C; Thu, 19 Apr 2018 15:20:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Date: Thu, 19 Apr 2018 15:20:23 +0200
Message-Id: <20180419132026.5494-2-kraxel@redhat.com>
In-Reply-To: <20180419132026.5494-1-kraxel@redhat.com>
References: <20180419132026.5494-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 19 Apr 2018 13:20:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 19 Apr 2018 13:20:38 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH 1/4] ui: add qapi parser for -display
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

Add parse_display_qapi() function which parses the -display command line
using a qapi visitor for DisplayOptions.  Wire up as default catch in
parse_display().

Improves the error message for unknown display types.

Also enables json as -display argument, i.e. -display "{ 'type': 'gtk' }"

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 vl.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/vl.c b/vl.c
index fce1fd12d8..784c3fb795 100644
--- a/vl.c
+++ b/vl.c
@@ -126,6 +126,7 @@ int main(int argc, char **argv)
 #include "sysemu/replay.h"
 #include "qapi/qapi-events-run-state.h"
 #include "qapi/qapi-visit-block-core.h"
+#include "qapi/qapi-visit-ui.h"
 #include "qapi/qapi-commands-block-core.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-run-state.h"
@@ -2090,6 +2091,31 @@ static void select_vgahw(const char *p)
     }
 }
 
+static void parse_display_qapi(const char *optarg)
+{
+    Error *err = NULL;
+    DisplayOptions *opts;
+    Visitor *v;
+
+    v = qobject_input_visitor_new_str(optarg, "type", &err);
+    if (!v) {
+        error_report_err(err);
+        exit(1);
+    }
+
+    visit_type_DisplayOptions(v, NULL, &opts, &error_fatal);
+    visit_free(v);
+
+    /*
+     * We don't have any dynamically allocated stuff inside
+     * DisplayOptions, so we can simply copy the struct content and
+     * free opts without ending up with pointers pointing into
+     * nowhere.
+     */
+    dpy = *opts;
+    qapi_free_DisplayOptions(opts);
+}
+
 static void parse_display(const char *p)
 {
     const char *opts;
@@ -2201,8 +2227,7 @@ static void parse_display(const char *p)
     } else if (strstart(p, "none", &opts)) {
         dpy.type = DISPLAY_TYPE_NONE;
     } else {
-        error_report("unknown display type");
-        exit(1);
+        parse_display_qapi(p);
     }
 }
 
-- 
2.9.3


