Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bAIbA-00006y-4J
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jun 2016 11:07:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bAIb8-00005h-98
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 11:07:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bAIb7-0002Ay-B3
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2016 11:07:18 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37301)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bAIb1-00027l-3S; Tue, 07 Jun 2016 11:07:11 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id EF9A440C27;
	Tue,  7 Jun 2016 18:06:59 +0300 (MSK)
To: James Clarke <jrtc27@jrtc27.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20160606110250.GA43977@Jamess-MacBook.local>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <5756E312.3000904@msgid.tls.msk.ru>
Date: Tue, 7 Jun 2016 18:06:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <20160606110250.GA43977@Jamess-MacBook.local>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v2] Fix linking relocatable objects on
 Sparc
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
X-List-Received-Date: Tue, 07 Jun 2016 15:07:19 -0000

06.06.2016 14:02, James Clarke wrote:
> On Sparc, gcc implicitly passes --relax to the linker, but -r is
> incompatible with this. Therefore, if --no-relax is supported, it should
> be passed to the linker.

Applied to -trivial instead of the initial version.

Thanks,

/mjt

