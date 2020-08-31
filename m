Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kChLK-0003aJ-NE
	for mharc-qemu-trivial@gnu.org; Mon, 31 Aug 2020 06:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kChLI-0003ZQ-5T
 for qemu-trivial@nongnu.org; Mon, 31 Aug 2020 06:47:16 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:28950
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kChLG-0006GU-K8
 for qemu-trivial@nongnu.org; Mon, 31 Aug 2020 06:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598870833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=umknKpRa/Hk2w4cmnV/bbQBB8EnHVqB/Mwx8H/7by9M=;
 b=AYdTUSLWzDbHRGAt1eH+QLqAjqq9PGLAmzi8gZUFlN9rz2Kr+nShJaMc8CtCm35ZN0OxxL
 WMS1SBwzHh4YKBDtFjnhDpkNiUyH8CajnsAW6+D8uIgpM8VaxznLCuO2YEahCZ+zbpCiKr
 XyzoP/PLg526/sd3UWWerabzR4kdIno=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-OSTzTP6UMZSm_WhLvSdvyw-1; Mon, 31 Aug 2020 06:47:11 -0400
X-MC-Unique: OSTzTP6UMZSm_WhLvSdvyw-1
Received: by mail-wr1-f70.google.com with SMTP id b8so3081903wrr.2
 for <qemu-trivial@nongnu.org>; Mon, 31 Aug 2020 03:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=umknKpRa/Hk2w4cmnV/bbQBB8EnHVqB/Mwx8H/7by9M=;
 b=k9ZOBpHL7B7cSiLtUHTI1H0BvYdZbuQBl4aU9JAh1iJA5hONU/DMdHYOS2wCyqXfEy
 UmwaGtt6601+uV6NHBSmDLrygex8yWRueqO8Nvw1010FwTfopEyZnrrQkT05K0L7UihW
 +y3jUl83qz+XT4cBxYdkasYzZ20vENcokS2dQ76M8Hd0eVu4lsde1awbANW2XibbO0ud
 jeCA606mYwO+WwEeH+0Tf63Bi6kMmWYsHVTM8zPMICwppqYuMBop6INnqSUKMLtc+aT7
 74v5wCLmYNopphpi8uBfIEP4W8FWfeZn5pK6PYOSaxBR2b+lQjZCoizCTaPMuKCIAY66
 hlHA==
X-Gm-Message-State: AOAM532BUE8Vrw/iKo5LoKyWSm5Ah2F+OlXudcYZREoR+vDoxI/qqreW
 W8JQuAwbvBaRTsfmkLchtffthSmJuX9JG4rkFyqJxBsN7DhV6cmP6M910ByXVl9bP17g474Wbbe
 T//XrHF4PzxqtKkuJEg==
X-Received: by 2002:a5d:644b:: with SMTP id d11mr1013449wrw.373.1598870830290; 
 Mon, 31 Aug 2020 03:47:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyp0N51/sBROKOQg7uX3JoT2sanhwRg1O3CLhGEA9lqObh6ffILLVclPtTcMj+ehy3Nm9+Guw==
X-Received: by 2002:a5d:644b:: with SMTP id d11mr1013434wrw.373.1598870830097; 
 Mon, 31 Aug 2020 03:47:10 -0700 (PDT)
Received: from redhat.com (bzq-79-181-14-13.red.bezeqint.net. [79.181.14.13])
 by smtp.gmail.com with ESMTPSA id
 33sm12181796wri.16.2020.08.31.03.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 03:47:09 -0700 (PDT)
Date: Mon, 31 Aug 2020 06:46:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, pannengyuan@huawei.com,
 zhang.zhanghailiang@huawei.com, Euler Robot <euler.robot@huawei.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH 05/11] hw/virtio/vhost-user:Remove dead assignment in
 scrub_shadow_regions()
Message-ID: <20200831064640-mutt-send-email-mst@kernel.org>
References: <20200813073712.4001404-1-kuhn.chenqun@huawei.com>
 <20200813073712.4001404-6-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200813073712.4001404-6-kuhn.chenqun@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 03:56:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Mon, 31 Aug 2020 10:47:16 -0000

On Thu, Aug 13, 2020 at 03:37:06PM +0800, Chen Qun wrote:
> Clang static code analyzer show warning:
> hw/virtio/vhost-user.c:606:9: warning: Value stored to 'mr' is never read
>         mr = vhost_user_get_mr_data(reg->userspace_addr, &offset, &fd);
>         ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

feel free to merge through the trivial tree

> ---
>  hw/virtio/vhost-user.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index d7e2423762..9c5b4f7fbc 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -603,7 +603,7 @@ static void scrub_shadow_regions(struct vhost_dev *dev,
>       */
>      for (i = 0; i < dev->mem->nregions; i++) {
>          reg = &dev->mem->regions[i];
> -        mr = vhost_user_get_mr_data(reg->userspace_addr, &offset, &fd);
> +        vhost_user_get_mr_data(reg->userspace_addr, &offset, &fd);
>          if (fd > 0) {
>              ++fd_num;
>          }
> -- 
> 2.23.0


