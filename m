Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xo4V2-0001Ln-15
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 01:00:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xo4Uv-0001De-Bn
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 01:00:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xo4Uq-0001e1-IU
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 01:00:13 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:51875)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xo4Ug-0001Fv-It; Tue, 11 Nov 2014 00:59:58 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3A15B41C62;
	Tue, 11 Nov 2014 08:59:49 +0300 (MSK)
Message-ID: <5461A5D4.2010306@msgid.tls.msk.ru>
Date: Tue, 11 Nov 2014 08:59:48 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, 
	Martin Simmons <martin@lispworks.com>
References: <201411041751.sA4Hpu4X013678@heapu.cam.lispworks.com>	<CAFEAcA9X35ptR64c=rFEN42de1Lrp_+ikuVFcxM2ZENGZY_aag@mail.gmail.com>	<201411051350.sA5DowCk030277@higson.cam.lispworks.com>	<CAFEAcA8rEYK51OR12uJFC+jrFzTgnpdZ9dg5TXWLi5ooLqiRig@mail.gmail.com>	<201411051447.sA5EldYV022824@higson.cam.lispworks.com>
	<CAFEAcA8-TKo7uLR7Z4h7hf+194e9LrQ0B5SHaSE0-54Z7D3aYg@mail.gmail.com>
In-Reply-To: <CAFEAcA8-TKo7uLR7Z4h7hf+194e9LrQ0B5SHaSE0-54Z7D3aYg@mail.gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] gdbstub: Add a missing case of signal
 number translation in gdbstub
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
X-List-Received-Date: Tue, 11 Nov 2014 06:00:18 -0000

05.11.2014 18:06, Peter Maydell wrote:
[]
> This version Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> and cc'd trivial. (Somebody's going to have to manually put the
> patch together with the commit message now, though.)

Applied to -trivial, putting all parts together.

Thanks,

/mjt

