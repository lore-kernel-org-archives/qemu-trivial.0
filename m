Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UbSWf-000124-Re
	for mharc-qemu-trivial@gnu.org; Sun, 12 May 2013 05:25:06 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UbSWb-0000wT-VF
	for qemu-trivial@nongnu.org; Sun, 12 May 2013 05:25:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UbSWa-0002ZF-SJ
	for qemu-trivial@nongnu.org; Sun, 12 May 2013 05:25:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49470)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UbSWY-0002WQ-FK; Sun, 12 May 2013 05:24:58 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E3D8E40759;
	Sun, 12 May 2013 13:24:47 +0400 (MSK)
Message-ID: <518F5FDE.2040108@msgid.tls.msk.ru>
Date: Sun, 12 May 2013 13:24:46 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Igor Mitsyanko <i.mitsyanko@gmail.com>
References: <1368215901-55444-1-git-send-email-i.mitsyanko@gmail.com>
In-Reply-To: <1368215901-55444-1-git-send-email-i.mitsyanko@gmail.com>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, aliguori@us.ibm.com,
	qemu-devel@nongnu.org, peter.maydell@linaro.org
Subject: Re: [Qemu-trivial] [PATCH V2] osdep.h: include sys/types.h for
 ssize_t definition
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
X-List-Received-Date: Sun, 12 May 2013 09:25:03 -0000

10.05.2013 23:58, Igor Mitsyanko wrote:
> sys/types.h is taken out from "ifdef __OpenBSD__" guard. It should be
> safe for other systems, according to following survey:
> http://hacks.owlfolio.org/header-survey/
> 
> This fixes build for CONFIG_IOVEC-less systems (mingw).

Thanks, applied to the trivial patches queue.

/mjt

