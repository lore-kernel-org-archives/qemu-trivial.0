Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V1gEG-0004sa-LT
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jul 2013 13:18:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59358)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V1gEC-0004mY-Kg
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 13:18:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V1gEA-0002b5-Pt
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 13:18:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49480)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V1gE6-0002Z2-0g; Tue, 23 Jul 2013 13:18:18 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D9BD8429A5;
	Tue, 23 Jul 2013 21:18:15 +0400 (MSK)
Message-ID: <51EEBAD6.4020607@msgid.tls.msk.ru>
Date: Tue, 23 Jul 2013 21:18:14 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130704 Icedove/17.0.7
MIME-Version: 1.0
To: Petar Jovanovic <petar.jovanovic@rt-rk.com>
References: <1374598810-78021-1-git-send-email-petar.jovanovic@rt-rk.com>
In-Reply-To: <1374598810-78021-1-git-send-email-petar.jovanovic@rt-rk.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, riku.voipio@linaro.org, qemu-devel@nongnu.org,
	petar.jovanovic@imgtec.com
Subject: Re: [Qemu-trivial] [PATCH] linux-user: correct argument number for
 sys_mremap and sys_splice
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
X-List-Received-Date: Tue, 23 Jul 2013 17:18:26 -0000

23.07.2013 21:00, Petar Jovanovic wrote:
> From: Petar Jovanovic <petar.jovanovic@imgtec.com>
> 
> sys_mremap missed 5th argument (new_address), which caused examples that
> remap to a specific address to fail.
> sys_splice missed 5th and 6th argument which caused different examples to
> fail.
> This change has an effect on MIPS target only.

While splice is obvious and appears to be correct, with mremap I'm not
this sure.  The last, 5th argument of mremap(), which is `void *new_address',
is optional and may be either present or not.  So, without understanding
how the underlying tables/code works, I'm not really sure if the resulting
change will work or not.  On the other hand, sys_open is also declared as
having 3 arguments while the 3rd one (mode) is also optional, so the patch
appears to be correct there as well, so I was almost ready to apply it,
until your last comment which states that the change has only effect on
MIPS.  Which is quite puzzling to me who, again, does not really know
how the code works.

So either the patch isn't trivial enough, or maybe you can provide some
more verbose explanation... ;)

Thanks,

/mjt

