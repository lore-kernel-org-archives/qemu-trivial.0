Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ymm9v-00047b-Rj
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 12:45:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ymm9n-0003r6-7B
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:45:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ymm9h-0001Ut-Sz
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:45:19 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:39603)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ymm9h-0001Ul-Gk
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:45:13 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 4EFE120B24
	for <qemu-trivial@nongnu.org>; Mon, 27 Apr 2015 12:45:13 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute1.internal (MEProxy); Mon, 27 Apr 2015 12:45:13 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=Iu3kK4WVvNuVl8ktdBQ/9OOXhws
	=; b=DOP6yfSbuKyWwvciyIq/KHdIs30YPqJt6HVYYbttPPNveB/XNm3EIzyqsbe
	VxAhyLOJFYEJk4Lp3Nsk6Q4+fSjvmpPOcZCvm3Juuc7+fwJaq8OXxd7d7/GAgFWE
	H+NCLv0kiFaGu2MLKhiz6uO2XRKQfm/Xe57UxAbS0nAph9bw=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=Iu3k
	K4WVvNuVl8ktdBQ/9OOXhws=; b=efErQF9c/PCEk42qy8rkSmXa88rgB05V6zRO
	XFRdQ5UNgZs4HkmdKBZp6WbGXLab0qNXEAmGF5LlJTZu+2Bp7musLaN2jn7cHWPE
	4cewe/gsMmUHbypXLhI9ZUMhroNmrTrrN1qo7ngyTFa2c0WGv9xxy1PqmIWmhLo9
	zGzVmKI=
X-Sasl-enc: DRGaEW/gzmyoQCpvhRlUpmJkkHA8nKMEzXE9WkP9QNi8 1430153113
Received: from localhost (unknown [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1378D680110;
	Mon, 27 Apr 2015 12:45:13 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Mon, 27 Apr 2015 12:45:33 -0400
Message-Id: <1430153133-30988-7-git-send-email-cota@braap.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430153133-30988-1-git-send-email-cota@braap.org>
References: <1430153133-30988-1-git-send-email-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.111.4.25
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>
Subject: [Qemu-trivial] [PATCH 6/6] linux-user/elfload: use QTAILQ_FOREACH
	instead of open-coding it
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
X-List-Received-Date: Mon, 27 Apr 2015 16:45:21 -0000

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 linux-user/elfload.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 399c021..0ba9706 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2887,8 +2887,7 @@ static int write_note_info(struct elf_note_info *info, int fd)
             return (error);
 
     /* write prstatus for each thread */
-    for (ets = info->thread_list.tqh_first; ets != NULL;
-         ets = ets->ets_link.tqe_next) {
+    QTAILQ_FOREACH(ets, &info->thread_list, ets_link) {
         if ((error = write_note(&ets->notes[0], fd)) != 0)
             return (error);
     }
-- 
1.9.1


