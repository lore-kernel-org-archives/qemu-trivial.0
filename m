Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4wPc-0000WL-TV
	for mharc-qemu-trivial@gnu.org; Wed, 18 Oct 2017 18:02:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1e4wPZ-0000TF-L8
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 18:02:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1e4wPY-0003uK-TS
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 18:02:01 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:57835)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1e4wPU-0003mr-1h; Wed, 18 Oct 2017 18:01:56 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 95FFA21335;
	Wed, 18 Oct 2017 18:01:55 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Wed, 18 Oct 2017 18:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=mesmtp; bh=TUJzqDt9Zhp9V7
	nJ9RsU0KuloO3kPkpBouku0OBf+Wg=; b=1hqkOk+b3Ql2GvDqes5fEfNNiiAn2X
	LitnR+mB4UCKAscC/cWhB4++7WEOORg8meCtGqLkBhAf3MZrbkC1XrEJNfF7DoVA
	RKrtDjC//ae5HDQXaDNXAmXr37wWRjOI3e8Zb7Y8oEiKhKZfFWHKefUvNgLMvSXb
	8F/8JWlaLIAa0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=TUJzqDt9Zhp9V7nJ9RsU0KuloO3kPkpBouku0OBf+Wg=; b=mX+QaGAg
	WDx0DsjoadIwr30iXe511cmhherKjFvIMwF3raAOZEMdhDTX+4kF2xvEuspljsGV
	DJse7zk3vwFwNYCTc6H0xOcb+p5IpxiRtwb+u9O96H/to5zSqnHNfFlDjGKW1LfP
	iDQGC541sLUemxT18brctcR6wH9MGwkK4xPrxYRC9zAVyn2fCiQ3eCjesGX5xohf
	Jcalaa9bc2Kl3+Iaj7KROdAFpdBwBjog95fudoCUMZfHwVbgVcERI2DMnqWArpZy
	PKQozU5P/3GTETLYlDhMwTMjxpex4ZakXSXMITwacIqOlU1oGist4Pw7AwSPuQ3J
	NrBC6U1ckY2Deg==
X-ME-Sender: <xms:U8_nWfSfcN_QIfA6bWU-h04jKNmIgvkXYfYMkaCUNwj0M5PB2z6LGA>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5960D247A7;
	Wed, 18 Oct 2017 18:01:55 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
Date: Wed, 18 Oct 2017 18:01:41 -0400
Message-Id: <1508364103-16131-3-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1508364103-16131-1-git-send-email-cota@braap.org>
References: <1508364103-16131-1-git-send-email-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: [Qemu-trivial] [PATCH 2/4] linux-user: fix 'finshed' typo in comment
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
X-List-Received-Date: Wed, 18 Oct 2017 22:02:02 -0000

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 linux-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 9d4cc4c..47b4a79 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6231,7 +6231,7 @@ static void *clone_func(void *arg)
     pthread_mutex_lock(&info->mutex);
     pthread_cond_broadcast(&info->cond);
     pthread_mutex_unlock(&info->mutex);
-    /* Wait until the parent has finshed initializing the tls state.  */
+    /* Wait until the parent has finished initializing the tls state.  */
     pthread_mutex_lock(&clone_lock);
     pthread_mutex_unlock(&clone_lock);
     cpu_loop(env);
-- 
2.7.4


