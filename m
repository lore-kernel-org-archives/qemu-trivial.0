Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4wPi-0000bw-RD
	for mharc-qemu-trivial@gnu.org; Wed, 18 Oct 2017 18:02:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1e4wPg-0000Zq-GT
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 18:02:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1e4wPd-0003zQ-Do
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 18:02:08 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:47877)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1e4wPT-0003mB-Ry; Wed, 18 Oct 2017 18:01:55 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 3F57621333;
	Wed, 18 Oct 2017 18:01:55 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Wed, 18 Oct 2017 18:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc; s=mesmtp; bh=cU6QfXhZhrSCICO/pSeCYLY/kJZacA7OF9fc+Q
	2kxEg=; b=E03t6Z44NHHuQBISJOX/T8xMplZ1NsYjZ5JUC4lP7rFJ4LFdZheBkD
	UDZXmd7MZja855XmE2UF4TxPrjfPD4DT1d1ZmkW+vyKs2F4zX3nWYi+xTnSIVgVu
	5L/DZCGD4PsINRBePJWK39f71pXldj952jXpjWqYatpUB/sd4d8KU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=cU6QfXhZhrSCICO/p
	SeCYLY/kJZacA7OF9fc+Q2kxEg=; b=gRxhQj0TAHIoMWj03c7+GXWK9zvgQCI76
	xaNrNoinQ5Y1KngaiaJ/WC9EpPs4oOZoBpy+GrvGm2UKDBeZ2TYASng3qHuuRlhc
	B1s3owzn7x/wCSI1/TwQu8OVtdYx6bm92XLPe3WHHqiFc6CuI4zXBhkK+71dFgvt
	Bx44QZD3EdrweoBZpcIpSdRWBixbiXMaFp0PMSrHmZOBAZcAawmDrRxSIFRfVMd1
	/etr2axEptvQ+9TsQq6m4vmzSI9IMfywZPo/7h49zi6xAQALt8XROtmhbvoq/jif
	Jyczod42eqmygNCgzKaz/Nq37Sb6z8YHy2d4uGpKbaFmQUCSjLHBg==
X-ME-Sender: <xms:U8_nWXhrSEh9kWaB4JFxQBfbVFaZWNYZK0AV4Rgma0KpF3Ac1_PhYw>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id E65E2247AD;
	Wed, 18 Oct 2017 18:01:54 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
Date: Wed, 18 Oct 2017 18:01:39 -0400
Message-Id: <1508364103-16131-1-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: [Qemu-trivial] [PATCH 0/4] Some trivial fixes, mostly comment typos
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
X-List-Received-Date: Wed, 18 Oct 2017 22:02:09 -0000

A few trivial fixes that I embedded in a previous (unrelated) patchset.
Better to submit them separately as a standalone "trivial" patchset.

Note that in patch 1 I went with space indentation instead of
a hard tab just to appease checkpatch. However, the surrounding
code uses hard tabs. Wasn't sure what's preferred in cases like
this.

Thanks,

		Emilio


