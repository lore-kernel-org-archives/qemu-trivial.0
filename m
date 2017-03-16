Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cqKcL-0003Lw-IR
	for mharc-qemu-trivial@gnu.org; Tue, 21 Mar 2017 10:18:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vfeenstr@redhat.com>) id 1cqIvf-0005v6-P8
	for qemu-trivial@nongnu.org; Tue, 21 Mar 2017 08:30:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vfeenstr@redhat.com>) id 1cqIve-0002np-Rm
	for qemu-trivial@nongnu.org; Tue, 21 Mar 2017 08:30:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33914)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vfeenstr@redhat.com>)
	id 1cqIva-0002n1-4t; Tue, 21 Mar 2017 08:30:18 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CAFF185547;
	Tue, 21 Mar 2017 12:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CAFF185547
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=vfeenstr@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com CAFF185547
Received: from localhost.localdomain.com (dhcp131-51.brq.redhat.com
	[10.34.131.51])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2CE51A84CD;
	Tue, 21 Mar 2017 12:30:15 +0000 (UTC)
From: Vinzenz 'evilissimo' Feenstra <vfeenstr@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, qemu-trivial@nongnu.org,
	Vinzenz Feenstra <vfeenstr@redhat.com>
Date: Thu, 16 Mar 2017 12:14:16 +0100
Message-Id: <20170316111416.25587-1-vfeenstr@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 21 Mar 2017 12:30:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Tue, 21 Mar 2017 10:18:31 -0400
Subject: [Qemu-trivial] [PATCH] checkpatch: Supress warning in function
 pointer typedefs
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
X-List-Received-Date: Tue, 21 Mar 2017 12:30:24 -0000

From: Vinzenz Feenstra <vfeenstr@redhat.com>

When importing dynamically functions via `GetProcAddress` in windows
related code, it is quite common to make a typedef for the resulting
function pointer. When the function to be imported, has a stdcall
calling convention, usually the `WINAPI` macro is used. This patch adds an
exception in the checkpatch.pl script to allow the calling convention
specification in function pointer typedefs, to be `WINAPI`.

Signed-off-by: Vinzenz Feenstra <vfeenstr@redhat.com>
---
 scripts/checkpatch.pl | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index f084542..33bf585 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1774,7 +1774,14 @@ sub process {
 			# likely a typedef for a function.
 			} elsif ($ctx =~ /$Type$/) {
 
-			} else {
+            # If this is a typedef we need to allow WINAPI as a calling
+            # convention. Even though there should be only one space around the
+            # star, we allow none or any, to suppress the following warning.
+            # The check for the number of spaces around the star is checked
+            # elsewhere.
+			} elsif($ctx =~ /^\s*typedef\s+$Type\(WINAPI\s*\*\s*$Ident\)/) {
+
+            } else {
 				ERROR("space prohibited between function name and open parenthesis '('\n" . $herecurr);
 			}
 		}
-- 
2.9.3


