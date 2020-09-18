Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kJFCr-0006uA-Lj
	for mharc-qemu-trivial@gnu.org; Fri, 18 Sep 2020 08:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kJFCq-0006sm-CB
 for qemu-trivial@nongnu.org; Fri, 18 Sep 2020 08:09:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kJFCo-0000VL-UT
 for qemu-trivial@nongnu.org; Fri, 18 Sep 2020 08:09:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600430973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GI7GzSHEhKfeZ8mgyUB2+60HYpZEbSxq1LSwUWCPvjU=;
 b=esC4PFnDIKaiJ8AAxiqHO3w9qWfbltSXBl4Gj/rwmaPekLLDQAMS6y/KBdTjgbggIFHTGa
 5hdDIpDRfHir2t+jmsWKXwzBOVs0IQqJnlJ4yzq2HWHU80EkSmTXmnKWeZCxylGkUfc5Fi
 BrBDTPTFuQcejczBXwx4PAXKl6LoApU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-ovdLm2d_OOuzCVMeUnmfwg-1; Fri, 18 Sep 2020 08:09:30 -0400
X-MC-Unique: ovdLm2d_OOuzCVMeUnmfwg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5FEB81F004;
 Fri, 18 Sep 2020 12:09:28 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19C1D5C225;
 Fri, 18 Sep 2020 12:09:23 +0000 (UTC)
Subject: Re: [PATCH] vhost-vdpa: don't check g_malloc() return value
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20200918120301.729794-1-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ce98054d-7410-50ca-79e8-48ec3405c5ad@redhat.com>
Date: Fri, 18 Sep 2020 14:09:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200918120301.729794-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 00:20:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.869, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Fri, 18 Sep 2020 12:09:36 -0000

On 18/09/2020 14.03, Laurent Vivier wrote:
> On failure, g_malloc() aborts the program, we don't need to check the
> return value
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  hw/virtio/vhost-vdpa.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 4580f3efd8a2..23a4a957ef77 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -321,9 +321,6 @@ static int vhost_vdpa_set_config(struct vhost_dev *dev, const uint8_t *data,
>      int ret;
>      unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
>      config = g_malloc(size + config_size);
> -    if (config == NULL) {
> -        return -1;
> -    }
>      config->off = offset;
>      config->len = size;
>      memcpy(config->buf, data, size);
> @@ -340,9 +337,6 @@ static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
>      int ret;
>  
>      v_config = g_malloc(config_len + config_size);
> -    if (v_config == NULL) {
> -        return -1;
> -    }
>      v_config->len = config_len;
>      v_config->off = 0;
>      ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_CONFIG, v_config);
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


