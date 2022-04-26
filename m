Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njKt5-0003u7-3p
	for mharc-qemu-trivial@gnu.org; Tue, 26 Apr 2022 09:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1njKt3-0003lL-OH
 for qemu-trivial@nongnu.org; Tue, 26 Apr 2022 09:05:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1njKt0-0002oG-G5
 for qemu-trivial@nongnu.org; Tue, 26 Apr 2022 09:05:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650978344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1EdINgQ3JgOAAEXTBvVys5eom+DJ2H2dyXQXTGpqbAk=;
 b=E3CT8nWcyBNK9NS+XQ1cbgQxrXrzsHTy/dP8KPf2/F8p7qntI450W5swD3XHyoP5ZsIXcw
 jWjMvCzIQICucTGfZfjuxfVbz9NG6rAkciWK9krm+zivk66DCObrf6kmIvHyQPksRXHAbt
 SF1eR9wyGVtSxCI4ETzv2Fjpj63QKhE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-CYLAQb0jOTKFmj-fvQisXQ-1; Tue, 26 Apr 2022 09:05:43 -0400
X-MC-Unique: CYLAQb0jOTKFmj-fvQisXQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 e8-20020a05622a110800b002f380dd879eso330557qty.11
 for <qemu-trivial@nongnu.org>; Tue, 26 Apr 2022 06:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1EdINgQ3JgOAAEXTBvVys5eom+DJ2H2dyXQXTGpqbAk=;
 b=0lcWiBGu0MuwSAKibpQulkM3jc7ODX3LN5KkfLhw1A2zc6VhaZPRcnGysXpyyk1otO
 ZE/eCBXRJH7AU829rTnZmv+bJKuzG7z7kGSqNo3ZDf6/xnZsUSCBDaI7s33J6QU0euZJ
 wCDRScKnryRdYG26n/any2KPmvwR9tNuMBAEVCI26R19Onrl3Jaf++jCEGMGry9Umyk1
 2IMMe/WxCwh4Rfm4Em2pyqC/3vEmK9FX6RCkec3F4H7hOtLCGdwT5INykxgfeaO+XYYT
 5mcIb4VDxwZNy4gkGgkepZtAtkYG8Kkh7IizvxowI1aMQOvG+F7qympbcba7pAFC9tvi
 Id0w==
X-Gm-Message-State: AOAM5339j/+ifcyirb6Zc5Y0bo4ZnWnHw1VpK9i3oK966ZgMnb5X1Yh9
 gmZfmWcJsx72sn4B9eSh31vFAPfV8XmNEq9/5XGZxOOh0R4+8HkaevQwMrjzY/wAx9JBBxOYdET
 0pZTyJCAeUA/H+Do7/iI0vw/1PsT5eqiY6Q==
X-Received: by 2002:a05:620a:1f6:b0:69e:cba0:e63a with SMTP id
 x22-20020a05620a01f600b0069ecba0e63amr12530251qkn.764.1650978343191; 
 Tue, 26 Apr 2022 06:05:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8OcLAB6Du2/G6V0s69i85WBTPx2wwBgMhubcTroYz7/34w23984uztwGhqvZntV7oEHlnIA1OLCKJsjJrl0k=
X-Received: by 2002:a05:620a:1f6:b0:69e:cba0:e63a with SMTP id
 x22-20020a05620a01f600b0069ecba0e63amr12530223qkn.764.1650978342944; Tue, 26
 Apr 2022 06:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220405063628.853745-1-eperezma@redhat.com>
 <735751c6-c230-5013-7a65-0d210094fd74@vivier.eu>
In-Reply-To: <735751c6-c230-5013-7a65-0d210094fd74@vivier.eu>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 26 Apr 2022 15:05:06 +0200
Message-ID: <CAJaqyWfu-oj71CKE6nYUY20kWff3cVvq6_gmZeZGSRxyZToijA@mail.gmail.com>
Subject: Re: [PATCH] vdpa: Add missing tracing to batch mapping functions
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-level <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>,
 qemu-trivial@nongnu.org, 
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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
X-List-Received-Date: Tue, 26 Apr 2022 13:05:50 -0000

On Tue, Apr 26, 2022 at 12:40 PM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 05/04/2022 =C3=A0 08:36, Eugenio P=C3=A9rez a =C3=A9crit :
> > These functions were not traced properly.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-vdpa.c | 2 ++
> >   hw/virtio/trace-events | 2 ++
> >   2 files changed, 4 insertions(+)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 8adf7c0b92..9e5fe15d03 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -129,6 +129,7 @@ static void vhost_vdpa_listener_begin_batch(struct =
vhost_vdpa *v)
> >           .iotlb.type =3D VHOST_IOTLB_BATCH_BEGIN,
> >       };
> >
> > +    trace_vhost_vdpa_listener_begin_batch(v, fd, msg.type, msg.iotlb.t=
ype);
> >       if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
> >           error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
> >                        fd, errno, strerror(errno));
> > @@ -163,6 +164,7 @@ static void vhost_vdpa_listener_commit(MemoryListen=
er *listener)
> >       msg.type =3D v->msg_type;
> >       msg.iotlb.type =3D VHOST_IOTLB_BATCH_END;
> >
> > +    trace_vhost_vdpa_listener_commit(v, fd, msg.type, msg.iotlb.type);
> >       if (write(fd, &msg, sizeof(msg)) !=3D sizeof(msg)) {
> >           error_report("failed to write, fd=3D%d, errno=3D%d (%s)",
> >                        fd, errno, strerror(errno));
> > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > index a5102eac9e..333348d9d5 100644
> > --- a/hw/virtio/trace-events
> > +++ b/hw/virtio/trace-events
> > @@ -25,6 +25,8 @@ vhost_user_postcopy_waker_nomatch(const char *rb, uin=
t64_t rb_offset) "%s + 0x%"
> >   # vhost-vdpa.c
> >   vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint64_t io=
va, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd:=
 %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx=
64" perm: 0x%"PRIx8" type: %"PRIu8
> >   vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint64_t =
iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova=
: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
> > +vhost_vdpa_listener_begin_batch(void *v, int fd, uint32_t msg_type, ui=
nt8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> > +vhost_vdpa_listener_commit(void *v, int fd, uint32_t msg_type, uint8_t=
 type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> >   vhost_vdpa_listener_region_add(void *vdpa, uint64_t iova, uint64_t ll=
end, void *vaddr, bool readonly) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx6=
4" vaddr: %p read-only: %d"
> >   vhost_vdpa_listener_region_del(void *vdpa, uint64_t iova, uint64_t ll=
end) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64
> >   vhost_vdpa_add_status(void *dev, uint8_t status) "dev: %p status: 0x%=
"PRIx8
> > --
> > 2.27.0
> >
> >
>
> Applied to my trivial-patches branch.
>
> (I know you have an (identicial) v7 of this patch in a series, but as thi=
s one is reviewed, acked
> and sent to trivial I've merged it).
>

Thanks! The v7 is about the series as a whole, not only about this
patch, so everything is right.

>
> Thanks,
> Laurent
>
>


