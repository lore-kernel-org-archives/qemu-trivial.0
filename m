Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOXwA-0001Hm-Ot
	for mharc-qemu-trivial@gnu.org; Fri, 14 Mar 2014 15:38:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOXw2-000126-7J
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 15:38:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOXvw-0006Zs-7U
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 15:38:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33433)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WOXvk-00069U-09; Fri, 14 Mar 2014 15:38:08 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id AB84441C8B;
	Fri, 14 Mar 2014 23:38:06 +0400 (MSK)
Message-ID: <53235A9E.1060505@msgid.tls.msk.ru>
Date: Fri, 14 Mar 2014 23:38:06 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Laszlo Ersek <lersek@redhat.com>
References: <7bd1da678bd39335a69894433070611baf7c2968.1394815484.git.crobinso@redhat.com>
	<53234AB9.8050008@redhat.com>
In-Reply-To: <53234AB9.8050008@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>, Cole Robinson <crobinso@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.0]
 scripts/make-release: Don't distribute .git directories
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
X-List-Received-Date: Fri, 14 Mar 2014 19:38:32 -0000

14.03.2014 22:30, Laszlo Ersek wrote:
[]
> but did you in fact mean
> 
>   pixman/*.git
> 
> rather tan
> 
>   pixman/.git

This has been fixed in a v2 patch, which I applied to -trivial.

Thanks,

/mjt

