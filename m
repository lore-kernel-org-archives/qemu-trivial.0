Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RHBr1-0008ES-L9
	for mharc-qemu-trivial@gnu.org; Fri, 21 Oct 2011 05:57:31 -0400
Received: from eggs.gnu.org ([140.186.70.92]:59289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RHBqy-00084j-HB
	for qemu-trivial@nongnu.org; Fri, 21 Oct 2011 05:57:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RHBqx-0006dc-9X
	for qemu-trivial@nongnu.org; Fri, 21 Oct 2011 05:57:28 -0400
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:35881)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1RHBqt-0006bV-7s; Fri, 21 Oct 2011 05:57:23 -0400
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 454CAFBB;
	Fri, 21 Oct 2011 17:55:38 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:mime-version:content-type; s=
	rsa1024; bh=arBvJG74JaT65LfK/ZV7QrHVpA8=; b=oFG9+Rxzv7eRPPCMoRi7
	7Vo8kyXFG+Hfmmks7/glgkX0I+dWK2OGr6qqwEFpi/ohp8gJT280EsQFMLdx2rPK
	YRyQcbjiz4MwGD8yzncXCMnoRbMsAlNchZ5HE3oxeTJDI1X7N5Bvsnjbg+GlFodt
	LEJnx17B6i6BXoVZflhfAN8=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 28D54FBA;
	Fri, 21 Oct 2011 17:55:38 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.4/8.14.4/Submit) id p9L9v9K1010181;
	Fri, 21 Oct 2011 17:57:09 +0800 (CST) (envelope-from chenwj)
Date: Fri, 21 Oct 2011 17:57:09 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
To: qemu-devel@nongnu.org
Message-ID: <20111021095709.GA10092@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.113.235.130
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial]  [PATCH] exec.c: Remove useless comment
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
X-List-Received-Date: Fri, 21 Oct 2011 09:57:30 -0000

  As phys_ram_size had been removed since QEMU 0.12. Remove the useless
comment.

Signed-off-by: Chen Wen-Ren <chenwj@iis.sinica.edu.tw>
---
 exec.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/exec.c b/exec.c
index d0cbf15..fb21e76 100644
--- a/exec.c
+++ b/exec.c
@@ -472,7 +472,6 @@ static void code_gen_alloc(unsigned long tb_size)
     code_gen_buffer_size = tb_size;
     if (code_gen_buffer_size == 0) {
 #if defined(CONFIG_USER_ONLY)
-        /* in user mode, phys_ram_size is not meaningful */
         code_gen_buffer_size = DEFAULT_CODE_GEN_BUFFER_SIZE;
 #else
         /* XXX: needs adjustments */
-- 
1.7.3.4

