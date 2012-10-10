Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TLvRj-0007jO-KC
	for mharc-qemu-trivial@gnu.org; Wed, 10 Oct 2012 08:31:31 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1TLvRg-0007ZZ-J8
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2012 08:31:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1TLvRa-00043w-Ki
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2012 08:31:28 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:44268)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1TLvRT-00042c-Ks; Wed, 10 Oct 2012 08:31:15 -0400
Received: by mail-pb0-f45.google.com with SMTP id rp2so649122pbb.4
	for <multiple recipients>; Wed, 10 Oct 2012 05:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=/E7lGcqnNCYumQsOE4z7dR0BZCXLrGVQgMJdCrsGHiM=;
	b=MHBjByqpADPcKI3cQKf1PiTU6MBBjGS8SwPqX9LvdFXSpF2nDJ4yjBVdShfo31IMpE
	6QAln5b9ki1HzFUBBANpiOfr50OsHt6lA1cbJ2vhYFbLj7uA1qCQ+54YjQ63J0mkaAfl
	ukO5X4GCE+OfnWKQ4e4wYgJuOrbuAlgosLzsqrVb2pmw2doMzrczU5h7SN3z0ZfeYM9D
	n5VjmOfEs6sggt6bNJ6+Z5/SYE8uq4GrAhlCn1tV+iMDak8YNnl/aTvw4i7dMnIRmLAh
	1uTxQTW1tJiH/ZO6RQUWlbkERK8rvKpVYsAQc5Ygu5m9r3duAVbiLXw8NslN/vVCd979
	3U5g==
Received: by 10.68.138.198 with SMTP id qs6mr74045578pbb.151.1349872274271;
	Wed, 10 Oct 2012 05:31:14 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-169-1.ip50.fastwebnet.it.
	[93.34.169.1])
	by mx.google.com with ESMTPS id y11sm964739pbv.66.2012.10.10.05.31.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Oct 2012 05:31:13 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 Oct 2012 14:30:58 +0200
Message-Id: <1349872258-21952-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.12.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] vnc: fix "info vnc" with "-vnc ...,
	reverse=on"
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
X-List-Received-Date: Wed, 10 Oct 2012 12:31:29 -0000

When reverse connection is in use, there is no active VNC server
socket.  Because of this, getsockopt(-1, ...) is attempted and
the following error is emitted:

    $ socat TCP-LISTEN:5900,reuseaddr TCP-LISTEN:5901,reuseaddr &
    $ x86_64-softmmu/qemu-system-x86_64 -vnc localhost:5900,reverse -monitor stdio
    QEMU 1.2.50 monitor - type 'help' for more information
    (qemu) info vnc
    An undefined error has occurred

Because however the host, family, service and auth fields are
optional, we can just exit if there is no active server socket.

    $ x86_64-softmmu/qemu-system-x86_64 -vnc localhost:5900,reverse -monitor stdio
    QEMU 1.2.50 monitor - type 'help' for more information
    (qemu) info vnc
    Server:
    Client:
         address: 127.0.0.1:5900
      x509_dname: none
        username: none

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 ui/vnc.c | 4 ++++
 1 file modificato, 4 inserzioni(+)

diff --git a/ui/vnc.c b/ui/vnc.c
index b8e46ca..44d00a2 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -372,6 +372,10 @@ VncInfo *qmp_query_vnc(Error **errp)
             }
         }
 
+        if (vnc_display->lsock == -1) {
+            return info;
+        }
+
         if (getsockname(vnc_display->lsock, (struct sockaddr *)&sa,
                         &salen) == -1) {
             error_set(errp, QERR_UNDEFINED_ERROR);
-- 
1.7.12.1


