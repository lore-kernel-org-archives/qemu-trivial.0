Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnLaI-0007Qd-8T
	for mharc-qemu-trivial@gnu.org; Wed, 29 Apr 2015 02:35:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnLaF-0007MB-PI
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 02:35:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnLaE-00068f-UR
	for qemu-trivial@nongnu.org; Wed, 29 Apr 2015 02:34:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39017)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YnLa8-00065e-99; Wed, 29 Apr 2015 02:34:52 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9699442A54;
	Wed, 29 Apr 2015 09:34:51 +0300 (MSK)
Message-ID: <55407B8B.1010803@msgid.tls.msk.ru>
Date: Wed, 29 Apr 2015 09:34:51 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1430153944-24368-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1430153944-24368-1-git-send-email-thuth@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] kvm: Silence warning from valgrind
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
X-List-Received-Date: Wed, 29 Apr 2015 06:35:00 -0000

27.04.2015 19:59, Thomas Huth wrote:
> valgrind complains here about uninitialized bytes with the following message:
> 
> ==17814== Syscall param ioctl(generic) points to uninitialised byte(s)
> ==17814==    at 0x466A780: ioctl (in /usr/lib64/power8/libc-2.17.so)
> ==17814==    by 0x100735B7: kvm_vm_ioctl (kvm-all.c:1920)
> ==17814==    by 0x10074583: kvm_set_ioeventfd_mmio (kvm-all.c:574)
> 
> Let's fix it by using a proper struct initializer in kvm_set_ioeventfd_mmio().
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  kvm-all.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/kvm-all.c b/kvm-all.c
> index dd44f8c..077b0ed 100644
> --- a/kvm-all.c
> +++ b/kvm-all.c
> @@ -552,13 +552,13 @@ static int kvm_set_ioeventfd_mmio(int fd, hwaddr addr, uint32_t val,
>                                    bool assign, uint32_t size, bool datamatch)
>  {
>      int ret;
> -    struct kvm_ioeventfd iofd;
> -
> -    iofd.datamatch = datamatch ? adjust_ioeventfd_endianness(val, size) : 0;
> -    iofd.addr = addr;
> -    iofd.len = size;
> -    iofd.flags = 0;
> -    iofd.fd = fd;
> +    struct kvm_ioeventfd iofd = {
> +        .datamatch = datamatch ? adjust_ioeventfd_endianness(val, size) : 0,
> +        .addr = addr,
> +        .len = size,
> +        .flags = 0,
> +        .fd = fd,
> +    };

Hm.  So, what's the difference?  The same fields are assigned the same
values, why in first case we have some uninitialized data and in second
case everything is initialized?  Does struct initializer zero-fills all
other places (alignments, missing fields etc) ?  If yes, there's no need
to assign zero to flags, btw ;)

Thanks,

/mjt

