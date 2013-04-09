Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UPQIS-00031i-Lh
	for mharc-qemu-trivial@gnu.org; Tue, 09 Apr 2013 00:36:40 -0400
Received: from eggs.gnu.org ([208.118.235.92]:52935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jlarrew@linux.vnet.ibm.com>) id 1UPQIP-000303-Er
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2013 00:36:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jlarrew@linux.vnet.ibm.com>) id 1UPQIO-0006o8-7d
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2013 00:36:37 -0400
Received: from e9.ny.us.ibm.com ([32.97.182.139]:52212)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jlarrew@linux.vnet.ibm.com>) id 1UPQIO-0006np-4t
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2013 00:36:36 -0400
Received: from /spool/local
	by e9.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <jlarrew@linux.vnet.ibm.com>;
	Tue, 9 Apr 2013 00:36:34 -0400
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
	by e9.ny.us.ibm.com (192.168.1.109) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 9 Apr 2013 00:36:33 -0400
Received: from d01relay05.pok.ibm.com (d01relay05.pok.ibm.com [9.56.227.237])
	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 2F799C9001A;
	Tue,  9 Apr 2013 00:36:32 -0400 (EDT)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
	by d01relay05.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r394aW3h248236; Tue, 9 Apr 2013 00:36:32 -0400
Received: from d01av05.pok.ibm.com (loopback [127.0.0.1])
	by d01av05.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r394aVOC017400; Tue, 9 Apr 2013 00:36:31 -0400
Received: from jlarrew.austin.ibm.com (jlarrew.austin.ibm.com [9.41.149.149])
	by d01av05.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r394aUUn017378; Tue, 9 Apr 2013 00:36:31 -0400
Message-ID: <51639ACE.8020505@linux.vnet.ibm.com>
Date: Mon, 08 Apr 2013 23:36:30 -0500
From: Jesse Larrew <jlarrew@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: liguang <lig.fnst@cn.fujitsu.com>
References: <1365474461-17474-1-git-send-email-lig.fnst@cn.fujitsu.com>
In-Reply-To: <1365474461-17474-1-git-send-email-lig.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13040904-7182-0000-0000-000006260E44
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.182.139
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] hw/i386/pc: prompt not
 multboot or morden kernel image
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
X-List-Received-Date: Tue, 09 Apr 2013 04:36:38 -0000

On 04/08/2013 09:27 PM, liguang wrote:
> if head magic is missing or wrong unexpectedly, we'd
> better to prompt memssage for this.
> e.g.
> I make a mistake to boot a vmlinuz for MIPS(which
> I think it's for x86) like this:
> qemu-system-x86_64 -kernel vmlinuz -initrd demord
> then qemu report:
> "qemu: linux kernel too old to load a ram disk"
> that's misleading.
> 

Yes, that message would definitely be misleading in this case.

> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> ---
>  hw/i386/pc.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index ebbf059..6b29c3f 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -686,6 +686,8 @@ static void load_linux(void *fw_cfg,
>          if (load_multiboot(fw_cfg, f, kernel_filename, initrd_filename,
>                             kernel_cmdline, kernel_size, header)) {
>              return;
> +        } else {
> +            fprintf(stderr, "warn: invalid multiboot or modern kernel image\n");
>          }
>          protocol = 0;
>      }
> 

My impression from reading through the code is that this branch can be
legitimately triggered by an older kernel (protocol < 0x200). In that case,
the error message above would also be misleading.

I think a better solution might be to simply validate that the arch
specified in the ELF header matches the arch that qemu is emulating. I'll
look into this more tomorrow morning. :)

Jesse Larrew
Software Engineer, KVM Team
IBM Linux Technology Center
Phone: (512) 973-2052 (T/L: 363-2052)
jlarrew@linux.vnet.ibm.com


