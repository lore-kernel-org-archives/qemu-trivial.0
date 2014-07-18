Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X80uJ-00005U-RF
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jul 2014 01:40:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X80uC-0008RG-R2
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 01:40:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X80u6-0002fV-9m
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 01:40:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57693)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1X80tt-0002Zi-NR; Fri, 18 Jul 2014 01:40:09 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 985DA437AD;
	Fri, 18 Jul 2014 09:40:07 +0400 (MSK)
Message-ID: <53C8B336.7090401@msgid.tls.msk.ru>
Date: Fri, 18 Jul 2014 09:40:06 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.6.0
MIME-Version: 1.0
To: Gernot Hillier <gernot.hillier@siemens.com>, qemu-devel@nongnu.org
References: <53BE9CB5.4060503@siemens.com>
In-Reply-To: <53BE9CB5.4060503@siemens.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] doc: slirp supports ICMP echo if enabled
 in Linux
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
X-List-Received-Date: Fri, 18 Jul 2014 05:40:35 -0000

10.07.2014 18:01, Gernot Hillier wrote:
> 
> Since QEMU 0.15, slirp (user mode networking) supports ping to the
> Internet, see e6d43cfb1f9

Applied to the trivial tree, after removing an extra empty line and
rewording the last part to be "To allow ping for GID 100 (usually
users group)", because not all linux systems may use this GID for
users group.  Thank you!

/mjt

