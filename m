Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4wPc-0000VZ-FC
	for mharc-qemu-trivial@gnu.org; Wed, 18 Oct 2017 18:02:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1e4wPZ-0000TG-Nu
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 18:02:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1e4wPY-0003uc-V1
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 18:02:01 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:39079)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1e4wPU-0003oc-GS; Wed, 18 Oct 2017 18:01:56 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 0E32F21336;
	Wed, 18 Oct 2017 18:01:56 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Wed, 18 Oct 2017 18:01:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=mesmtp; bh=N1DX+AS86x3wUH
	hgAT84+6l3AcWrPA08aw4uby7Y1XA=; b=ASdUAdcre2lka/OhqShD6jSJTWJJp/
	Pdp1cc659H0zrBNZn3M/NjPZ5bnk7olToekdp4DQbT8Yjv+xcKu43Q9sQg/OcBTJ
	niZhuwziWcrGBL2NvW8/A6bJbbMPYkgzGcFqO72Mpg8jiM8Q8IGyGwb4RVjAm+5r
	4CIkNqi/xutmg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=N1DX+AS86x3wUHhgAT84+6l3AcWrPA08aw4uby7Y1XA=; b=LMej5kxM
	4p7dYZSHlVs6YMIFvHx7p+driVcyttzPKnlEhJFV9e8XITiCFg8H2bfF2mbT9UkK
	n3kpWGx+8Xx8wagUPTPoQBrWZZBPCo+0/alG+tH56jZ2FfjWFgHoJiSjM0FMbL8S
	EEHIUakQCBRNEPnJ0BlgDuC2wrW1GH9WVwEo7OKTk00RU77daS1gHnbDV3WkNKRU
	CnpUbU4HIM8IWouQS9UxNh3ozKHiujiyi7+97iaPswiFNn1QwhooVEb/FM2lOSpR
	5680W8QLYO2OEX7xBv2eHB9xLz7xWu0HxG1hpdSBrBYxb/W/zYHwOOOtIg9/0da5
	eP4dP23v57ZoBA==
X-ME-Sender: <xms:U8_nWeaTGfYbGGBCVFz45gjrCJ9tlkOfWpelR7Rik6FKlNZE-U-nDA>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id C3970247A7;
	Wed, 18 Oct 2017 18:01:55 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
Date: Wed, 18 Oct 2017 18:01:43 -0400
Message-Id: <1508364103-16131-5-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1508364103-16131-1-git-send-email-cota@braap.org>
References: <1508364103-16131-1-git-send-email-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: [Qemu-trivial] [PATCH 4/4] qht: fix kernel-doc markup in qht.h
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
X-List-Received-Date: Wed, 18 Oct 2017 22:02:03 -0000

While at it, s/stuct/struct/.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 include/qemu/qht.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qemu/qht.h b/include/qemu/qht.h
index 56c2c77..531aa95 100644
--- a/include/qemu/qht.h
+++ b/include/qemu/qht.h
@@ -166,7 +166,7 @@ void qht_iter(struct qht *ht, qht_iter_func_t func, void *userp);
 /**
  * qht_statistics_init - Gather statistics from a QHT
  * @ht: QHT to gather statistics from
- * @stats: pointer to a struct qht_stats to be filled in
+ * @stats: pointer to a &struct qht_stats to be filled in
  *
  * Does NOT need to be called under an RCU read-critical section,
  * since it does not dereference any pointers stored in the hash table.
@@ -177,8 +177,8 @@ void qht_iter(struct qht *ht, qht_iter_func_t func, void *userp);
 void qht_statistics_init(struct qht *ht, struct qht_stats *stats);
 
 /**
- * qht_statistics_destroy - Destroy a struct qht_stats
- * @stats: stuct qht_stats to be destroyed
+ * qht_statistics_destroy - Destroy a &struct qht_stats
+ * @stats: &struct qht_stats to be destroyed
  *
  * See also: qht_statistics_init().
  */
-- 
2.7.4


