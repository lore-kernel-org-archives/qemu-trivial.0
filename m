Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxxn-0004jK-7e
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxl-0004hM-Nn
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxl-00041m-1W
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:25 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37982)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxh-0003wy-5W; Fri, 28 Jul 2017 01:37:21 -0400
Received: by mail-qk0-x244.google.com with SMTP id v76so8644364qka.5;
	Thu, 27 Jul 2017 22:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AAoSIQm9Z84TrEUJ9j5qO6hVL88y4hGtgHkxD60IdTU=;
	b=Vx3Q6Oj9RMB2zv9Doj/S1wurfDQHTTs7CU6A38V1KGdT/bry/Z1yFvfrGEyXTr88jq
	ZwHKC4K8uswMRDYJh/AGBUGc1NTx7mhbRj/RkpNymZrI6szHgocwzzn8C2LBAhGOOXGB
	vmLTZHQxuStRz2gzknLqNemA3ebILtDU9STOgftpmZgxSmyUJCmlPAqbhsKszHFpBbxM
	pLhUYcGAA/WiTkBmf84HkSRzTf5z+Iz9LWta4XlRtpAN+cpoCr9Z8NiQZmMP41EdJPvK
	LBgpFAzFNAUXmsuPnGBk3iVvj31mSwloVUcNWYLupxljiC/9No5kkm2/RnwrHW5BPUnT
	Z/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=AAoSIQm9Z84TrEUJ9j5qO6hVL88y4hGtgHkxD60IdTU=;
	b=D4pM3LI+BN86SqdtrBcS5lpIAPwxESGfaoNMFl5Hf7OLQvZITSMiR0gOaFpqcqzTry
	S24FAWDz6pMOQX2kQ4AcRldE1ND0tHLNQmNLuBKr14sm6EWgb+3vAT9GqqIH8RsK5QhE
	db6Crs4qN0E2rnhs5rXlplO0KJ2V8wNnevPODJi73nYySi2LQ9ncjU6UiOkLMgnF3M4O
	qbrUb/RYvpO+nZXcmYGqZKQJOvjNg+cByqDCPktnpzKPUYd9UTY4GCYeHjbkskMIyacj
	fcv3NZHb7MFaOgvXVps09SKZory+R4jiPkNqjdQ/R3A2+UOnsk33tokvg2QYuVxNZNy7
	YjWg==
X-Gm-Message-State: AIVw1103K0UeS4ysBGyl1IR4dkSkB7G40H/BDaq0YfUT0z4P4EFX0ODO
	w73Ud+034tD7og==
X-Received: by 10.55.20.150 with SMTP id 22mr8848521qku.319.1501220240755;
	Thu, 27 Jul 2017 22:37:20 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:20 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Aurelien Jarno <aurelien@aurel32.net>, Yongbok Kim <yongbok.kim@imgtec.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:48 -0300
Message-Id: <20170728053610.15770-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 25/47] MAINTAINERS: add missing MIPS entry
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:26 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa6b0d189a..7354afb9f4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -182,6 +182,7 @@ F: include/hw/intc/mips_gic.h
 F: include/hw/timer/mips_gictimer.h
 F: tests/tcg/mips/
 F: disas/mips.c
+F: default-configs/mips*-softmmu.mak
 
 Moxie
 M: Anthony Green <green@moxielogic.com>
-- 
2.13.3


