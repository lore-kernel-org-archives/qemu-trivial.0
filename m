Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QGnxe-0003E5-5L
	for mharc-qemu-trivial@gnu.org; Mon, 02 May 2011 03:54:30 -0400
Received: from eggs.gnu.org ([140.186.70.92]:47718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1QGnxb-00038G-IU
	for qemu-trivial@nongnu.org; Mon, 02 May 2011 03:54:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1QGnxa-00040B-Ji
	for qemu-trivial@nongnu.org; Mon, 02 May 2011 03:54:27 -0400
Received: from mail-yw0-f45.google.com ([209.85.213.45]:55681)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1QGnxY-0003yt-RB; Mon, 02 May 2011 03:54:24 -0400
Received: by mail-yw0-f45.google.com with SMTP id 41so2236353ywl.4
	for <multiple recipients>; Mon, 02 May 2011 00:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=HQX9fdIygTuTu3XBebVnPzddZA083IsZRLTrU255fw8=;
	b=bGBvJaIBa+rKxUh3zQAxZ1qWFgZ9vxKH/ceqmauIqspEvGxjsTT9DwMQ+lrIA63IHf
	YtgwtRMvWgcZmDS3uYULmzJGxzDSugBEcqCeEbNOKG7SVROteT3rG+UGQvEzUZxV7tOt
	Y/5S9DiSTZPnzQLsWgPb8LA1Wtw35phX68TdA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=e8fI6emnW/OSIkWYsYdB3MMEcX42foXuUAKJtjA9OFFH8Iy4x0WUdA8JyAZ1tAeTFM
	Ma44t+IQRzb+V+qLOgb6rur5VLqeg0/UZMU9UQ0hVQyDndWJe2aDl6uF5yfcHH2Yw46g
	pl+YHppytql6+z4+B4D434XpkriNgyn9ss+CA=
Received: by 10.90.250.2 with SMTP id x2mr6451032agh.202.1304322864460;
	Mon, 02 May 2011 00:54:24 -0700 (PDT)
Received: from localhost.localdomain (93-34-184-88.ip51.fastwebnet.it
	[93.34.184.88])
	by mx.google.com with ESMTPS id t16sm3488849anm.16.2011.05.02.00.54.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2011 00:54:23 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  2 May 2011 09:54:06 +0200
Message-Id: <1304322846-24376-4-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.4.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 4/4] fix compilation when reconfiguring
	without dtrace backend
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
X-List-Received-Date: Mon, 02 May 2011 07:54:28 -0000

If QEMU is configured with the dtrace backend, then built, then
reconfigured without, the build fails.

The culprit is the trace-dtrace.h dependency that many files will
have.  Due to this dependency, make will attempt to rebuild
trace-dtrace.dtrace.  This is the step that fails.  Fix by wrapping
the dtrace rules with ifeq/endif.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
---
 Makefile.objs |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/Makefile.objs b/Makefile.objs
index 0ba989f..e4e538a 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -326,6 +326,7 @@ trace.c-timestamp: $(SRC_PATH)/trace-events config-host.mak
 
 trace.o: trace.c $(GENERATED_HEADERS)
 
+ifeq ($(TRACE_BACKEND),dtrace)
 trace-dtrace.h: trace-dtrace.dtrace
 	$(call quiet-command,dtrace -o $@ -h -s $<, "  GEN   trace-dtrace.h")
 
@@ -339,6 +340,7 @@ trace-dtrace.dtrace-timestamp: $(SRC_PATH)/trace-events config-host.mak
 
 trace-dtrace.o: trace-dtrace.dtrace $(GENERATED_HEADERS)
 	$(call quiet-command,dtrace -o $@ -G -s $<, "  GEN trace-dtrace.o")
+endif
 
 simpletrace.o: simpletrace.c $(GENERATED_HEADERS)
 
-- 
1.7.4.4


