Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oIb5X-0001uC-CH
	for mharc-qemu-trivial@gnu.org; Mon, 01 Aug 2022 15:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oIb5W-0001qT-1g
 for qemu-trivial@nongnu.org; Mon, 01 Aug 2022 15:28:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oIb5S-000661-Ob
 for qemu-trivial@nongnu.org; Mon, 01 Aug 2022 15:28:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659382101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SxAGMSe2K7iIYbVaHzp7Pt8ae+2JVq0rDnSmAR/Z52I=;
 b=J1NkKucdZT+yWSznbYxif4beTCYCKN6dMqpSTjPQItwbU2+X+bitLvS5bPckwOJfuA+U6y
 Wqhsc/S7BgzpEcHpsLsXxO8T++O0Um9X/d62xELCO/PknksjFSZW2435naUkbfYqh3sKf9
 i+/IyUiTHPVu7uRXTZU9Bgw5Sa0Qkvo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-R-UV1PZgPW2jCmh7BMmivA-1; Mon, 01 Aug 2022 15:28:20 -0400
X-MC-Unique: R-UV1PZgPW2jCmh7BMmivA-1
Received: by mail-ej1-f70.google.com with SMTP id
 sg42-20020a170907a42a00b0072e3fc6cdd1so3322370ejc.13
 for <qemu-trivial@nongnu.org>; Mon, 01 Aug 2022 12:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=SxAGMSe2K7iIYbVaHzp7Pt8ae+2JVq0rDnSmAR/Z52I=;
 b=bQ5h18+6XYhyxYbMkZTbi4xL1ihVZczW1RM6L6ko92XrencNUBMnjIsWVZW6CCJJz+
 8iyhbF7ff9wiFDYGraCqFhN4vkEj5z2jrL05nKs5CKS4ey2jb5dZ+bx4N4QSGMs7Kfl4
 YjOJ17xFuaf8REwSWlR6doFGCn6UF/FwRUVYXEiQFyzUPxX45t/iqDxAxJGhs1/Mhaef
 QToEb1XHzZo8Kxo2RHzuZvgsR6S7Cq3lpxvsJmF7aeO0C5SYIwwi6B5E8otT2QOQIBLR
 ozBaABi2BWmh7o2unvDSAHU3kCv+MFCjogpEd+BWsJ0iMPuglKuCJXZyMCwgrq+iZwu7
 qjbA==
X-Gm-Message-State: ACgBeo0/MDrpvjgFHJFJ5/q8N3+xLH9unWMs4THqpgZhVzJViZcOCOAH
 j2PIIJr7BK6nWUWnf+NfIJBPs1VwaSbUiVdga3RRKeMqy+SkGVEbsRirDznrHC2b2uSXEGiso4d
 h1NCDplBMlRVwHslheg==
X-Received: by 2002:a05:6402:2691:b0:43d:ba10:854b with SMTP id
 w17-20020a056402269100b0043dba10854bmr4454940edd.158.1659382099696; 
 Mon, 01 Aug 2022 12:28:19 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5jyx7cWdVahSmOCWrcKNuknfW8jygpu+hEUCqQQL0bkB3d18lo1BJq4FHFyuedFJ2O/FtygQ==
X-Received: by 2002:a05:6402:2691:b0:43d:ba10:854b with SMTP id
 w17-20020a056402269100b0043dba10854bmr4454918edd.158.1659382099409; 
 Mon, 01 Aug 2022 12:28:19 -0700 (PDT)
Received: from redhat.com ([154.16.192.137]) by smtp.gmail.com with ESMTPSA id
 19-20020a170906319300b0072b8fbc9be1sm5497909ejy.187.2022.08.01.12.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 12:28:18 -0700 (PDT)
Date: Mon, 1 Aug 2022 15:28:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, qemu-trivial@nongnu.org
Subject: Re: [PATCH] vdpa: Fix file descriptor leak on get features error
Message-ID: <20220801152749-mutt-send-email-mst@kernel.org>
References: <20220801144714.181644-1-eperezma@redhat.com>
 <b649292a-7d80-1d8f-8179-e8d74f5a9310@redhat.com>
 <CAFEAcA85_e8v+RoWM_29c96_bDV1OAbM6cq-vL_68ZX+AY07ew@mail.gmail.com>
 <CAJaqyWeCGRCKqULG9HOiOJmX+3v3P9h1B8x09k3aZbx7rJw5Jw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWeCGRCKqULG9HOiOJmX+3v3P9h1B8x09k3aZbx7rJw5Jw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
X-List-Received-Date: Mon, 01 Aug 2022 19:28:26 -0000

On Mon, Aug 01, 2022 at 08:48:41PM +0200, Eugenio Perez Martin wrote:
> On Mon, Aug 1, 2022 at 8:34 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Mon, 1 Aug 2022 at 19:31, Laurent Vivier <lvivier@redhat.com> wrote:
> > >
> > > On 01/08/2022 16:47, Eugenio Pérez wrote:
> > > > File descriptor vdpa_device_fd is not free in the case of returning
> > > > error from vhost_vdpa_get_features. Fixing it by making all errors go to
> > > > the same error path.
> > > >
> > > > Resolves: Coverity CID 1490785
> > > > Fixes: 8170ab3f43 ("vdpa: Extract get features part from vhost_vdpa_get_max_queue_pairs")
> > > >
> > > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > > > ---
> > > >   net/vhost-vdpa.c | 4 ++--
> > > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > index 6abad276a6..303447a68e 100644
> > > > --- a/net/vhost-vdpa.c
> > > > +++ b/net/vhost-vdpa.c
> > > > @@ -566,7 +566,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
> > > >       g_autofree NetClientState **ncs = NULL;
> > > >       g_autoptr(VhostIOVATree) iova_tree = NULL;
> > > >       NetClientState *nc;
> > > > -    int queue_pairs, r, i, has_cvq = 0;
> > > > +    int queue_pairs, r, i = 0, has_cvq = 0;
> > > >
> > > >       assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
> > > >       opts = &netdev->u.vhost_vdpa;
> > > > @@ -582,7 +582,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
> > > >
> > > >       r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
> > > >       if (unlikely(r < 0)) {
> > > > -        return r;
> > > > +        goto err;
> > >
> > > Why don't you use "goto err_svq"?
> >
> > This patch is kind of half of the idea discussed in the thread where
> > this problem was reported, which is that by setting i = 0 you can
> > then consistently have all the error handling be 'goto err' and that
> > frees everything that needs to be freed regardless of whether it's
> > called after or before the initialization of the ncs[] entries. But it
> > doesn't do the other half of the job, which is making all the other
> > error handling code in the function also use 'goto err', so it looks
> > a bit odd as it stands.
> >
> 
> That's right, I thought just fixing the issue about the leaked file
> descriptor was the right thing to do in the hard feature freeze, and
> that other part should be left for the next dev phase. Is the unified
> error handling code acceptable for this period? I can send a patch
> either on top of this one or squashed if so for sure.
> 
> Thanks!

Yea I'd prefer a minimal patch, unless others object strongly.


-- 
MST


