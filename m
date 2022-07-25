Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oG2UU-0002JY-Ch
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jul 2022 14:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oG2US-0002JM-Tl
 for qemu-trivial@nongnu.org; Mon, 25 Jul 2022 14:07:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oG2UP-0004fT-PB
 for qemu-trivial@nongnu.org; Mon, 25 Jul 2022 14:07:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658772452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DevWWlgm6GlTpF6XqeS9krz79brtNqqQyHUWT5+mB7g=;
 b=EjbnYy+/2s2s8RPN+DuzcLXgrsrqBkEizvgIEJhfq9VHrM0/vmx5+Thcd5W1qZHd0T6SMQ
 fgAGSs+T0bFuJFNsxomDFzPRnBgShmMWI8BTBXYsuKzWmOrsJ1Miq7SSVopF0ZRNmK0z+W
 WiU0/Ug+99SZQjjuquuCHp7ipm9lh84=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-1wgT9EGEM_aScCklbwK00w-1; Mon, 25 Jul 2022 14:07:30 -0400
X-MC-Unique: 1wgT9EGEM_aScCklbwK00w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B5D385A587;
 Mon, 25 Jul 2022 18:07:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04517492C3B;
 Mon, 25 Jul 2022 18:07:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D077121E6930; Mon, 25 Jul 2022 20:07:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,  raphael.norwitz@nutanix.com,  mst@redhat.com
Subject: Re: [PATCH] contrib/vhost-user-blk: Clean up deallocation of
 VuVirtqElement
References: <20220630085219.1305519-1-armbru@redhat.com>
Date: Mon, 25 Jul 2022 20:07:28 +0200
In-Reply-To: <20220630085219.1305519-1-armbru@redhat.com> (Markus Armbruster's
 message of "Thu, 30 Jun 2022 10:52:19 +0200")
Message-ID: <87tu75nk0v.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 25 Jul 2022 18:07:37 -0000

Could this go via qemu-trivial now?

Markus Armbruster <armbru@redhat.com> writes:

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


