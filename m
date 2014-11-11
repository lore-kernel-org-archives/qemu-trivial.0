Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoCRi-0002RZ-9x
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 09:29:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCRb-0002J3-5V
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:29:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCRU-0001sK-RM
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:29:19 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:54020)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XoCRG-0001pV-FM; Tue, 11 Nov 2014 09:28:58 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C026641DE5;
	Tue, 11 Nov 2014 17:28:57 +0300 (MSK)
Message-ID: <54621D29.7020500@msgid.tls.msk.ru>
Date: Tue, 11 Nov 2014 17:28:57 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: Chen Fan <chen.fan.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org
References: <1415176833-26438-1-git-send-email-chen.fan.fnst@cn.fujitsu.com>
In-Reply-To: <1415176833-26438-1-git-send-email-chen.fan.fnst@cn.fujitsu.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] target-i386: cpu: keeping function
 parameters alignment on new line
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
X-List-Received-Date: Tue, 11 Nov 2014 14:29:25 -0000

> -static int sstrcmp(const char *s1, const char *e1, const char *s2,
> -    const char *e2)
> +static int sstrcmp(const char *s1, const char *e1,
> +                   const char *s2, const char *e2)
...

Not that it's hugely important, but since the patch is here anyway,
there's no reason to not apply it.  Thanks,

/mjt

