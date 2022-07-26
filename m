Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGLpk-00041H-5G
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jul 2022 10:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGLph-000402-SW
 for qemu-trivial@nongnu.org; Tue, 26 Jul 2022 10:46:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGLpf-0007eG-IM
 for qemu-trivial@nongnu.org; Tue, 26 Jul 2022 10:46:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658846806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0BTI12aY0BMggaoc5W9golNQ7eHfw1JPtj5zdy0VNkM=;
 b=LyMWVKvq9Lr/vHfUQitspBoRpBetbcjMGJPMXLwqY/Ledv6SjcFrhcEkVVDp01IJlB8l11
 j1a9mLTpZl7cqNPBjVFlnwDivW+njL0GiI94Mpm1/JVJYbQ5PpdTXFqZAIQxRGU9tst6T4
 1+HXSUBeMW0TlL35B88JLyz7U9lhWuk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-ZoEfhbCsP4u2k2H2I__sAw-1; Tue, 26 Jul 2022 10:46:42 -0400
X-MC-Unique: ZoEfhbCsP4u2k2H2I__sAw-1
Received: by mail-wm1-f69.google.com with SMTP id
 z20-20020a1c4c14000000b003a3020da654so5471832wmf.5
 for <qemu-trivial@nongnu.org>; Tue, 26 Jul 2022 07:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=0BTI12aY0BMggaoc5W9golNQ7eHfw1JPtj5zdy0VNkM=;
 b=OUJoMFA4cRO54CsJVZ/LuJcFFqo7fkCuSwE6Ax4l9EbTABBeR9Szdp3fAnpG0DnL8K
 nwAB5ZtswzpIN9UZgrTMxwE6bh6d5/IQqguL6x0TfLqKh1LDsAPQzewzIYh/DfQKzTW8
 icyfPCkVDyZOjTRAG2ORgMkWBbzcGjJnxQ/MpStdIi2pVyLEi85iJjXmDk2S5vhOM35q
 dM7O48e+Tr5ZSQImgOMBQKv3y/Umiq9Uz9qCSnnqYB1vnzfqLmD7+RZfZ7ce9ElOW6ng
 NpFCIkl6848GgEYtP7thZaTfiHLjJKACTotB49rerPEYOeM40Rj+mZiH7vO+vpbCl3lY
 lfpA==
X-Gm-Message-State: AJIora+MbDk79mgkApxUk+Lcx8xOOTKgzfE2NISnNeYv8glKSLOXALR6
 0u9k676X1DJsevMFfplyd64ObqtdcN+xyDK20myTix5uwt7dZUFukIXzkkquRGQO93h83C5dWvu
 483tYDCMbGtpgQiao6g==
X-Received: by 2002:a05:600c:49a4:b0:3a2:fec4:954c with SMTP id
 h36-20020a05600c49a400b003a2fec4954cmr25492010wmp.163.1658846801574; 
 Tue, 26 Jul 2022 07:46:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u0dHzMLinriIU+ORcOjO+6DBOfyMl5Ru97NZiRZRf4Jrw41/vcbjQ7pLBT2rOrY9blF37ppg==
X-Received: by 2002:a05:600c:49a4:b0:3a2:fec4:954c with SMTP id
 h36-20020a05600c49a400b003a2fec4954cmr25491992wmp.163.1658846801162; 
 Tue, 26 Jul 2022 07:46:41 -0700 (PDT)
Received: from redhat.com ([2.55.4.105]) by smtp.gmail.com with ESMTPSA id
 a21-20020a05600c349500b003a317ee3036sm18856376wmq.2.2022.07.26.07.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 07:46:40 -0700 (PDT)
Date: Tue, 26 Jul 2022 10:46:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, raphael.norwitz@nutanix.com, qemu-trivial@nongnu.org
Subject: Re: [PATCH] contrib/vhost-user-blk: Clean up deallocation of
 VuVirtqElement
Message-ID: <20220726104620-mutt-send-email-mst@kernel.org>
References: <20220630085219.1305519-1-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220630085219.1305519-1-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 26 Jul 2022 14:46:50 -0000

On Thu, Jun 30, 2022 at 10:52:19AM +0200, Markus Armbruster wrote:
> We allocate VuVirtqElement with g_malloc() in
> virtqueue_alloc_element(), but free it with free() in
> vhost-user-blk.c.  Harmless, but use g_free() anyway.
> 
> One of the calls is guarded by a "not null" condition.  Useless,
> because it cannot be null (it's dereferenced right before), and even
> it it could be, free() and g_free() do the right thing.  Drop the
> conditional.
> 
> Fixes: Coverity CID 1490290
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Thanks!

Acked-by: Michael S. Tsirkin <mst@redhat.com>

trivial tree pls.


> ---
> Not even compile-tested, because I can't figure out how this thing is
> supposed to be built.  Its initial commit message says "make
> vhost-user-blk", but that doesn't work anymore.
> 
>  contrib/vhost-user-blk/vhost-user-blk.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
> index 9cb78ca1d0..d6932a2645 100644
> --- a/contrib/vhost-user-blk/vhost-user-blk.c
> +++ b/contrib/vhost-user-blk/vhost-user-blk.c
> @@ -106,10 +106,7 @@ static void vub_req_complete(VubReq *req)
>                    req->size + 1);
>      vu_queue_notify(vu_dev, req->vq);
>  
> -    if (req->elem) {
> -        free(req->elem);
> -    }
> -
> +    g_free(req->elem);
>      g_free(req);
>  }
>  
> @@ -243,7 +240,7 @@ static int vub_virtio_process_req(VubDev *vdev_blk,
>      /* refer to hw/block/virtio_blk.c */
>      if (elem->out_num < 1 || elem->in_num < 1) {
>          fprintf(stderr, "virtio-blk request missing headers\n");
> -        free(elem);
> +        g_free(elem);
>          return -1;
>      }
>  
> @@ -325,7 +322,7 @@ static int vub_virtio_process_req(VubDev *vdev_blk,
>      return 0;
>  
>  err:
> -    free(elem);
> +    g_free(elem);
>      g_free(req);
>      return -1;
>  }
> -- 
> 2.35.3


