Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cBOoD-0003Go-A5
	for mharc-qemu-trivial@gnu.org; Mon, 28 Nov 2016 11:29:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45566)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <francis.deslauriers@efficios.com>)
	id 1cBOEg-0000uT-Ay
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2016 10:52:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <francis.deslauriers@efficios.com>)
	id 1cBOEf-0008Ai-Lj
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2016 10:52:54 -0500
Received: from mail.efficios.com ([167.114.142.141]:41758)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <francis.deslauriers@efficios.com>)
	id 1cBOEb-000851-2K; Mon, 28 Nov 2016 10:52:49 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id B779A34022A;
	Mon, 28 Nov 2016 15:54:05 +0000 (UTC)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (evm-mail-1.efficios.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id OLD0mpLuZlJa; Mon, 28 Nov 2016 15:54:05 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 3198C340227;
	Mon, 28 Nov 2016 15:54:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (evm-mail-1.efficios.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id 99PZgvDE5C1A; Mon, 28 Nov 2016 15:54:05 +0000 (UTC)
Received: from raton.internal.efficios.com
	(cable-192.222.218.157.electronicbox.net [192.222.218.157])
	by mail.efficios.com (Postfix) with ESMTPSA id 11A98340222;
	Mon, 28 Nov 2016 15:54:05 +0000 (UTC)
From: Francis Deslauriers <francis.deslauriers@efficios.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Francis Deslauriers <francis.deslauriers@efficios.com>
Date: Mon, 28 Nov 2016 10:52:17 -0500
Message-Id: <1480348337-24271-1-git-send-email-francis.deslauriers@efficios.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 167.114.142.141
X-Mailman-Approved-At: Mon, 28 Nov 2016 11:29:35 -0500
Subject: [Qemu-trivial] [PATCH] configure: fix LTTng UST tracing backend
 detection
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
X-List-Received-Date: Mon, 28 Nov 2016 15:52:55 -0000

The detection program needs to be linked with -ldl to build succesfully
with recent versions of LTTng-UST.

We also need to add -ldl to the libs required to build the LTTng-UST
backend (lttng_ust_libs).

Signed-off-by: Francis Deslauriers <francis.deslauriers@efficios.com>
---
 configure | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 5e66828..89df5c4 100755
--- a/configure
+++ b/configure
@@ -4305,11 +4305,11 @@ if have_backend "ust"; then
 #include <lttng/tracepoint.h>
 int main(void) { return 0; }
 EOF
-  if compile_prog "" "" ; then
+  if compile_prog "" "-Wl,--no-as-needed -ldl" ; then
     if $pkg_config lttng-ust --exists; then
       lttng_ust_libs=$($pkg_config --libs lttng-ust)
     else
-      lttng_ust_libs="-llttng-ust"
+      lttng_ust_libs="-llttng-ust -ldl"
     fi
     if $pkg_config liburcu-bp --exists; then
       urcu_bp_libs=$($pkg_config --libs liburcu-bp)
-- 
2.7.4


