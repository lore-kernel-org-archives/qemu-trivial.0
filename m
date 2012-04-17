Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SKBst-0000O2-L7
	for mharc-qemu-trivial@gnu.org; Tue, 17 Apr 2012 13:08:07 -0400
Received: from eggs.gnu.org ([208.118.235.92]:52401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1SKBso-0008Vh-2y
	for qemu-trivial@nongnu.org; Tue, 17 Apr 2012 13:08:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1SKBsj-0001aW-AJ
	for qemu-trivial@nongnu.org; Tue, 17 Apr 2012 13:08:01 -0400
Received: from mail-ob0-f173.google.com ([209.85.214.173]:51649)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>)
	id 1SKBsb-0001Xe-Dp; Tue, 17 Apr 2012 13:07:49 -0400
Received: by obbwd18 with SMTP id wd18so3132837obb.4
	for <multiple recipients>; Tue, 17 Apr 2012 10:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=KkaES/ctc17/VC/ia7Li4J9OxkP8yqMZETOK5O9895c=;
	b=ZHgbgN/evksFJEk7r8HfxPugaGLAEwPuypc0Dug7TkyErSVAvvvOgYY5I5HpjX2Imy
	pY5ZckIUTCVPXdqOH59Q9eGHmX0VYFQ1yKdJcvJTshMmaqYwyyBIkMPen2yhQuGkoYTO
	gQYyGlfGSBvRBuD1pVZC/CBiwZ2SrL6YNY6EYXc9NvyOuNYZwQCMlAa7vnIy6D9hUVW9
	Rc+ibtDXI8v4MkFymhYL73JzHfcMH9/dJ1F+lfZdiZSxRj0+WlH9N6RMJGXT8rVG7lJ/
	ib5HiP/M9Y6FfqU9wAq+Bjfo42SMN3al0FXQbZqknkSurFMvZpPTLZ7TUUHXsmPvgWn4
	+fpA==
Received: by 10.182.159.41 with SMTP id wz9mr22426794obb.69.1334682467046;
	Tue, 17 Apr 2012 10:07:47 -0700 (PDT)
Received: from localhost.localdomain ([32.97.110.59])
	by mx.google.com with ESMTPS id m2sm23700149obk.9.2012.04.17.10.07.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 10:07:46 -0700 (PDT)
Sender: fluxion <flukshun@gmail.com>
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Tue, 17 Apr 2012 12:07:39 -0500
Message-Id: <1334682459-27835-2-git-send-email-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1334682459-27835-1-git-send-email-mdroth@linux.vnet.ibm.com>
References: <1334682459-27835-1-git-send-email-mdroth@linux.vnet.ibm.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.173
Cc: qemu-trivial@nongnu.org, afaerber@suse.de, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH 2/2] qemu-ga: fix help output
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
X-List-Received-Date: Tue, 17 Apr 2012 17:08:05 -0000


Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 qemu-ga.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/qemu-ga.c b/qemu-ga.c
index d6f786e..74a1b02 100644
--- a/qemu-ga.c
+++ b/qemu-ga.c
@@ -117,12 +117,13 @@ static gboolean register_signal_handlers(void)
 static void usage(const char *cmd)
 {
     printf(
-"Usage: %s -c <channel_opts>\n"
+"Usage: %s [-m <method> -p <path>] [<options>]\n"
 "QEMU Guest Agent %s\n"
 "\n"
 "  -m, --method      transport method: one of unix-listen, virtio-serial, or\n"
 "                    isa-serial (virtio-serial is the default)\n"
-"  -p, --path        device/socket path (%s is the default for virtio-serial)\n"
+"  -p, --path        device/socket path (the default for virtio-serial is:\n"
+"                    %s)\n"
 "  -l, --logfile     set logfile path, logs to stderr by default\n"
 "  -f, --pidfile     specify pidfile (default is %s)\n"
 "  -v, --verbose     log extra debugging information\n"
@@ -131,7 +132,7 @@ static void usage(const char *cmd)
 #ifdef _WIN32
 "  -s, --service     service commands: install, uninstall\n"
 #endif
-"  -b, --blacklist   comma-separated list of RPCs to disable (no spaces, \"?\""
+"  -b, --blacklist   comma-separated list of RPCs to disable (no spaces, \"?\"\n"
 "                    to list available RPCs)\n"
 "  -h, --help        display this help and exit\n"
 "\n"
-- 
1.7.4.1


