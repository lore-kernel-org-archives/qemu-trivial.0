Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dGMtq-0004DH-2T
	for mharc-qemu-trivial@gnu.org; Thu, 01 Jun 2017 06:00:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dGMto-0004Aa-A4
	for qemu-trivial@nongnu.org; Thu, 01 Jun 2017 06:00:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dGMtm-0005ZX-Ff
	for qemu-trivial@nongnu.org; Thu, 01 Jun 2017 06:00:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50841)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dGMtg-0005Uy-Cr; Thu, 01 Jun 2017 06:00:04 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 49DDA40122;
	Thu,  1 Jun 2017 13:00:03 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 223335DA;
	Thu,  1 Jun 2017 13:00:03 +0300 (MSK)
To: Kamil Rytarowski <n54@gmx.com>, qemu-trivial@nongnu.org
References: <20170531120049.14111-1-n54@gmx.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, marcandre.lureau@gmail.com,
	peter.maydell@redhat.com, eblake@redhat.com, f4bug@amsat.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <c967a222-e6f6-67b2-5227-895f8e43af32@msgid.tls.msk.ru>
Date: Thu, 1 Jun 2017 13:00:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170531120049.14111-1-n54@gmx.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v3] ivshmem-server: ivshmem-client: Build
 when eventfd() is available
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
X-List-Received-Date: Thu, 01 Jun 2017 10:00:13 -0000

31.05.2017 15:00, Kamil Rytarowski wrote:
> Currently ivshmem requires eventfd() which is Linux specific.
> Do not and build it unconditionally on every Linux/BSD/Solaris.
> 
> This patch indirectly fixes build failure on NetBSD, where these tools
> additionally require -lrt for shm_open(3). In future there should be
> added support for NetBSD and the linking addressed appropriately.

Applied to -trivial, thanks!

/mjt

