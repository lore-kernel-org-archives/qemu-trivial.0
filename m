Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fbT1f-0002mN-Aa
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jul 2018 11:52:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fbT1c-0002jy-SW
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2018 11:52:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fbT1b-0000mO-TX
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2018 11:52:00 -0400
Received: from mail-qt0-x22f.google.com ([2607:f8b0:400d:c0d::22f]:37718)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fbT1X-0000fO-Bc; Fri, 06 Jul 2018 11:51:55 -0400
Received: by mail-qt0-x22f.google.com with SMTP id a18-v6so10321827qtj.4;
	Fri, 06 Jul 2018 08:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mM7lbfYF2Xdi5f/oKpXZNYIRgi91L/aGcXQSd6e2nIo=;
	b=RsxkcjhsqiJXtJl5KFEsZ6Ac7lWwUI4XOdCd1pLWmBBpnknxWbMauAqq0zaX+5GoAG
	M1hIKkXi2+kS+6z9bvQIDjjBPj5Ial5xQFrEckTcdCJh6HVPU/ExM4s+nJBSrJkxEHbi
	UK9BnuVNcHFoE7Yv9u71Hg/aGaQNlZwekzHwM3G+8qe2Gz9fQ5TgK9XR8NLlJqLjnc4T
	GZ6B9Gm7I+Fau6xP+NmZcooJzWT/ftFk1DR6cBFi2X+OA9iIrAvyp9VRQVrkTuwol9FA
	GRM6JzFoWx3WSv7LkYb4WKEb63Je5hLqRahcu98Mb8+W3YCpfxS9F3aWkmjnDW+Kocv4
	RkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=mM7lbfYF2Xdi5f/oKpXZNYIRgi91L/aGcXQSd6e2nIo=;
	b=TbOnekmRqWCsSJtQSGTZfq70BY3DqpfK3cadb73+6n95SC7GeEXMkQ3w2NDeo4WHuj
	nNmTv+Gu2GdEp+hDBk96D4w0Swx4sxKamBBMcgXoxJkqw0U3ITu3N76YlLLsktSIS856
	EkcZO0jHfOT4jFuyG2EVCOOZHk94oomvfxrNGJ8uHmoHjr5/eebpXZROpeg0OvhbTSMb
	cfnGUCFeWVN1x5VlqehkeSwIwc23TZ+JoXGhUmaadd8iQxWSV/5i11PLfwpoqZN3xIVV
	a4MNdCjJ8W1wvlmk57vXcwxzMwZMYe3M7g38qkDmd1eaOWmwxhvQWyiTA/vz2yGlyYOx
	cNLQ==
X-Gm-Message-State: APt69E2aCAqCEod9VJFgeS51OnUKYoCk9oY3SEJmNQrdJUPEAT2077du
	2L428fIIklkd4XSK3GQ3dqY=
X-Google-Smtp-Source: AAOMgpclBufpIwiVAuJP8o2eLUf4h7C4J2s8Yis81JG5YupnJfbVfhgUAE7p9CouAbce/rDlnTfNew==
X-Received: by 2002:ac8:709:: with SMTP id g9-v6mr9836926qth.110.1530892314303;
	Fri, 06 Jul 2018 08:51:54 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	140-v6sm5913691qkm.18.2018.07.06.08.51.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jul 2018 08:51:53 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Laurent Vivier <laurent@vivier.eu>,
	Riku Voipio <riku.voipio@iki.fi>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org
Date: Fri,  6 Jul 2018 12:51:27 -0300
Message-Id: <20180706155127.7483-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180706155127.7483-1-f4bug@amsat.org>
References: <20180706155127.7483-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22f
Subject: [Qemu-trivial] [PATCH for-3.0 3/3] linux-user: Report error message
 on stderr, rather than stdout
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
X-List-Received-Date: Fri, 06 Jul 2018 15:52:02 -0000

Code change produced with:

  git ls-files linux-user | \
  xargs sed -i -E 's/(\s+)printf\s*\(("Unhandled.*)\);/\1fprintf(stderr, \2);/g'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/alpha/cpu_loop.c      | 2 +-
 linux-user/cris/cpu_loop.c       | 2 +-
 linux-user/microblaze/cpu_loop.c | 6 +++---
 linux-user/sh4/cpu_loop.c        | 2 +-
 linux-user/sparc/cpu_loop.c      | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index b87fcaea87..c1a98c8cbf 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -196,7 +196,7 @@ void cpu_loop(CPUAlphaState *env)
             arch_interrupt = false;
             break;
         default:
-            printf ("Unhandled trap: 0x%x\n", trapnr);
+            fprintf(stderr, "Unhandled trap: 0x%x\n", trapnr);
             cpu_dump_state(cs, stderr, fprintf, 0);
             exit(EXIT_FAILURE);
         }
diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
index 1c5eca9f83..37bdcfa8cc 100644
--- a/linux-user/cris/cpu_loop.c
+++ b/linux-user/cris/cpu_loop.c
@@ -81,7 +81,7 @@ void cpu_loop(CPUCRISState *env)
             cpu_exec_step_atomic(cs);
             break;
         default:
-            printf ("Unhandled trap: 0x%x\n", trapnr);
+            fprintf(stderr, "Unhandled trap: 0x%x\n", trapnr);
             cpu_dump_state(cs, stderr, fprintf, 0);
             exit(EXIT_FAILURE);
         }
diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index 5af12d5b21..2af93eb39a 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -105,8 +105,8 @@ void cpu_loop(CPUMBState *env)
                     queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
                     break;
                 default:
-                    printf("Unhandled hw-exception: 0x%" PRIx64 "\n",
-                           env->sregs[SR_ESR] & ESR_EC_MASK);
+                    fprintf(stderr, "Unhandled hw-exception: 0x%" PRIx64 "\n",
+                            env->sregs[SR_ESR] & ESR_EC_MASK);
                     cpu_dump_state(cs, stderr, fprintf, 0);
                     exit(EXIT_FAILURE);
                     break;
@@ -130,7 +130,7 @@ void cpu_loop(CPUMBState *env)
             cpu_exec_step_atomic(cs);
             break;
         default:
-            printf ("Unhandled trap: 0x%x\n", trapnr);
+            fprintf(stderr, "Unhandled trap: 0x%x\n", trapnr);
             cpu_dump_state(cs, stderr, fprintf, 0);
             exit(EXIT_FAILURE);
         }
diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index 418833ea25..fdd348170b 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -84,7 +84,7 @@ void cpu_loop(CPUSH4State *env)
             arch_interrupt = false;
             break;
         default:
-            printf ("Unhandled trap: 0x%x\n", trapnr);
+            fprintf(stderr, "Unhandled trap: 0x%x\n", trapnr);
             cpu_dump_state(cs, stderr, fprintf, 0);
             exit(EXIT_FAILURE);
         }
diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 7c4796ca23..91f714afc6 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -285,7 +285,7 @@ void cpu_loop (CPUSPARCState *env)
             cpu_exec_step_atomic(cs);
             break;
         default:
-            printf ("Unhandled trap: 0x%x\n", trapnr);
+            fprintf(stderr, "Unhandled trap: 0x%x\n", trapnr);
             cpu_dump_state(cs, stderr, fprintf, 0);
             exit(EXIT_FAILURE);
         }
-- 
2.18.0


