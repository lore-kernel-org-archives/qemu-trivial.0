Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxvuT-0008Ia-DP
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 07:23:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YxvuR-0008HJ-2z
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:23:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YxvuN-0003BV-T0
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:23:35 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48200)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YxvuN-0003BM-LK
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:23:31 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6F717426CE;
	Thu, 28 May 2015 14:23:30 +0300 (MSK)
Message-ID: <5566FAB2.6060606@msgid.tls.msk.ru>
Date: Thu, 28 May 2015 14:23:30 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-trivial@nongnu.org
References: <1431680403-5776-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1431680403-5776-1-git-send-email-zhang.zhanghailiang@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-devel@nongnu.or, liang.z.li@intel.com, quintela@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] arch_init: Clean up the duplicate
 variable 'len' defining in ram_load()
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
X-List-Received-Date: Thu, 28 May 2015 11:23:36 -0000

15.05.2015 12:00, zhanghailiang wrote:
> There are two places that define 'len' variable, It's OK for compiling,
> but makes it difficult for reading.
> 
> Remove the local one which defined in the inside 'while' loop.
> 
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  arch_init.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch_init.c b/arch_init.c
> index 23d3feb..8918f6c 100644
> --- a/arch_init.c
> +++ b/arch_init.c
> @@ -1593,7 +1593,6 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
>              total_ram_bytes = addr;
>              while (!ret && total_ram_bytes) {
>                  RAMBlock *block;
> -                uint8_t len;

Note the type of this variable is not the same as the "other" len,
which is of type `int'.  Note also that at least in theory, signed
type might show different behavour than unsigned, for bytes (in
this case) with high (8th) bit set.  I just briefly looked at
what the code does, it assigns result of qemu_get_byte() to
this `len' variable, and this ensures it is interpreted as
unsigned.  By removing this `len' variable and using `len' of
type `int', it is possible this will change.  A bit more review
is needed here, I think.  If time permits I'll take a look, but
I can't do it right now.

Thanks,

/mjt

