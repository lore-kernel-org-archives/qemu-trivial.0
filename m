Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YyDcy-0002XL-A1
	for mharc-qemu-trivial@gnu.org; Fri, 29 May 2015 02:18:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YyDcv-0002SS-PQ
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 02:18:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YyDcv-0005Qz-2N
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 02:18:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:32866)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YyDcq-0005Q0-U9; Fri, 29 May 2015 02:18:37 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 96AEC42883;
	Fri, 29 May 2015 09:18:35 +0300 (MSK)
Message-ID: <556804BB.4090702@msgid.tls.msk.ru>
Date: Fri, 29 May 2015 09:18:35 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1432811625-13392-1-git-send-email-zhaoshenglong@huawei.com>	<1432811625-13392-5-git-send-email-zhaoshenglong@huawei.com>	<556701E8.1040801@msgid.tls.msk.ru>	<556703B2.8050606@msgid.tls.msk.ru>
	<556707D2.50800@ilande.co.uk>
In-Reply-To: <556707D2.50800@ilande.co.uk>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 4/4] hw/display/tcx.c: Fix memory leak
	spotted by valgrind
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
X-List-Received-Date: Fri, 29 May 2015 06:18:42 -0000

28.05.2015 15:19, Mark Cave-Ayland wrote:
[]
> The FCode ROMs supplied for CG3/TCX are used to both initialise various
> DT entries for the graphic adapters and also provide a minimal driver to
> allow OpenBIOS (or Sun PROM) to initialise and use the adapter at boot.
> 
> I'd say at the moment the error should be fatal, [...]

So it looks like some exit(1) or similar is missing after error_report()
in these cases, which should be added :)  Thanks!

/mjt

