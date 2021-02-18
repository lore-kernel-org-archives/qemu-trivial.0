Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lCcNu-00039Z-Aw
	for mharc-qemu-trivial@gnu.org; Thu, 18 Feb 2021 01:01:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lCcNn-00037l-CP
 for qemu-trivial@nongnu.org; Thu, 18 Feb 2021 01:01:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lCcNg-0008Jw-Q8
 for qemu-trivial@nongnu.org; Thu, 18 Feb 2021 01:01:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613628099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8INPDyffZKUTlNdxYrYWOxncMtyXJuLhDjD8DmHtbrk=;
 b=eBnF9a8/Y/cN6y82W1hpPI9Tb8+SSnSUbg3/4y0y5YbGvZs7op43tZYRNfKZ7D01xNnuC4
 sMwZtkhGA7Gsf25Hd+w08cSvdY+utjKnCGEpObj0gDYu92xpLWFgYCp9mvCVyFk2E+rrUr
 rNfo8hmqruzQiBoIVPE3nIWXMkA2Q4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-dxc9iknhOlq6oXYaI3ZWWA-1; Thu, 18 Feb 2021 01:01:37 -0500
X-MC-Unique: dxc9iknhOlq6oXYaI3ZWWA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E878D192AB79;
 Thu, 18 Feb 2021 06:01:35 +0000 (UTC)
Received: from [10.72.13.28] (ovpn-13-28.pek2.redhat.com [10.72.13.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFD655D9C2;
 Thu, 18 Feb 2021 06:01:26 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] failover: really display a warning when the
 primary device is not found
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, quintela@redhat.com,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, jfreimann@redhat.com,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
References: <20210210174518.2493928-1-lvivier@redhat.com>
 <20210210174518.2493928-4-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2eb9122a-700c-ed7f-c0c5-829dad009a85@redhat.com>
Date: Thu, 18 Feb 2021 14:01:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210210174518.2493928-4-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
X-List-Received-Date: Thu, 18 Feb 2021 06:01:48 -0000


On 2021/2/11 上午1:45, Laurent Vivier wrote:
> In failover_add_primary(), we search the id of the failover device by
> scanning the list of the devices in the opts list to find a device with
> a failover_pair_id equals to the id of the virtio-net device.
>
> If the failover_pair_id is not found, QEMU ignores the primary
> device silently (which also means it will not be hidden and
> it will be enabled directly at boot).
>
> After that, we search the id in the opts list to do a qdev_device_add()
> with it. The device will be always found as otherwise we had exited
> before, and thus the warning is never displayed.
>
> Fix that by moving the error report to the first exit condition.
> Also add a g_assert() to be sure the compiler will not complain
> about a possibly NULL pointer.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/net/virtio-net.c | 20 +++++++++-----------
>   1 file changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 1c5af08dc556..439f823b190c 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -855,21 +855,19 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
>   
>       id = failover_find_primary_device_id(n);
>       if (!id) {
> +        error_setg(errp, "Primary device not found");
> +        error_append_hint(errp, "Virtio-net failover will not work. Make "
> +                          "sure primary device has parameter"
> +                          " failover_pair_id=%s\n", n->netclient_name);
>           return;
>       }
>       opts = qemu_opts_find(qemu_find_opts("device"), id);
> -    if (opts) {
> -        dev = qdev_device_add(opts, &err);
> -        if (err) {
> -            qemu_opts_del(opts);
> -        } else {
> -            object_unref(OBJECT(dev));
> -        }
> +    g_assert(opts); /* cannot be NULL because id was found using opts list */
> +    dev = qdev_device_add(opts, &err);
> +    if (err) {
> +        qemu_opts_del(opts);
>       } else {
> -        error_setg(errp, "Primary device not found");
> -        error_append_hint(errp, "Virtio-net failover will not work. Make "
> -                          "sure primary device has parameter"
> -                          " failover_pair_id=<virtio-net-id>\n");
> +        object_unref(OBJECT(dev));
>       }
>       error_propagate(errp, err);
>   }


