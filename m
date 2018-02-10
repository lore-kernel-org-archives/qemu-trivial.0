Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekPG3-0005YJ-Sl
	for mharc-qemu-trivial@gnu.org; Sat, 10 Feb 2018 02:07:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekPG1-0005Wj-Ud
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 02:07:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekPG1-0005Ww-AE
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 02:07:33 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36509)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ekPFx-0005Gi-Iy; Sat, 10 Feb 2018 02:07:29 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7785E4099D;
	Sat, 10 Feb 2018 10:07:19 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id D9922758;
	Sat, 10 Feb 2018 10:07:20 +0300 (MSK)
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <20171026014139.46221-1-aik@ozlabs.ru>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <f28effda-5133-67b6-b67e-9e10af3c68fc@msgid.tls.msk.ru>
Date: Sat, 10 Feb 2018 10:07:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20171026014139.46221-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH qemu v2] machine: Polish -machine xxx,
 help
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
X-List-Received-Date: Sat, 10 Feb 2018 07:07:34 -0000

26.10.2017 04:41, Alexey Kardashevskiy =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> The "-machine xxx,help" prints kernel-irqchip possible values as
> "OnOffSplit", this adds separators to the printed line.

Applied to -trivial, thanks, and please excuse us for the very long delay=
!

/mjt

