Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qpMKb-0003Lx-QD
	for mharc-qemu-trivial@gnu.org; Sun, 08 Oct 2023 01:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1qpMKZ-0003Lj-3e
 for qemu-trivial@nongnu.org; Sun, 08 Oct 2023 01:27:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1qpMKX-0006VP-Ly
 for qemu-trivial@nongnu.org; Sun, 08 Oct 2023 01:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696742872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hr7T1ZkDawWvtjDrdIneKcvzMEjpeZm7SKe5BPaAeio=;
 b=T/CHmtjcqBHKIJCCoVcZPp4ljbYB/7QU42LqR0+IQrOJh4RuxDt8ZRYxINZXE4kdO+pkUL
 IC20AEE8AVzCIvslFQtlqxmWIjInQRzHq09OkIPHy1/C8Zpf43cwiJ2TOCG3P7muSu6ZH5
 U6N9+UcS0BuOyC9vnsuahQ9xR3NJ9uM=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-f7CWOqMfO1-oVKMHZNyyXg-1; Sun, 08 Oct 2023 01:27:51 -0400
X-MC-Unique: f7CWOqMfO1-oVKMHZNyyXg-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-5043307ec0bso3114907e87.2
 for <qemu-trivial@nongnu.org>; Sat, 07 Oct 2023 22:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696742869; x=1697347669;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hr7T1ZkDawWvtjDrdIneKcvzMEjpeZm7SKe5BPaAeio=;
 b=D9vjvKO/kKxQTKHwSaPYBmEVWC04Se32qZnX5UPFVD8qDNwwsH9OzLc9+Uuxf1kSW4
 0zKwKcQawXsBiQRDGzdkRxsJFRou00LXqR78irDPipWo6rTWV42eSNKPinmo02fHXlxR
 9N7r590JwZPHPIJubSk4XQYl+BONOKZkAvtX4djUN5+6TLiO7ZEEM71jP9o8bEAyTPGW
 A1Xsd2nuKJjDqRAtbe13qTEmsqiEcnqXW9Z2YPBpXsCmwiJ36tigdqbPzVZeRZVIXXcZ
 TdyNq89nAv5W6mTmrLpUpNw2mgCThgvmfqrVRbseU2Wdkqvy/MC8uAc74eJ/9Phfqu8d
 vK+g==
X-Gm-Message-State: AOJu0YwwQ74cvDzH4oQ1cLXARCKaYnB7EX0xDRUTqL38zuS2rlxnJeF5
 E2qQtyW2miKOD9D+cVD9/arJ49Z1tF/KH6eKlKgZgCgt/2mMaT4pIXGnfQcPrMxm7hgCPH24epn
 pAtKf55diMgf1govsWqxqtl1BUzZAt9nbbGKsczVHGD+e
X-Received: by 2002:a05:6512:39d0:b0:504:51e9:89a2 with SMTP id
 k16-20020a05651239d000b0050451e989a2mr15625753lfu.32.1696742869638; 
 Sat, 07 Oct 2023 22:27:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRscR506okY7xwG1XImUKUol7kSiOvFx26DTqoqggKCVYoZybrCUD14IvLUIa7G2eL0QbAjoygf7Mvz0cMxPs=
X-Received: by 2002:a05:6512:39d0:b0:504:51e9:89a2 with SMTP id
 k16-20020a05651239d000b0050451e989a2mr15625748lfu.32.1696742869357; Sat, 07
 Oct 2023 22:27:49 -0700 (PDT)
MIME-Version: 1.0
References: <20231004084939.96349-1-thuth@redhat.com>
 <20231004045724-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231004045724-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Sun, 8 Oct 2023 13:27:38 +0800
Message-ID: <CACGkMEvfUDzDvor6TjcF8-2wbymgNKxvn77gUM8KuiAb5Ndi7g@mail.gmail.com>
Subject: Re: [PATCH] hw/net/vhost_net: Silence compiler warning when compiling
 with -Wshadow
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 08 Oct 2023 05:27:55 -0000

On Wed, Oct 4, 2023 at 4:57=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Wed, Oct 04, 2023 at 10:49:39AM +0200, Thomas Huth wrote:
> > Rename the innermost local variables to avoid compiler warnings
> > with "-Wshadow".
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

>
> feel free to merge
>
> > ---
> >  hw/net/vhost_net.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index 57427a3997..e8e1661646 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -313,8 +313,8 @@ fail:
> >                  /* Queue might not be ready for start */
> >                  continue;
> >              }
> > -            int r =3D vhost_net_set_backend(&net->dev, &file);
> > -            assert(r >=3D 0);
> > +            int ret =3D vhost_net_set_backend(&net->dev, &file);
> > +            assert(ret >=3D 0);
> >          }
> >      }
> >      if (net->nc->info->poll) {
> > @@ -629,8 +629,8 @@ err_start:
> >      if (net->nc->info->type =3D=3D NET_CLIENT_DRIVER_TAP) {
> >          file.fd =3D VHOST_FILE_UNBIND;
> >          file.index =3D idx;
> > -        int r =3D vhost_net_set_backend(&net->dev, &file);
> > -        assert(r >=3D 0);
> > +        int ret =3D vhost_net_set_backend(&net->dev, &file);
> > +        assert(ret >=3D 0);
> >      }
> >
> >      vhost_dev_stop(&net->dev, vdev, false);
> > --
> > 2.41.0
>


