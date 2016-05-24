Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b5B0F-0008RQ-1N
	for mharc-qemu-trivial@gnu.org; Tue, 24 May 2016 08:00:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1b5B0C-0008Ob-7v
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 08:00:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1b5B0B-0005LC-7S
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 08:00:00 -0400
Received: from smtp3.mundo-r.com ([212.51.32.191]:57057 helo=smtp4.mundo-r.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>)
	id 1b5B06-00054w-Gj; Tue, 24 May 2016 07:59:54 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2ALAgBkQURX/5tjdVtcgzeBU6VBCwUBgQ+RDoIPAQ2BdhKFf4E1OBQBAQEBAQEBZSeFQoEdNIgzAcRghV+KH4RyHAWIBJAzjiACgWeHWCOFNgKPTB4BAUKBNgGCODoyiVEBAQE
X-IPAS-Result: A2ALAgBkQURX/5tjdVtcgzeBU6VBCwUBgQ+RDoIPAQ2BdhKFf4E1OBQBAQEBAQEBZSeFQoEdNIgzAcRghV+KH4RyHAWIBJAzjiACgWeHWCOFNgKPTB4BAUKBNgGCODoyiVEBAQE
X-IronPort-AV: E=Sophos;i="5.26,359,1459807200"; d="scan'208";a="10831458"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 24 May 2016 13:59:16 +0200
Received: from [192.168.13.244] (helo=perseus.local)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1b5AzU-0000Wt-AE; Tue, 24 May 2016 13:59:16 +0200
Received: from berto by perseus.local with local (Exim 4.87)
	(envelope-from <berto@igalia.com>)
	id 1b5AzU-0002sz-5Q; Tue, 24 May 2016 14:59:16 +0300
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Alberto Garcia <berto@igalia.com>
Date: Tue, 24 May 2016 13:59:13 +0200
Message-Id: <1464091153-11057-1-git-send-email-berto@igalia.com>
X-Mailer: git-send-email 2.8.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.51.32.191
Subject: [Qemu-trivial] [PATCH] docs: Fix a couple of typos in throttle.txt
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
X-List-Received-Date: Tue, 24 May 2016 12:00:01 -0000

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 docs/throttle.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/throttle.txt b/docs/throttle.txt
index 06ed9b3..b4431f6 100644
--- a/docs/throttle.txt
+++ b/docs/throttle.txt
@@ -39,7 +39,7 @@ the parameters for both cases:
 | throttling.bps-write  | bps_wr                |
 |-----------------------+-----------------------|
 
-It is possible to set limits for both IOPS and bps and the same time,
+It is possible to set limits for both IOPS and bps at the same time,
 and for each case we can decide whether to have separate read and
 write limits or not, but note that if iops-total is set then neither
 iops-read nor iops-write can be set. The same applies to bps-total and
@@ -235,7 +235,7 @@ consider the following values:
   - Water leaks from the bucket at a rate of 100 IOPS.
   - Water can be added to the bucket at a rate of 2000 IOPS.
   - The size of the bucket is 2000 x 60 = 120000
-  - If 'iops-total-max-length' is unset then the bucket size is 100.
+  - If 'iops-total-max' is unset then the bucket size is 100.
 
 The bucket is initially empty, therefore water can be added until it's
 full at a rate of 2000 IOPS (the burst rate). Once the bucket is full
-- 
2.8.1


