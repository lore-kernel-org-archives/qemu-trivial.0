Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ymm9p-0003wB-UV
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 12:45:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ymm9l-0003n3-Fb
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:45:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ymm9h-0001TS-61
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:45:17 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:45190)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ymm9g-0001T2-Uy
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:45:13 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 27FC520B12
	for <qemu-trivial@nongnu.org>; Mon, 27 Apr 2015 12:45:12 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute1.internal (MEProxy); Mon, 27 Apr 2015 12:45:12 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=pBWiqpoLDkf+aqCGjWhVn99os3U
	=; b=R9Dvv3euuFmmUBEN94SbK6qy/9M2LkpXGfBB8da13FuCzDWvC8sxe56c+GR
	sCOTQL+DH+nh9pthXmgtThNxkBce0H1jYDxRO34ByPVamQtGhW9LxOwYOiigh8oK
	YxfImCNi7l69caW3O1fybe/wYNXK5iwZ+9qLyXRZj9xUPfPI=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=pBWi
	qpoLDkf+aqCGjWhVn99os3U=; b=S8vcHjV98C7pA1aqeA45TrGMMxMrfrcLo8XU
	CzxXQAOrRQN1ZKzix/TAQMAIxb9gNHl+8FCnpivlp7kHmAADZJwVvRVSr8+43rWm
	4GcFzMl1lXT6tVQ+hgpITVDmKY41UQtcRcFSRSTF8wTFRPl2gX54UzFYq//6cuAg
	899Z3G0=
X-Sasl-enc: XkJE/l5jyLX0e5oXb26hE8bGbCSZKh+Y2owL4npd/KsL 1430153111
Received: from localhost (unknown [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id DF63CC00019;
	Mon, 27 Apr 2015 12:45:11 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Mon, 27 Apr 2015 12:45:28 -0400
Message-Id: <1430153133-30988-2-git-send-email-cota@braap.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430153133-30988-1-git-send-email-cota@braap.org>
References: <1430153133-30988-1-git-send-email-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.111.4.25
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH 1/6] cpus: use first_cpu macro instead of
	QTAILQ_FIRST(&cpus)
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
 cpus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cpus.c b/cpus.c
index e6dcae3..62d157a 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1016,7 +1016,7 @@ static void *qemu_tcg_cpu_thread_fn(void *arg)
     qemu_cond_signal(&qemu_cpu_cond);
 
     /* wait for initial kick-off after machine start */
-    while (QTAILQ_FIRST(&cpus)->stopped) {
+    while (first_cpu->stopped) {
         qemu_cond_wait(tcg_halt_cond, &qemu_global_mutex);
 
         /* process any pending work */
-- 
1.9.1


