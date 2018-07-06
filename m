Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fbT1d-0002kW-8l
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jul 2018 11:52:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fbT1X-0002ea-NB
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2018 11:51:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fbT1W-0000eH-L6
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2018 11:51:55 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:38328)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fbT1U-0000c9-3N; Fri, 06 Jul 2018 11:51:52 -0400
Received: by mail-qt0-x243.google.com with SMTP id c5-v6so10315635qth.5;
	Fri, 06 Jul 2018 08:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Qq4zW0j5/pH4zwxGo2ae9u1gX5pvBe1OqPDzfP89sAg=;
	b=kxHrnn70hEU+0Q+5JIgB8/Drdfx/tzBK3bp3tYC/MUVpAMvRgWlSt3bSOCxdHJT1lN
	RNBXJLgKk6+ArA96PmtVvIxSNDAtGEBjwWbXpYUuP4f6YemxwUxtiUf1RWmLMQEbr4TD
	yoDj6xNOkGXBx69nKe8oeeylVAmcB/wB/h+KNY0zof0JZC/3wDhwG1Z5oYnLXYR7kaOe
	QO4NNkjLBeGEC/69Nsho8vp7XewLtYR8VVlzlmQg2+qZFAM2H4K4Ie377uK8lZIq8LTF
	SRScfNnKLuTLRz3NsAXpitjNFmU4dDYLYh1idP8dLGyg1vq2CEqT6zjWB8TUhA76ozEZ
	WdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Qq4zW0j5/pH4zwxGo2ae9u1gX5pvBe1OqPDzfP89sAg=;
	b=gjUNANX5GKlsKXRUvKlxGOk8jMx08n1sh7+t3pgVec/sxRau6Om8kukd6SunEzbK6I
	7SuzFgkz2r0xT9c6o6ZiARhTOVWxQczpgIdAIsqPkl6WECWeVpaFDsiWKXnCkQlHE1Gx
	PQzMRSUwPIyUZyouQUF1Czhq1ec75JHfPwDgzZGxP0WwBAOJL1WLbc9fpSvWH49k/iNi
	LG5Kfq54dYHZNDdEkMzMuDcL39HESSGWA7zS075JunMDgqx+2Cl//sQffeMUd8/W5xUL
	XmdrQCjv4U5fya5F8YRYSD5qMzhgp1almxgPDovPnZ/E0kx4MJauxp3eHkAKgn/Lv9ly
	J7xQ==
X-Gm-Message-State: APt69E0siaXaz5wVtTI32JbLiJz8Ljcn9Z3CHOroC3frn7JmD2KcLuiO
	POEF6/aFQWgC91yVgEFXER8=
X-Google-Smtp-Source: AAOMgpd2n6a8CyGGW9FIC14MLBHqd6cYJil4PR/Gf791/XJFGlixh4+PrV46vqXsOFTbLBr13QQgLA==
X-Received: by 2002:aed:2317:: with SMTP id
	h23-v6mr9469242qtc.85.1530892311474; 
	Fri, 06 Jul 2018 08:51:51 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	140-v6sm5913691qkm.18.2018.07.06.08.51.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jul 2018 08:51:50 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Laurent Vivier <laurent@vivier.eu>,
	Riku Voipio <riku.voipio@iki.fi>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org
Date: Fri,  6 Jul 2018 12:51:26 -0300
Message-Id: <20180706155127.7483-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180706155127.7483-1-f4bug@amsat.org>
References: <20180706155127.7483-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH for-3.0 2/3] linux-user: Do not report
 "syscall not implemented" by default
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
X-List-Received-Date: Fri, 06 Jul 2018 15:51:58 -0000

This can still be reported using the "-d unimp" command line option.

Code change produced with:

  git ls-files linux-user | \
  xargs sed -i -E 's/fprintf\(stderr,\s?(".*not implemented\\n")\);/qemu_log_mask(LOG_UNIMP, \1);/g'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/cris/signal.c       | 4 ++--
 linux-user/microblaze/signal.c | 4 ++--
 linux-user/nios2/signal.c      | 2 +-
 linux-user/sparc/signal.c      | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux-user/cris/signal.c b/linux-user/cris/signal.c
index 0b405247cf..1e02194377 100644
--- a/linux-user/cris/signal.c
+++ b/linux-user/cris/signal.c
@@ -146,7 +146,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                      target_sigset_t *set, CPUCRISState *env)
 {
-    fprintf(stderr, "CRIS setup_rt_frame: not implemented\n");
+    qemu_log_mask(LOG_UNIMP, "setup_rt_frame: not implemented\n");
 }
 
 long do_sigreturn(CPUCRISState *env)
@@ -183,6 +183,6 @@ badframe:
 long do_rt_sigreturn(CPUCRISState *env)
 {
     trace_user_do_rt_sigreturn(env, 0);
-    fprintf(stderr, "CRIS do_rt_sigreturn: not implemented\n");
+    qemu_log_mask(LOG_UNIMP, "do_rt_sigreturn: not implemented\n");
     return -TARGET_ENOSYS;
 }
diff --git a/linux-user/microblaze/signal.c b/linux-user/microblaze/signal.c
index 712ee522b2..80950c2181 100644
--- a/linux-user/microblaze/signal.c
+++ b/linux-user/microblaze/signal.c
@@ -200,7 +200,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPUMBState *env)
 {
-    fprintf(stderr, "Microblaze setup_rt_frame: not implemented\n");
+    qemu_log_mask(LOG_UNIMP, "setup_rt_frame: not implemented\n");
 }
 
 long do_sigreturn(CPUMBState *env)
@@ -240,6 +240,6 @@ badframe:
 long do_rt_sigreturn(CPUMBState *env)
 {
     trace_user_do_rt_sigreturn(env, 0);
-    fprintf(stderr, "Microblaze do_rt_sigreturn: not implemented\n");
+    qemu_log_mask(LOG_UNIMP, "do_rt_sigreturn: not implemented\n");
     return -TARGET_ENOSYS;
 }
diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index 4985dc2212..7d535065ed 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -203,7 +203,7 @@ give_sigsegv:
 long do_sigreturn(CPUNios2State *env)
 {
     trace_user_do_sigreturn(env, 0);
-    fprintf(stderr, "do_sigreturn: not implemented\n");
+    qemu_log_mask(LOG_UNIMP, "do_sigreturn: not implemented\n");
     return -TARGET_ENOSYS;
 }
 
diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 55e9d6f9b2..b4c60aa446 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -278,7 +278,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPUSPARCState *env)
 {
-    fprintf(stderr, "setup_rt_frame: not implemented\n");
+    qemu_log_mask(LOG_UNIMP, "setup_rt_frame: not implemented\n");
 }
 
 long do_sigreturn(CPUSPARCState *env)
@@ -357,7 +357,7 @@ segv_and_exit:
 long do_rt_sigreturn(CPUSPARCState *env)
 {
     trace_user_do_rt_sigreturn(env, 0);
-    fprintf(stderr, "do_rt_sigreturn: not implemented\n");
+    qemu_log_mask(LOG_UNIMP, "do_rt_sigreturn: not implemented\n");
     return -TARGET_ENOSYS;
 }
 
-- 
2.18.0


