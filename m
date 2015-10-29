Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zri1v-00027g-7z
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2015 03:53:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40684)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zri1s-00022y-1m
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:53:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zri1r-0008Hb-4F
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 03:53:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41795)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Zri1m-0008Gv-4v; Thu, 29 Oct 2015 03:53:42 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 42D9B42107;
	Thu, 29 Oct 2015 10:53:41 +0300 (MSK)
Message-ID: <5631D085.30604@msgid.tls.msk.ru>
Date: Thu, 29 Oct 2015 10:53:41 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org
References: <1444406198-6521-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1444406198-6521-1-git-send-email-thuth@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v2 0/4] Small optimizations for code
 using g_malloc0 + memset/memcpy
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
X-List-Received-Date: Thu, 29 Oct 2015 07:53:48 -0000

09.10.2015 18:56, Thomas Huth wrote:
> There are a couple of spots in the QEMU code which use g_malloc0,
> directly followed by a memset or memcpy which fill the whole
> allocated buffer. In this case it either does not make sense to
> zero the buffer via g_malloc0 first (so g_malloc should be used
> instead), or if the second command is a memset(..., 0, ...), then
> the memset does not make much sense, of course, since the buffer
> has already been zeroed by the g_malloc0.

Applied to -trivial, thanks!
The 4/4 patch has been picked up by Riku.

/mjt

