Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaImz-00065g-C1
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 03:30:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaImx-000633-Nu
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 03:30:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaImw-0004dN-UH
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 03:30:27 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42434)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaImr-0004cQ-Sd; Fri, 11 Sep 2015 03:30:22 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B52FD413F3;
	Fri, 11 Sep 2015 10:30:20 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id A29FFA52;
	Fri, 11 Sep 2015 10:30:20 +0300 (MSK)
Message-ID: <55F2830C.1000308@msgid.tls.msk.ru>
Date: Fri, 11 Sep 2015 10:30:20 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <1436788726-20590-1-git-send-email-kraxel@redhat.com>
In-Reply-To: <1436788726-20590-1-git-send-email-kraxel@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] virtio-vga: enable for i386
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
X-List-Received-Date: Fri, 11 Sep 2015 07:30:28 -0000

13.07.2015 14:58, Gerd Hoffmann wrote:
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Gerd, -trivial received 3 patches like this enabling various virtio
bits for various architectures.  I never got any reviewed-by or ACK
on these patches, so they're not applied still.  Maybe you can add
some explanation as to why you think it's a good idea, or else it
doesn't seem like a trivial change? :)

Thanks,

/mjt

>  default-configs/i386-softmmu.mak | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/default-configs/i386-softmmu.mak b/default-configs/i386-softmmu.mak
> index 48b5762..6f042e2 100644
> --- a/default-configs/i386-softmmu.mak
> +++ b/default-configs/i386-softmmu.mak
> @@ -7,6 +7,7 @@ CONFIG_QXL=$(CONFIG_SPICE)
>  CONFIG_VGA_ISA=y
>  CONFIG_VGA_CIRRUS=y
>  CONFIG_VMWARE_VGA=y
> +CONFIG_VIRTIO_VGA=y
>  CONFIG_VMMOUSE=y
>  CONFIG_SERIAL=y
>  CONFIG_PARALLEL=y
> 


