Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cldJp-0008HW-Fx
	for mharc-qemu-trivial@gnu.org; Wed, 08 Mar 2017 10:16:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cldJn-0008Fk-8g
	for qemu-trivial@nongnu.org; Wed, 08 Mar 2017 10:16:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cldJm-0004b1-86
	for qemu-trivial@nongnu.org; Wed, 08 Mar 2017 10:15:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36948)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cldJh-0004Zs-FB; Wed, 08 Mar 2017 10:15:53 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0913804ED;
	Wed,  8 Mar 2017 15:15:53 +0000 (UTC)
Received: from red.redhat.com (ovpn-124-84.rdu2.redhat.com [10.10.124.84] (may
	be forged))
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v28FFqwI007743; Wed, 8 Mar 2017 10:15:53 -0500
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Wed,  8 Mar 2017 09:15:44 -0600
Message-Id: <20170308151544.7606-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 08 Mar 2017 15:15:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH for-2.9? v2] tests: Ignore more test
 executables
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
X-List-Received-Date: Wed, 08 Mar 2017 15:16:00 -0000

Ignore test executables when building in-tree:
test-arm-mptimer introduced in commit 882fac3
test-crypto-hmac introduced in commit 4fd460b
test-aio-multithread introduced in commit 0c330a7

Signed-off-by: Eric Blake <eblake@redhat.com>
---

v2: pick up another built binary [Laurent]

Doesn't affect the built binaries, but does make it harder to
accidentally commit an unintended binary when doing 'git add .'.
Therefore, it's up to the maintainer if this is 2.9 or 2.10
material.  (test-arm-mptimer has been around since the 2.8 release)

 tests/.gitignore | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index dc37519..73598b6 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -11,6 +11,8 @@ check-qom-proplist
 qht-bench
 rcutorture
 test-aio
+test-aio-multithread
+test-arm-mptimer
 test-base64
 test-bitops
 test-bitcnt
@@ -24,6 +26,7 @@ test-crypto-afsplit
 test-crypto-block
 test-crypto-cipher
 test-crypto-hash
+test-crypto-hmac
 test-crypto-ivgen
 test-crypto-pbkdf
 test-crypto-secret
-- 
2.9.3


