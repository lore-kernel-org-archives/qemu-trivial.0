Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dsOm8-00081L-Ej
	for mharc-qemu-trivial@gnu.org; Thu, 14 Sep 2017 03:41:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dsOm6-0007zi-Cg
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 03:41:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dsOm5-00069V-L9
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 03:41:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42491)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dsOly-00060l-O0; Thu, 14 Sep 2017 03:41:18 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C547B412D1;
	Thu, 14 Sep 2017 10:41:17 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 9CB395B9;
	Thu, 14 Sep 2017 10:41:15 +0300 (MSK)
To: Kamil Rytarowski <n54@gmx.com>, qemu-trivial@nongnu.org
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
	"list@suse.de:PowerPC list:PowerPC" <qemu-ppc@nongnu.org>
References: <20170911200002.4511-1-n54@gmx.com>
	<20170911201610.15204-1-n54@gmx.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <e2230002-e063-ee4a-6e66-b4bd8c08de06@msgid.tls.msk.ru>
Date: Thu, 14 Sep 2017 10:41:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170911201610.15204-1-n54@gmx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v2] Replace round_page() with
 TARGET_PAGE_ALIGN()
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
X-List-Received-Date: Thu, 14 Sep 2017 07:41:27 -0000

11.09.2017 23:16, Kamil Rytarowski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> This change fixes conflict with the DragonFly BSD headers.

Applied to -trivial, thanks!

/mjt

