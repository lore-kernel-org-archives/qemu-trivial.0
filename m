Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPuL1-0000VY-NY
	for mharc-qemu-trivial@gnu.org; Tue, 18 Mar 2014 09:45:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maxa@catit.be>) id 1WPn4R-0001wX-Uh
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 02:00:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maxa@catit.be>) id 1WPn4L-0000WO-7F
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 02:00:15 -0400
Received: from mail-la0-f47.google.com ([209.85.215.47]:45147)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maxa@catit.be>) id 1WPn4L-0000WF-0r
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 02:00:09 -0400
Received: by mail-la0-f47.google.com with SMTP id y1so4349219lam.20
	for <qemu-trivial@nongnu.org>; Mon, 17 Mar 2014 23:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=o50q5FpKwRGMw/myqjCG24sZ4x5Y05fSpappt5ha9uA=;
	b=MYpEnl3SqiwD9d804+QEDLhoX94hWlq+VMgoy6DU0odcSYfXuqXPaLeihww8RwX9i0
	TPI+5G1ct4nuT8o6yGXvR2RJJso2KoR+jQOiOFmf3utkACoObQxQ9PXUEuCubpNxyKfD
	YwihgNrL3GAjKLfbdbAc+sHHZs5+l6JkEWXCpqWpAY/n2dnx4C4tpAZduGpVEbkttvKO
	V1d3aTY4TVRXb7S+w54fPrNhxugIoVKF3nsmXyyxHNkDp41OUk9W68X/gYY3zuFYmWaF
	lVhOXT88AFlUn8XVI6f22Qx3/mGBo/F8mfXDi08AabyMBeGmgWKCbnlTQfhwhyjlBibK
	BILQ==
X-Gm-Message-State: ALoCoQllYo/CA6WNlBDSH2wO3yArQisIoLtKuvaBCrPloYvySy2/POLKgk5gIo6r5a29/bwQqvLc
X-Received: by 10.152.22.37 with SMTP id a5mr20044123laf.4.1395122408097;
	Mon, 17 Mar 2014 23:00:08 -0700 (PDT)
Received: from z1.base.vohkarts.com ([31.134.130.233])
	by mx.google.com with ESMTPSA id
	tq9sm14326202lbb.10.2014.03.17.23.00.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Mar 2014 23:00:07 -0700 (PDT)
From: Maria Kustova <maxa@catit.be>
To: qemu-devel@nongnu.org
Date: Tue, 18 Mar 2014 09:59:19 +0400
Message-Id: <1395122359-28890-4-git-send-email-maria.k@catit.be>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1395122359-28890-1-git-send-email-maria.k@catit.be>
References: <1395122359-28890-1-git-send-email-maria.k@catit.be>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.47
X-Mailman-Approved-At: Tue, 18 Mar 2014 09:45:48 -0400
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, Maria Kustova <maria.k@catit.be>,
	stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH v2 3/3] qemu-io: Extended "--cmd" description
	in usage text
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
X-List-Received-Date: Tue, 18 Mar 2014 06:00:22 -0000

It's not clear from the usage description that "--cmd" option accepts its argument as a string, so any special symbols have to be quoted from the shell.
Updates in usage text:
 - Specified parameter format for "--cmd" option.
 - Added an instruction how to get help for "--cmd" option.

Signed-off-by: Maria Kustova <maria.k@catit.be>
---
 qemu-io.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/qemu-io.c b/qemu-io.c
index fc38608..be68d96 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -194,10 +194,11 @@ static const cmdinfo_t quit_cmd = {
 static void usage(const char *name)
 {
     printf(
-"Usage: %s [-h] [-V] [-rsnm] [-c cmd] ... [file]\n"
+"Usage: %s [-h] [-V] [-rsnm] [-c STRING] ... [file]\n"
 "QEMU Disk exerciser\n"
 "\n"
-"  -c, --cmd            command to execute\n"
+"  -c, --cmd STRING     execute command with its arguments\n"
+"                       from the given string\n"
 "  -r, --read-only      export read-only\n"
 "  -s, --snapshot       use snapshot file\n"
 "  -n, --nocache        disable host cache\n"
@@ -208,8 +209,10 @@ static void usage(const char *name)
 "  -T, --trace FILE     enable trace events listed in the given file\n"
 "  -h, --help           display this help and exit\n"
 "  -V, --version        output version information and exit\n"
+"\n"
+"See '%s -c help' for information on available commands."
 "\n",
-    name);
+    name, name);
 }
 
 static char *get_prompt(void)
-- 
1.8.2.1


