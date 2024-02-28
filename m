Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rfQZp-0003tX-M4
	for mharc-qemu-trivial@gnu.org; Wed, 28 Feb 2024 15:30:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rfQZj-0003r8-18
 for qemu-trivial@nongnu.org; Wed, 28 Feb 2024 15:30:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rfQZg-0000Ze-MV
 for qemu-trivial@nongnu.org; Wed, 28 Feb 2024 15:30:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709152241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1QW82QujdXbG3JxzkU/eLku3CZ1MEf03sIG23EM9vWI=;
 b=LzaGucB7SZuw50lVmiqwalV2nsWHGZNqRaj6W2z3b/Nvy8t7fyJWjsX0bZ9m0xcPdeLnQF
 0YjMb1Y6WfO64BQ/YbJgRI9serMV5ah6BMRWtIHmfAqlw0n+JiDnrRLJSEfNuReNNW+j55
 P8797Kds/fATxt6OABldq+PbYJPxsd0=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-pBpEFO2yM0WjKf_0ivu_kQ-1; Wed, 28 Feb 2024 15:30:16 -0500
X-MC-Unique: pBpEFO2yM0WjKf_0ivu_kQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-50e91f9d422so67407e87.2
 for <qemu-trivial@nongnu.org>; Wed, 28 Feb 2024 12:30:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709152214; x=1709757014;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1QW82QujdXbG3JxzkU/eLku3CZ1MEf03sIG23EM9vWI=;
 b=DUkLtaIObPXNFPH0anPxs9AoaroXMPufx//+43ipM5A1zNbLlW7sABJeFBbxHnWIf3
 pp4CC5kz/WTQBVlCsygDmU5HboKI7NvU8vxLkI0V1833+lmXmPhDlDKHu2Ck/W7HJK/m
 9t/gi5wGCDNUQzdVi5gjQws9aZaWGNlOkgJ5Tpgjcf/48cnvXi9YK2SO1VoOkd4W4VAb
 t5k0JWFddKlM0xfZFeCF4RBdU3dlTXrhEfhzg4VU62Wv9arGP7gDb3U7C1hVCOHgk/LQ
 Op1UBmUyuJDirTbWKUjiQkD7bpvxbmHpM6MHh0oV7v5a2iLXnKtIsHL4sAyMf5KFV7ok
 dT2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1QDBmjThW0QFw/CnS2orQWb2A2BUZzIvOXyt9xsaQatk4vpIIBfRHQ/ZzjzmyTFKlhmGD3GdtVLYyCL8RVy9TQW5tlIWAnA==
X-Gm-Message-State: AOJu0Ywp/bSrhwskaaGTUEZonRN7UsH9G1Dqvcy70Wkq4T6OgHjE5kdV
 IuRFBqi/uYhvFLOOl3Gl05mBm0KRHq/5EyReFzk9ff3jof3kpgTgTLtWwBJoxdE5IzARizdXH+9
 PnZ5dgTCvK9TR12i+Ucq7ZBA4pTTSDEP0cqA9cZktJBmk5zGmWE9pwrQ=
X-Received: by 2002:ac2:52b2:0:b0:512:e58c:7bf1 with SMTP id
 r18-20020ac252b2000000b00512e58c7bf1mr48348lfm.40.1709152214583; 
 Wed, 28 Feb 2024 12:30:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTnZ99e3qAETe6P3a1/HERVWYZxhR1xioIFDpadmN359iXseUttYyekkHW1nGkc3OgtoU0Aw==
X-Received: by 2002:ac2:52b2:0:b0:512:e58c:7bf1 with SMTP id
 r18-20020ac252b2000000b00512e58c7bf1mr48337lfm.40.1709152214224; 
 Wed, 28 Feb 2024 12:30:14 -0800 (PST)
Received: from redhat.com ([2a02:14f:178:d6b0:a21c:61c4:2098:5db])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a5d4142000000b0033cf453f2bbsm15415833wrq.35.2024.02.28.12.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 12:30:13 -0800 (PST)
Date: Wed, 28 Feb 2024 15:30:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>
Cc: Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 13/16] block/virtio-blk: Fix missing ERRP_GUARD() for
 error_prepend()
Message-ID: <20240228152955-mutt-send-email-mst@kernel.org>
References: <20240228163723.1775791-1-zhao1.liu@linux.intel.com>
 <20240228163723.1775791-14-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20240228163723.1775791-14-zhao1.liu@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.102,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Feb 2024 20:30:50 -0000

On Thu, Feb 29, 2024 at 12:37:20AM +0800, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> As the comment in qapi/error, passing @errp to error_prepend() requires
> ERRP_GUARD():
> 
> * = Why, when and how to use ERRP_GUARD() =
> *
> * Without ERRP_GUARD(), use of the @errp parameter is restricted:
> ...
> * - It should not be passed to error_prepend(), error_vprepend() or
> *   error_append_hint(), because that doesn't work with &error_fatal.
> * ERRP_GUARD() lifts these restrictions.
> *
> * To use ERRP_GUARD(), add it right at the beginning of the function.
> * @errp can then be used without worrying about the argument being
> * NULL or &error_fatal.
> 
> ERRP_GUARD() could avoid the case when @errp is the pointer of
> error_fatal, the user can't see this additional information, because
> exit() happens in error_setg earlier than information is added [1].
> 
> The virtio_blk_vq_aio_context_init() passes @errp to error_prepend().
> 
> Though its @errp points its caller's local @err variable, to follow the
> requirement of @errp, add missing ERRP_GUARD() at the beginning of
> virtio_blk_vq_aio_context_init().
> 
> [1]: Issue description in the commit message of commit ae7c80a7bd73
>      ("error: New macro ERRP_GUARD()").
> 
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Hanna Reitz <hreitz@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>


Acked-by: Michael S. Tsirkin <mst@redhat.com>

merge with other things please.

> ---
>  hw/block/virtio-blk.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index 738cb2ac367d..92de315f17f7 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -1682,6 +1682,7 @@ static bool apply_iothread_vq_mapping(
>  /* Context: BQL held */
>  static bool virtio_blk_vq_aio_context_init(VirtIOBlock *s, Error **errp)
>  {
> +    ERRP_GUARD();
>      VirtIODevice *vdev = VIRTIO_DEVICE(s);
>      VirtIOBlkConf *conf = &s->conf;
>      BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
> -- 
> 2.34.1


