Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLse-0001q8-Cv
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:21:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsa-0001n3-Vj
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsa-0000w1-3k
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:08 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35766)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsZ-0000vR-Vy; Tue, 18 Jul 2017 02:21:08 -0400
Received: by mail-qt0-x242.google.com with SMTP id p25so253587qtp.2;
	Mon, 17 Jul 2017 23:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Os8K3RuD0Sg/Km1YQjYsFxtDsV1Bn2R66uZ3QaG3nR0=;
	b=psNGYH43Lsf10AlzbxZE4PUI7jVRlYFL3qb+MtVgZ1vurhGdLahuEsWb642vVvaslW
	5jsh4S0ohQMw6IEwNI7aM5L/joa64X+b4Zn3GZAuV94bRkpoW9Z89aDe0bAXTSxqq2yI
	xdrx0n48SuG/y3PWkuxZU6WpXw0krKcAUAY+hmAoZv5quyw99Nbo/pK5Kww0ZQmcUoBf
	/vmc51d+US7DXw7mv7RD4Lp+hi6c/VMOGAyCofPN4cnVM2P5EClgaGjTg8cOMyZwJKAw
	cQQtb3corYZlVYe1i41BnNYxHuhvAVKbcDEOf3Gz6GeMk2MQnod+3vB7DVGM2ZGSO5Z1
	g1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Os8K3RuD0Sg/Km1YQjYsFxtDsV1Bn2R66uZ3QaG3nR0=;
	b=jDZgsgtY7gSI5C0BUw42an9spvGFbdXMvOVHSmDKgnkxSvESUKOOL8YlEOLj/6KN7s
	+ka+tF56LEi9+Q6kdtz5SupFzIbtHN+R3czSl6bLHd3jGEF/m6hnJNZQVOhZ775i9ldf
	sD0C6LAAG45Baon6TKkedC7H28nBpdmolQ57c3NBagbx90UuN+vHPuPaPLHwnGeozCkD
	/YJj9BopXoxr1X3W+FPaXl/WwXUs5ifeHZw8Pu/FePmj0U4be1GqkFKioypnjLa+y7qA
	cHYQQoYrD+/ElpxPm7IdnT3wD3DDW1PAWBVbLemu5889XeCeiO9viGmAn8pDaC1iu7X+
	GeNg==
X-Gm-Message-State: AIVw113KHvxd5c1l0yyQRkyxot5VjX5bbFXIcHDdNuEnmoHrWgJRh76l
	9iUvoIi/FS00aFXzSzSSsQ==
X-Received: by 10.237.51.70 with SMTP id u64mr13773qtd.211.1500358867342;
	Mon, 17 Jul 2017 23:21:07 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.21.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:21:06 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:09:50 -0300
Message-Id: <20170718061005.29518-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 14/29] cris: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:21:10 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/cris/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 0ee05ca02d..46afdff145 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3332,14 +3332,14 @@ void cris_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
 
     for (i = 0; i < 16; i++) {
         cpu_fprintf(f, "%s=%8.8x ", regnames[i], env->regs[i]);
-        if ((i + 1) % 4 == 0) {
+        if (QEMU_IS_ALIGNED(i + 1, 4)) {
             cpu_fprintf(f, "\n");
         }
     }
     cpu_fprintf(f, "\nspecial regs:\n");
     for (i = 0; i < 16; i++) {
         cpu_fprintf(f, "%s=%8.8x ", pregnames[i], env->pregs[i]);
-        if ((i + 1) % 4 == 0) {
+        if (QEMU_IS_ALIGNED(i + 1, 4)) {
             cpu_fprintf(f, "\n");
         }
     }
@@ -3350,7 +3350,7 @@ void cris_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
             for (i = 0; i < 16; i++) {
                 cpu_fprintf(f, "s%2.2d=%8.8x ",
                         i, env->sregs[srs][i]);
-                if ((i + 1) % 4 == 0) {
+                if (QEMU_IS_ALIGNED(i + 1, 4)) {
                     cpu_fprintf(f, "\n");
                 }
             }
-- 
2.13.2


