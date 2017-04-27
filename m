Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d3qNu-0005Xy-3n
	for mharc-qemu-trivial@gnu.org; Thu, 27 Apr 2017 16:51:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1d3qNr-0005V9-EL
	for qemu-trivial@nongnu.org; Thu, 27 Apr 2017 16:51:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1d3qNq-0004OB-MM
	for qemu-trivial@nongnu.org; Thu, 27 Apr 2017 16:51:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57600)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1d3qNk-0004LC-7x; Thu, 27 Apr 2017 16:51:20 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 289EE24851C;
	Thu, 27 Apr 2017 20:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 289EE24851C
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=jsnow@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 289EE24851C
Received: from scv.usersys.redhat.com (dhcp-17-221.bos.redhat.com
	[10.18.17.221])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5939D5C6C9;
	Thu, 27 Apr 2017 20:51:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, eblake@redhat.com,
	mreitz@redhat.com, John Snow <jsnow@redhat.com>
Date: Thu, 27 Apr 2017 16:51:00 -0400
Message-Id: <20170427205100.9505-3-jsnow@redhat.com>
In-Reply-To: <20170427205100.9505-1-jsnow@redhat.com>
References: <20170427205100.9505-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 27 Apr 2017 20:51:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 2/2] iotests: fix exclusion option
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
X-List-Received-Date: Thu, 27 Apr 2017 20:51:28 -0000

If you are running out-of-tree, the -x option to exclude
a certain iotest is broken.

Replace porcelain usage of ls with a sturdier awk command.

Reviewed-by: Fam Zheng <famz@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/common | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/common b/tests/qemu-iotests/common
index fa8e69e..f2a7199 100644
--- a/tests/qemu-iotests/common
+++ b/tests/qemu-iotests/common
@@ -86,7 +86,8 @@ s/ .*//p
     elif $xgroup
     then
         # arg after -x
-        [ ! -s $tmp.list ] && ls [0-9][0-9][0-9] [0-9][0-9][0-9][0-9] >$tmp.list 2>/dev/null
+        # Populate $tmp.list with all tests
+        awk '/^[0-9]{3,}/ {print $1}' "${source_iotests}/group" > $tmp.list 2>/dev/null
         group_list=`sed -n <"$source_iotests/group" -e 's/$/ /' -e "/^[0-9][0-9][0-9].* $r /"'{
 s/ .*//p
 }'`
-- 
2.9.3


