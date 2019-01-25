Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gn4dM-0006b3-Pr
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2019 11:47:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gn4dE-0006Yt-UC
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 11:47:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gn4dD-0008CI-NE
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 11:47:04 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35635)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gn4dD-0008AW-Fy
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 11:47:03 -0500
Received: by mail-wr1-f68.google.com with SMTP id 96so11041703wrb.2
	for <qemu-trivial@nongnu.org>; Fri, 25 Jan 2019 08:47:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RweHb0k96jfZWbiP5IWE/VQkaDIqdxUtWZIpzvAI98w=;
	b=ePTxsJuaHJrikMloOmmErOJFNZzj/PshkN3CfF8QjauVrrR2vKS9Hg3/GJJNc91o03
	ZW1oME76OTxJbxlCFZovryt/SlEuC9ZKG2B4kfbrtkExIrZbbl++EGn4jhB2tBCoX0oD
	8vLlk1x/lnEQNriVGG1rb9oD22FB/moa4Z5hI6uX+yUQ+5FSI8Rd41oKhbFCKYLSnSeX
	fc+rUFbCBPOGSLFBN3IgEASI2Gpup7/3q8RKDrgCURxfbtIdf2KOB4JlrFfhbsx2PSFS
	Dw+OZdli/8KAz4VtvDpbMCxjTXlBQnvtzK+0TKblttGPMFi2dnIj0hEPRpBXG0H9evLE
	7ppQ==
X-Gm-Message-State: AHQUAubcLwV6ykbcevzg0XA8uwiXWvWqwz/zhJUOKGblaxHb6iDwqo7K
	YMKUcx9JzvTd468mTzP/SPQRdA==
X-Google-Smtp-Source: AHgI3IYx6G+wfFtg/KnK/m4z3mGBK0c1x4Ow3LTNYiVZUSIQHHiGZFaxb6KTwd7NdisZAaZCOnQ5Kg==
X-Received: by 2002:a05:6000:11c3:: with SMTP id
	i3mr7469705wrx.221.1548434821631; 
	Fri, 25 Jan 2019 08:47:01 -0800 (PST)
Received: from [192.168.1.39] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	f22sm14433027wmj.26.2019.01.25.08.47.00
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 08:47:01 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-s390x@nongnu.org,
	Miroslav Rezanina <mrezanin@redhat.com>
References: <1548420960-5555-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <47446e41-5758-4ec3-34c3-fded0413e104@redhat.com>
Date: Fri, 25 Jan 2019 17:47:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1548420960-5555-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/virtio: Use
 CONFIG_VIRTIO_PCI switch instead of CONFIG_PCI
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
X-List-Received-Date: Fri, 25 Jan 2019 16:47:07 -0000

On 1/25/19 1:56 PM, Thomas Huth wrote:
> For downstream s390x builds, we'd like to be able to build QEMU with
> CONFIG_VIRTIO_PCI disabled (since virtio-ccw is used here instead),
> but still with CONFIG_PCI enabled. This currently fails since the
> virtio-*-pci.o files are still included in the build, but virtio-pci.o
> is missing. Use the right config switch CONFIG_VIRTIO_PCI to exclude
> the virtio-*-pci.o files from the build.
> 
> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/virtio/Makefile.objs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs
> index ea7913d..d335dd0 100644
> --- a/hw/virtio/Makefile.objs
> +++ b/hw/virtio/Makefile.objs
> @@ -11,7 +11,7 @@ obj-$(call land,$(CONFIG_VIRTIO_CRYPTO),$(CONFIG_VIRTIO_PCI)) += virtio-crypto-p
>  
>  obj-$(CONFIG_LINUX) += vhost.o vhost-backend.o vhost-user.o
>  obj-$(CONFIG_VHOST_VSOCK) += vhost-vsock.o
> -ifeq ($(CONFIG_PCI),y)
> +ifeq ($(CONFIG_VIRTIO_PCI),y)
>  obj-$(CONFIG_VHOST_VSOCK) += vhost-vsock-pci.o
>  obj-$(CONFIG_VHOST_USER_BLK) += vhost-user-blk-pci.o
>  obj-$(CONFIG_VHOST_USER_SCSI) += vhost-user-scsi-pci.o
> 

