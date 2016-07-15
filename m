Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bO53d-0003DO-IB
	for mharc-qemu-trivial@gnu.org; Fri, 15 Jul 2016 11:29:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bO53b-0003Ac-03
	for qemu-trivial@nongnu.org; Fri, 15 Jul 2016 11:29:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bO53Z-0005j8-RE
	for qemu-trivial@nongnu.org; Fri, 15 Jul 2016 11:29:38 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:33383)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1bO53U-0005fh-FZ; Fri, 15 Jul 2016 11:29:32 -0400
Received: by mail-wm0-x241.google.com with SMTP id o80so2618777wme.0;
	Fri, 15 Jul 2016 08:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=8miTXhrmdsUQHTNQjYwQuqeQziYvcUvXokW9S/QlBG0=;
	b=KBuidwoaivU3TYlHhunEOEBC9duY2OBezeZdWZVv0b+2rFCmVLT1eFvQ5Ac8wblfK3
	QFsP0k8zf+S1CP6pzGtpdMHCkioizslTO+l+7lowGe5mRyFeuN8ewMwAMYPyE/CuRYMP
	lDWxeQoDv2bIx/qOPOp4WIcwz2cImvmsf0OqPDSpl9jo/52lZqaraZgJfwoYrGMWVP2N
	DGn7KpKtdgmS7JVLH6MpLoVDG2pSoo55gwvmFASlRLa3IbdlpKkLdFeBJ1WA/SPOE1TI
	1sXMoBq0hxuR6PuZDYBRGPnHJ7QUNVeB/JoG+CKObt6gci3T3xDF4nCi//wr/nbAJCtd
	R94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=8miTXhrmdsUQHTNQjYwQuqeQziYvcUvXokW9S/QlBG0=;
	b=aLwiggLg8QNmqyX81iGLZSNOR4OrqxluloroOsggs4Q6u369LeCO3YsMG0K/q4oDhF
	UeaRgRCxnjBg+03Xw7/VI8gqHRyWRQvg0qQPjAl5cOg87Np5glV4onKHYzl6vmWYnok0
	3hd8n2c5jC1lVjQlEdE0Ewll5qT1qqqjjWYN5AhrUnD64IVh9H7EW6Deq1DWOxD91v6g
	oCVW/4RSPyLpMnr1qIXUw8aYkq7UFUKM852XY59uLY9Y4iTmgFQNAheZOlg4ZjmHlCZB
	vRhNwW+d/X7B1QCZR6OXsTTnJ9x0F90cts/xZrXEbXJM8YP50UK6BG5NtxOGyOy9Ysd2
	uSBA==
X-Gm-Message-State: ALyK8tI224d1Br7jpO7A+S+/2uDG0PhoHeJbPrM6J2gMsxk5vBZYz3qwTmA+3hsmNBbwzg==
X-Received: by 10.194.169.234 with SMTP id ah10mr1341552wjc.58.1468596571574; 
	Fri, 15 Jul 2016 08:29:31 -0700 (PDT)
Received: from donizetti.localdomain
	(host253-183-static.123-81-b.business.telecomitalia.it.
	[81.123.183.253])
	by smtp.gmail.com with ESMTPSA id g67sm6512482wme.5.2016.07.15.08.29.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jul 2016 08:29:30 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Fri, 15 Jul 2016 17:29:22 +0200
Message-Id: <1468596562-28609-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Subject: [Qemu-trivial] [PATCH] target-m68k: fix get_mac_extf helper
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
X-List-Received-Date: Fri, 15 Jul 2016 15:29:40 -0000

val is assigned twice; the second one should be combined with "|".
Reported by Coverity.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target-m68k/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-m68k/helper.c b/target-m68k/helper.c
index f52d0e3..89bbe6d 100644
--- a/target-m68k/helper.c
+++ b/target-m68k/helper.c
@@ -812,7 +812,7 @@ uint32_t HELPER(get_mac_extf)(CPUM68KState *env, uint32_t acc)
 {
     uint32_t val;
     val = env->macc[acc] & 0x00ff;
-    val = (env->macc[acc] >> 32) & 0xff00;
+    val |= (env->macc[acc] >> 32) & 0xff00;
     val |= (env->macc[acc + 1] << 16) & 0x00ff0000;
     val |= (env->macc[acc + 1] >> 16) & 0xff000000;
     return val;
-- 
2.7.4


