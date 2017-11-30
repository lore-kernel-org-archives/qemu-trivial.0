Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eKPQ3-0000YL-3z
	for mharc-qemu-trivial@gnu.org; Thu, 30 Nov 2017 09:02:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eKPPy-0000W5-Ge
	for qemu-trivial@nongnu.org; Thu, 30 Nov 2017 09:02:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eKPPm-00073B-7J
	for qemu-trivial@nongnu.org; Thu, 30 Nov 2017 09:02:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45660)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eKPPc-0006w0-0d; Thu, 30 Nov 2017 09:02:00 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 01D82C058ECC;
	Thu, 30 Nov 2017 14:01:59 +0000 (UTC)
Received: from red.redhat.com (ovpn-122-213.rdu2.redhat.com [10.10.122.213])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6EF325C88D;
	Thu, 30 Nov 2017 14:01:58 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Thu, 30 Nov 2017 08:01:54 -0600
Message-Id: <20171130140154.11161-1-eblake@redhat.com>
In-Reply-To: <20171130134159.9697-1-eblake@redhat.com>
References: <20171130134159.9697-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 30 Nov 2017 14:01:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 4/3] checkpatch: Enforce proper do/while (0)
 style
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
X-List-Received-Date: Thu, 30 Nov 2017 14:02:26 -0000

while (0) is only idiomatic in a macro definition, where the caller
will be supplying the trailing ';'.  Warn if the macro has a duplicate.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 scripts/checkpatch.pl | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 34df753571..acb66bff34 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1622,6 +1622,11 @@ sub process {
 			}
 		}

+# 'while (0);' is odd; only macros should use while (0), without trailing ;
+		if ($line =~ /while\s*\(0\);/) {
+			ERROR("suspicious ; after while (0)\n" . $herecurr);
+		}
+
 # Check relative indent for conditionals and blocks.
 		if ($line =~ /\b(?:(?:if|while|for)\s*\(|do\b)/ && $line !~ /^.\s*#/ && $line !~ /\}\s*while\s*/) {
 			my ($s, $c) = ($stat, $cond);
-- 
2.14.3


