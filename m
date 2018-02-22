Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eoyt7-0001NO-Ry
	for mharc-qemu-trivial@gnu.org; Thu, 22 Feb 2018 16:58:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eoyt5-0001Lc-LO
	for qemu-trivial@nongnu.org; Thu, 22 Feb 2018 16:58:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eoyt4-0004RT-Ss
	for qemu-trivial@nongnu.org; Thu, 22 Feb 2018 16:58:47 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51404 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eoysz-0004Pc-8A; Thu, 22 Feb 2018 16:58:41 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B9308EB6ED;
	Thu, 22 Feb 2018 21:58:40 +0000 (UTC)
Received: from red.redhat.com (ovpn-122-122.rdu2.redhat.com [10.10.122.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 60A611049460;
	Thu, 22 Feb 2018 21:58:40 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-trivial@nongnu.org
Date: Thu, 22 Feb 2018 15:58:38 -0600
Message-Id: <20180222215838.18223-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 22 Feb 2018 21:58:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 22 Feb 2018 21:58:40 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] checkpatch: Exempt long URLs
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
X-List-Received-Date: Thu, 22 Feb 2018 21:58:48 -0000

Sometimes, we want to refer to really long URLs, but checkpatch
balks, and we have to manually bypass the check.  URL shorterners
may be nice at reducing long links, but it's hard to guarantee the
shortened link will live as long as the real target, and it is
also nice to see the original target without having to load the
shortened URL through a browser.  So exempt a line containing
only a URL from the long-line syntax check.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 scripts/checkpatch.pl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 1b4b812e28f..0d3f753c665 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1447,9 +1447,10 @@ sub process {
 # check we are in a valid source file if not then ignore this hunk
 		next if ($realfile !~ /$SrcFile/);

-#90 column limit
+#90 column limit; exempt URLs, if no other words on line
 		if ($line =~ /^\+/ &&
 		    !($line =~ /^\+\s*"[^"]*"\s*(?:\s*|,|\)\s*;)\s*$/) &&
+		    !($rawline =~ /^[^[:alnum:]]*https?:\S*$/) &&
 		    $length > 80)
 		{
 			if ($length > 90) {
-- 
2.14.3


