Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXUht-0004RS-Fm
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 08:00:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WXUhj-0004C1-D7
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 08:00:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WXUha-0002TG-2e
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 08:00:39 -0400
Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229]:59918)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WXUhZ-0002Sl-P2; Tue, 08 Apr 2014 08:00:29 -0400
Received: by mail-pa0-f41.google.com with SMTP id fa1so942992pad.0
	for <multiple recipients>; Tue, 08 Apr 2014 05:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=XNmJsYdC500YBKb3t4Nurfv0SK4X13u09fIfvZo2jRI=;
	b=jIegTwbVeomMxTITbF6jKUTcPRZ5zBYENQVKKaMocPs24YLbuf5gABCgHIy5wWf+4E
	xNJT8FAYkeOEy2uNFmTqYKHfocNOSgX8VpHo3KoCkMtON5RjGV1zYPw0os9HC2+W2CwA
	mMpzHidA7rGEcObn4kOKxnkqwcTl45xfdz/QMakZmfR2DLvliJIbjyhtiVh7dTgUFYaO
	HqgzQRWJt3rExfTh8Vsc7fW6hHfQoo414MNOQ7nFLKZTjbPJmNFeoSRxxcFj/xOT9PWI
	r6UVzdai3Ak/mPIRVwNhfQxIp20E+FsvuYBj1PGVFGgiZHPAta52CkKk/GEf1M4/QiFg
	Aqyw==
X-Received: by 10.66.144.102 with SMTP id sl6mr4033794pab.96.1396958428626;
	Tue, 08 Apr 2014 05:00:28 -0700 (PDT)
Received: from [192.168.1.104] ([124.126.227.121])
	by mx.google.com with ESMTPSA id
	id10sm4199641pbc.35.2014.04.08.05.00.24 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Apr 2014 05:00:27 -0700 (PDT)
Message-ID: <5343E4D4.6070305@gmail.com>
Date: Tue, 08 Apr 2014 20:00:20 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <53337BEB.90305@gmail.com> <87wqfgrp83.fsf@blackfin.pond.sub.org>
	<5333F6E2.9080202@gmail.com> <53382DDD.8050001@gmail.com>
	<87fvlylf02.fsf@blackfin.pond.sub.org> <53396545.805@gmail.com>
	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>
	<533969AB.4010505@gmail.com>
	<CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>
	<53396CE9.9090405@gmail.com>
	<CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>
	<533E7DD5.3090203@gmail.com> <5340F4FD.7040305@msgid.tls.msk.ru>
	<53414941.5040908@gmail.com>
In-Reply-To: <53414941.5040908@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::229
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH trivial 0/3] vl: simplify code for main() and
	get_boot_device()
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
X-List-Received-Date: Tue, 08 Apr 2014 12:00:48 -0000

In "vl.c", at least, we can simplify the code below, so can let readers
read professional C code (especially for new readers, which often start
reading code at main function).

 - remove useless 'continue' in main().

 - remove redundant local variable 'res' in get_boot_device().

 - remove local variable 'args' in the middle of code block in main().

The following 3 patches are for the 3 'remove' above.

And "vl.c" has a very long function main() which is about 17K lines.
Next, it can be split into sub-functions (so can bypass another code
style issue: multiple "{...}" styles within "swith(...)").


Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 vl.c |   23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

