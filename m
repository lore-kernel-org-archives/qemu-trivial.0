Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1elHn4-0000XM-Up
	for mharc-qemu-trivial@gnu.org; Mon, 12 Feb 2018 12:21:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1elHn2-0000V5-MJ
	for qemu-trivial@nongnu.org; Mon, 12 Feb 2018 12:21:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1elHn1-00085s-Ov
	for qemu-trivial@nongnu.org; Mon, 12 Feb 2018 12:21:16 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35370 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1elHmx-00081s-HH; Mon, 12 Feb 2018 12:21:11 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 21EDD404084B;
	Mon, 12 Feb 2018 17:21:11 +0000 (UTC)
Received: from [10.10.122.122] (ovpn-122-122.rdu2.redhat.com [10.10.122.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDF06FD92A;
	Mon, 12 Feb 2018 17:21:08 +0000 (UTC)
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <151844508814.7999.5257918627784684957.stgit@bahia>
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <9ad4936c-e9b8-c55c-8aad-1f91e459528f@redhat.com>
Date: Mon, 12 Feb 2018 11:21:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <151844508814.7999.5257918627784684957.stgit@bahia>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 12 Feb 2018 17:21:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 12 Feb 2018 17:21:11 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtio-pci: trivial fixes
 in error message
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
X-List-Received-Date: Mon, 12 Feb 2018 17:21:17 -0000

On 02/12/2018 08:18 AM, Greg Kurz wrote:
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>   hw/virtio/virtio-pci.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index c20537f31de7..ae3e8e1ca9b8 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1585,7 +1585,7 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
>       if (legacy) {
>           if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
>               error_setg(errp, "VIRTIO_F_IOMMU_PLATFORM was supported by"
> -                       "neither legacy nor transitional device.");
> +                       " neither legacy nor transitional device");

Reviewed-by: Eric Blake <eblake@redhat.com>

(fixing both the missing space and the unneeded trailing dot)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

