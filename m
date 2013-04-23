Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UUgpd-0003hK-2K
	for mharc-qemu-trivial@gnu.org; Tue, 23 Apr 2013 13:16:41 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel@kerneis.info>) id 1UUgpZ-0003bd-6C
	for qemu-trivial@nongnu.org; Tue, 23 Apr 2013 13:16:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gabriel@kerneis.info>) id 1UUgpV-0003If-1u
	for qemu-trivial@nongnu.org; Tue, 23 Apr 2013 13:16:37 -0400
Received: from witko.kerneis.info ([213.186.56.95]:58924)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel@kerneis.info>)
	id 1UUgpI-0003Dl-EU; Tue, 23 Apr 2013 13:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kerneis.info;
	s=witko-rsa1; h=Message-Id:Date:Subject:Cc:To:From;
	bh=dNlCaWWzrBNUwCifkG6S931xkivjGv4Wv0ksY5FT7B4=; 
	b=yf7XjXvym7DrQZK8TGB9Jq0TiPK8XC7QCDAs51EcWZ1ZZqVHqEffw5laehGDvHC4vig4q2nkab3HLtPr/UXUBmHBpveM8IzKxAL9Mvd9L+iJxH1QWpr6MnVdvGVL+f+5;
Received: from c171.al.cl.cam.ac.uk ([128.232.110.171] helo=localhost)
	by witko.kerneis.info with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <gabriel@kerneis.info>)
	id 1UUgp5-0002Am-M4; Tue, 23 Apr 2013 19:16:07 +0200
From: Gabriel Kerneis <gabriel@kerneis.info>
To: Richard Henderson <rth@twiddle.net>,
	Alexander Graf <agraf@suse.de>
Date: Tue, 23 Apr 2013 18:15:12 +0100
Message-Id: <1366737312-8598-1-git-send-email-gabriel@kerneis.info>
X-Mailer: git-send-email 1.7.10.4
X-SA-Exim-Connect-IP: 128.232.110.171
X-SA-Exim-Mail-From: gabriel@kerneis.info
X-SA-Exim-Scanned: No (on witko.kerneis.info); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 213.186.56.95
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] s390x: use CONFIG_INT128 to detect
	__uint128_t
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
X-List-Received-Date: Tue, 23 Apr 2013 17:16:40 -0000

Target s390x uses ad-hoc macro magic to guess if the compiler
supports the GCC extension __uint128_t.  This patch uses the
the dedicated macro CONFIG_INT128 defined by configure instead.

This fixes compilation with the CIL source code analyzer, which
uses GCC as a preprocessor but does not support __uint128_t.

Signed-off-by: Gabriel Kerneis <gabriel@kerneis.info>
---
 target-s390x/int_helper.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target-s390x/int_helper.c b/target-s390x/int_helper.c
index af16b21..85e49aa 100644
--- a/target-s390x/int_helper.c
+++ b/target-s390x/int_helper.c
@@ -97,8 +97,7 @@ uint64_t HELPER(divu64)(CPUS390XState *env, uint64_t ah, uint64_t al,
         ret = al / b;
     } else {
         /* ??? Move i386 idivq helper to host-utils.  */
-#if HOST_LONG_BITS == 64 && defined(__GNUC__)
-        /* assuming 64-bit hosts have __uint128_t */
+#ifdef CONFIG_INT128
         __uint128_t a = ((__uint128_t)ah << 64) | al;
         __uint128_t q = a / b;
         env->retxl = a % b;
-- 
1.7.10.4


