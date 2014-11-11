Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoCZW-0007pV-4n
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 09:37:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCZN-0007ba-QZ
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:37:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCZH-0004mO-Md
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:37:21 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58702)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XoCZ5-0004jD-25; Tue, 11 Nov 2014 09:37:03 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0E9CF41DE5;
	Tue, 11 Nov 2014 17:37:02 +0300 (MSK)
Message-ID: <54621F0D.8080401@msgid.tls.msk.ru>
Date: Tue, 11 Nov 2014 17:37:01 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>
References: <5461D59C.5020106@gmail.com>	<alpine.DEB.2.02.1411111052280.26318@kaball.uk.xensource.com>	<20141111142359.GB8751@konrad-lan.dumpdata.com>
	<54621DE6.60108@gmail.com>
In-Reply-To: <54621DE6.60108@gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, xen-devel@lists.xensource.com,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Xen-devel] [PATCH trivial] xen-hvm: Remove
 redandant varialbe 'xstate'
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
X-List-Received-Date: Tue, 11 Nov 2014 14:37:28 -0000

11.11.2014 17:32, Chen Gang wrote:
>> The title of your patch should say 'variable'.
> 
> Oh, yes, thanks. If necessary to send patch v2 for it, please let me
> know.

Not only 'varialbe', but also 'redandant'.  I fixed both on commit, plus
fixed grammar in commit message.

Thanks,

/mjt

