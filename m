Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFhbb-0005kc-DI
	for mharc-qemu-trivial@gnu.org; Mon, 26 Jan 2015 06:13:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YFhbV-0005bA-SE
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 06:13:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YFhbM-0001t6-Jb
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 06:13:13 -0500
Received: from mail-wg0-x22e.google.com ([2a00:1450:400c:c00::22e]:44944)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YFhb3-0001mQ-VM; Mon, 26 Jan 2015 06:12:46 -0500
Received: by mail-wg0-f46.google.com with SMTP id l2so8346704wgh.5;
	Mon, 26 Jan 2015 03:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AqLG+s61fRneaLePC99yWb0AY6CFVVZ1Ciy2eoUr9Pk=;
	b=DdRZR+QTo59T+oaIZB2FSfyjn5Ghp+bU7juWvcXFRUJynVVtzV16k6Y8l7AgL+v2xp
	hMdpMBLK2JKFnNSLPwOpdRLH4DVene9j/ihIUcLicRJ4zbMP49MkjcGQXfjtCKuSnYcG
	74FcnlJeMIsAFIIQvTYogfRGjyf6rnhiSN1n8adTGQx4sGl4wHQ133edJw/hz1+MvmnE
	NbR98KLvbnz0IsfnITJuCPE7fJdKW58o4hLRY1gRnQrGn6ewVcpzaA1ayc05bH3+qj9k
	GbrAYneTd1EVj6GaILf3bmam0kkOQs6Ry2rzgrfkACoMnLP2n1Ra/pJZMlR5JQsJs6gG
	Gduw==
X-Received: by 10.194.9.4 with SMTP id v4mr43969593wja.115.1422270765472;
	Mon, 26 Jan 2015 03:12:45 -0800 (PST)
Received: from playground.station (net-2-35-193-154.cust.vodafonedsl.it.
	[2.35.193.154])
	by mx.google.com with ESMTPSA id fp2sm13476390wib.8.2015.01.26.03.12.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jan 2015 03:12:44 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Jan 2015 12:12:27 +0100
Message-Id: <1422270747-23994-8-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>
References: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22e
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Subject: [Qemu-trivial] [PATCH 7/7] migration: do floating-point division
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
X-List-Received-Date: Mon, 26 Jan 2015 11:13:17 -0000

Dividing integer expressions transferred_bytes and time_spent, and then converting
the integer quotient to type double. Any remainder, or fractional part of the
quotient, is ignored.  Fix this.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 migration/migration.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index b3adbc6..6db75b8 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -646,7 +646,7 @@ static void *migration_thread(void *opaque)
         if (current_time >= initial_time + BUFFER_DELAY) {
             uint64_t transferred_bytes = qemu_ftell(s->file) - initial_bytes;
             uint64_t time_spent = current_time - initial_time;
-            double bandwidth = transferred_bytes / time_spent;
+            double bandwidth = (double)transferred_bytes / time_spent;
             max_size = bandwidth * migrate_max_downtime() / 1000000;
 
             s->mbps = time_spent ? (((double) transferred_bytes * 8.0) /
-- 
1.8.3.1


