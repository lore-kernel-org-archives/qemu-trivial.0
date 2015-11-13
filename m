Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZxDvw-0000Rq-OD
	for mharc-qemu-trivial@gnu.org; Fri, 13 Nov 2015 07:58:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ZxDvu-0000Pb-EQ
	for qemu-trivial@nongnu.org; Fri, 13 Nov 2015 07:58:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ZxDvt-0003SZ-Jg
	for qemu-trivial@nongnu.org; Fri, 13 Nov 2015 07:58:26 -0500
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:33517)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1ZxDvo-0003Ry-Dr; Fri, 13 Nov 2015 07:58:20 -0500
Received: by wmec201 with SMTP id c201so80040159wme.0;
	Fri, 13 Nov 2015 04:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=2DYjufYddFSIffIl9jr66vBmiKsfl9gvoEwG1OGurco=;
	b=VE/tNe3kO5LaiYS6qMiIK8ZXy07rGpaLWSMpfQWD1noTAfGJeFpO2rGIUWeTgMufqG
	2JjqX8nFyICgTup7QXIAfEY4ZsRgzgZNxWHPpw90/jekVTSaBRMgoyP/RkS15KeTKa+G
	WY92AMQ0d6ywYLvNKVe6JbyVEauBJ+F5aAHGKh0vqkCYSti9nfN5IIbMxn6UvIBkIgj3
	xX+jfVvPDpY71pGriVC0qSP57XBvUWbId+36UjzcaFRvABEEoIRx+xM19Z186gmCFGNh
	pJjthDVsVfQud/1mSuQ7HVUu1ln/caJ3S08dtrNnMTrIkW5LVaLCpqQyaEE25yAFaPQ0
	N17A==
X-Received: by 10.194.222.137 with SMTP id qm9mr25393314wjc.30.1447419499725; 
	Fri, 13 Nov 2015 04:58:19 -0800 (PST)
Received: from 640k.lan (94-39-161-165.adsl-ull.clienti.tiscali.it.
	[94.39.161.165]) by smtp.gmail.com with ESMTPSA id
	w67sm3858697wmw.17.2015.11.13.04.58.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Nov 2015 04:58:17 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 13 Nov 2015 13:58:14 +0100
Message-Id: <1447419494-10670-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::22c
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] net: convert qemu_log to error_report
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
X-List-Received-Date: Fri, 13 Nov 2015 12:58:27 -0000

Ensure that the error is printed with the proper timestamp.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 net/dump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/dump.c b/net/dump.c
index dd0555f..ab71ffc 100644
--- a/net/dump.c
+++ b/net/dump.c
@@ -84,7 +84,7 @@ static ssize_t dump_receive_iov(DumpState *s, const struct iovec *iov, int cnt)
     cnt = iov_copy(&dumpiov[1], cnt, iov, cnt, 0, caplen);
 
     if (writev(s->fd, dumpiov, cnt + 1) != sizeof(hdr) + caplen) {
-        qemu_log("-net dump write error - stop dump\n");
+        error_report("-net dump write error - stop dump");
         close(s->fd);
         s->fd = -1;
     }
-- 
1.8.3.1


