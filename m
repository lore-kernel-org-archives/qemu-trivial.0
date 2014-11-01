Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xkd8J-0001zm-3f
	for mharc-qemu-trivial@gnu.org; Sat, 01 Nov 2014 14:10:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xkd8C-0001vb-QK
	for qemu-trivial@nongnu.org; Sat, 01 Nov 2014 14:10:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xkd87-0002Na-OL
	for qemu-trivial@nongnu.org; Sat, 01 Nov 2014 14:10:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52158)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xkd7x-0002Is-Fo; Sat, 01 Nov 2014 14:10:17 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 59DBF4019B;
	Sat,  1 Nov 2014 21:10:07 +0300 (MSK)
Message-ID: <545521FF.8070603@msgid.tls.msk.ru>
Date: Sat, 01 Nov 2014 21:10:07 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1414724010-1756-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1414724010-1756-1-git-send-email-arei.gonglei@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Sat, 01 Nov 2014 18:10:37 -0000

31.10.2014 05:53, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> DEFAULT_NETWORK_SCRIPT and DEFAULT_NETWORK_DOWN_SCRIPT
> have been defined in net/net.h included in
> tap.c, which is the only C file that using those two macro.
> Let's remove the repeating macroinstruction.
> 
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  net/tap_int.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/net/tap_int.h b/net/tap_int.h
> index 86bb224..79afdf2 100644
> --- a/net/tap_int.h
> +++ b/net/tap_int.h
> @@ -29,9 +29,6 @@
>  #include "qemu-common.h"
>  #include "qapi-types.h"
>  
> -#define DEFAULT_NETWORK_SCRIPT "/etc/qemu-ifup"
> -#define DEFAULT_NETWORK_DOWN_SCRIPT "/etc/qemu-ifdown"
> -
>  int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
>               int vnet_hdr_required, int mq_required);


Hmm.  We had this change in debian qemu-kvm for many years
(at least since 2008), here:
http://anonscm.debian.org/cgit/collab-maint/qemu-kvm.git/tree/debian/patches/04_use_etc_kvm_kvm-ifup.patch

I always thought it is some mis-merge of kvm to qemu.

So, ofcourse, applying to -trivial, thank you for getting
rid of it finally, because I really forgot about it...

/mjt

