Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVwdy-0001S0-Ij
	for mharc-qemu-trivial@gnu.org; Thu, 12 Mar 2015 02:30:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVwdw-0001NX-31
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 02:30:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVwdv-0008Oz-5S
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 02:30:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60251)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YVwdp-0008OF-1P; Thu, 12 Mar 2015 02:30:45 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 628A141725;
	Thu, 12 Mar 2015 09:30:42 +0300 (MSK)
Message-ID: <55013292.9030306@msgid.tls.msk.ru>
Date: Thu, 12 Mar 2015 09:30:42 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, 
	qemu-devel@nongnu.org
References: <1425966860-13605-1-git-send-email-mjt@msgid.tls.msk.ru>
	<87mw3krckd.fsf@linux.vnet.ibm.com>
In-Reply-To: <87mw3krckd.fsf@linux.vnet.ibm.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] 9pfs-proxy: tiny cleanups in
	proxy_pwritev and proxy_preadv
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
X-List-Received-Date: Thu, 12 Mar 2015 06:30:53 -0000

10.03.2015 20:23, Aneesh Kumar K.V wrote:
[]>
> I am not sure this is needed, whether to use int err or int ret as the
> variable name is simply a matter of preference for the author.

We have 2 filesystem methods in here, read and write, one near another,
which are written by the same author (but one of them has been later
extended a bit, adding another variable).  This patch makes them similar
again.

>   Also did
> you compile test the above ? (note: int ret followed by a check with
> variable name 'err').

Well yes.  It is a forgotten git commit.  Ofcourse I verified the result,
I just forgot to commit because I was distracted by something else, hence
sent a wrong patch.  I'll resend it.

/mjt


