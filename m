Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xkd8p-0002f6-FP
	for mharc-qemu-trivial@gnu.org; Sat, 01 Nov 2014 14:11:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xkd8i-0002Uh-U0
	for qemu-trivial@nongnu.org; Sat, 01 Nov 2014 14:11:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xkd8d-0002av-Uj
	for qemu-trivial@nongnu.org; Sat, 01 Nov 2014 14:11:04 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35708)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xkd8U-0002YN-2G; Sat, 01 Nov 2014 14:10:50 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6DF434019B;
	Sat,  1 Nov 2014 21:10:49 +0300 (MSK)
Message-ID: <54552229.7000005@msgid.tls.msk.ru>
Date: Sat, 01 Nov 2014 21:10:49 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1414724010-1756-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1414724010-1756-1-git-send-email-arei.gonglei@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] tap_int.h: remove repeating
	macroinstruction
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
X-List-Received-Date: Sat, 01 Nov 2014 18:11:09 -0000

31.10.2014 05:53, arei.gonglei@huawei.com =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> From: Gonglei <arei.gonglei@huawei.com>
>=20
> DEFAULT_NETWORK_SCRIPT and DEFAULT_NETWORK_DOWN_SCRIPT
> have been defined in net/net.h included in
> tap.c, which is the only C file that using those two macro.
> Let's remove the repeating macroinstruction.
>=20
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  net/tap_int.h | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/net/tap_int.h b/net/tap_int.h
> index 86bb224..79afdf2 100644
> --- a/net/tap_int.h
> +++ b/net/tap_int.h
> @@ -29,9 +29,6 @@
>  #include "qemu-common.h"
>  #include "qapi-types.h"
> =20
> -#define DEFAULT_NETWORK_SCRIPT "/etc/qemu-ifup"
> -#define DEFAULT_NETWORK_DOWN_SCRIPT "/etc/qemu-ifdown"
> -
>  int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
>               int vnet_hdr_required, int mq_required);
> =20


Hmm.  We had this change in debian qemu-kvm for many years
(at least since 2008), here:
http://anonscm.debian.org/cgit/collab-maint/qemu-kvm.git/tree/debian/patc=
hes/04_use_etc_kvm_kvm-ifup.patch

I always thought it is some mis-merge of kvm to qemu.

So, ofcourse, applying to -trivial, thank you for getting
rid of it finally, because I really forgot about it...

/mjt

