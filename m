Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daYm2-00066s-Er
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 22:43:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYm0-00064f-8c
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlz-0008MR-DY
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:36 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:38228)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlw-0008KY-TA; Wed, 26 Jul 2017 22:43:32 -0400
Received: by mail-qk0-x242.google.com with SMTP id v76so5570737qka.5;
	Wed, 26 Jul 2017 19:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=01ywgbYAmvRif3f1oGnhtntNv5w9K5Glmnc9tmFpHxE=;
	b=KFFbkNlhCFwtPCH+mJ4MFLK4y3IlUoEDJ51rbDiJn7bKv98K3t5B5IuoAbnm62z13T
	UaIYdV3NQbjxZg8S6sum55h05AdIOJdbrQy7yWeBnLVEcBSleBFa0m7HmGbH2hhh6trl
	zgwnnBWdKsTZo8Zdb4X0p4ZfXavwwnkQ/dgNSvj1+BJwyGHQV/971heXSP/UXjPi2idY
	kXPaG+b6DEkbQDmNmLWi4BBTfG7QbIeTatB7KYCmDXrYM2LYXv1QK07QUUgVS6DqXvrc
	2C/PY6+hg0NDXjSkjhPHLifleK5EefXWAGYgFzp9b9kMl0Cyk5Vmsf/r1AaQKfU3O/u8
	LqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=01ywgbYAmvRif3f1oGnhtntNv5w9K5Glmnc9tmFpHxE=;
	b=dlaQgC7EFvxA1id7r3h7f0I6DdphjEadWGcjasANoUy/KmPQXc/NSVgZ+fnR7H5xZu
	IwIe7LHmxey+rFu4tLGLkQEIttGx3pK1nTYWNAXXiIlhsRdcly+irg8394It7HIQQuUW
	eBddtVe7xrFr2ii54YJGvtBd76HDiKJmQUFXke/CQumMnouKlXgObMf3y90bPA6BTcNZ
	C8m/U+cI12r8RoCCpC5Mfndyj9LouyOFiCamsm9+kdvyCJq8KECHIbDfhnEtz3CJLV+z
	nE25CrsTklAoo9iXmgZmskb77Ewy6oKAZkUIYsFnNighI7Fv7O5gjslJno1p7yvhxraX
	sRjg==
X-Gm-Message-State: AIVw110QpFGgw99ljxJB+4rSQJW4ztk+JJL2LBwWAnTwgFCYmcrUwVll
	qtrVfK5aDCkBYw==
X-Received: by 10.55.80.6 with SMTP id e6mr4185074qkb.109.1501123412361;
	Wed, 26 Jul 2017 19:43:32 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	g27sm13221147qtg.84.2017.07.26.19.43.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 19:43:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
Date: Wed, 26 Jul 2017 23:42:23 -0300
Message-Id: <20170727024224.22900-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170727024224.22900-1-f4bug@amsat.org>
References: <20170727024224.22900-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH for 2.10 v2 19/20] spapr_vio: fix overflow of
 qdevs in spapr_dt_vdevice()
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
X-List-Received-Date: Thu, 27 Jul 2017 02:43:37 -0000

sizeof(ptr) was used instead of sizeof(struct)...

also use g_malloc_n() which take care of possible type overflow.

hw/ppc/spapr_vio.c:641:22: warning: The code calls sizeof() on a pointer type. This can produce an unexpected result
    qdevs = g_malloc(sizeof(qdev) * num);
                     ^     ~~~~~~
hw/ppc/spapr_vio.c:648:23: warning: The code calls sizeof() on a pointer type. This can produce an unexpected result
    qsort(qdevs, num, sizeof(qdev), compare_reg);
                      ^     ~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ppc/spapr_vio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
index ea3bc8bd9e..9991b44c9f 100644
--- a/hw/ppc/spapr_vio.c
+++ b/hw/ppc/spapr_vio.c
@@ -638,14 +638,14 @@ void spapr_dt_vdevice(VIOsPAPRBus *bus, void *fdt)
     }
 
     /* Copy out into an array of pointers */
-    qdevs = g_malloc(sizeof(qdev) * num);
+    qdevs = g_malloc_n(num, sizeof(*qdev));
     num = 0;
     QTAILQ_FOREACH(kid, &bus->bus.children, sibling) {
         qdevs[num++] = kid->child;
     }
 
     /* Sort the array */
-    qsort(qdevs, num, sizeof(qdev), compare_reg);
+    qsort(qdevs, num, sizeof(*qdev), compare_reg);
 
     /* Hack alert. Give the devices to libfdt in reverse order, we happen
      * to know that will mean they are in forward order in the tree. */
-- 
2.13.3


