Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXUix-0005y5-Vj
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 08:01:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WXUin-0005mh-Cu
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 08:01:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WXUie-00032x-7z
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 08:01:45 -0400
Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234]:48103)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WXUie-00032j-1y; Tue, 08 Apr 2014 08:01:36 -0400
Received: by mail-pd0-f180.google.com with SMTP id v10so903033pde.25
	for <multiple recipients>; Tue, 08 Apr 2014 05:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=kCmJcnDnlUL8Wm+jUfwb7zK3JJIxTmHDGaZdU2i4Vmo=;
	b=lGLQJpNrwZOrMkF191zKsWZAVp2nSAB5zsjNkA2wx77+1p6kMWOlgvjItWPmtq2nFN
	NLWrGlN6KxLUzxL+41g7y9d6oyNPGwa9gG5gcHkoEpWV8vrpF3X/ceFXmiGoHJGLa3eu
	L6qT308erTvMUXpbx3YgNZo9AIeClvIUcfUtSvRcpdHxjehFNOiDnI4UPPL4uzGtxQvg
	AzPJZ1r61IB0RTtqEubNqb8gPmG4wIRGbWyXbPDttW1T8ezRm7u3amhpIHHkemknrDjc
	E9DYNI7zeG23jGZ7ojZlco+YGo3Khs4JlK+7gH/EcpmccjFZXWuQQL0IqVlYx6zAWYeX
	GbmA==
X-Received: by 10.66.136.131 with SMTP id qa3mr3996832pab.77.1396958494789;
	Tue, 08 Apr 2014 05:01:34 -0700 (PDT)
Received: from [192.168.1.104] ([124.126.227.121])
	by mx.google.com with ESMTPSA id wp3sm4188756pbc.67.2014.04.08.05.01.29
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Apr 2014 05:01:34 -0700 (PDT)
Message-ID: <5343E516.3020103@gmail.com>
Date: Tue, 08 Apr 2014 20:01:26 +0800
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
	<53414941.5040908@gmail.com> <5343E4D4.6070305@gmail.com>
In-Reply-To: <5343E4D4.6070305@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::234
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH trivial 1/3] vl: remove useless 'continue'
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
X-List-Received-Date: Tue, 08 Apr 2014 12:01:54 -0000

Normal "if (...) {...} else {...}" is enough in "while(...) {...}", not
need additional useless 'continue'.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 vl.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/vl.c b/vl.c
index 9975e5a..7505002 100644
--- a/vl.c
+++ b/vl.c
@@ -3034,7 +3034,6 @@ int main(int argc, char **argv, char **envp)
         if (argv[optind][0] != '-') {
             /* disk image */
             optind++;
-            continue;
         } else {
             const QEMUOption *popt;
 
-- 
1.7.9.5

