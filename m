Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nQ52p-0003g7-JE
	for mharc-qemu-trivial@gnu.org; Fri, 04 Mar 2022 05:20:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ52o-0003dO-5q
 for qemu-trivial@nongnu.org; Fri, 04 Mar 2022 05:20:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ52m-0001vl-0P
 for qemu-trivial@nongnu.org; Fri, 04 Mar 2022 05:20:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646389215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xT9rMbAJiIPmZJCBsFjN9G6fildk+Sf62878RFPslXU=;
 b=CBnhH08GHV/oa3D246365NNiwDdHbZ0Pn2QjYuRbgexjMBiGCB1b/VudXAZ48Ju2e+66pG
 c1eMPl1atynye2ibgFMxJrfyXVz7WGzccqA/BQmIn+O6wiFSHOkPbfy4VSSAUtkwVzHiE5
 /QamOWkqeCKDb1P5pLVfnG993bh4ar0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-x_gUuay1PruQJcce_x7WaQ-1; Fri, 04 Mar 2022 05:20:13 -0500
X-MC-Unique: x_gUuay1PruQJcce_x7WaQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c19-20020a05600c0ad300b00385bb3db625so2371078wmr.4
 for <qemu-trivial@nongnu.org>; Fri, 04 Mar 2022 02:20:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xT9rMbAJiIPmZJCBsFjN9G6fildk+Sf62878RFPslXU=;
 b=CkRy1t98tYu8h8LgPBcvk3QFhzP7bbKt3n2uW5ijBXadTvb67yVNryGbdHT1nk87Zk
 gNESY0GhGHgnEkxScAdchy+d+db/yZNbDb0gG5rQbin3NN+JMOyfly5VxqoSLa/zczmA
 N7x2559eQVBjkO9q5v33p+Nvck/ZgsbAufKaeraZWL/bDwXjUD+mfRdbUbTOnQvxSMF+
 Ws4txhreF2nlMLwNFpR85VorbAo0RReYSx70OwEZy9ofmZMqUY+ebovCf9u3Llctf5u4
 08RLNXBkY7HEE0bnEK3Modhwq1YAlSWIcP8I8IlFywMhKdT8IUcjKSIxiLWIRtlRAgva
 lczw==
X-Gm-Message-State: AOAM530WUqlsaCNwdwiY31CuvUeaMKxlwbtNiYQpiJjW0agercOUOnPO
 P/GuzhMSMKLLt/jICwHGiXHU/BAX6aTqkCgY/KFTSzZiI4ZH93TIGRb9zxVwulEoXzOlUTGAg6U
 e/jdClM3gsf+g3X01UA==
X-Received: by 2002:a05:600c:2314:b0:381:8931:2387 with SMTP id
 20-20020a05600c231400b0038189312387mr7292620wmo.76.1646389211830; 
 Fri, 04 Mar 2022 02:20:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpGLeu6GFNwzLmx6/18eiP2hVylgSCWZjJnfi97EUQfV/GACBYS0j9xP16Gr5VdqGRWxR7QQ==
X-Received: by 2002:a05:600c:2314:b0:381:8931:2387 with SMTP id
 20-20020a05600c231400b0038189312387mr7292602wmo.76.1646389211537; 
 Fri, 04 Mar 2022 02:20:11 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 d8-20020a056000114800b001f045f3435asm5966127wrx.108.2022.03.04.02.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 02:20:10 -0800 (PST)
Date: Fri, 4 Mar 2022 05:20:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH vRESEND] virtio/virtio-balloon: Prefer Object* over void*
 parameter
Message-ID: <20220304051952-mutt-send-email-mst@kernel.org>
References: <20220301222301.103821-1-shentey@gmail.com>
 <20220301222301.103821-2-shentey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220301222301.103821-2-shentey@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 04 Mar 2022 10:20:18 -0000

On Tue, Mar 01, 2022 at 11:23:01PM +0100, Bernhard Beschow wrote:
> *opaque is an alias to *obj. Using the ladder makes the code consistent with
> with other devices, e.g. accel/kvm/kvm-all and accel/tcg/tcg-all. It also
> makes the cast more typesafe.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

trivial tree pls

> ---
>  hw/virtio/virtio-balloon.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index e6c1b0aa46..163d244eb4 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -242,7 +242,7 @@ static void balloon_stats_get_all(Object *obj, Visitor *v, const char *name,
>                                    void *opaque, Error **errp)
>  {
>      Error *err = NULL;
> -    VirtIOBalloon *s = opaque;
> +    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
>      int i;
>  
>      if (!visit_start_struct(v, name, NULL, 0, &err)) {
> @@ -277,7 +277,7 @@ static void balloon_stats_get_poll_interval(Object *obj, Visitor *v,
>                                              const char *name, void *opaque,
>                                              Error **errp)
>  {
> -    VirtIOBalloon *s = opaque;
> +    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
>      visit_type_int(v, name, &s->stats_poll_interval, errp);
>  }
>  
> @@ -285,7 +285,7 @@ static void balloon_stats_set_poll_interval(Object *obj, Visitor *v,
>                                              const char *name, void *opaque,
>                                              Error **errp)
>  {
> -    VirtIOBalloon *s = opaque;
> +    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
>      int64_t value;
>  
>      if (!visit_type_int(v, name, &value, errp)) {
> @@ -1015,12 +1015,12 @@ static void virtio_balloon_instance_init(Object *obj)
>      s->free_page_hint_notify.notify = virtio_balloon_free_page_hint_notify;
>  
>      object_property_add(obj, "guest-stats", "guest statistics",
> -                        balloon_stats_get_all, NULL, NULL, s);
> +                        balloon_stats_get_all, NULL, NULL, NULL);
>  
>      object_property_add(obj, "guest-stats-polling-interval", "int",
>                          balloon_stats_get_poll_interval,
>                          balloon_stats_set_poll_interval,
> -                        NULL, s);
> +                        NULL, NULL);
>  }
>  
>  static const VMStateDescription vmstate_virtio_balloon = {
> -- 
> 2.35.1


