Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQ0ml-000174-A1
	for mharc-qemu-trivial@gnu.org; Fri, 27 May 2011 13:25:19 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QQ0mk-000140-6C
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 13:25:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QQ0mj-0003iJ-EG
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 13:25:18 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:45883)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1QQ0mh-0003aF-Kj; Fri, 27 May 2011 13:25:15 -0400
Received: by mail-qw0-f45.google.com with SMTP id 8so1166413qwj.4
	for <multiple recipients>; Fri, 27 May 2011 10:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=8DX8YzSZckEsxVuS4ORmJ+yUDG6Cmk6cZNYeyI6BItY=;
	b=jLD9FNe7JgaAO64PlB3LKZvyG7lbd/uO6XvB8Drnrzo04Xcnt7oug0o8P79PtHTdH5
	2V4eSohc01/C1XI8omgrQSvq6rSNHcUCc0kzgipfi3YXiHhhYcmXKtAPkw9puVyHB5Vk
	56AeObCJR2FNzJs6w8+JDpLj5m5i374cNLnJ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	b=RaNbsvsfZpHjriodFtGmqUoC2ndIhn7vRnxHbNOVn2PCQRbq21mJm26ixEwCwDyTMF
	G6dbVNbVHnWgvwNd0scMtVZZsPhELKpMrYbU6FziEZzYZQlVrthAIMRLLd3a5YFPRuLg
	NfLz6n0zrEquxyh8lPGyRYjkX9n3e/9/+pEAM=
Received: by 10.229.67.142 with SMTP id r14mr1749985qci.209.1306517115455;
	Fri, 27 May 2011 10:25:15 -0700 (PDT)
Received: from localhost.localdomain (modemcable055.201-23-96.mc.videotron.ca
	[96.23.201.55])
	by mx.google.com with ESMTPS id e28sm1198569qck.30.2011.05.27.10.25.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 10:25:14 -0700 (PDT)
From: Alexandre Raymond <cerbere@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 May 2011 13:22:30 -0400
Message-Id: <1306516951-31105-6-git-send-email-cerbere@gmail.com>
X-Mailer: git-send-email 1.7.5
In-Reply-To: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
References: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, Alexandre Raymond <cerbere@gmail.com>
Subject: [Qemu-trivial] [PATCH 5/6] Remove warning in printf due to type
	mismatch
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
X-List-Received-Date: Fri, 27 May 2011 17:25:19 -0000

----8<----
qemu/target-lm32/translate.c: In function ‘gen_intermediate_code_internal’:
qemu/target-lm32/translate.c:1135: warning: format ‘%zd’ expects type ‘signed size_t’, but argument 4 has type ‘int’
----8<----

Both gen_opc_ptr and gen_opc_buf are "uint16_t *", so a simple '%d' should
be able to describe their relative difference.

Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
---
 target-lm32/translate.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/target-lm32/translate.c b/target-lm32/translate.c
index eb21158..0f69f27 100644
--- a/target-lm32/translate.c
+++ b/target-lm32/translate.c
@@ -1132,7 +1132,7 @@ static void gen_intermediate_code_internal(CPUState *env,
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)) {
         qemu_log("\n");
         log_target_disas(pc_start, dc->pc - pc_start, 0);
-        qemu_log("\nisize=%d osize=%zd\n",
+        qemu_log("\nisize=%d osize=%d\n",
             dc->pc - pc_start, gen_opc_ptr - gen_opc_buf);
     }
 #endif
-- 
1.7.5


