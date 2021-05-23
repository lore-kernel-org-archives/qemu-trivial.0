Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lkj4k-0005ic-7L
	for mharc-qemu-trivial@gnu.org; Sun, 23 May 2021 04:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lkj4i-0005gs-6h
 for qemu-trivial@nongnu.org; Sun, 23 May 2021 04:03:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lkj4e-0000mv-O1
 for qemu-trivial@nongnu.org; Sun, 23 May 2021 04:03:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621756978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GEUjU14OJxOMpMwYbGCpZd0GXP6hP6CTz55rfv47wT4=;
 b=PbqQugg7OTVpJqbCettYo8ZMqPKbZM3HHEHwtgGAQvf6DPC1OaPur2s4b+VW2Hr9XEt0AD
 6YEz0k1gyBlsS6MYv/SnrJqBSkuGHd60YIqy/f4V59+l7KUa+DQnauyi9SBYj7f6Pod0j0
 BjEdkwtoMjxoj+jHolffBuSKFTB9LSw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-kpbO6Mt_MI20cKBmZHmz8w-1; Sun, 23 May 2021 04:02:55 -0400
X-MC-Unique: kpbO6Mt_MI20cKBmZHmz8w-1
Received: by mail-wr1-f69.google.com with SMTP id
 2-20020adf94020000b0290110481f75ddso11264794wrq.21
 for <qemu-trivial@nongnu.org>; Sun, 23 May 2021 01:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GEUjU14OJxOMpMwYbGCpZd0GXP6hP6CTz55rfv47wT4=;
 b=ogkC95qXjopcTKUeooTTJkbMARQ9M7jUoi7kK34fbbk1INn9Ze6TP0Vg3HT/em4BZO
 NM/suHryupuDaVVh/7Yp1bkGYaBh4j9Ec6JOD/m9MUq7AYhP/OBCn0d9w+D8H5VlFCdu
 U67Ik1wUxG09UQt3saCXIVRobS18TFLOFnUihGrmFtxVnjI4SapD0ZbIu1ijD/X1M8uP
 u7Bh+aBBoLI7+js/JTtDesUNR9J8MLQB15542MjRJ2aXQ9TFyzVCHpwH1NsIt6Q231tl
 jhz1SmPoPNxP8vygmDbnTK+ghv5WQAeBD9VM/u3s521eRbyRJyYaJT4XvLXVs/FnVgRe
 T37A==
X-Gm-Message-State: AOAM5339uuj18l7fixb3OLcRAVhxXHD84XA4mmG3W392rP3nlI0UKzul
 0iD13UQqEnaMB9A8u2V7C51nuiOxctBYEFKyGl7wxw9i1QfUmbh08+8oTV09Kv+GvBOSFDQMy/D
 xtVJWGErmyWmA6hjnWw==
X-Received: by 2002:a5d:638e:: with SMTP id p14mr16517640wru.299.1621756974534; 
 Sun, 23 May 2021 01:02:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFsgeHhs1g0HxaVfY+0WdBQZ4JD4TO7cyXc2t+vYO0kEaDNDv6V4AgMk2ARTVcOmKzj+am4A==
X-Received: by 2002:a5d:638e:: with SMTP id p14mr16517616wru.299.1621756974218; 
 Sun, 23 May 2021 01:02:54 -0700 (PDT)
Received: from redhat.com ([2a10:8006:fcda:0:90d:c7e7:9e26:b297])
 by smtp.gmail.com with ESMTPSA id u8sm4295848wmq.29.2021.05.23.01.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 01:02:53 -0700 (PDT)
Date: Sun, 23 May 2021 04:02:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/virtio: Document *_should_notify() are called within
 rcu_read_lock()
Message-ID: <20210523040228-mutt-send-email-mst@kernel.org>
References: <20210520064900.2413612-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210520064900.2413612-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
X-List-Received-Date: Sun, 23 May 2021 08:03:04 -0000

On Thu, May 20, 2021 at 08:49:00AM +0200, Philippe Mathieu-Daudé wrote:
> Such comments make reviewing this file somehow easier.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

ok but

> ---
>  hw/virtio/virtio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index e02544b2df7..2b4c6c4b875 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2449,6 +2449,7 @@ static void virtio_set_isr(VirtIODevice *vdev, int value)
>      }
>  }
>  
> +/* Called within rcu_read_lock().  */
>  static bool virtio_split_should_notify(VirtIODevice *vdev, VirtQueue *vq)
>  {
>      uint16_t old, new;
> @@ -2485,6 +2486,7 @@ static bool vring_packed_need_event(VirtQueue *vq, bool wrap,
>      return vring_need_event(off, new, old);
>  }
>  
> +/* Called within rcu_read_lock().  */
>  static bool virtio_packed_should_notify(VirtIODevice *vdev, VirtQueue *vq)
>  {
>      VRingPackedDescEvent e;


one space before */ please, not two.

> -- 
> 2.26.3


