Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RcxW2-0000j8-8F
	for mharc-qemu-trivial@gnu.org; Tue, 20 Dec 2011 06:05:50 -0500
Received: from eggs.gnu.org ([140.186.70.92]:49900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1RcxVt-0000KT-6A
	for qemu-trivial@nongnu.org; Tue, 20 Dec 2011 06:05:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1RcxVn-0004aO-Er
	for qemu-trivial@nongnu.org; Tue, 20 Dec 2011 06:05:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:1848)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1RcxVb-0004YD-Ey; Tue, 20 Dec 2011 06:05:23 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pBKB5LOZ013357
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 20 Dec 2011 06:05:21 -0500
Received: from garlic.tlv.redhat.com (dhcp-4-31.tlv.redhat.com [10.35.4.31])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pBKB5IrC028432; Tue, 20 Dec 2011 06:05:19 -0500
From: Alon Levy <alevy@redhat.com>
To: kraxel@redhat.com
Date: Tue, 20 Dec 2011 13:05:18 +0200
Message-Id: <1324379118-2570-1-git-send-email-alevy@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] qemu-options.hx: fix tls-channel help text
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
X-List-Received-Date: Tue, 20 Dec 2011 11:05:48 -0000

Remove the default compiled out tunnel channel, add the always available
cursor channel. Optimally the man page would depend on compiled in
options, but that's harder to do.

RHBZ: 688586

Signed-off-by: Alon Levy <alevy@redhat.com>
---
 qemu-options.hx |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index a60191f..3c3bda8 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -857,8 +857,8 @@ The x509 file names can also be configured individually.
 @item tls-ciphers=<list>
 Specify which ciphers to use.
 
-@item tls-channel=[main|display|inputs|record|playback|tunnel]
-@item plaintext-channel=[main|display|inputs|record|playback|tunnel]
+@item tls-channel=[main|display|cursor|inputs|record|playback]
+@item plaintext-channel=[main|display|cursor|inputs|record|playback]
 Force specific channel to be used with or without TLS encryption.  The
 options can be specified multiple times to configure multiple
 channels.  The special name "default" can be used to set the default
-- 
1.7.8


