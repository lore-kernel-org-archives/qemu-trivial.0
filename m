Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fDLo4-0000ZZ-Vo
	for mharc-qemu-trivial@gnu.org; Mon, 30 Apr 2018 23:18:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fDLo3-0000ZQ-Bv
	for qemu-trivial@nongnu.org; Mon, 30 Apr 2018 23:18:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fDLo0-0007UB-6o
	for qemu-trivial@nongnu.org; Mon, 30 Apr 2018 23:18:19 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:33048)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fDLo0-0007Tx-0z; Mon, 30 Apr 2018 23:18:16 -0400
Received: by mail-qt0-x243.google.com with SMTP id e8-v6so8540671qth.0;
	Mon, 30 Apr 2018 20:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qpkzMYO5db+ydMZqguMaFMWvSB4AImgWZvrE3n0y8mc=;
	b=s2+TFp19H7SWs8v7zepL4XznHp3XhMbi5dMmzf7EDxLQQgaXYaF6Bg3vYMkHYOpL79
	XOunb3VUfwz63cBgRVjMGRGoTjVCGf19I4b6mlaghjAPCCZBSqP1ZKeclzX7xs0OPAlw
	iPt9ycOOAIfp6kVWk4kvgaExYuYoBKiu1szWnDl4OFV02wkLLQB8HKNMl5yRS1oOsOEQ
	PUvuefPglxhytlmZKxa5ONSXdiKk8JYOY/uOnv+BmAAS5+jceN7s1VNjzSflBK2IU2lg
	cNRUPZZotqBOcpD2AbuizmeJB9beYG9Zm3JfOCZpoKoV0vdVMBhDJMk3E3D15wNen3qm
	VkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=qpkzMYO5db+ydMZqguMaFMWvSB4AImgWZvrE3n0y8mc=;
	b=VGQY6cT9o4lwGufjDDMpMp8/Yih39fnr+Tt5AjpqkEFt+IDoJfmHgZ4sxsXGHYrs6t
	0liSXvQtyEWUNXH6gPt2HlmawmCLMZI50i6j6RPvESr6ViWKePf/Cs+yoS97LDtDpPVG
	mOt5FRlC4/EHqXp71CRgwdKZxA0MKxWXlD+dq8AyFTVc0Y1Y86Mtre1OOP6rdmFskPQ+
	2IRlNxZ9cBwkUJV82WRQ9l8aGMyYTNyocWiF2BAyettDq+nmh99axUBnp7k8RyyGe/NE
	Pw7ZzF2IRqZCubqFxFUZ5bHQh3/OIjXFUicnlFf7lllYfUC6Q9rLmA0XREXY04A6A27V
	CXtg==
X-Gm-Message-State: ALQs6tBjzHuU+bDlpNsrRqlF0XHP0E8Qk6CUfChF6juKwED56NGbujdb
	tGdwCo1KSVBs8BohJDT6cF0=
X-Google-Smtp-Source: AB8JxZrfj09e1scobhh1XaqX3+GTMByyZFJO8NDBPZVOz5B/0V5wc8Y4/Sjais9GpPwOSj2P7PSZvQ==
X-Received: by 2002:ac8:2725:: with SMTP id
	g34-v6mr12771635qtg.86.1525144695600; 
	Mon, 30 Apr 2018 20:18:15 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	n83sm7453195qke.58.2018.04.30.20.18.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Apr 2018 20:18:15 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>
References: <1525073539-27991-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <ba65d189-1963-1134-195f-5aa2f5dcd531@amsat.org>
Date: Tue, 1 May 2018 00:18:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1525073539-27991-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] trivial: Do not include
 pci.h if it is not necessary
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
X-List-Received-Date: Tue, 01 May 2018 03:18:20 -0000

On 04/30/2018 04:32 AM, Thomas Huth wrote:
> There is no need to include pci.h in these files.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/hw/ppc/ppc4xx.h            | 2 --
>  include/hw/virtio/virtio-balloon.h | 1 -
>  include/hw/virtio/virtio-gpu.h     | 1 -
>  3 files changed, 4 deletions(-)
> 
> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
> index cb0bb55..3a2a04c 100644
> --- a/include/hw/ppc/ppc4xx.h
> +++ b/include/hw/ppc/ppc4xx.h
> @@ -25,8 +25,6 @@
>  #ifndef PPC4XX_H
>  #define PPC4XX_H
>  
> -#include "hw/pci/pci.h"
> -
>  /* PowerPC 4xx core initialization */
>  PowerPCCPU *ppc4xx_init(const char *cpu_model,
>                          clk_setup_t *cpu_clk, clk_setup_t *tb_clk,

"ppc4xx.h" misses various includes...

> diff --git a/include/hw/virtio/virtio-balloon.h b/include/hw/virtio/virtio-balloon.h
> index 1ea13bd..e0df352 100644
> --- a/include/hw/virtio/virtio-balloon.h
> +++ b/include/hw/virtio/virtio-balloon.h
> @@ -17,7 +17,6 @@
>  
>  #include "standard-headers/linux/virtio_balloon.h"
>  #include "hw/virtio/virtio.h"
> -#include "hw/pci/pci.h"
>  
>  #define TYPE_VIRTIO_BALLOON "virtio-balloon-device"
>  #define VIRTIO_BALLOON(obj) \
> diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
> index 22ac3c2..79bb3fb 100644
> --- a/include/hw/virtio/virtio-gpu.h
> +++ b/include/hw/virtio/virtio-gpu.h
> @@ -18,7 +18,6 @@
>  #include "ui/qemu-pixman.h"
>  #include "ui/console.h"
>  #include "hw/virtio/virtio.h"
> -#include "hw/pci/pci.h"
>  #include "qemu/log.h"
>  
>  #include "standard-headers/linux/virtio_gpu.h"
> 

Weirdness of virtio-gpu.h, it uses VIRTIO_PCI_FLAG_USE_IOEVENTFD which
is defined in the local hw/virtio/virtio-pci.h (local = not under include/)

Anyway any of those requires "hw/pci/pci.h", so:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

