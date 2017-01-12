Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cRd1w-00005Q-Cx
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2017 05:54:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRd1t-0008VA-Qm
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 05:54:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRd1s-00037m-Ff
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 05:54:49 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:45437)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cRd1m-00031Q-PI; Thu, 12 Jan 2017 05:54:42 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E1EE540A29;
	Thu, 12 Jan 2017 13:54:37 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 26DF154C;
	Thu, 12 Jan 2017 13:54:37 +0300 (MSK)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20170104150525.4246-1-pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <984ba1ed-c50e-7d99-f060-9ca5bc40d341@msgid.tls.msk.ru>
Date: Thu, 12 Jan 2017 13:54:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170104150525.4246-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] pci-assign: avoid pointless stat
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
X-List-Received-Date: Thu, 12 Jan 2017 10:54:51 -0000

04.01.2017 18:05, Paolo Bonzini wrote:
> Just check the errno value after fopen and follow it with fstat.
> This shuts up Coverity's complaint about TOC/TOU violation.

Applied to -trivial, thanks!

/mjt

