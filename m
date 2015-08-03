Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMBqD-0005zW-RV
	for mharc-qemu-trivial@gnu.org; Mon, 03 Aug 2015 05:15:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpw-0005SV-CY
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBps-0003MR-Re
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:12 -0400
Received: from mail-wi0-f176.google.com ([209.85.212.176]:38645)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBps-0003Lf-G5
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:08 -0400
Received: by wibxm9 with SMTP id xm9so105252157wib.1
	for <qemu-trivial@nongnu.org>; Mon, 03 Aug 2015 02:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=w0jSUrUnF0+W93GMCFPBUQIEJD+iuV5rQvoCGdytRlI=;
	b=kQq6pPh9yzYPUTMwXg74490iERBKoaBJSnAKmm7eT0N4KXOWT2Ua6XDzQ9QENE6rQg
	51MpncVMSx4xVlHbCf36I5TxQhD1CHf5E+Fu860d0wJ1jG2P60doO96Z3Ug9eqEMdWUq
	Aowvjmcn5Iofe1Wahja7IrxNIPG7FEw5uL8LU7SlsPvQicaB3IfZOXFa4bDWVMkDhfYe
	epH236zysrpuvCbaB+DPjL4XwH7418ABPHC7CdlZQd0UTXfn8JyPbgfU4GP0QBDTbpT8
	Rgl8cZXLG6Rk7mzDQS+8uwnSXu4epwjGUfyONJGJnRpTHPg1tLgsmxbE/kWd8oLevEDU
	SIuw==
X-Gm-Message-State: ALoCoQmbyLL0CTcWCk+ZYjSKbW1g0sit52IaH5PYysH3ck9P9YGAKHiuSSAhvunk3zR2v/L9V9n9
X-Received: by 10.194.158.34 with SMTP id wr2mr31808391wjb.23.1438593308063;
	Mon, 03 Aug 2015 02:15:08 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	fq15sm21866093wjc.12.2015.08.03.02.15.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Aug 2015 02:15:07 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id E9F313E08D6;
	Mon,  3 Aug 2015 10:15:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  3 Aug 2015 10:14:50 +0100
Message-Id: <1438593291-27109-11-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.176
Cc: qemu-trivial@nongnu.org, crosthwaitepeter@gmail.com, pbonzini@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH v4 10/11] vl.c: log system invocation when
	enabled
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
X-List-Received-Date: Mon, 03 Aug 2015 09:15:16 -0000

This makes it a little easier to remember how you generated that 100Mb
trace log you saved for a future date.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure |  2 +-
 vl.c      | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 704b34c..9cc6a48 100755
--- a/configure
+++ b/configure
@@ -1445,7 +1445,7 @@ else
 fi
 
 gcc_flags="-Wold-style-declaration -Wold-style-definition -Wtype-limits"
-gcc_flags="-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers $gcc_flags"
+gcc_flags="-Wformat-security -Wno-format-y2k -Winit-self -Wignored-qualifiers $gcc_flags"
 gcc_flags="-Wmissing-include-dirs -Wempty-body -Wnested-externs $gcc_flags"
 gcc_flags="-Wendif-labels $gcc_flags"
 gcc_flags="-Wno-initializer-overrides $gcc_flags"
diff --git a/vl.c b/vl.c
index 05211cf..6f0ae74 100644
--- a/vl.c
+++ b/vl.c
@@ -4094,12 +4094,30 @@ int main(int argc, char **argv, char **envp)
 
     if (log_mask) {
         int mask;
+        char fmt_time[512];
+        time_t start_time = time(NULL);
+        struct tm *local_start = localtime(&start_time);
+
+
+        if (log_file) {
+            qemu_set_log_filename(log_file);
+        }
+
         mask = qemu_str_to_log_mask(log_mask);
         if (!mask) {
             qemu_print_log_usage(stdout);
             exit(1);
         }
         qemu_set_log(mask);
+
+        if (strftime(fmt_time, sizeof(fmt_time), "%c", local_start) > 0) {
+            qemu_log("System Emulation started at %s\n", fmt_time);
+            qemu_log("Invocation:");
+            for (i = 0; i < argc; i++) {
+                qemu_log("%s ", argv[i]);
+            }
+            qemu_log("\n");
+        }
     }
 
     if (!is_daemonized()) {
-- 
2.5.0


