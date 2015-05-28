Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxwkO-0005Qt-H5
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:17:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YxwkG-0005Cu-Rb
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:17:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YxwkC-00067p-Qu
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:17:08 -0400
Received: from mail-ie0-f180.google.com ([209.85.223.180]:33785)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YxwkC-00067a-N5
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:17:04 -0400
Received: by iebgx4 with SMTP id gx4so36536578ieb.0
	for <qemu-trivial@nongnu.org>; Thu, 28 May 2015 05:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VPghFf4RvFH8IZEGNbWedmq2bgFxTaj3agzkyYaLTX8=;
	b=d2V4176cRtZxpYfE+2JyYgoxKs+6SdpdohFrCsUc2O00pT/FEpvtHnJznf7z7saqBN
	/BWIKa9RSR/S0uHRRX0flJHp8c6LmYjTjfC2RL8ETIx1mzbZluEpEKkJD5gLCBy75H1c
	UcN5OQuRnNa78ALee0IPmXGyLuHlm+t4ZU7PpsDll67MxW0MWx7cs8cA8vhCcCXvV7w8
	vpVSH2N78FfmBwbEf1D61Vv3aF0pn1toCk7sD3ey7yrgWW7zg7yN/oVzzS0qhct2sZll
	6MAERdODoGOinLohAaKgyUSpqeUIw7sG6jbBD88DCylgxK2ig6jEvIty63cvL06UWJfh
	vAcw==
X-Gm-Message-State: ALoCoQma5vTA4T9Ap1fJpgBE0fqBCaoMhLHTqYrs3z06gbJITSj0Rj8fI+xQrXjGCL4JRaTcjx6A
X-Received: by 10.107.133.154 with SMTP id p26mr2971419ioi.7.1432815424215;
	Thu, 28 May 2015 05:17:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.181.6 with HTTP; Thu, 28 May 2015 05:16:43 -0700 (PDT)
In-Reply-To: <1432814932-12608-2-git-send-email-zhaoshenglong@huawei.com>
References: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
	<1432814932-12608-2-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2015 13:16:43 +0100
Message-ID: <CAFEAcA_ya9V+kLVCrqU-wuG7cbJNf4ZX+xS9OsLgmzBveyXT1g@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.223.180
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH 01/29] hw/ide/ahci.c: Fix memory leak
	spotted by valgrind
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
X-List-Received-Date: Thu, 28 May 2015 12:17:13 -0000

On 28 May 2015 at 13:08, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> valgrind complains about:
> ==23381== 8 bytes in 1 blocks are definitely lost in loss record 438 of 2,785
> ==23381==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
> ==23381==    by 0x35478F: malloc_and_trace (vl.c:2556)
> ==23381==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
> ==23381==    by 0x3ED98B: qemu_extend_irqs (irq.c:55)
> ==23381==    by 0x3EDA17: qemu_allocate_irqs (irq.c:64)
> ==23381==    by 0x43D767: ahci_init (ahci.c:1356)
> ==23381==    by 0x43DAC5: sysbus_ahci_realize (ahci.c:1520)
> ==23381==    by 0x3EA4CC: device_set_realized (qdev.c:1058)
> ==23381==    by 0x516CD2: property_set_bool (object.c:1514)
> ==23381==    by 0x5155CC: object_property_set (object.c:837)
> ==23381==    by 0x5178EE: object_property_set_qobject (qom-qobject.c:24)
> ==23381==    by 0x51583B: object_property_set_bool (object.c:905)
>
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/ide/ahci.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
> index 9e5d862..4702a05 100644
> --- a/hw/ide/ahci.c
> +++ b/hw/ide/ahci.c
> @@ -1367,6 +1367,7 @@ void ahci_init(AHCIState *s, DeviceState *qdev, AddressSpace *as, int ports)
>          ad->port.dma->ops = &ahci_dma_ops;
>          ide_register_restart_cb(&ad->port);
>      }
> +    g_free(irqs);
>  }

Freeing the return value of qemu_allocate_irqs()
directly rather than using qemu_free_irqs() looks
dubious to me.

-- PMM

