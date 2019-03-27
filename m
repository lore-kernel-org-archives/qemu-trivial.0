Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h95pF-0000VS-2p
	for mharc-qemu-trivial@gnu.org; Wed, 27 Mar 2019 06:30:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h95p9-0000Qt-2G
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2019 06:30:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h95p8-0001nz-6S
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2019 06:30:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43346)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h95p5-0001lO-Bp; Wed, 27 Mar 2019 06:30:19 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 67B2A307CE82;
	Wed, 27 Mar 2019 10:23:24 +0000 (UTC)
Received: from [10.36.117.163] (ovpn-117-163.ams2.redhat.com [10.36.117.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A6291949F;
	Wed, 27 Mar 2019 10:23:16 +0000 (UTC)
To: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
Cc: ehabkost@redhat.com, mst@redhat.com, qemu-trivial@nongnu.org,
	peterx@redhat.com, pbonzini@redhat.com, rth@twiddle.net
References: <155364147432.16467.15898335025013220939.stgit@gimli.home>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <a9c9aa0b-1100-1442-5188-8ff1481e0b27@redhat.com>
Date: Wed, 27 Mar 2019 11:23:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <155364147432.16467.15898335025013220939.stgit@gimli.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Wed, 27 Mar 2019 10:23:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] intel_iommu: Correct
 caching-mode error message
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
X-List-Received-Date: Wed, 27 Mar 2019 10:30:28 -0000

Hi,

On 3/27/19 12:05 AM, Alex Williamson wrote:
> If we try to use the intel-iommu device with vfio-pci devices without
> caching mode enabled, we're told:
> 
>   qemu-system-x86_64: We need to set caching-mode=1 for intel-iommu to enable
>   device assignment with IOMMU protection.
> 
> But to enable caching mode, the option is actually "caching-mode=on".
> 
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> ---
>  hw/i386/intel_iommu.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index b90de6c66461..b62badd4f08d 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -2919,7 +2919,7 @@ static void vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>      IntelIOMMUState *s = vtd_as->iommu_state;
>  
>      if (!s->caching_mode && new & IOMMU_NOTIFIER_MAP) {
> -        error_report("We need to set caching-mode=1 for intel-iommu to enable "
> +        error_report("We need to set caching-mode=on for intel-iommu to enable "
>                       "device assignment with IOMMU protection.");
>          exit(1);
>      }
> 
> 

