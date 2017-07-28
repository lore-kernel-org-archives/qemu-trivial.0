Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dau2V-0002UD-4X
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 21:26:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35442)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2S-0002Rt-OM
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 21:26:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2R-00023M-VT
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 21:26:00 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:36139)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2Q-00021W-06; Thu, 27 Jul 2017 21:25:58 -0400
Received: by mail-qk0-x244.google.com with SMTP id d136so19919278qkg.3;
	Thu, 27 Jul 2017 18:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cdliJG+Ez4peHiiJiBAn8mfrYdfjl5jQ54nHZoJuWGQ=;
	b=csbkxAFacVYMoW1JcCWa97/JqlSAqm4CkbaDOGod1JEsrMEXeepPOJsIqpMdbIkXSM
	/062lYxmum76qo9odY1v9NIsL+d51/1IJQOTAnpFrUIUdodOFLpxm9bzjzQGj8Wp4UcV
	tjFXWYwzz6n+UBFPH9JqLarlzQcBl5tssc3U7RjX4uLJ6XmxLi8nC3Q98C0lJcim2qq5
	FWyyRW+wktKXMlcYHp+jDP5H6H9sKyrQnzp8Wc3fczZhMo6hgHEevph8MD1PqJZKAci4
	PpmQZex3JB+sYvdkPWg5NPS93wzcEISFXDK9u2PxSJdhQNhaLB1RkEiPvxPMaiL3O2Ot
	wjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=cdliJG+Ez4peHiiJiBAn8mfrYdfjl5jQ54nHZoJuWGQ=;
	b=QGP41J+XBRekKlSwyz47T+wRmhc6JcHPU8ymKwdrahXnuMGUT/l9f3FepGPTgcFJ/P
	geXOfi6m+T3MRFn52cKlIQCh/agHCYCyxW0rFfGlJe9rBJ0vGQ5XdyGuyOdP5DDTtBYg
	lv55TJ69hn4W7ZDb8VomLRw9pwK0CzmVZrK8bFn0IhNeRWvXNY1YqKZ+RevXG5JxU3zx
	rBs+XHcRG8kWFWucnWT1UUuu3Exkr/e6bqpxf/8tYb39YFIYTlFC0Vyr2JAe08YtPe9P
	2UjEhswIr8x1MR4P/Ea+ivG7PqwT53j3j+0VQ9cikEA1FiCoveEMsDFXv7OMrjXaw56d
	Z9bw==
X-Gm-Message-State: AIVw112X+0LQWidkyPY8b2neGddmBltHwbNK5A8SGAp9+lj83pX36+uZ
	2fBppxd7VGYD5StSMEWJ0w==
X-Received: by 10.55.12.4 with SMTP id 4mr8703924qkm.151.1501205157554;
	Thu, 27 Jul 2017 18:25:57 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	o97sm15010202qte.56.2017.07.27.18.25.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 18:25:57 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alberto Garcia <berto@igalia.com>, Max Reitz <mreitz@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Date: Thu, 27 Jul 2017 22:25:36 -0300
Message-Id: <20170728012542.29975-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728012542.29975-1-f4bug@amsat.org>
References: <20170728012542.29975-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH for 2.10 2/8] docs: fix broken paths to
 docs/interop/qcow2.txt
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
X-List-Received-Date: Fri, 28 Jul 2017 01:26:01 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/qcow2-cache.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/qcow2-cache.txt b/docs/qcow2-cache.txt
index 1fdd6f9ce7..b0571de4b8 100644
--- a/docs/qcow2-cache.txt
+++ b/docs/qcow2-cache.txt
@@ -15,7 +15,7 @@ not a straightforward operation.
 This document attempts to give an overview of the L2 and refcount
 caches, and how to configure them.
 
-Please refer to the docs/specs/qcow2.txt file for an in-depth
+Please refer to the docs/interop/qcow2.txt file for an in-depth
 technical description of the qcow2 file format.
 
 
-- 
2.13.3


