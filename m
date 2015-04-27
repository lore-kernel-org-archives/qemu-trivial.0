Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ymm9w-000490-FY
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 12:45:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ymm9n-0003r0-5P
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:45:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ymm9h-0001Uc-Du
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:45:19 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:44333)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ymm9h-0001Tp-9k
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:45:13 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 1733E20B12
	for <qemu-trivial@nongnu.org>; Mon, 27 Apr 2015 12:45:13 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute1.internal (MEProxy); Mon, 27 Apr 2015 12:45:13 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=p7IaamHw3qGeCd3ElUJAua2jf+Q
	=; b=MSkg6hyobksqyN6twSk8bp3VgZgfUu4Tstp+cwoNGJXo3lqVGkHwGrIg83a
	1pIoFvYlsBY7hXP3cUFNGgLWwRov2jPxhTb+M0qN7jmH7sGJfLcBP0rpiWKv1xbU
	Tmvepcwn/eS1vYVjqFJROKrCRivgbgB6/7yiKCTBXnim+30w=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=p7Ia
	amHw3qGeCd3ElUJAua2jf+Q=; b=HH5jIOvxafW+kYNJP5r/5pcBPajxsghVPf4k
	A5T9QO+i6lb6/Xnl46tsBAsVz0fqZ0QtfDX5ctSn77oI8x6XluE52yaqF5/T/IN9
	iEaoL9wHLOOZ2f4ai+Fu3Zs73QMbpvoDAYUroQYKQZgDc3sgehr7M/wXECbCg8MK
	t6IY/k0=
X-Sasl-enc: oVaqTvgwWtiFDTJ7RPP3ceawBhMYtdDQyN24PJUAAL/M 1430153112
Received: from localhost (unknown [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id D2F20C00019;
	Mon, 27 Apr 2015 12:45:12 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Mon, 27 Apr 2015 12:45:32 -0400
Message-Id: <1430153133-30988-6-git-send-email-cota@braap.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430153133-30988-1-git-send-email-cota@braap.org>
References: <1430153133-30988-1-git-send-email-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.111.4.25
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 5/6] coroutine: remove unnecessary
	parentheses in qemu_co_queue_empty
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
 qemu-coroutine-lock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-coroutine-lock.c b/qemu-coroutine-lock.c
index e4860ae..6b49033 100644
--- a/qemu-coroutine-lock.c
+++ b/qemu-coroutine-lock.c
@@ -108,7 +108,7 @@ bool qemu_co_enter_next(CoQueue *queue)
 
 bool qemu_co_queue_empty(CoQueue *queue)
 {
-    return (QTAILQ_FIRST(&queue->entries) == NULL);
+    return QTAILQ_FIRST(&queue->entries) == NULL;
 }
 
 void qemu_co_mutex_init(CoMutex *mutex)
-- 
1.9.1


