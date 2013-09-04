Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VHDOn-00015I-67
	for mharc-qemu-trivial@gnu.org; Wed, 04 Sep 2013 09:45:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1VH2Kh-0001G8-KC
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 21:56:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1VH2Ke-0005Su-Hm
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 21:56:35 -0400
Received: from mail-ob0-x22c.google.com ([2607:f8b0:4003:c01::22c]:55524)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1VH2Ke-0005Sn-CP
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 21:56:32 -0400
Received: by mail-ob0-f172.google.com with SMTP id er7so6741356obc.31
	for <qemu-trivial@nongnu.org>; Tue, 03 Sep 2013 18:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=0ChPP6c+Hqu6WFcKyayJvd96Ca4jsoIbwTQ72QtInpQ=;
	b=sIJUaqNETqiRch2LJBK59Wp6qJyQ8P8xiqQpCUuZWS9vDA6LGntI3MYtD+ntxlDoSx
	kLp7v7VO6bHnXznJWIZIpOKGNncnJKfatcHWFjvGZcVUCQRY8lTbukTv7T0/QCZlGzk7
	oLxU2jmgGOEQ0eivzaOnuuaJj2g912cuShqCy18V4hKXxA9qEicRI9RdksZDWPk2AqGo
	SD1Ke8sMoci4Bq4IojkvkVY5EQKinzrlu6eDryderT5LTQz5EyR+dxqrBQblj5o41z08
	VO8GSIZH8ljy1bU4JGSJccAJq6jQI0Ew1H+45DxiEk4oxjKC31aP6aKnkjhvjnuQtA8m
	XXww==
MIME-Version: 1.0
X-Received: by 10.182.250.163 with SMTP id zd3mr322227obc.20.1378259791377;
	Tue, 03 Sep 2013 18:56:31 -0700 (PDT)
Received: by 10.60.18.200 with HTTP; Tue, 3 Sep 2013 18:56:31 -0700 (PDT)
Date: Tue, 3 Sep 2013 21:56:31 -0400
Message-ID: <CA+K+NcRuDrKRLNzCuvHkdkj=dNyvj_swbpgiuMi-vH8nx6+kfg@mail.gmail.com>
From: =?UTF-8?B?SsOhbiBWZXNlbMO9?= <jano.vesely@gmail.com>
To: QEMU <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::22c
X-Mailman-Approved-At: Wed, 04 Sep 2013 09:45:30 -0400
Subject: [Qemu-trivial] [PATCH] configure: Undef _FORTIFY_SOURCE before
	redefining it
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
X-List-Received-Date: Wed, 04 Sep 2013 01:56:36 -0000

This patch fixes the following  warning/error with compilers that
define _FORTIFY_SOURE by default:
<command-line>:0:0: error: "_FORTIFY_SOURCE" redefined [-Werror]
stubs/dump.c:1:0: note: this is the location of the previous definition

Signed-off-by: Jan Vesely <jano.vesely@gmail.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index e989609..24e5b00 100755
--- a/configure
+++ b/configure
@@ -3419,7 +3419,7 @@ if test "$gcov" = "yes" ; then
   CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
   LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
 elif test "$debug" = "no" ; then
-  CFLAGS="-O2 -D_FORTIFY_SOURCE=2 $CFLAGS"
+  CFLAGS="-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
 fi


-- 
1.8.1.5

