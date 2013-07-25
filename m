Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V2Exj-0001V2-I9
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jul 2013 02:23:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2Exg-0001QM-Lt
	for qemu-trivial@nongnu.org; Thu, 25 Jul 2013 02:23:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2Exf-0004T6-Qs
	for qemu-trivial@nongnu.org; Thu, 25 Jul 2013 02:23:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42718)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V2Exd-0004Si-QM; Thu, 25 Jul 2013 02:23:37 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id DCBB542D74;
	Thu, 25 Jul 2013 10:23:35 +0400 (MSK)
Message-ID: <51F0C468.7060700@msgid.tls.msk.ru>
Date: Thu, 25 Jul 2013 10:23:36 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130704 Icedove/17.0.7
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1374598810-78021-1-git-send-email-petar.jovanovic@rt-rk.com>
	<51EEBAD6.4020607@msgid.tls.msk.ru>
	<CAFEAcA87Vf5OOMNtnNhWMsRBJWr7WG3LBut9b5rW-iC9=n32mg@mail.gmail.com>
In-Reply-To: <CAFEAcA87Vf5OOMNtnNhWMsRBJWr7WG3LBut9b5rW-iC9=n32mg@mail.gmail.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, riku.voipio@linaro.org, qemu-devel@nongnu.org,
	petar.jovanovic@imgtec.com, Petar Jovanovic <petar.jovanovic@rt-rk.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: correct
 argument number for sys_mremap and sys_splice
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
X-List-Received-Date: Thu, 25 Jul 2013 06:23:41 -0000

23.07.2013 21:33, Peter Maydell wrote:
> On 23 July 2013 18:18, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> 23.07.2013 21:00, Petar Jovanovic wrote:
>>> From: Petar Jovanovic <petar.jovanovic@imgtec.com>
>>>
>>> sys_mremap missed 5th argument (new_address), which caused examples that
>>> remap to a specific address to fail.
>>> sys_splice missed 5th and 6th argument which caused different examples to
>>> fail.
>>> This change has an effect on MIPS target only.

Thanks, applied to the trivial patches queue.

/mjt

