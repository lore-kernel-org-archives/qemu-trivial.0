Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1da1ui-0003gf-8h
	for mharc-qemu-trivial@gnu.org; Tue, 25 Jul 2017 11:38:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1da1uf-0003eJ-OK
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 11:38:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1da1ub-0001jt-M0
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 11:38:21 -0400
Received: from mail-wm0-f45.google.com ([74.125.82.45]:35972)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1da1ub-0001jO-Dr
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 11:38:17 -0400
Received: by mail-wm0-f45.google.com with SMTP id t201so49442027wmt.1
	for <qemu-trivial@nongnu.org>; Tue, 25 Jul 2017 08:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=o2Qe0mUs5d3dSDl/VqvnO3M4HsXkIoLWHZ5Ceq9AhVo=;
	b=RrAe+XCVEPesJeiX+4MSZ44Moe8gnmAa8Th7ir0yigrq+E9c2f9pRJzQqGdRuEPEn8
	nSByn9ARo8xF+rtHzvZ9is0rZR9PYiWMY/ufITWvRnUCn1LKVzqLKRr4NMwP8OuK8vE5
	PurdWVEi9SoZK5wbhRYmolaRClOFHrFfi+puuOvga8kpUcYeM43PW0IXvhsKFSM28xeC
	SWiUQx8LQ4r1djzY03EqsEdEOhsk2mfslp3hacBw3dhKDZ5RQiahK1+fcqbtWfJdbjvw
	b6JPfaSrXugmLOZcv+/snJ2wbVrBDdtMC0KfKl3zBAg/+xvriTSTXKvAGXr3KUocR6pt
	XGHA==
X-Gm-Message-State: AIVw111EmF0P8tNkI735R7J3Ec2prHV1sbEyjKUvf4Y6qG1eH2B1nmhu
	vQIGexkjYPlQ058V
X-Received: by 10.28.29.2 with SMTP id d2mr7723276wmd.152.1500997096317;
	Tue, 25 Jul 2017 08:38:16 -0700 (PDT)
Received: from [192.168.10.165] (94-39-195-172.adsl-ull.clienti.tiscali.it.
	[94.39.195.172]) by smtp.gmail.com with ESMTPSA id
	h68sm15815734wrh.32.2017.07.25.08.38.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jul 2017 08:38:15 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-14-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ac0e97ce-c5bf-260a-aea7-1332bda33073@redhat.com>
Date: Tue, 25 Jul 2017 17:38:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170724182751.18261-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.45
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.10 13/35] vfio/pci:
 fix use of freed memory
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
X-List-Received-Date: Tue, 25 Jul 2017 15:38:22 -0000

On 24/07/2017 20:27, Philippe Mathieu-Daudé wrote:
> hw/vfio/pci.c:308:29: warning: Use of memory after it is freed
>         qemu_set_fd_handler(*pfd, NULL, NULL, vdev);
>                             ^~~~
> 
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/vfio/pci.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index d4051cb951..31e1edf447 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -257,7 +257,7 @@ static void vfio_intx_update(PCIDevice *pdev)
>  static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
>  {
>      uint8_t pin = vfio_pci_read_config(&vdev->pdev, PCI_INTERRUPT_PIN, 1);
> -    int ret, argsz;
> +    int ret, argsz, retval = 0;
>      struct vfio_irq_set *irq_set;
>      int32_t *pfd;
>      Error *err = NULL;
> @@ -302,12 +302,12 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
>      qemu_set_fd_handler(*pfd, vfio_intx_interrupt, NULL, vdev);
>  
>      ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_SET_IRQS, irq_set);
> -    g_free(irq_set);
>      if (ret) {
>          error_setg_errno(errp, -ret, "failed to setup INTx fd");
>          qemu_set_fd_handler(*pfd, NULL, NULL, vdev);
>          event_notifier_cleanup(&vdev->intx.interrupt);
> -        return -errno;
> +        retval = -errno;
> +        goto cleanup;
>      }
>  
>      vfio_intx_enable_kvm(vdev, &err);
> @@ -319,7 +319,10 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
>  
>      trace_vfio_intx_enable(vdev->vbasedev.name);
>  
> -    return 0;
> +cleanup:
> +    g_free(irq_set);
> +
> +    return retval;
>  }
>  
>  static void vfio_intx_disable(VFIOPCIDevice *vdev)
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

