Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grjWX-0004UQ-38
	for mharc-qemu-trivial@gnu.org; Thu, 07 Feb 2019 08:15:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1grjWP-0004KL-R7
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 08:15:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1grjWM-0007tr-65
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 08:15:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54726)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1grjWE-0007d5-Ve; Thu, 07 Feb 2019 08:15:07 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 28956369CD;
	Thu,  7 Feb 2019 13:15:06 +0000 (UTC)
Received: from thuth.com (ovpn-116-84.ams2.redhat.com [10.36.116.84])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8340E18780;
	Thu,  7 Feb 2019 13:15:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
	qemu-trivial@nongnu.org
Date: Thu,  7 Feb 2019 14:14:55 +0100
Message-Id: <1549545296-18903-2-git-send-email-thuth@redhat.com>
In-Reply-To: <1549545296-18903-1-git-send-email-thuth@redhat.com>
References: <1549545296-18903-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 07 Feb 2019 13:15:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 1/2] qemu-deprecated: Remove -virtioconsole
 and -no-frame for good
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
X-List-Received-Date: Thu, 07 Feb 2019 13:15:23 -0000

The two sections have accidentally been added again during the
merge of Paolo's and Gerd's trees.

Fixes: 3e29da9fd81002a0c03041aaa26dea6d9dd9bd65
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-deprecated.texi | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 80b0702..90e5860 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -37,18 +37,6 @@ would automatically enable USB support on the machine type.
 If using the new syntax, USB support must be explicitly
 enabled via the ``-machine usb=on'' argument.
 
-@subsection -virtioconsole (since 3.0.0)
-
-Option @option{-virtioconsole} has been replaced by
-@option{-device virtconsole}.
-
-@subsection -no-frame (since 2.12.0)
-
-The @code{--no-frame} argument works with SDL 1.2 only. The other user
-interfaces never implemented this in the first place. So this will be
-removed together with SDL 1.2 support.
->>>>>>> remotes/bonzini/tags/for-upstream
-
 @subsection -clock (since 3.0.0)
 
 The @code{-clock} option is ignored since QEMU version 1.7.0. There is no
-- 
1.8.3.1


