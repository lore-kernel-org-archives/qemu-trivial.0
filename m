Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIXc5-0000s2-LJ
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 03:14:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIXc3-0000pB-3c
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:14:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIXc2-0002XL-C5
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:14:03 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43314)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIXbx-0002X5-Cw; Mon, 11 Jan 2016 03:13:57 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 41F9B403D2;
	Mon, 11 Jan 2016 11:13:57 +0300 (MSK)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1449250461-23392-1-git-send-email-peter.maydell@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56936444.9090904@msgid.tls.msk.ru>
Date: Mon, 11 Jan 2016 11:13:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1449250461-23392-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] osdep.h: Include glib-compat.h in
 osdep.h rather than qemu-common.h
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
X-List-Received-Date: Mon, 11 Jan 2016 08:14:04 -0000

04.12.2015 20:34, Peter Maydell wrote:
> Our use of glib is now pervasive across QEMU. Move the include of glib-compat.h
> from qemu-common.h to osdep.h so that it is more widely accessible and doesn't
> get forgotten by accident. (Failure to include it will result in build failure
> on old versions of glib which is likely to be unnoticed by most developers.)

Applied to -trivial, thanks!

/mjt

