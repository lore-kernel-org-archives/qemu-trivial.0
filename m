Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dsP33-0005xM-Es
	for mharc-qemu-trivial@gnu.org; Thu, 14 Sep 2017 03:58:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dsP31-0005vH-6E
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 03:58:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dsP30-0008GN-GF
	for qemu-trivial@nongnu.org; Thu, 14 Sep 2017 03:58:55 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49065)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dsP2w-0008Bg-6X; Thu, 14 Sep 2017 03:58:50 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6C8D6412CF;
	Thu, 14 Sep 2017 10:58:49 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 415DA5B9;
	Thu, 14 Sep 2017 10:58:47 +0300 (MSK)
To: KONRAD Frederic <frederic.konrad@adacore.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, thuth@redhat.com
References: <1503661569-11408-1-git-send-email-frederic.konrad@adacore.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <560a5a7c-1dca-f074-7ffb-42909700b840@msgid.tls.msk.ru>
Date: Thu, 14 Sep 2017 10:58:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503661569-11408-1-git-send-email-frederic.konrad@adacore.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH for-2.11] aux-to-i2c-bridge: don't allow
 user to create one
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
X-List-Received-Date: Thu, 14 Sep 2017 07:58:56 -0000

25.08.2017 14:46, KONRAD Frederic wrote:
> This device is private and is created once per aux-bus.
> So don't allow the user to create one from command-line.

Applied to -trivial, thanks!

/mjt

