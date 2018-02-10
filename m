Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekPLd-0000Wn-VF
	for mharc-qemu-trivial@gnu.org; Sat, 10 Feb 2018 02:13:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekPLb-0000W1-Ki
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 02:13:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekPLa-0004Pr-Sv
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 02:13:19 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:55661)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ekPLX-0004NQ-2H; Sat, 10 Feb 2018 02:13:15 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BA20D4099D;
	Sat, 10 Feb 2018 10:13:13 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id 3FD38758;
	Sat, 10 Feb 2018 10:13:15 +0300 (MSK)
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org
References: <20180115023501.37361-1-aik@ozlabs.ru>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <7d78a12f-1683-1df8-6ff3-58373110a2bb@msgid.tls.msk.ru>
Date: Sat, 10 Feb 2018 10:13:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180115023501.37361-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH qemu] configure: Allow capstone=git only
 if git update is not disabled
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
X-List-Received-Date: Sat, 10 Feb 2018 07:13:20 -0000

15.01.2018 05:35, Alexey Kardashevskiy wrote:
> Even with --disable-git-update, ./configure tries updating the capstone
> submodule instead of marking it "no"; this disables capstone submodule
> if git update is disabled.

Applied to -trivial, thanks!

/mjt

