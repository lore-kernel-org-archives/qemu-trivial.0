Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eKugG-0007jj-C2
	for mharc-qemu-trivial@gnu.org; Fri, 01 Dec 2017 18:25:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eKugA-0007fJ-N2
	for qemu-trivial@nongnu.org; Fri, 01 Dec 2017 18:25:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eKug9-0004eX-Pi
	for qemu-trivial@nongnu.org; Fri, 01 Dec 2017 18:25:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57028)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eKug6-0004co-Hd; Fri, 01 Dec 2017 18:25:06 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA1C561BB2;
	Fri,  1 Dec 2017 23:25:05 +0000 (UTC)
Received: from red.redhat.com (ovpn-122-182.rdu2.redhat.com [10.10.122.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6631E5D6A3;
	Fri,  1 Dec 2017 23:25:01 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	qemu-trivial@nongnu.org,
	pbonzini@redhat.com
Date: Fri,  1 Dec 2017 17:24:33 -0600
Message-Id: <20171201232433.25193-8-eblake@redhat.com>
In-Reply-To: <20171201232433.25193-1-eblake@redhat.com>
References: <20171201232433.25193-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 01 Dec 2017 23:25:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 7/7] checkpatch: Enforce proper do/while
 (0) style
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
X-List-Received-Date: Fri, 01 Dec 2017 23:25:11 -0000

Use of a loop construct for code that is not intended to repeat
does not make much idiomatic sense, except in one place: it is a
common usage in macros in order to wrap arbitrary code with
single-statement semantics.  But when used in a macro, it is more
typical for the caller to supply the trailing ';' when calling
the macro.

Although qemu coding style frowns on bare:
  if (cond)
    statement1;
  else
    statement2;
where extra semicolons actually cause syntax errors, we still
want our macro styles to be easily copied to other projects.
Thus, declare it an error if we encounter any form of 'while (0)'
with a semicolon in the same line.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 scripts/checkpatch.pl | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 34df753571..27800a4ed9 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1622,6 +1622,11 @@ sub process {
 			}
 		}

+# 'do ... while (0/false)' only makes sense in macros, without trailing ';'
+		if ($line =~ /while\s*\((0|false)\);/) {
+			ERROR("suspicious ; after while (0)\n" . $herecurr);
+		}
+
 # Check relative indent for conditionals and blocks.
 		if ($line =~ /\b(?:(?:if|while|for)\s*\(|do\b)/ && $line !~ /^.\s*#/ && $line !~ /\}\s*while\s*/) {
 			my ($s, $c) = ($stat, $cond);
-- 
2.14.3


