Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WW0bk-00044u-Kd
	for mharc-qemu-trivial@gnu.org; Fri, 04 Apr 2014 05:40:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WW0bZ-0003aU-Kl
	for qemu-trivial@nongnu.org; Fri, 04 Apr 2014 05:40:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WW0bQ-0006PK-KE
	for qemu-trivial@nongnu.org; Fri, 04 Apr 2014 05:40:09 -0400
Received: from mail-pb0-x22c.google.com ([2607:f8b0:400e:c01::22c]:32976)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WW0b8-0006Kz-A3; Fri, 04 Apr 2014 05:39:42 -0400
Received: by mail-pb0-f44.google.com with SMTP id rp16so3232304pbb.3
	for <multiple recipients>; Fri, 04 Apr 2014 02:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=c5jYVYJlc4mOkEkvv8frdYIDl3x5RlRmmRTVQmRLStM=;
	b=zVg53zB1YN1lf5ifdIQ8jHqaaJLh29miSpB5eKfbbvTVXvewS9+gaHJjwFgVWDh9v5
	NNbVcykr8fxCCNRdlBB80zLHfAESrBArhxiSNeVIgLAgw3l6KhmyrmQuvryoss9wu06f
	doks96212W23Vcfuc0nVWqIUE7aNc1zXhMglSgsdF3GPkdgwauA/Q6xGYm4VRxBKt4s4
	6Quhjh1aeK8qWcXdF+qNadO1NGaQ6QeCgqx8cq7bEKYd+I7GyGZ8F+UQIWYN+DtFlD4v
	C+j8bApEi4gQXAvMuDqiqnEzScHA4eSy6fkL7/NrxzQeBxPGyXYNIHZndcyRD805A51W
	Jk/A==
X-Received: by 10.69.1.69 with SMTP id be5mr13922162pbd.126.1396604380784;
	Fri, 04 Apr 2014 02:39:40 -0700 (PDT)
Received: from [192.168.1.104] ([124.126.231.64])
	by mx.google.com with ESMTPSA id
	aj7sm38043755pad.29.2014.04.04.02.39.36 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Apr 2014 02:39:39 -0700 (PDT)
Message-ID: <533E7DD5.3090203@gmail.com>
Date: Fri, 04 Apr 2014 17:39:33 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <53337BEB.90305@gmail.com> <87wqfgrp83.fsf@blackfin.pond.sub.org>
	<5333F6E2.9080202@gmail.com> <53382DDD.8050001@gmail.com>
	<87fvlylf02.fsf@blackfin.pond.sub.org> <53396545.805@gmail.com>
	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>
	<533969AB.4010505@gmail.com>
	<CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>
	<53396CE9.9090405@gmail.com>
	<CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>
In-Reply-To: <CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::22c
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH-trivial v2] vl: Report accelerator not
 supported for target more nicely
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
X-List-Received-Date: Fri, 04 Apr 2014 09:40:19 -0000

When you ask for an accelerator not supported for your target, you get
a bogus "accelerator does not exist" message:

  $ qemu-system-arm -machine none,accel=kvm
  KVM not supported for this target
  "kvm" accelerator does not exist.
  No accelerator found!

Suppress it.


Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 vl.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index 842e897..b4f98fa 100644
--- a/vl.c
+++ b/vl.c
@@ -2709,7 +2709,7 @@ static int configure_accelerator(QEMUMachine *machine)
                 if (!accel_list[i].available()) {
                     printf("%s not supported for this target\n",
                            accel_list[i].name);
-                    continue;
+                    break;
                 }
                 *(accel_list[i].allowed) = true;
                 ret = accel_list[i].init(machine);
-- 
1.7.9.5

