Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVKGG-0001wB-Nh
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 09:31:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVKGA-0001lB-Cr
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 09:31:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVKG9-0003hw-HJ
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 09:31:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41526)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YVKG3-0003fl-76; Tue, 10 Mar 2015 09:31:39 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3CFB24138F;
	Tue, 10 Mar 2015 16:31:37 +0300 (MSK)
Message-ID: <54FEF239.304@msgid.tls.msk.ru>
Date: Tue, 10 Mar 2015 16:31:37 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <1425971164-9845-1-git-send-email-mjt@msgid.tls.msk.ru>	<20150310085016.GC3770@noname.str.redhat.com>	<20150310091759.GC14320@ad.nay.redhat.com>	<20150310100936.GD3770@noname.str.redhat.com>
	<87mw3lx9xb.fsf@blackfin.pond.sub.org>
In-Reply-To: <87mw3lx9xb.fsf@blackfin.pond.sub.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: Fam Zheng <famz@redhat.com>, qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Peter Wu <peter@lekensteyn.nl>, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] block/dmg: make it modular if using
	additional library
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
X-List-Received-Date: Tue, 10 Mar 2015 13:31:51 -0000

10.03.2015 16:24, Markus Armbruster wrote:
[]
> For me, avoiding bothersome dependencies is a strong practical argument
> for making a something a loadable module.  Other benefits of loadable
> modules presented so far seem pretty negligible to me.  If you want
> them, no objection from me, as long as the cost is similarly negligible,
> additional complexity for developers, packagers and users in particular.

That's the same for me.  No need to reduce code size, at least not
by that much, and no need to disable some "insecure" eg block driver,
but once something pulls in some interesting external dep it seems
to be worth the effort (if it is not large anyway) to make it loadable.

It is much bigger PITA if some feature is needed in some obscure or
rare sutuation but it is not present -- cost of solving this might
be significantly larger than billions of copies of unused code on
billions of user's hdds :)

This is the reason I made it a module or built-in depending on usage
of external dep.

However, in this case libbz2 is most likely present on a user's system
anyway (since at least some time ago it was rather popular, not as
wide as gzip but still significantly; now it is mostly replaced by xz),
so there isn't much of an external dependency.

Thanks,

/mjt


