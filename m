Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipu7I-0005Vf-Ak
	for mharc-qemu-trivial@gnu.org; Fri, 10 Jan 2020 08:14:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35872)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ipu7G-0005VR-3F
 for qemu-trivial@nongnu.org; Fri, 10 Jan 2020 08:14:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ipu7E-0004ut-KR
 for qemu-trivial@nongnu.org; Fri, 10 Jan 2020 08:14:17 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:35914
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ipu7E-0004s4-HA
 for qemu-trivial@nongnu.org; Fri, 10 Jan 2020 08:14:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578662055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dTeSyn7oUbkHvThdgdAj4NLY06b69s7RUsAYXGBaiP4=;
 b=X3xYVGa5fNRj0y0VajGcssMjzVm52rL5yZDGh35xjCAngLmmnMICl6Ka2nwXhBc64Nk7ya
 dyLIgvFhTyjNbvKMlyCZeA+vd6FsRqOra0a/TPmGbILKxh7o7VzU2D/8o2e0MM0ER0/wuU
 AEtyMH2KI9pNiVTidr9JQcs3xGordGQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-B2RVlhJkN1O0f8a9ksr7nA-1; Fri, 10 Jan 2020 08:14:12 -0500
Received: by mail-wm1-f71.google.com with SMTP id f25so754135wmb.1
 for <qemu-trivial@nongnu.org>; Fri, 10 Jan 2020 05:14:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JLFLPm8LQxLk2H6otzowzgvHPhaGbstgfoVndHDl0EM=;
 b=BbPgPWdC/xFbWvMCB1eMPssTl0oXLsD3sAddtfkSnIL6ShgJHR8qitN4cWfDGXJ89O
 f3oasOUe2OYT/7i2DyR5gMkGpEro7W8uPWCUH4T8G0uuCePFgCJnnsPfZIOySfOcHqgL
 vcy2FgKDscOHCTcjPFAGLj0a+03/DD8GplOjIht3eA4Wnl8cD2mJPiCDTpJE2bKnIF1U
 +os74CHuKdtwSpTPT7WvblZ2qlyCmtn63Qx9yois+iAYmqFAii9gFIMcWrSiVBAPj2Sm
 W9OvJukISGgqRTbavuA9G9gctVv7jdtpXJ4bMPNIjgSqSFeAg/HZzkxY1MaQpkodq0CW
 eDPw==
X-Gm-Message-State: APjAAAXGjRL1wxBAhY83cb+hWsPvzdDTZJn7bdnEnNNgx/Ymcu/9bedO
 C4knQXFYN08H+ve8xHu1JojzRBo27uYii9grSjDFP6/Ko/TdaO5DU+FgtJCHInmMJdOEONtUA6m
 2Oy0r9kxcItveaksBnw==
X-Received: by 2002:adf:d846:: with SMTP id k6mr3396343wrl.337.1578662050811; 
 Fri, 10 Jan 2020 05:14:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqz8SUwxI8bMv8xwPRHvujdFaXe3PLxIAiExQJZJQqQ0N0kFSgr51Rfz7fV4ivoULqmWscjAmg==
X-Received: by 2002:adf:d846:: with SMTP id k6mr3396322wrl.337.1578662050599; 
 Fri, 10 Jan 2020 05:14:10 -0800 (PST)
Received: from [10.101.1.81] ([176.12.107.132])
 by smtp.gmail.com with ESMTPSA id c9sm2133410wmc.47.2020.01.10.05.14.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2020 05:14:09 -0800 (PST)
Subject: Re: [PATCH] xhci: Fix memory leak in xhci_kick_epctx when poweroff
 GuestOS
To: kuhn.chenqun@huawei.com, qemu-devel@nongnu.org, kraxel@redhat.com
Cc: qemu-trivial@nongnu.org, pannengyuan@huawei.com,
 zhang.zhanghailiang@huawei.com
References: <20200110105855.81144-1-kuhn.chenqun@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d5e369c6-b1c2-2b64-97a5-d9b2fc443842@redhat.com>
Date: Fri, 10 Jan 2020 14:14:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200110105855.81144-1-kuhn.chenqun@huawei.com>
Content-Language: en-US
X-MC-Unique: B2RVlhJkN1O0f8a9ksr7nA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jan 2020 13:14:19 -0000

On 1/10/20 11:58 AM, kuhn.chenqun@huawei.com wrote:
> From: Chen Qun <kuhn.chenqun@huawei.com>
>=20
> start vm with libvirt, when GuestOS running, enter poweroff command using
> the xhci keyboard, then ASAN shows memory leak stack=EF=BC=9A
>=20
> Direct leak of 80 byte(s) in 5 object(s) allocated from:
>      #0 0xfffd1e6431cb in __interceptor_malloc (/lib64/libasan.so.4+0xd31=
cb)
>      #1 0xfffd1e107163 in g_malloc (/lib64/libglib-2.0.so.0+0x57163)
>      #2 0xaaad39051367 in qemu_sglist_init /qemu/dma-helpers.c:43
>      #3 0xaaad3947c407 in pci_dma_sglist_init /qemu/include/hw/pci/pci.h:=
842
>      #4 0xaaad3947c407 in xhci_xfer_create_sgl /qemu/hw/usb/hcd-xhci.c:14=
46
>      #5 0xaaad3947c407 in xhci_setup_packet /qemu/hw/usb/hcd-xhci.c:1618
>      #6 0xaaad3948625f in xhci_submit /qemu/hw/usb/hcd-xhci.c:1827
>      #7 0xaaad3948625f in xhci_fire_transfer /qemu/hw/usb/hcd-xhci.c:1839
>      #8 0xaaad3948625f in xhci_kick_epctx /qemu/hw/usb/hcd-xhci.c:1991
>      #9 0xaaad3948f537 in xhci_doorbell_write /qemu/hw/usb/hcd-xhci.c:315=
8
>      #10 0xaaad38bcbfc7 in memory_region_write_accessor /qemu/memory.c:48=
3
>      #11 0xaaad38bc654f in access_with_adjusted_size /qemu/memory.c:544
>      #12 0xaaad38bd1877 in memory_region_dispatch_write /qemu/memory.c:14=
82
>      #13 0xaaad38b1c77f in flatview_write_continue /qemu/exec.c:3167
>      #14 0xaaad38b1ca83 in flatview_write /qemu/exec.c:3207
>      #15 0xaaad38b268db in address_space_write /qemu/exec.c:3297
>      #16 0xaaad38bf909b in kvm_cpu_exec /qemu/accel/kvm/kvm-all.c:2383
>      #17 0xaaad38bb063f in qemu_kvm_cpu_thread_fn /qemu/cpus.c:1246
>      #18 0xaaad39821c93 in qemu_thread_start /qemu/util/qemu-thread-posix=
.c:519
>      #19 0xfffd1c8378bb  (/lib64/libpthread.so.0+0x78bb)
>      #20 0xfffd1c77616b  (/lib64/libc.so.6+0xd616b)
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
>   hw/usb/hcd-xhci.c | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> index 80988bb305..0d3d96d05a 100644
> --- a/hw/usb/hcd-xhci.c
> +++ b/hw/usb/hcd-xhci.c
> @@ -2000,6 +2000,7 @@ static void xhci_kick_epctx(XHCIEPContext *epctx, u=
nsigned int streamid)
>           if (xfer !=3D NULL && xfer->running_retry) {
>               DPRINTF("xhci: xfer nacked, stopping schedule\n");
>               epctx->retry =3D xfer;
> +            xhci_xfer_unmap(xfer);

Shouldn't we use xhci_ep_free_xfer() instead?
Also, it would be cleaner if you set it to NULL.

>               break;
>           }
>           if (count++ > TRANSFER_LIMIT) {
>=20


