Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dGMiv-0007Wp-2P
	for mharc-qemu-trivial@gnu.org; Thu, 01 Jun 2017 05:48:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dGMis-0007Uw-CQ
	for qemu-trivial@nongnu.org; Thu, 01 Jun 2017 05:48:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dGMir-0001NY-KH
	for qemu-trivial@nongnu.org; Thu, 01 Jun 2017 05:48:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:32851)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dGMim-0001LK-5T; Thu, 01 Jun 2017 05:48:48 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6D35740122;
	Thu,  1 Jun 2017 12:48:47 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 2BA615DA;
	Thu,  1 Jun 2017 12:48:47 +0300 (MSK)
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>, qemu-devel@nongnu.org
References: <20170531061150.15755-1-sjitindarsingh@gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <d392c401-1b36-b663-32bf-638895ba5572@msgid.tls.msk.ru>
Date: Thu, 1 Jun 2017 12:48:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170531061150.15755-1-sjitindarsingh@gmail.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] help: Add newline to end of thread
 option help text
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
X-List-Received-Date: Thu, 01 Jun 2017 09:48:55 -0000

31.05.2017 09:11, Suraj Jitindar Singh wrote:
> The help text for the thread sub option of the accel option is missing
> a newline at the end. This is annoying as it makes it hard to see the
> help text for the next option.
..
Applied to -trivial, thanks!

/mjt

