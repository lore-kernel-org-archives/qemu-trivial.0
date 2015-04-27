Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmkKH-0002YH-M3
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 10:48:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YmkKF-0002TL-Ih
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 10:48:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YmkKA-0007B4-LG
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 10:47:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51102)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YmkJy-00077H-4N; Mon, 27 Apr 2015 10:47:42 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 68BA342778;
	Mon, 27 Apr 2015 17:47:41 +0300 (MSK)
Message-ID: <553E4C0D.8040505@msgid.tls.msk.ru>
Date: Mon, 27 Apr 2015 17:47:41 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>, 
 qemu-devel@nongnu.org
References: <cover.1430096379.git.crosthwaite.peter@gmail.com>
	<efaa0333fb80cd88f3a7559bb8d8a5dd29b5b121.1430096379.git.crosthwaite.peter@gmail.com>
In-Reply-To: <efaa0333fb80cd88f3a7559bb8d8a5dd29b5b121.1430096379.git.crosthwaite.peter@gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH target-arm 1/2] arm: cpu.h: Remove unused
	typdefs
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
X-List-Received-Date: Mon, 27 Apr 2015 14:48:00 -0000

27.04.2015 04:38, Peter Crosthwaite wrote:
> These CP accessor function prototypes are unused. Remove them.

Applied to -trivial, thank you!

/mjt

