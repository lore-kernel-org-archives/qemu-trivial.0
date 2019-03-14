Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4RvQ-0002PU-QF
	for mharc-qemu-trivial@gnu.org; Thu, 14 Mar 2019 11:05:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41743)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h4RvK-0002MF-4E
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 11:05:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h4RvI-0004gR-H1
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 11:05:33 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:45783)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h4RvH-0004Mc-RK; Thu, 14 Mar 2019 11:05:32 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MXXZf-1hXm6X27lH-00YwNf; Thu, 14 Mar 2019 16:05:06 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, Stefano Garzarella <sgarzare@redhat.com>,
	Eric Blake <eblake@redhat.com>
Date: Thu, 14 Mar 2019 16:04:54 +0100
Message-Id: <20190314150454.15960-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190314150454.15960-1-laurent@vivier.eu>
References: <20190314150454.15960-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SR3B16lirBGE4gVeehwjITpiKMyzMFswAXNLoI2rY+TxotOEZDj
	DUqEprxe4QpE9JTxxKMmJxUUG+B8pytZsPZd2dg53e+yPhLqE1DeIVbBm1OdLXgfRlVDs6L
	b1/CxviHvIGD0oaX9N4zFxo0s3QaWVnzE+9nvvW+wRZ3NLlChS3Jf0CFuFhhfvGECU7jjBo
	j0vfXUW1yO5Ec+/GUzXjg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3+aSLu66qBg=:3Ksk6y7Bi5JK8fC7Syaojf
	sgfU0NL2leGDyKmrb0+a6PeCIRBQnSivDRAIj2IP/BoeSLrfnVvvu188+/u7r5q/RVit8anoJ
	Oa0z5ZwXZfRwud6D7RuoipPphx7GnF7dVkkPIc6QbIsSbTOCU5U08iR3zqTxa1Q9zFe1tykBA
	5wf9NBwn0KKwuIDGX4vfLN1HgG2rlab75COSe4nOfPhANjQlhN2VOR2qfuwkkb5cuXFJKHQBC
	a7PSFOV253BFOYw2x0X8w7s1afF1JPWO4UxKfA+mILRWBBJerm+9y8zd8l6vCnsOIotnCBdWh
	1hxFST4Tky5whDjcmeN2/UAo00WX7w2JtfbCqwXKnTuNaq+wnN4HjRfbaSfTLDmAySKkDtOA7
	f7ZHtlW8TlNqylDTNBVup3NipbiLoi0c56xcYgqYP0yeWzEVTCK+u8UwdIxmsxRNGkLsISC/9
	DHjZ3xO4AK57uaX/edyq9w69qHsck+RsJmK0MRd88/92g3jxoHtJhJnpYALsRSFbdGwcMB8SJ
	p0a8qoCCHduMcGWk9tBT1TU9hj0lAUZ8FmytEEEtSVo7BJaadEl8O59TFUe5TymgnJDXGh7o0
	5w5S4uXTcbV7fswdT4Neoj5WIqk8a/96ik31n/rlkNCzETKQ0QHuTo8vBqynS6lcqaXStg0Bq
	k8XBZy9ZAYBLZh7vt/D0P7TqJl5TGayXCOom6Zf5YQgQVCH+n+OdM2kfQq222xYhulSOPOlOm
	4lrUhYAo6k79+6Q/SV1YeaWh0MN7aSZcgFLllg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: [Qemu-trivial] [PULL 3/3] tests/.gitignore: ignore
 test-qapi-emit-events.[ch] for in-tree builds
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
X-List-Received-Date: Thu, 14 Mar 2019 15:05:39 -0000

From: Stefano Garzarella <sgarzare@redhat.com>

Commit 5d75648b56e generates 'tests/test-qapi-emit-events.[ch]' but
did not ignore them for in-tree builds.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20190314104622.101715-3-sgarzare@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index c88f8f2537c2..f9c017088126 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -14,6 +14,7 @@ test-*
 test-qapi-commands.[ch]
 include/test-qapi-commands-sub-module.[ch]
 test-qapi-commands-sub-sub-module.[ch]
+test-qapi-emit-events.[ch]
 test-qapi-events.[ch]
 include/test-qapi-events-sub-module.[ch]
 test-qapi-events-sub-sub-module.[ch]
-- 
2.20.1


