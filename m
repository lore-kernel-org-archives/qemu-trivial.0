Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwE8M-0003KS-Em
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 17:08:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwE8K-0003JT-Nf
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:08:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwE8I-0006BB-MH
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:08:12 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34121)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwE8B-00064D-Fq; Sun, 24 Sep 2017 17:08:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B290041C78;
	Mon, 25 Sep 2017 00:08:02 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 9C9443C3;
	Mon, 25 Sep 2017 00:08:02 +0300 (MSK)
To: Kamil Rytarowski <n54@gmx.com>, qemu-trivial@nongnu.org
Cc: jperkin@joyent.com, qemu-devel@nongnu.org
References: <20170911205001.11789-1-n54@gmx.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <5f6af3cc-14cb-3e51-2ddf-86453e3ca190@msgid.tls.msk.ru>
Date: Mon, 25 Sep 2017 00:08:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170911205001.11789-1-n54@gmx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] Drop gld linker usage on SunOS
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
X-List-Received-Date: Sun, 24 Sep 2017 21:08:13 -0000

11.09.2017 23:50, Kamil Rytarowski wrote:
> This is required to be removed on SmartOS (Illumos).

I take this as granted - I haven't verified this.

> As of now there are no alternative supported SunOS distributions.

Applied to -trivial, thanks!

/mjt

