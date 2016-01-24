Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aNba1-0002r5-N8
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jan 2016 02:28:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aNLNJ-0006ZP-UE
	for qemu-trivial@nongnu.org; Sun, 24 Jan 2016 09:10:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aNLNG-0002zI-NM
	for qemu-trivial@nongnu.org; Sun, 24 Jan 2016 09:10:41 -0500
Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241]:33648)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aNLNG-0002zC-FL
	for qemu-trivial@nongnu.org; Sun, 24 Jan 2016 09:10:38 -0500
Received: by mail-pa0-x241.google.com with SMTP id pv5so5405398pac.0
	for <qemu-trivial@nongnu.org>; Sun, 24 Jan 2016 06:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WLI8sCGEGhKgA4Ylr/w4mVlPqFVjomSDaCR8efDZWuQ=;
	b=VR0bhzrJBfm52MyWNo48UVTqN+QudLGvNI+/hSHivCl6lRkwSNWyhMDIUEBjlxN/wM
	edUvNEwcRdELo6eV3LCjGQl26XC3NGxdnIty5vywdZ/2zYF1laC3PeZO7U6a6rcUAwkz
	H3gIO9HL4DlizCxvtvmRdB+LOfgh5Le4A8QlZNR1cpW898hDPpA7zAPMoco57butTq91
	NbE5f6XC+BnbReOZ03NAQg7IhdH3u5ZHwqpNu/Uy9juzKMPxnfmNkD8bSNz/v22rrngN
	ip4eb+LuwWQ1qYOA7vU8GV1P4CE06MloeTCA+Hwcgo4Bh2SUrRCa8FwA4IBgvXA++VPR
	GsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WLI8sCGEGhKgA4Ylr/w4mVlPqFVjomSDaCR8efDZWuQ=;
	b=Wq+PGFwB5/b3k0dje1MHx78JaTnNqlxdqkJ50bm/m0JjxSmyusi8y+bdue+OPOefW5
	qXDr1gcxCA5KXyc6ASkUAMm+tlCmIUZa2+jFKdd/YhC77cydg3uN0MSNyYDwsVnfbOjn
	OpaI+N7HfKpVdw4VSTSHhoe8wUHeNMHhVE/Ma63FCZFKmKmReH3PgRjU0x4GHmiTp7LW
	GEpAO3C5j4iXoeDDhsZAYrFKOow+uyLWlaMGfFaU8wV7EyWcq2ze7xN5Xcmjjt19GJzi
	/cU/Ej1uHQQhOxjSvM4fIlPT2sGoSStXl5nDPZFMZj7i7AwrEm+vBnWjzDpJtbbTYB51
	Nz1A==
X-Gm-Message-State: AG10YOTgiVFRPdVi867iU1nqjVIer0K3OSgoeubekGx4hPAK+//gkM+ufDG8hJLpxycryw==
X-Received: by 10.66.182.202 with SMTP id eg10mr18943540pac.50.1453644637168; 
	Sun, 24 Jan 2016 06:10:37 -0800 (PST)
Received: from localhost ([45.32.44.20]) by smtp.gmail.com with ESMTPSA id
	fi16sm22125909pac.12.2016.01.24.06.10.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jan 2016 06:10:35 -0800 (PST)
From: Wei Yang <richard.weiyang@gmail.com>
To: qemu-trivial@nongnu.org
Date: Sun, 24 Jan 2016 14:09:57 +0000
Message-Id: <1453644598-11250-1-git-send-email-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::241
X-Mailman-Approved-At: Mon, 25 Jan 2016 02:28:52 -0500
Cc: amit.shah@redhat.com, Wei Yang <richard.weiyang@gmail.com>,
	quintela@redhat.com
Subject: [Qemu-trivial] [PATCH 1/2] rdma: remove check on time_spent when
	calculating mbs
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
X-List-Received-Date: Sun, 24 Jan 2016 14:10:42 -0000

Within the if statement, time_spent is assured to be non-zero.

This patch just removes the check on time_spent when calculating mbs.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
---
 migration/migration.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index c842499..40b87f2 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1677,8 +1677,8 @@ static void *migration_thread(void *opaque)
             double bandwidth = (double)transferred_bytes / time_spent;
             max_size = bandwidth * migrate_max_downtime() / 1000000;
 
-            s->mbps = time_spent ? (((double) transferred_bytes * 8.0) /
-                    ((double) time_spent / 1000.0)) / 1000.0 / 1000.0 : -1;
+            s->mbps = (((double) transferred_bytes * 8.0) /
+                    ((double) time_spent / 1000.0)) / 1000.0 / 1000.0;
 
             trace_migrate_transferred(transferred_bytes, time_spent,
                                       bandwidth, max_size);
-- 
2.5.0


