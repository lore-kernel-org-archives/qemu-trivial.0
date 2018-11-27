Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRaAU-0006Wa-Ti
	for mharc-qemu-trivial@gnu.org; Tue, 27 Nov 2018 05:00:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gRaAR-0006TW-25
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 05:00:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gRaAL-0006kF-B2
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 05:00:30 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:44287)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liq3ea@gmail.com>)
	id 1gRaAJ-0006i0-BN; Tue, 27 Nov 2018 05:00:25 -0500
Received: by mail-pf1-x444.google.com with SMTP id u6so8098739pfh.11;
	Tue, 27 Nov 2018 02:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=v0/hZ6InXhyc8TcQhqhHlDtVA7jepcx+4JRLBWUmHpE=;
	b=MJNzE1r2Gb3FiwgaufLbUriOb8sKTEKdFPOtiImU/lnnkxe/GArUCHfiCGdzrxRWXE
	K5ML+2i26Gr6OHTvjMEX9DRWampxdK//agMq0oal+XpkYR1W2GFiVo4kkX8zLYIvzFil
	WYd5MwCX0+gaJdMD44pN4sGkT2pBkX4zole9KiNL0W3d5CVwDM0Il50LPXktJUYtB5IC
	arQiixtT8WjVCbuqwAbukjipygULpsfRWC1g6NYLzige7W1TgiF6GgPZUqKLS16+RfMH
	SMLAoCToxHQB/xGlTum3fVFF2a6sWK2PwlPMYYA324kjEpupvrAAIV6nXxREyXGV97bv
	4esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=v0/hZ6InXhyc8TcQhqhHlDtVA7jepcx+4JRLBWUmHpE=;
	b=T2rPNaG7uKIPoa9LbsY/AVge2amt3vQfPhumuMzOoSbxetMXLau0vpvl4KvMLWVylG
	wgQhOysxY8mXElhgYEsQWitCBYUKqXpCJfvQa+WBe7V6/N4XM8qdp9Ejw4vQeNnoj3nn
	5VgHE+01HNGg0vzJYGfxnyymAxUZ0qXtmzWZB7Qd/mike4hkfNzpotAcxX1fS618HpZY
	czzQ4Caspl+AZBFO8VCrCh+hsU8EQv/voG4zqtrGhLbWVqgdpdkF5su2bVaGDbuTkr3Q
	f8sv5uJGivld6io/PllPSGU6fHGjR38S1WPIanxfhzxgtVAv9Lcx0NpTZ/D6vx31kKF3
	RN2w==
X-Gm-Message-State: AA+aEWYGpPXy4lO86GKaQHUbnY4v4xG4ultOPnh/UGAA+xLMg1X9a3kw
	phwkNyZySjH8oeDTMTLawGI=
X-Google-Smtp-Source: AJdET5flYx93Eu1COdCelkzkaLrir88RXsTV0OxQCUKA6PZj1gMh1+atxlfKdP8U/wOi+mx9BkkXWw==
X-Received: by 2002:a63:dd55:: with SMTP id g21mr27986880pgj.86.1543312818398; 
	Tue, 27 Nov 2018 02:00:18 -0800 (PST)
Received: from localhost.localdomain.localdomain ([103.129.255.252])
	by smtp.gmail.com with ESMTPSA id
	d65-v6sm4279739pfc.144.2018.11.27.02.00.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Nov 2018 02:00:17 -0800 (PST)
From: Li Qiang <liq3ea@gmail.com>
To: rth@twiddle.net, ehabkost@redhat.com, laurent@vivier.eu,
	alex.bennee@linaro.org, philmd@redhat.com
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Li Qiang <liq3ea@gmail.com>
Date: Tue, 27 Nov 2018 02:00:12 -0800
Message-Id: <1543312812-2929-1-git-send-email-liq3ea@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-trivial] [PATCH v2] target: hax: fix errors in comment
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
X-List-Received-Date: Tue, 27 Nov 2018 10:00:32 -0000

Cc: qemu-trivial@nongnu.org

Signed-off-by: Li Qiang <liq3ea@gmail.com>
---
 target/i386/hax-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
index 502ce6f0af..b978a9b821 100644
--- a/target/i386/hax-all.c
+++ b/target/i386/hax-all.c
@@ -205,7 +205,7 @@ int hax_vcpu_destroy(CPUState *cpu)
     }
 
     /*
-     * 1. The hax_tunnel is also destroied when vcpu destroy
+     * 1. The hax_tunnel is also destroyed when vcpu is destroyed
      * 2. close fd will cause hax module vcpu be cleaned
      */
     hax_close_fd(vcpu->fd);
-- 
2.11.0


