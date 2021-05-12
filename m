Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgj4E-0006Ni-61
	for mharc-qemu-trivial@gnu.org; Wed, 12 May 2021 03:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lgj4B-0006NS-Jx
 for qemu-trivial@nongnu.org; Wed, 12 May 2021 03:13:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lgj48-0007Xp-PR
 for qemu-trivial@nongnu.org; Wed, 12 May 2021 03:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620803635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4c+ACL/FmYHZANdsFz+No8Sb0t9xliMHFRhLilsUY+8=;
 b=PFr5HhoH9TPQ0hgESGGPw91BCEzaSLAJ1mjWmtI7pmJiy7nXXlplrx737mEy94N5dh9ljR
 SABishhAUr/8BPp41TG8Uee0p5s4pkpUlomm7MOE6otW80ALizPbNK6v7FxdxcI7R/HeKi
 ZlZEwoN7xxAOmiJ76afKkyvLk6GW6qA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-c_hzsSvZP6eXMJpwcIQbiw-1; Wed, 12 May 2021 03:13:53 -0400
X-MC-Unique: c_hzsSvZP6eXMJpwcIQbiw-1
Received: by mail-ej1-f72.google.com with SMTP id
 z1-20020a1709068141b02903cd421d7803so1392779ejw.22
 for <qemu-trivial@nongnu.org>; Wed, 12 May 2021 00:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4c+ACL/FmYHZANdsFz+No8Sb0t9xliMHFRhLilsUY+8=;
 b=mEiezP8bXu/2Dc8H7sh/YcS4hodOE/6UY6ey61vqGAT5IBBtHbVmFLzvXqS79wugD3
 /tT6vzi7C6sFzDbpuar9jbE+X5F9jvErxAagkNo8e18QTfEv+57RSHj7StLJT0nwUrk3
 A2afPfilqmMX5Alx2A/rM+iZgJr724/asQqlixrrOFbHQ5eRRq/a+dBCGZcZduZ3riqY
 uTyT7TDsIiBSE92bYuU6WLeWPxu2YdYZ9xoNniFdqMts8ykwBT30dHz8DPwT1C/yti2t
 Yq5AQRvwYDG3o8eigjlMHzPFMoIgEuZtjulpynnDQyywIoqHSRr4CFMFoLTm3TqYTuRR
 QEsQ==
X-Gm-Message-State: AOAM5318aUyPvp8K7UikjYKQHSzH2yOsxrN0Oi2OrcZsKyoTcrW6kke2
 GdYqyTzF9hdWdcCgesHteGf1LhhPnoBzP1pzIi/bJ0RD8WXOBTryhE1fu7cXeam0Nwq+clblfLS
 WZHdph80D72alXy5S/w==
X-Received: by 2002:a17:906:d285:: with SMTP id
 ay5mr35123761ejb.222.1620803632800; 
 Wed, 12 May 2021 00:13:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDg1s0sDoXH3QTv5KbfkC4rFA21BbjRM8FRzJoJ6FNxL4Gsr4IW/udtxFv0AznWs5bqKM3SA==
X-Received: by 2002:a17:906:d285:: with SMTP id
 ay5mr35123744ejb.222.1620803632644; 
 Wed, 12 May 2021 00:13:52 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id h13sm10967876edb.65.2021.05.12.00.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 00:13:52 -0700 (PDT)
Date: Wed, 12 May 2021 09:13:50 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 0/3] hw/virtio: Constify VirtIOFeature
Message-ID: <20210512071350.a7qnxgf3inzmm5j4@steredhat>
References: <20210511104157.2880306-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210511104157.2880306-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 12 May 2021 07:13:59 -0000

On Tue, May 11, 2021 at 12:41:54PM +0200, Philippe Mathieu-Daudé wrote:
>Trivial patches to keep VirtIOFeature arrays read-only
>(better safe than sorry).
>
>Philippe Mathieu-Daudé (3):
>  hw/virtio: Pass virtio_feature_get_config_size() a const argument
>  virtio-blk: Constify VirtIOFeature feature_sizes[]
>  virtio-net: Constify VirtIOFeature feature_sizes[]
>
> include/hw/virtio/virtio.h | 2 +-
> hw/block/virtio-blk.c      | 2 +-
> hw/net/virtio-net.c        | 2 +-
> hw/virtio/virtio.c         | 2 +-
> 4 files changed, 4 insertions(+), 4 deletions(-)
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


