Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ciaxq-0004nP-Kk
	for mharc-qemu-trivial@gnu.org; Tue, 28 Feb 2017 01:08:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ciaxo-0004mN-Bc
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 01:08:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ciaxn-0001t4-GW
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 01:08:44 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:38953)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ciaxj-0001sW-65; Tue, 28 Feb 2017 01:08:39 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5672D4327E;
	Tue, 28 Feb 2017 09:08:38 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id EB08B2C;
	Tue, 28 Feb 2017 09:08:37 +0300 (MSK)
To: Franklin Snaipe Mathieu <snaipe@diacritic.io>, qemu-devel@nongnu.org
References: <20170216085857.23501-1-snaipe@diacritic.io>
Cc: qemu-trivial@nongnu.org, snaipe@arista.com,
	Riku Voipio <riku.voipio@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <b521ebac-a3e9-8f6a-18de-86ad57c71d06@msgid.tls.msk.ru>
Date: Tue, 28 Feb 2017 09:08:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170216085857.23501-1-snaipe@diacritic.io>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] syscall: fixed mincore(2) not failing
 with ENOMEM
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
X-List-Received-Date: Tue, 28 Feb 2017 06:08:45 -0000

16.02.2017 11:58, Franklin Snaipe Mathieu wrote:
> From: "Franklin \"Snaipe\" Mathieu" <snaipe@diacritic.io>
> 
> The current implementation of the mincore(2) syscall sets errno to
> EFAULT when the region identified by the first two parameters is
> invalid.
> 
> This goes against the man page specification, where mincore(2) should
> only fail with EFAULT when the third parameter is an invalid address;
> and fail with ENOMEM when the checked region does not point to mapped
> memory.

Applied to -trivial, thanks!

/mjt

