Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gf98X-0001DW-3L
	for mharc-qemu-trivial@gnu.org; Thu, 03 Jan 2019 14:58:37 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jon.diekema@gmail.com>) id 1gf98U-0001DJ-Qm
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2019 14:58:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jon.diekema@gmail.com>) id 1gf98Q-0002ee-PJ
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2019 14:58:34 -0500
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:43494)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jon.diekema@gmail.com>)
	id 1gf98Q-0002eS-J6
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2019 14:58:30 -0500
Received: by mail-vs1-xe2e.google.com with SMTP id x1so21408559vsc.10
	for <qemu-trivial@nongnu.org>; Thu, 03 Jan 2019 11:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:from:date:subject:to;
	bh=HjxHS80aC4HyPnmeSwPV9bvfJe6RWyYaxVQSULN5OQI=;
	b=h9ktXAzPvY892yUy6+4bwIz2dN+XwYJOKq7ElANCLV5csMunH7gmxo6o6ABLnmLb4g
	SaeJYBYZ+/K7SfsUFKSLZRkKMsXA2SVnFhABfIIKHmH1slza4XEv0smjOfgRKFyB4PVG
	3HWzZ82pa3znFmlbSpMSR0jRLH4ZKgiKfE9qFto+EBteTNA+NDZJjnQomF6tXXRnvJ8V
	PLfMV9EqTKyrX1iqM5JFBHU+bgTrClrvpwxwHDN//KI2TRW6BsSP2bfUcTTlapRvRHNN
	24OL1tcaJs2ez4u0qtzyNj41MokI0gq1wmoFHP5wgA5Wqt0Kuay9h4pIHpDDBsn1CIIj
	0YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:from:date:subject:to;
	bh=HjxHS80aC4HyPnmeSwPV9bvfJe6RWyYaxVQSULN5OQI=;
	b=gaVl+p7KUzPY6V7NXn3iYD/C8FQJUX3gac5/VdaEW4CZpx5jzjnusEGdk+IxADiHrJ
	zAoKthkWinXMsDd27LNGmSn5qK7/2s+tLn/y5vPWfE069nkEcTfwtIBYzCwfVQuo3wws
	nzg5xxF6Vjnqp1SP1Ns2P2Aepkv4zEMREl/37jLBRBpyV6a6Ml9at87143aN1tdRH/Qt
	dzmCWvYZELRySykqse3WOijlp9jI5Q0xbLrfxshJ4MRacgOanlSTLuHTS1b733gA2pIm
	eEEMpRXZ/r/gDI9P7s48CQi55AeHUUJJjZWn2nS5vJRWAAADtBN5lPuyOj5uPitEhAtu
	d+pg==
X-Gm-Message-State: AA+aEWZVuDCog413OICIgp5GiIW7k9sg+QLEaRoxlzq59doM5/Y2NNP6
	QnaZwJowoxt0tqIv8VqVhYvRn8p/
X-Google-Smtp-Source: AFSGD/V7RBai+QXrs7Tdy37Aa7fSM9EvciDDW/M18kIdIIc9s91us4xU3PCWEsmsOG66A1wmVb+JwA==
X-Received: by 2002:a67:820f:: with SMTP id e15mr19827636vsd.156.1546545509674;
	Thu, 03 Jan 2019 11:58:29 -0800 (PST)
Received: from localhost.localdomain (c-68-61-44-136.hsd1.mi.comcast.net.
	[68.61.44.136]) by smtp.gmail.com with ESMTPSA id
	w83sm16068518vke.22.2019.01.03.11.58.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 03 Jan 2019 11:58:29 -0800 (PST)
Message-ID: <5c2e6965.1c69fb81.b832c.13ee@mx.google.com>
From: Jon Diekema <jon.diekema@gmail.com>
X-Google-Original-From: "Jon Diekema" <diekemjm@localhost.localdomain>
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 03 Jan 2019 14:58:27 -0500
Date: Thu, 03 Jan 2019 14:58:27 -0500
To: <qemu-trivial@nongnu.org>,<jon.diekema@gmail.com>
X-Mailer: mail (GNU Mailutils 3.4)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::e2e
Subject: [Qemu-trivial] Whitespace cleanup: target/ppc/translate_init.inc.c
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
X-List-Received-Date: Thu, 03 Jan 2019 19:58:35 -0000

From: Jon Diekema <jon.diekema@gmail.com>
Date: Tue, 25 Dec 2018 04:03:04 -0500
Subject: Whitespace cleanup: target/ppc/translate_init.inc.c

Signed-off-by: Jon Diekema <jon.diekema@gmail.com>
---
 target/ppc/translate_init.inc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.inc.c
index c971a5faf7..b5f4c9bd55 100644
--- a/target/ppc/translate_init.inc.c
+++ b/target/ppc/translate_init.inc.c
@@ -5237,7 +5237,7 @@ static void init_proc_601(CPUPPCState *env)
                  0x00000000);
     /* Memory management */
     init_excp_601(env);
-    /* XXX: beware that dcache line size is 64 
+    /* XXX: beware that dcache line size is 64
      *      but dcbz uses 32 bytes "sectors"
      * XXX: this breaks clcs instruction !
      */
@@ -10485,7 +10485,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_initialize = ppc_translate_init;
 #endif
     cc->disas_set_info = ppc_disas_set_info;
- 
+
     dc->fw_name = "PowerPC,UNKNOWN";
 }
 
-- 
2.20.1.3.gf17a2b179


