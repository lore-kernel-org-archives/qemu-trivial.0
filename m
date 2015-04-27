Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ymm9v-00046g-9l
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 12:45:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ymm9m-0003p4-Cg
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:45:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ymm9h-0001UC-CL
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:45:18 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:41251)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ymm9h-0001TI-8j
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:45:13 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 6673520B4B
	for <qemu-trivial@nongnu.org>; Mon, 27 Apr 2015 12:45:12 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute6.internal (MEProxy); Mon, 27 Apr 2015 12:45:12 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=DnlbAyz5R3nK4yquBXcoXO4PeIQ
	=; b=zRts/55JjKx8LMjXGrj44Tu6ko7iDIrpa6VCMTOei5aio5NEVaxi2oxGXw1
	+a7CDqfMSHwpeS3/P4iMv/L86J/fNmfMz74Uy/nkJg5eXKvb0E1wO/jO86tC36BT
	m1ZUo92En68rQPDkl9ugYQw7o0gMa4ev6RTbH1naJTrRSpZo=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=Dnlb
	Ayz5R3nK4yquBXcoXO4PeIQ=; b=mt/27GoEBaMf22LmxOtn4dZPaojq5zisMLFE
	0ClWhHjHbCpzx73Pooqe4X++1lc4uVbRpYWAeAGamol9IkNjd0Y15HifNjUhCOPm
	I7qlxzwuxkMyi/54GBDqlIYhNkjs9+DWdkVoK07iJ0Gr7xSqaCVJ9casmJ29sqfI
	rrt08cc=
X-Sasl-enc: oVa2SfIoRNeVDTd0W/n3ceawBhMYtdDQyN24PJUAAL/M 1430153112
Received: from localhost (unknown [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 24802680226;
	Mon, 27 Apr 2015 12:45:12 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Mon, 27 Apr 2015 12:45:29 -0400
Message-Id: <1430153133-30988-3-git-send-email-cota@braap.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430153133-30988-1-git-send-email-cota@braap.org>
References: <1430153133-30988-1-git-send-email-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.111.4.25
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH 2/6] input: remove unused mouse_handlers list
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
X-List-Received-Date: Mon, 27 Apr 2015 16:45:20 -0000

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 ui/input-legacy.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/ui/input-legacy.c b/ui/input-legacy.c
index 2d4ca19..3e9bb38 100644
--- a/ui/input-legacy.c
+++ b/ui/input-legacy.c
@@ -57,8 +57,6 @@ struct QEMUPutLEDEntry {
 
 static QTAILQ_HEAD(, QEMUPutLEDEntry) led_handlers =
     QTAILQ_HEAD_INITIALIZER(led_handlers);
-static QTAILQ_HEAD(, QEMUPutMouseEntry) mouse_handlers =
-    QTAILQ_HEAD_INITIALIZER(mouse_handlers);
 
 int index_from_key(const char *key)
 {
-- 
1.9.1


