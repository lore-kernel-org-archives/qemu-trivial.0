Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YntwJ-0007ur-Ri
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 15:16:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YntwG-0007sW-7W
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 15:16:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YntwC-00048g-6W
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 15:15:59 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:59350)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YntwB-00048C-Fu
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 15:15:55 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id DB6B820B0D
	for <qemu-trivial@nongnu.org>; Thu, 30 Apr 2015 15:15:53 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute3.internal (MEProxy); Thu, 30 Apr 2015 15:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=oK8276I2mpvCwFyzAGmuae5juKI
	=; b=R72rlp2mlc4iO8NeS8U8mq+rCJ9tSMPeVbn+0GFZZG5Tj5ZA3/TQv6VIesF
	9liWkcKMjPUC9J+O/2rwahSmcYbcNsRlo3tMvMSBop5VyuCIc33vRmola3fr9Xcr
	C3SFi3dwIiIKK6I3GZj4oDttPKBJdiZRwLc04lPKHwCbx0go=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=oK82
	76I2mpvCwFyzAGmuae5juKI=; b=dfapmv79A/q1XcgejiuMguiBX37i6P7UHQvr
	ccITibt7bJWH2ZDGJk+jAPDReEzfZu79U4mhEYuyM5fI+bZi4mOTVwWkY6Gb5/D0
	0LxZPF2y/1imgslMqUV6PSWbb2H20ftekpQQ/W7Wmm0IoTemU/JSckQez6oJ6BMr
	k5AegVw=
X-Sasl-enc: /U3JNkJL6IgJpNWuJmfe+OEQsV2mY2MLlGFGaUhoLCaq 1430421353
Received: from localhost (unknown [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id A03F1C00018;
	Thu, 30 Apr 2015 15:15:53 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 15:16:30 -0400
Message-Id: <1430421390-2787-1-git-send-email-cota@braap.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <CAFEAcA_g1SgYSPqaiP-eewaY1AbKLAJoReWYgD5kvhEW5JbW8w@mail.gmail.com>
References: <CAFEAcA_g1SgYSPqaiP-eewaY1AbKLAJoReWYgD5kvhEW5JbW8w@mail.gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.111.4.25
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH] i440fx-test: guard ARRAY_SIZE definition
	with #ifndef
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
X-List-Received-Date: Thu, 30 Apr 2015 19:16:02 -0000

ARRAY_SIZE is defined in osdep.h so having an unconditional
definition here is fragile.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 tests/i440fx-test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i440fx-test.c b/tests/i440fx-test.c
index d0bc8de..d610e66 100644
--- a/tests/i440fx-test.c
+++ b/tests/i440fx-test.c
@@ -27,7 +27,9 @@
 
 #define BROKEN 1
 
+#ifndef ARRAY_SIZE
 #define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
+#endif
 
 typedef struct TestData
 {
-- 
1.9.1


