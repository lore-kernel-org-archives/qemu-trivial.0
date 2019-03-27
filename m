Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h94Pj-0005eB-JN
	for mharc-qemu-trivial@gnu.org; Wed, 27 Mar 2019 05:00:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h94Pg-0005c3-VN
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2019 05:00:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h94Pg-0000TC-0x
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2019 05:00:00 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:43523)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h94Pd-0000S5-LH; Wed, 27 Mar 2019 04:59:57 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
	1M89P1-1h3pDd1hYp-005KhZ; Wed, 27 Mar 2019 09:59:46 +0100
To: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
Cc: ehabkost@redhat.com, mst@redhat.com, qemu-trivial@nongnu.org,
	peterx@redhat.com, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
	rth@twiddle.net
References: <155364147432.16467.15898335025013220939.stgit@gimli.home>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <256a87f8-a417-0082-77fa-a66ca4c20536@vivier.eu>
Date: Wed, 27 Mar 2019 09:59:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <155364147432.16467.15898335025013220939.stgit@gimli.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:IBLzDjueEAdAQ1FJuN+vJ5J8WNO1pyOjhtOkrp+17sQ0ryXyxCW
	83bOVNInoaEGhtoJgwRsTxSwpGMac6cz/L6iWr19NoEROCC7+cjfIHBArm0/P0nfZpU69R9
	WsNh5OgOuM+JhsNdlEJJvOKqsdlzPYugixwys6aJI8rPixukg88uaCOenpa2mPS7eEiLS3y
	ZXohvtuSs1qPwgr1/RATw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:M9ZJhYEKqkM=:aBpqZICCkw0VKI/qHduQsO
	qcjoKRrwUdW6XhOOy40HXuQ6IymNQ9yGSmhkQaR6FGb7oQSCSOjPOG8J936KQttFUKL31NLm1
	BaHzDKUEJRLsfBg3nBblcCxacFwzEAEs8BiOixigN/okhPL62OlJYcL/cL3vM6oNit5/eiBWQ
	roj6oEdjp69qzidO7jFV0hWjck15cM8f/a04mNAIs3gxURcBDMcTJQQDSb1AJbwI3Jw0tllbv
	8ihr7MMuK4+3K3/zh22BIilf9ppcUvUjBWpObddJSF8jE+TKb01z/StSZ7Dd9vq6YFC0aFe/M
	n5WAQj/UJA6E5mpuW+k4NFVc3F0BqNxk69F7ZoDL4ULqM0/YaiPCWSIR9wXmCJoPP3Bs4Py08
	1DwjHSnZp4fdo8FEf6XHb+h3XBkcGe9CRvcYA1quj4+r4hJLbYnE1CbYmkKmhfxaBaAHmji6S
	pZDndg085r9cT4Kc0vJPPwmxcX6OlSSh8kmNa7SCrJsVLJVJU/eI/91gLkKhGzMY9sq64FYgR
	R6XAC8/90w/O2Qujg831NLIThhrPz/ukh9Z0SkYu3lL8gS3DRoVS3xL61t70G9b9X34VM/CEv
	lkN1TnqHDYiER0KR9JlyOS+DyioT5jojgL3zpRGP9kB3QMb+fXXxE4gPVtAnmdyfFO5OK6iOX
	QP1+1zUgzLPeDgT87F6IT7HXQMyjGnQeSvStDAbdpYAEwq5OrXMh8U6buxdmt+T32pP3T8Xk3
	RF3oGxH2e/ATZio6tgurlyjZEEGm6YjhcppsoHhpzfRzT4/ixmpWsm2e/So=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: Re: [Qemu-trivial] [PATCH] intel_iommu: Correct caching-mode error
 message
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
X-List-Received-Date: Wed, 27 Mar 2019 09:00:02 -0000

On 27/03/2019 00:05, Alex Williamson wrote:
> If we try to use the intel-iommu device with vfio-pci devices without
> caching mode enabled, we're told:
> 
>    qemu-system-x86_64: We need to set caching-mode=1 for intel-iommu to enable
>    device assignment with IOMMU protection.
> 
> But to enable caching mode, the option is actually "caching-mode=on".
> 
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---
>   hw/i386/intel_iommu.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index b90de6c66461..b62badd4f08d 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -2919,7 +2919,7 @@ static void vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>       IntelIOMMUState *s = vtd_as->iommu_state;
>   
>       if (!s->caching_mode && new & IOMMU_NOTIFIER_MAP) {
> -        error_report("We need to set caching-mode=1 for intel-iommu to enable "
> +        error_report("We need to set caching-mode=on for intel-iommu to enable "
>                        "device assignment with IOMMU protection.");
>           exit(1);
>       }
> 
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


