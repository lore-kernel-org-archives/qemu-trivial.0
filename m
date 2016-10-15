Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bvOC6-0000YJ-4z
	for mharc-qemu-trivial@gnu.org; Sat, 15 Oct 2016 08:36:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bvOC3-0000Vj-Kk
	for qemu-trivial@nongnu.org; Sat, 15 Oct 2016 08:36:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bvOC1-0002AX-Ox
	for qemu-trivial@nongnu.org; Sat, 15 Oct 2016 08:36:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53618)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bvOBw-00025t-Ax; Sat, 15 Oct 2016 08:35:56 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 245E341D00;
	Sat, 15 Oct 2016 15:35:53 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 44642B2A;
	Sat, 15 Oct 2016 15:35:52 +0300 (MSK)
To: Michael Walle <michael@walle.cc>, qemu-devel@nongnu.org
References: <1476292505-19542-1-git-send-email-michael@walle.cc>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <d1a94909-333f-85e8-949c-04d6e1e37f5d@msgid.tls.msk.ru>
Date: Sat, 15 Oct 2016 15:35:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1476292505-19542-1-git-send-email-michael@walle.cc>
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] target-lm32: fix LOG_DIS operand order
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
X-List-Received-Date: Sat, 15 Oct 2016 12:36:04 -0000

12.10.2016 20:15, Michael Walle wrote:
> The order of most opcodes with immediates was wrong (according to the
> reference manual) in the (debug) logging. Additionally, one operand for the
> andhi instruction was completly wrong. Fix these.

Applied to -trivial, thank you!

/mjt

