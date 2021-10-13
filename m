Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1maixo-00025U-Uw
	for mharc-qemu-trivial@gnu.org; Wed, 13 Oct 2021 14:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1maixj-00023m-9U
 for qemu-trivial@nongnu.org; Wed, 13 Oct 2021 14:26:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1maixf-00066f-Dj
 for qemu-trivial@nongnu.org; Wed, 13 Oct 2021 14:26:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634149600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mIexyks6trSE4vLyprIcGWiExaP7tJJPFto2dPxB1b4=;
 b=XdovUbIM+I8Mykhl6qG5z0bq4TXpHJmc1J5Tc1ZXSHPlK1azHcx8ysvuZphi3qwk8cz8lG
 fAccrfQjA/LuBGtTAI+iDbU6rcaOqmEJf9ayqs7MaBn/Me6V774A6uuJiNum0tmPyStF0A
 D67f2BtRH/APPDGR1qoIEpBYCFRCcxE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-tXRveZkEM7m7FVok2PNfSA-1; Wed, 13 Oct 2021 14:26:37 -0400
X-MC-Unique: tXRveZkEM7m7FVok2PNfSA-1
Received: by mail-qt1-f197.google.com with SMTP id
 c19-20020ac81e93000000b002a71180fd3dso2764283qtm.1
 for <qemu-trivial@nongnu.org>; Wed, 13 Oct 2021 11:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mIexyks6trSE4vLyprIcGWiExaP7tJJPFto2dPxB1b4=;
 b=jsROpBkn89A45cMVhx9eNwNwXKUUOavJKk0c49l6QQP0x1WMt6zLOZt9ousTZqEyji
 /kafZmb6qVJtfQM8r7FSLprB0eS8UkjDocvflABd5dk1/PmreEDG9rZz3U9xpJvzDjEI
 Z9r4XQVzc7RwyS6XCh5jaDZO7YljbJwEADXIcWNaz/sW9ppHNx6DyNAMBkQ+mtKVrXIC
 X6ABVKrCNLhrv2kD1sGTYz58gF93tjXyLpLD9RUAME/fzmjJHHYICK3lkHTdz9fFd3n5
 8YKR5J+p3TKS2VYyA3bfJNejwj2clO3NFQc4310VoXkZu73rBWQqcstpu5KRfPbsqlMI
 HZ3A==
X-Gm-Message-State: AOAM531nl0WczLUZSaZPgCet0nXAMv3f97Zf0Hw/CnCtDiG1T0alpNr2
 rtPTlfTO5RJS4AmZiioN0NR9TQj1gbr0BSzbGhGpoGgus7jItXKpfAB9YVcbigfjdTlsiB4Z6L9
 GIVexIhX7hA1ohpsvDyTFWFPmr39pLmLQdg==
X-Received: by 2002:a05:6214:1763:: with SMTP id
 et3mr790930qvb.37.1634149597393; 
 Wed, 13 Oct 2021 11:26:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRFt/7cjPVChdZyGIAZoygkpUKw3Tdx8nF4d8DyPJS8dttXav/oxK+uXEu9B07GjNxskcF8Jvj/T0WcYYcfRo=
X-Received: by 2002:a05:6214:1763:: with SMTP id
 et3mr790913qvb.37.1634149597223; 
 Wed, 13 Oct 2021 11:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211012155001.811160-1-eperezma@redhat.com>
 <20211012155001.811160-2-eperezma@redhat.com>
 <4af0e643-b80a-7a77-bf4c-f3bff68d70f7@redhat.com>
In-Reply-To: <4af0e643-b80a-7a77-bf4c-f3bff68d70f7@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 13 Oct 2021 20:26:01 +0200
Message-ID: <CAJaqyWd_h3ci04D5223uaiy2-SRJfpo6vPx63spXsb4oJe_0Rw@mail.gmail.com>
Subject: Re: [PATCH 1/1] util: Make some iova_tree parameters const
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 13 Oct 2021 18:26:49 -0000

On Wed, Oct 13, 2021 at 12:21 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 10/12/21 17:50, Eugenio P=C3=A9rez wrote:
> > As qemu guidelines:
> > Unless a pointer is used to modify the pointed-to storage, give it the
> > "const" attribute.
> >
> > In the particular case of iova_tree_find it allows to enforce what is
> > requested by its comment, since the compiler would shout in case of
> > modifying or freeing the const-qualified returned pointer.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  include/qemu/iova-tree.h |  8 ++++----
> >  hw/i386/intel_iommu.c    |  2 +-
> >  util/iova-tree.c         | 10 +++++-----
> >  3 files changed, 10 insertions(+), 10 deletions(-)
>
> > -DMAMap *iova_tree_find_address(IOVATree *tree, hwaddr iova)
> > +const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova=
)
> >  {
> >      DMAMap map =3D { .iova =3D iova, .size =3D 0 };
>
> You missed this one ^
>
> With it declared const:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

Right! Sending v2.

Thanks!


