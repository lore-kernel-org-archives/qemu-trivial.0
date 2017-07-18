Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLss-00024b-Km
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:21:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60550)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLso-00020w-IB
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsn-00017m-Qc
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:22 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:36387)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsn-00016t-Mt; Tue, 18 Jul 2017 02:21:21 -0400
Received: by mail-qk0-x244.google.com with SMTP id d136so1326928qkg.3;
	Mon, 17 Jul 2017 23:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Lq2u0t/8zST3wOUNainN0Zty5exQjk2xsW18OEKJWu8=;
	b=JvYx5gTTJ7QlNC9ePWEbcs06FvCBMjsRi7vi7T4cL6F1QiSc5c6AWgK8WI/XaEVOhV
	UU74uWUZ7MLwHcARPBrUGOqtoXpo3oQxPqLqstw8iSm80FCkpBnUDTwB7kDS4HDouQMC
	1rVFaiWXHlb9TY11gCmSzH+cHvHi/67tn++mbnYLTsh6WxKN8FB1hMinmjUiOnS1RBxx
	iBnhKl6tzrxjIvajxJtAwsuyN2Kdf12E0V/dxvUOdgV4+W/p+roJqocqQ/4iTJzBJS+5
	62UOQNcMlumy/skOg727M0RHwVyx+rstg6y6FSDmeYv8eeQBfpgrH3DXVV3QBux6aMhY
	qP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Lq2u0t/8zST3wOUNainN0Zty5exQjk2xsW18OEKJWu8=;
	b=qKY6rKiQH+6lFH2aFUEDsaNB7JzHpFUmCrrYhppeMw8r3nVHQ1n5AkmQagDBQHbdL3
	eAqbxFqKIiZFs/FnmtN/08Q/Yqhkmef0FTmXZxvPRDCFbuXJhDj3N7CvhF+YqLUhLGJb
	y2cLAV+b1rmbEV++QHrPY3FDFPMbCZWmSFLYl/Eu60zXRBdCVfsYJZEVe58ebAc93vxc
	e7tiR2pXLtlKDTXn7c6orXqMeW+O4ObCumiK/PbxjzQZbUBxOo8RSLyvK2Fx9SckbDnG
	R1cUwGMCGh9RAZtDGYw5agM1W2GqNpqiLUOqEFizydf2xwxcbNGQALExN+M5zt1qsE9Y
	mvdA==
X-Gm-Message-State: AIVw112faclRa5+qMZTeI0JXYwetYRE6dN1AityNRbFZc4OAo0rxao/C
	oku7Nh3JCUdiJDV8uQkEYA==
X-Received: by 10.55.140.71 with SMTP id o68mr131495qkd.18.1500358881145;
	Mon, 17 Jul 2017 23:21:21 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.21.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:21:20 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 18 Jul 2017 03:09:55 -0300
Message-Id: <20170718061005.29518-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 19/29] disas: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:21:25 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

There is no entry for this file in MAINTAINERS, should it go under TCG/Overall?

 disas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas.c b/disas.c
index d335c55bbf..8b59448286 100644
--- a/disas.c
+++ b/disas.c
@@ -151,7 +151,7 @@ static int print_insn_objdump(bfd_vma pc, disassemble_info *info,
     info->read_memory_func(pc, buf, n, info);
 
     for (i = 0; i < n; ++i) {
-        if (i % 32 == 0) {
+        if (QEMU_IS_ALIGNED(i, 32)) {
             info->fprintf_func(info->stream, "\n%s: ", prefix);
         }
         info->fprintf_func(info->stream, "%02x", buf[i]);
-- 
2.13.2


