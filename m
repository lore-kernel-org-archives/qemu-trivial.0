Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ymm9q-0003wo-7R
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 12:45:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ymm9m-0003pD-FV
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:45:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ymm9h-0001U2-Bz
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:45:18 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:43835)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ymm9h-0001TL-8f
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:45:13 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 9ED2620B3C
	for <qemu-trivial@nongnu.org>; Mon, 27 Apr 2015 12:45:12 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Mon, 27 Apr 2015 12:45:12 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=LKgLJZAJO+dkPn4zDWsP8l91zn8
	=; b=jyddCtiv7RDusllG49V3Uyya4pQoaxfnwQwJI3OWmTgXZqAD+Z1wBOtn9nv
	VnE7fn7nFaeOdLK+QtXIvLk2vSSJBNsGc7T50Mg46koBf8Sk79a4rk37A4AGlRtH
	bFmcsRWubDzdZI7jV636vy2g1I0YBPI6L5FE1PjPK6Ddas+k=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=LKgL
	JZAJO+dkPn4zDWsP8l91zn8=; b=Ods+zsk0edyIPUBikr0mss4XbdGRVq5Vht4+
	AMPpUyFWiNowIQCDFFR6IB4Lr5ehI4PqCuOLs21ilKMxhVoVoNvZET6H/3YJAusy
	tHMQpT0C+iglx6FgRteAlfQjpe3Ono+YETA51GO1TTRa7HmVkT40g36zU34+bMAA
	AmyNneY=
X-Sasl-enc: oValVPIzQ9GBEiZwRfb3ceawBhMYtdDQyN24PJUAAL/M 1430153112
Received: from localhost (unknown [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 627D4C0001B;
	Mon, 27 Apr 2015 12:45:12 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Mon, 27 Apr 2015 12:45:30 -0400
Message-Id: <1430153133-30988-4-git-send-email-cota@braap.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430153133-30988-1-git-send-email-cota@braap.org>
References: <1430153133-30988-1-git-send-email-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.111.4.25
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH 3/6] qemu-char: remove unused list node from
	FDCharDriver
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
X-List-Received-Date: Mon, 27 Apr 2015 16:45:19 -0000

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 qemu-char.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/qemu-char.c b/qemu-char.c
index a405d76..d0c1564 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -973,7 +973,6 @@ typedef struct FDCharDriver {
     CharDriverState *chr;
     GIOChannel *fd_in, *fd_out;
     int max_size;
-    QTAILQ_ENTRY(FDCharDriver) node;
 } FDCharDriver;
 
 /* Called with chr_write_lock held.  */
-- 
1.9.1


