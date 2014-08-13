Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHRpv-0000oM-Di
	for mharc-qemu-trivial@gnu.org; Wed, 13 Aug 2014 02:15:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XHRpo-0000cb-RW
	for qemu-trivial@nongnu.org; Wed, 13 Aug 2014 02:15:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XHRpk-00044Q-33
	for qemu-trivial@nongnu.org; Wed, 13 Aug 2014 02:14:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34586)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XHRpZ-00043M-Ob; Wed, 13 Aug 2014 02:14:42 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CCAF742A90;
	Wed, 13 Aug 2014 10:14:40 +0400 (MSK)
Message-ID: <53EB0250.4080007@msgid.tls.msk.ru>
Date: Wed, 13 Aug 2014 10:14:40 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@web.de>, 
 qemu-trivial <qemu-trivial@nongnu.org>
References: <53E62ABF.2000104@web.de>
In-Reply-To: <53E62ABF.2000104@web.de>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] apic: Fix reported DFR content
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
X-List-Received-Date: Wed, 13 Aug 2014 06:15:01 -0000

09.08.2014 18:05, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> IA-32 SDM, Figure 10-14: Bits 27:0 are reserved as 1.
> 
> Fixes Jailhouse hypervisor start with in-kernel irqchips off.

Applied to -trivial, thank you!

Are the other similar cases in there okay?
Say, 0x0d or 0x02 which also uses shifts like this one?

/mjt

