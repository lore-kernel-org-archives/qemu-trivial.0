Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ciR6a-0000Ix-Q3
	for mharc-qemu-trivial@gnu.org; Mon, 27 Feb 2017 14:37:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ciR6Y-0000HJ-BD
	for qemu-trivial@nongnu.org; Mon, 27 Feb 2017 14:37:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ciR6X-0001cq-F5
	for qemu-trivial@nongnu.org; Mon, 27 Feb 2017 14:37:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48828)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ciR6R-0001Zc-6g; Mon, 27 Feb 2017 14:36:59 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 54061C04B95E;
	Mon, 27 Feb 2017 19:36:59 +0000 (UTC)
Received: from [10.36.116.136] (ovpn-116-136.ams2.redhat.com [10.36.116.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4171072380;
	Mon, 27 Feb 2017 19:36:58 +0000 (UTC)
To: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>
References: <1485377117-18105-1-git-send-email-thuth@redhat.com>
Cc: Laurent Vivier <laurent@vivier.eu>, QEMU Trivial <qemu-trivial@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f524e29d-6e8c-19b0-e170-2a6876cbfe69@redhat.com>
Date: Mon, 27 Feb 2017 20:36:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1485377117-18105-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 27 Feb 2017 19:36:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/core/generic-loader: Fix
 crash when running without CPU
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Feb 2017 19:37:07 -0000

On 25.01.2017 21:45, Thomas Huth wrote:
> When running QEMU with "-M none -device loader,file=kernel.elf", it
> currently crashes with a segmentation fault, because the "none"-machine
> does not have any CPU by default and the generic loader code tries
> to dereference s->cpu. Fix it by adding an appropriate check for a
> NULL pointer.
> 
> Reported-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/core/generic-loader.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
> index 58f1f02..4601267 100644
> --- a/hw/core/generic-loader.c
> +++ b/hw/core/generic-loader.c
> @@ -137,20 +137,21 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
>  #endif
>  
>      if (s->file) {
> +        AddressSpace *as = s->cpu ? s->cpu->as :  NULL;
> +
>          if (!s->force_raw) {
>              size = load_elf_as(s->file, NULL, NULL, &entry, NULL, NULL,
> -                               big_endian, 0, 0, 0, s->cpu->as);
> +                               big_endian, 0, 0, 0, as);
>  
>              if (size < 0) {
>                  size = load_uimage_as(s->file, &entry, NULL, NULL, NULL, NULL,
> -                                      s->cpu->as);
> +                                      as);
>              }
>          }
>  
>          if (size < 0 || s->force_raw) {
>              /* Default to the maximum size being the machine's ram size */
> -            size = load_image_targphys_as(s->file, s->addr, ram_size,
> -                                          s->cpu->as);
> +            size = load_image_targphys_as(s->file, s->addr, ram_size, as);
>          } else {
>              s->addr = entry;
>          }

Ping?

 Thomas


