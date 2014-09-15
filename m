Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XTVwt-0007Oi-Rx
	for mharc-qemu-trivial@gnu.org; Mon, 15 Sep 2014 09:04:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XTVwm-0007Cn-1x
	for qemu-trivial@nongnu.org; Mon, 15 Sep 2014 09:04:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XTVwf-0002SG-UP
	for qemu-trivial@nongnu.org; Mon, 15 Sep 2014 09:04:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37517)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XTVwT-0002QX-3G; Mon, 15 Sep 2014 09:03:41 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5C9E8441EB;
	Mon, 15 Sep 2014 17:03:40 +0400 (MSK)
Message-ID: <5416E3AC.1070701@msgid.tls.msk.ru>
Date: Mon, 15 Sep 2014 17:03:40 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org
References: <1410179457-19737-1-git-send-email-kbastian@mail.uni-paderborn.de>
In-Reply-To: <1410179457-19737-1-git-send-email-kbastian@mail.uni-paderborn.de>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] arch_init: Setting QEMU_ARCH enum
	straight
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
X-List-Received-Date: Mon, 15 Sep 2014 13:04:06 -0000

08.09.2014 16:30, Bastian Koppelmann wrote:
> Every QEMU_ARCH is now hexadecimal instead of a mixture of decimal and hexadecimal.

I'm not sure it is worth the trouble really.  For readability, the best in this case
(in my opinion anyway) is to use (1<<n) notation (with consecutive n), so it becomes
really obvious that these are distinct bits.  Besides, -0x01 (fo ARCH_ALL) does look
a bit weird :)

Thanks,

/mjt

