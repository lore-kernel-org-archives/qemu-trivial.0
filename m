Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekPUh-00055l-RN
	for mharc-qemu-trivial@gnu.org; Sat, 10 Feb 2018 02:22:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekPUf-00053L-62
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 02:22:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekPUe-0006LQ-AY
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 02:22:41 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58499)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ekPUa-0006IN-2h; Sat, 10 Feb 2018 02:22:36 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2AD304099D;
	Sat, 10 Feb 2018 10:22:35 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id A5ED1758;
	Sat, 10 Feb 2018 10:22:36 +0300 (MSK)
To: Andreas Gustafsson <gson@gson.org>, qemu-devel@nongnu.org
Cc: Kamil Rytarowski <kamil@NetBSD.org>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <23118.26328.811644.330716@guava.gson.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <461e6922-eb36-3945-3f1c-3886bb6cefa3@msgid.tls.msk.ru>
Date: Sat, 10 Feb 2018 10:22:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <23118.26328.811644.330716@guava.gson.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] oslib-posix: check for posix_memalign in
 configure script
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
X-List-Received-Date: Sat, 10 Feb 2018 07:22:42 -0000

04.01.2018 20:39, Andreas Gustafsson wrote:
> Check for the presence of posix_memalign() in the configure script,
> not using "defined(_POSIX_C_SOURCE) && !defined(__sun__)".  This
> lets qemu use posix_memalign() on NetBSD versions that have it,
> instead of falling back to valloc() which is wasteful when the
> required alignment is smaller than a page.

Applied to -trivial, thanks!

/mjt

