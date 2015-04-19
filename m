Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yjmr7-0001AK-HN
	for mharc-qemu-trivial@gnu.org; Sun, 19 Apr 2015 06:53:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1Yjmr5-00017H-IL
	for qemu-trivial@nongnu.org; Sun, 19 Apr 2015 06:53:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1Yjmr1-0005h1-BJ
	for qemu-trivial@nongnu.org; Sun, 19 Apr 2015 06:53:39 -0400
Received: from mail-wg0-f54.google.com ([74.125.82.54]:35009)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1Yjmr1-0005gr-61
	for qemu-trivial@nongnu.org; Sun, 19 Apr 2015 06:53:35 -0400
Received: by wgyo15 with SMTP id o15so152236117wgy.2
	for <qemu-trivial@nongnu.org>; Sun, 19 Apr 2015 03:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RXhsH144ceD8BrXnfN/7nfOlfDkWZy2GBzNzrbMJ0ek=;
	b=NoV+XLqPstoe9DBMnMxnPMEsbIUJzeN0+N1q/xe4psro52fbbZJ/VrCZzBmXoY3nHA
	xibrzIYwC8kjU9fr5nM9wPPMM/V5+o2TjH5utK9gFwdFn9gLbD2Efx7glHoJaaSCol0q
	0uR3le5mlO9jnj304yGDIVpPzv4QPg62Kq4/shq1IfMFnesa3yicyFEwsUI3//3CybZs
	OGc2bVwryYdIufQniaeBzXtBzwgZ+2alhg4sWFKraPvu04fwHu4tSAnk/9BcxHF1kiTu
	CmpsFT2n8PN1UWJWUVJCQFXQS01BPmxpGMEUPb0iGDpV2FYZDNqDcxFPtyZ6moh04PRZ
	T4fg==
X-Gm-Message-State: ALoCoQkeF0B0yV/1tg9HmaAt+82oNH+tGJsM2qtMAPOyLV0h3YNhlNL4FIgKSgzM57qf6QapFqrp
X-Received: by 10.194.89.7 with SMTP id bk7mr21122290wjb.127.1429440814613;
	Sun, 19 Apr 2015 03:53:34 -0700 (PDT)
Received: from Snarl.daynix ([91.205.155.63])
	by mx.google.com with ESMTPSA id fv2sm4350546wjb.6.2015.04.19.03.53.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Apr 2015 03:53:33 -0700 (PDT)
From: Joseph Hindin <jhindin@daynix.com>
To: qemu-devel@nongnu.org
Date: Sun, 19 Apr 2015 13:53:15 +0300
Message-Id: <1429440798-11888-3-git-send-email-jhindin@daynix.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1429440798-11888-1-git-send-email-jhindin@daynix.com>
References: <1429440798-11888-1-git-send-email-jhindin@daynix.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.54
Cc: qemu-trivial@nongnu.org, Joseph Hindin <jhindin@daynix.com>
Subject: [Qemu-trivial] [PATCH 1/4] qemu-ga: adding vss-[un]install options
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
X-List-Received-Date: Sun, 19 Apr 2015 10:53:40 -0000

The '-s install' options installs both Windows service
and COM service, with correspondent option '-s uninstall'
uninstalling Windows service and COM server.

 '-s vss-install' and '-s vss-uninstall' options were added,
installing and uninstalling only COM server.

Signed-off-by: Joseph Hindin <jhindin@daynix.com>
---
 qga/main.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/qga/main.c b/qga/main.c
index 9939a2b..7e1e438 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -211,7 +211,7 @@ static void usage(const char *cmd)
 "  -V, --version     print version information and exit\n"
 "  -d, --daemonize   become a daemon\n"
 #ifdef _WIN32
-"  -s, --service     service commands: install, uninstall\n"
+"  -s, --service     service commands: install, uninstall, vss-install, vss-uninstall\n"
 #endif
 "  -b, --blacklist   comma-separated list of RPCs to disable (no spaces, \"?\"\n"
 "                    to list available RPCs)\n"
@@ -1036,6 +1036,14 @@ int main(int argc, char **argv)
             } else if (strcmp(service, "uninstall") == 0) {
                 ga_uninstall_vss_provider();
                 return ga_uninstall_service();
+            } else if (strcmp(service, "vss-install") == 0) {
+                if (ga_install_vss_provider()) {
+                    return EXIT_FAILURE;
+                }
+                return EXIT_SUCCESS;
+            } else if (strcmp(service, "vss-uninstall") == 0) {
+                ga_uninstall_vss_provider();
+                return EXIT_SUCCESS;
             } else {
                 printf("Unknown service command.\n");
                 return EXIT_FAILURE;
-- 
2.1.0


