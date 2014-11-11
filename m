Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoCPU-0007W9-Hy
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 09:27:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCPN-0007Lp-8V
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:27:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCPH-000157-54
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:27:01 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:33195)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XoCP4-00012w-AA; Tue, 11 Nov 2014 09:26:42 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 22CC041DE3;
	Tue, 11 Nov 2014 17:26:41 +0300 (MSK)
Message-ID: <54621CA1.9090801@msgid.tls.msk.ru>
Date: Tue, 11 Nov 2014 17:26:41 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>
References: <5461D59C.5020106@gmail.com>
In-Reply-To: <5461D59C.5020106@gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, xen-devel@lists.xensource.com,
	qemu-devel <qemu-devel@nongnu.org>,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: Re: [Qemu-trivial] [PATCH trivial] xen-hvm: Remove redandant
 varialbe 'xstate'
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
X-List-Received-Date: Tue, 11 Nov 2014 14:27:07 -0000

11.11.2014 12:23, Chen Gang wrote:
> In xen_hvm_change_state_handler(), can pass 'opaque' with type cast to
> xen_main_loop_prepare() directly, need not use additional variable for
> it.

gcc most likely eliminates it anyway, but heck, why not?
Applied to -trivial, thank you!

/mjt

