Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFhbW-0005bs-6V
	for mharc-qemu-trivial@gnu.org; Mon, 26 Jan 2015 06:13:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YFhbL-0005Hp-8m
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 06:13:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YFhbC-0001rb-79
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 06:13:03 -0500
Received: from mail-wg0-x232.google.com ([2a00:1450:400c:c00::232]:48380)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YFhat-0001RK-CL; Mon, 26 Jan 2015 06:12:35 -0500
Received: by mail-wg0-f50.google.com with SMTP id b13so8307758wgh.9;
	Mon, 26 Jan 2015 03:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=T+y1dR/Ftb9oD+lJ20KbKiwQRv+hAdSa8+ZFysRuD8k=;
	b=Msnn8i+TuLAxwBM00rQ6xSGRj5ajW9dt4a5wtep6Mw3eICLU4jq9wR8l5kqhZloTjS
	EuV1YdGXUXUqwexcy9+BSL1o9874jRrGCkp3vnh4YAO8OoNDRoSwdXDll3FhNG3bfNEx
	332CWK5FWzV22OvycnXjP3NsrK1CaAeZBr0f7miasPGKhIUVbqdMmJWGZi23Ylm584HV
	S3kzT3wchxRdsCsqm5OxmqoOaxkxkme8LD4OfESNce8zoCcAhXuhDGNVAn3ptWXT94Lv
	shJEnmLwbbWCp3VZhHdpB7II/xRU7z6KVu3B1MTxx+cLaBYDvjSPvjbm0HOaefXn/dT/
	mByA==
X-Received: by 10.194.19.197 with SMTP id h5mr24369152wje.109.1422270754863;
	Mon, 26 Jan 2015 03:12:34 -0800 (PST)
Received: from playground.station (net-2-35-193-154.cust.vodafonedsl.it.
	[2.35.193.154])
	by mx.google.com with ESMTPSA id fp2sm13476390wib.8.2015.01.26.03.12.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jan 2015 03:12:34 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Jan 2015 12:12:21 +0100
Message-Id: <1422270747-23994-2-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>
References: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::232
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Subject: [Qemu-trivial] [PATCH 1/7] cpu-exec: drop dead assignment
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
X-List-Received-Date: Mon, 26 Jan 2015 11:13:12 -0000

All uses of TB inside cpu_exec are dominated by "tb = tb_find_fast(env)",
and there are no uses after the switch statement.  So the assignment
is dead, as reported by Coverity.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 cpu-exec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/cpu-exec.c b/cpu-exec.c
index a4f0eff..7aab86d 100644
--- a/cpu-exec.c
+++ b/cpu-exec.c
@@ -497,7 +497,6 @@ int cpu_exec(CPUArchState *env)
                          * interrupt_request) which we will handle
                          * next time around the loop.
                          */
-                        tb = (TranslationBlock *)(next_tb & ~TB_EXIT_MASK);
                         next_tb = 0;
                         break;
                     case TB_EXIT_ICOUNT_EXPIRED:
-- 
1.8.3.1



