Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db3In-0006ch-RI
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 07:19:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1db3Il-0006ad-4F
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:19:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1db3Ik-0007iI-DV
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:19:27 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55079)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1db3Id-0007AD-Hv; Fri, 28 Jul 2017 07:19:19 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 152924283F;
	Fri, 28 Jul 2017 14:19:07 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 1A38B5E0;
	Fri, 28 Jul 2017 14:19:05 +0300 (MSK)
To: Eduardo Otubo <otubo@redhat.com>, qemu-trivial@nongnu.org
References: <20170727143040.7236-1-otubo@redhat.com>
Cc: kbastian@mail.uni-paderborn.de, thuth@redhat.com, qemu-devel@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <9858302e-566c-2ce8-45a1-29a5551bc367@msgid.tls.msk.ru>
Date: Fri, 28 Jul 2017 14:19:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170727143040.7236-1-otubo@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] qemu-system-tricore: segfault when entering "x
 0" on the monitor
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
X-List-Received-Date: Fri, 28 Jul 2017 11:19:28 -0000

27.07.2017 17:30, Eduardo Otubo wrote:
> Starting Qemu with "qemu-system-tricore -nographic -M tricore_testboard -S"
> and entering "x 0" at the monitor prompt leads to Segmentation fault. This happens
> because tricore_cpu_get_phys_page_debug() is not implemented yet, this
> is a temporary workaround to avoid the crash.

Applied to -trivial, without the extra newline in target/tricore/cpu.h

/mjt

