Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axtCB-0005dR-KS
	for mharc-qemu-trivial@gnu.org; Wed, 04 May 2016 05:34:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>) id 1axtC2-0005EK-Jb
	for qemu-trivial@nongnu.org; Wed, 04 May 2016 05:34:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>) id 1axtBq-0003ky-RA
	for qemu-trivial@nongnu.org; Wed, 04 May 2016 05:34:01 -0400
Received: from mail.lekensteyn.nl ([2a02:2308::360:1:25]:56082)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>)
	id 1axtBX-0003bW-6m; Wed, 04 May 2016 05:33:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lekensteyn.nl; s=s2048-2015-q1; 
	h=Message-Id:Date:Subject:Cc:To:From;
	bh=e+oVS3DZqQ1lPS0FzVAgMXBfLfNDb0xxvSA9WnhKTkg=; 
	b=h12MQnq3ahlWlys5HKIa4VeSZ293CY7y6j0oGQXVsKEIhtTdd7DizM07a3oFELBvh21U6W5nY5Lw6YnlAHOObgDxpk9b2jAywdomaO1LVrhfe2L/s7hsyIJ9nwO3rAzjPp8R1/HGpdFg2ZoOdsKTo4yK99Hzu7mYzCkiS22sAiZ4d76e8MZMoAeyLm2q8WISeZ9ChVowTNErhZoMG/07oo+yzIgPI2wsFLzVXajQF6D5tAJ/B783e2HAb/T2kGlSlVaB+fN6W1f60Q/ZVkD5dIp9Sp22YmZ9qbvxkNhBqMNtD3uryBn+7S4B36tvhqBwUppSjTGE+CXlg3zRVv9uWQ==;
Received: by lekensteyn.nl with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_CBC_SHA256:128) (Exim 4.84_2)
	(envelope-from <peter@lekensteyn.nl>)
	id 1axtB2-0002Mq-4M; Wed, 04 May 2016 11:33:15 +0200
From: Peter Wu <peter@lekensteyn.nl>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Wed,  4 May 2016 11:32:17 +0200
Message-Id: <1462354337-1733-1-git-send-email-peter@lekensteyn.nl>
X-Mailer: git-send-email 2.8.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a02:2308::360:1:25
Subject: [Qemu-trivial] [PATCH] gdbstub: set listen backlog to 1
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
X-List-Received-Date: Wed, 04 May 2016 09:34:14 -0000

Avoid possible connection drops on Linux (when tcp_syncookies is
disabled) or fallbacks to SYN cookies with the following kernel warning:

    TCP: request_sock_TCP: Possible SYN flooding on port 1234. Sending cookies.  Check SNMP counters.

Since Linux 4.4 (ef547f2ac16b "tcp: remove max_qlen_log"), a backlog of
zero is really treated as the "queue length for completely established
sockets waiting to be accepted" (listen(2)). This is apparently a valid
interpretation of an "implementation-defined minimum value" for a
backlog value of 0 (listen(3p)). Previous kernels would use 8 as
minimum value, but that is no longer the case.

Signed-off-by: Peter Wu <peter@lekensteyn.nl>
---
Hi,

This was also reported at Linux, but the author of that patch argued that it is
intended behavior[1].

Kind regards,
Peter

 [1]: https://lkml.kernel.org/r/1462321544.5535.337.camel@edumazet-glaptop3.roam.corp.google.com
---
 gdbstub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index b126bf5..f181dc3 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1630,7 +1630,7 @@ static int gdbserver_open(int port)
         close(fd);
         return -1;
     }
-    ret = listen(fd, 0);
+    ret = listen(fd, 1);
     if (ret < 0) {
         perror("listen");
         close(fd);
-- 
2.8.0


