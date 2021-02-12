Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAZI1-0007zF-7w
	for mharc-qemu-trivial@gnu.org; Fri, 12 Feb 2021 09:19:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lAZHz-0007yE-4K
 for qemu-trivial@nongnu.org; Fri, 12 Feb 2021 09:19:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lAZHw-0001Fg-OS
 for qemu-trivial@nongnu.org; Fri, 12 Feb 2021 09:19:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613139555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u7cf4618wYECIBT/TdEAazlVz10qmEwPe/aMgBFOdSA=;
 b=QNFpwizurniGh9whT7gBRinkLVzZ73XoQXdmxrOE96BqHpYyk5Pq6OpE6kOB5+bebHF8VO
 sI5neT6gPOxOtgG8TMX/OIqds7Yj4Tf4nSZdkYL0l0nuUcYDVo6qYO/oQeV+gtwmCSUZcG
 5MVfd7G4Du2AQ+Pr1CUNvKcAlVHuInQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-YjaS4j5yOMqVN7qwuLBGsA-1; Fri, 12 Feb 2021 09:19:13 -0500
X-MC-Unique: YjaS4j5yOMqVN7qwuLBGsA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBEFB107ACF5;
 Fri, 12 Feb 2021 14:19:01 +0000 (UTC)
Received: from [10.36.112.23] (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E050950A8B;
 Fri, 12 Feb 2021 14:18:49 +0000 (UTC)
Subject: Re: [PATCH v3 2/4] virtio-net: add missing object_unref()
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 quintela@redhat.com, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, zhengxiang9@huawei.com,
 jfreimann@redhat.com
References: <20210212135250.2738750-1-lvivier@redhat.com>
 <20210212135250.2738750-3-lvivier@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <5fb5be33-f238-da12-3465-d55cf311d34e@redhat.com>
Date: Fri, 12 Feb 2021 15:18:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210212135250.2738750-3-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 12 Feb 2021 14:19:19 -0000

On 12/02/2021 14:52, Laurent Vivier wrote:
> failover_add_primary() calls qdev_device_add() and doesn't unref
> the device. Because of that, when the device is unplugged a reference
> is remaining and prevents the cleanup of the object.
> 
> This prevents to be able to plugin back the failover primary device,
> with errors like:
> 
>   (qemu) device_add vfio-pci,host=0000:41:00.0,id=hostdev0,bus=root.3,failover_pair_id=net0
>   (qemu) device_del hostdev0
> 
> We can check with "info qtree" and "info pci" that the device has been removed, and then:
> 
>   (qemu) device_add vfio-pci,host=0000:41:00.0,id=hostdev1,bus=root.3,failover_pair_id=net0
>   Error: vfio 0000:41:00.0: device is already attached
>   (qemu) device_add vfio-pci,host=0000:41:00.0,id=hostdev0,bus=root.3,failover_pair_id=net0
>   qemu-kvm: Duplicate ID 'hostdev0' for device
> 
> Fixes: 21e8709b29cd ("failover: Remove primary_dev member")
> Cc: quintela@redhat.com
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

I forgot to copy from the first review:
Reviewed-by: Jens Freimann <jfreimann@redhat.com>

> ---
>  hw/net/virtio-net.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 5150f295e8c5..1c5af08dc556 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -862,6 +862,8 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
>          dev = qdev_device_add(opts, &err);
>          if (err) {
>              qemu_opts_del(opts);
> +        } else {
> +            object_unref(OBJECT(dev));
>          }
>      } else {
>          error_setg(errp, "Primary device not found");
> 


