Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAZcl-0002c5-S1
	for mharc-qemu-trivial@gnu.org; Fri, 12 Feb 2021 09:40:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jfreimann@redhat.com>)
 id 1lAZch-0002Vw-Fk
 for qemu-trivial@nongnu.org; Fri, 12 Feb 2021 09:40:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jfreimann@redhat.com>)
 id 1lAZcd-0001yH-9W
 for qemu-trivial@nongnu.org; Fri, 12 Feb 2021 09:40:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613140836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SuVsU7pojW7S48jHOx0pST86uvysNSACHN9SQg5bwhI=;
 b=ZAhLUmEiKn87sFQFyjIOe2ef5AyoavS0ieGy24R+ygPJZH0ro+uJ2VeRojmf22ZWxZ5fNd
 PYmqMkky/AGolfMh4Q8hIhrJUHVVCb0kQaKItF6DdVeSfFcUrAaqIQq4CwQt++rQto/yF4
 GFL8OI6i8XPZKusiCnTk3uehLcNNgYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-igS48ofOPKeayybYuuY3xw-1; Fri, 12 Feb 2021 09:40:35 -0500
X-MC-Unique: igS48ofOPKeayybYuuY3xw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19F98801962;
 Fri, 12 Feb 2021 14:40:34 +0000 (UTC)
Received: from localhost (ovpn-113-71.ams2.redhat.com [10.36.113.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 944415D735;
 Fri, 12 Feb 2021 14:40:26 +0000 (UTC)
Date: Fri, 12 Feb 2021 15:40:24 +0100
From: Jens Freimann <jfreimann@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-trivial@nongnu.org, benh@kernel.crashing.org,
 zhengxiang9@huawei.com, quintela@redhat.com, alex.williamson@redhat.com
Subject: Re: [PATCH v3 3/4] failover: really display a warning when the
 primary device is not found
Message-ID: <YCaTWHb45o74cKUS@linux.fritz.box>
References: <20210212135250.2738750-1-lvivier@redhat.com>
 <20210212135250.2738750-4-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210212135250.2738750-4-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfreimann@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jfreimann@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 12 Feb 2021 14:40:43 -0000

On Fri, Feb 12, 2021 at 02:52:49PM +0100, Laurent Vivier wrote:
>In failover_add_primary(), we search the id of the failover device by
>scanning the list of the devices in the opts list to find a device with
>a failover_pair_id equals to the id of the virtio-net device.
>
>If the failover_pair_id is not found, QEMU ignores the primary
>device silently (which also means it will not be hidden and
>it will be enabled directly at boot).
>
>After that, we search the id in the opts list to do a qdev_device_add()
>with it. The device will be always found as otherwise we had exited
>before, and thus the warning is never displayed.
>
>Fix that by moving the error report to the first exit condition.
>Also add a g_assert() to be sure the compiler will not complain
>about a possibly NULL pointer.
>
>Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>---
> hw/net/virtio-net.c | 20 +++++++++-----------
> 1 file changed, 9 insertions(+), 11 deletions(-)
>

Thank you Laurent!

Reviewed-by: Jens Freimann <jfreimann@redhat.com>

regards,
Jens


