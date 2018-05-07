Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fFcs3-0002GD-Nc
	for mharc-qemu-trivial@gnu.org; Mon, 07 May 2018 05:55:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fFcrz-0002Bc-9K
	for qemu-trivial@nongnu.org; Mon, 07 May 2018 05:55:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fFcry-0005IK-FF
	for qemu-trivial@nongnu.org; Mon, 07 May 2018 05:55:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33244 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fFcrv-0005DE-6t; Mon, 07 May 2018 05:55:43 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7EA384250;
	Mon,  7 May 2018 09:55:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-99.ams2.redhat.com
	[10.36.116.99])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D83F108471;
	Mon,  7 May 2018 09:55:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id A301651BA6; Mon,  7 May 2018 11:55:39 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Date: Mon,  7 May 2018 11:55:36 +0200
Message-Id: <20180507095539.19584-2-kraxel@redhat.com>
In-Reply-To: <20180507095539.19584-1-kraxel@redhat.com>
References: <20180507095539.19584-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 07 May 2018 09:55:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 07 May 2018 09:55:42 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH v2 1/4] ui: add qapi parser for -display
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
X-List-Received-Date: Mon, 07 May 2018 09:55:48 -0000

Add parse_display_qapi() function which parses the -display command line
using a qapi visitor for DisplayOptions.  Wire up as default catch in
parse_display().

Improves the error message for unknown display types.

Also enables json as -display argument, i.e. -display "{ 'type': 'gtk' }"

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 vl.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/vl.c b/vl.c
index 806eec2ef6..d53ea078bd 100644
--- a/vl.c
+++ b/vl.c
@@ -120,12 +120,14 @@ int main(int argc, char **argv)
 #include "ui/qemu-spice.h"
 #include "qapi/string-input-visitor.h"
 #include "qapi/opts-visitor.h"
+#include "qapi/clone-visitor.h"
 #include "qom/object_interfaces.h"
 #include "exec/semihost.h"
 #include "crypto/init.h"
 #include "sysemu/replay.h"
 #include "qapi/qapi-events-run-state.h"
 #include "qapi/qapi-visit-block-core.h"
+#include "qapi/qapi-visit-ui.h"
 #include "qapi/qapi-commands-block-core.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-run-state.h"
@@ -2088,6 +2090,25 @@ static void select_vgahw(const char *p)
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
+    QAPI_CLONE_MEMBERS(DisplayOptions, &dpy, opts);
+
+    qapi_free_DisplayOptions(opts);
+    visit_free(v);
+}
+
 static void parse_display(const char *p)
 {
     const char *opts;
@@ -2203,8 +2224,7 @@ static void parse_display(const char *p)
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


