Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fob9U-0005XN-AH
	for mharc-qemu-trivial@gnu.org; Sat, 11 Aug 2018 17:10:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1fob9S-0005VQ-3W
	for qemu-trivial@nongnu.org; Sat, 11 Aug 2018 17:10:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1fob9R-0005TZ-24
	for qemu-trivial@nongnu.org; Sat, 11 Aug 2018 17:10:22 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:54941)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1fob9M-0005PF-KL; Sat, 11 Aug 2018 17:10:16 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 521832D1;
	Sat, 11 Aug 2018 17:10:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute4.internal (MEProxy); Sat, 11 Aug 2018 17:10:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc; s=mesmtp; bh=kSnDuXIW3yXAXfQSjgtjxG55Mi80boeXHIxzuN
	3ynQI=; b=Kuitp9Ku/VWHEsxF2LwklgRxaIUB76nBsgI6us6pM42pKNn1FiyHHf
	ZeTqSIO56xB05Euevk7pShPpJAYT8AZLa3F1LYedijJuEQGLiY1orY+aQhyyssdG
	NdmhlBnxSrH1Rl6CUG8MJjQGR/FwgtjE+0eT+vSBqWKl0ba0/RtSw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=kSnDuXIW3yXAXfQSj
	gtjxG55Mi80boeXHIxzuN3ynQI=; b=Cm1gI1eCY+yRDvsqm/MBkB+Wt2vkzgXui
	nKVwvMieM0ge29FjxGQUUV8LWnw7oBtxGCcg25jBepx6NG+tqsXTSKZkF9wQafd3
	N41CgKNr8Umk7sStinJ/+p+HfUSDtCdoR9fd4NhdWVKNAJOnrJorlnoq2Af1Tf9x
	cn69E9QyTBnKYYiCdt/40WYm2d9UwaJWKbh24jasN9AaLd6EGIw2KU8Cs4lu/LKp
	BUTcijPZK54DwB+sGMzW/apuZ8hi5qpAmALXs13SQwbLqwylWgo+4XyDOumjkA/Q
	rP0ztqZkmGJlCtNCKDCpDVQd2ozmuVRFrQqpu2jJVnyQuCsQqP0sw==
X-ME-Proxy: <xmx:tFBvW0_g3lM8v_cF2_u0aJQsgDzif8q4By_gOnn15Jm-dzb3WT1mXQ>
	<xmx:tFBvW85xiXI0BGlRoBrK7LG4ob2KNI1fermSFDlV7HarIHFsV_53HA>
	<xmx:tFBvW73RhvbKLsn1pO4dxvRjUwK4ae7hG3uhd2saj-liK_a7JGELtg>
	<xmx:tFBvWzCZ2UFzB5c49WWRGMWHZEObR92MOnbTH2ILJF7p6Z9lVz9tiA>
	<xmx:tFBvW91EH_8VMHvhov02lroymBRbhV0usNHuFSnFb7GFk9D0PAs4tA>
	<xmx:tFBvW7yNZOfroEB-87U-fX3nvmxOFQgkCt1OOhCOtC1BbIoT5eBEcQ>
X-ME-Sender: <xms:tFBvW8q3ynXfzfFEv9bRUdnh4jFg8iQVrOq8-C7PfNZI7368KjAoVw>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4A27010255;
	Sat, 11 Aug 2018 17:10:12 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
	qemu-trivial@nongnu.org
Date: Sat, 11 Aug 2018 17:10:11 -0400
Message-Id: <20180811211011.6277-1-cota@braap.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 64.147.123.25
Subject: [Qemu-trivial] [PATCH] linux-user: fix comment
 s/atomic_write/atomic_set/
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
X-List-Received-Date: Sat, 11 Aug 2018 21:10:23 -0000

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 linux-user/qemu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index b4959e41c6..e6a8bc5867 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -143,7 +143,7 @@ typedef struct TaskState {
     /* Nonzero if process_pending_signals() needs to do something (either
      * handle a pending signal or unblock signals).
      * This flag is written from a signal handler so should be accessed via
-     * the atomic_read() and atomic_write() functions. (It is not accessed
+     * the atomic_read() and atomic_set() functions. (It is not accessed
      * from multiple threads.)
      */
     int signal_pending;
-- 
2.17.1


