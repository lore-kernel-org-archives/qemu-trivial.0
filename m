Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E94C98302
	for <qemu-trivial@archiver.kernel.org>; Tue, 22 Sep 2026 17:41:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1x94Ui-0008EB-QI; Tue, 22 Sep 2026 13:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x94Ue-0008Ck-JU
 for qemu-trivial@nongnu.org; Tue, 22 Sep 2026 13:41:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x94Ub-0007cg-Sv
 for qemu-trivial@nongnu.org; Tue, 22 Sep 2026 13:41:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790098880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SZd30P9CSdIgwU178RFVVjmbForznkG8/oHZMwvUt44=;
 b=BuHhZtyZotCUnxi2shm8pPYuiIBvZVMqaDYcvGOOcjq7dsfJHqXi/YDNeNZMm2tIFmJ7/n
 0oRb3KMVyjJdu05TuaLdVsAj+OQywJRU6nIFFT4CIZAZiJKS9aQMArw+Z0Ih05dHYunnCR
 8qtOLUTOoerxRcLzddY4+pn0kbjQC4o=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-FeJiom1zNCeFri0cXYvjzQ-1; Tue, 22 Sep 2026 13:41:19 -0400
X-MC-Unique: FeJiom1zNCeFri0cXYvjzQ-1
X-Mimecast-MFC-AGG-ID: FeJiom1zNCeFri0cXYvjzQ_1790098879
Received: by mail-yx1-f72.google.com with SMTP id
 956f58d0204a3-66988049306so86179d50.1
 for <qemu-trivial@nongnu.org>; Tue, 22 Sep 2026 10:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790098879; x=1790703679;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=SZd30P9CSdIgwU178RFVVjmbForznkG8/oHZMwvUt44=;
 b=FnNYpb9xE3Fxw/OTUxnTXjit0byyP9Q8+h7Ki1KpLthwqLy5LyfxvsF3Z1L9LxBvLu
 473vZIgeEVYCcbIN1Npx02ePvyYjv+EHyxw/qs5Rjxq78BbPzLjvxipl5uJpDrk+tA+J
 Ao5m9N94ZUHfQ3f6L1wbvkPogTyrdxh5Rn9IQuxaciDPhwZaYYJ2mUc0aQ4YNeTjszWw
 9yP6zV6CmjtqfsCD1QmjzS52UhEyeLB/dVvbZdBsUj7jZx6cxPIr4aoedNWpgXVvpmGy
 L21cVSUXoZvWQFQPVH3+ZWr9pMnQ2Ev99PnhxXmk2T9Rmb1I83umW/mbm6ASKhzVD4Le
 Wicw==
X-Forwarded-Encrypted: i=1;
 AKwUvByOmWxGcOnoOUbGRjbyCx8toIt9oR0hRtn/Kg2tXgL6z87vUF4/r43kOPFiJk9zwcGbsiYLlLIbdOVLcXs=@nongnu.org
X-Gm-Message-State: AFuF++kkWrVq6KFwUsPbbZQYdV0sbwVrmWYfCJaLVDSdUMF/1l9YRpT1
 qfxjicwUjWYFckpA01Cle7OeXVJlfG0L1SisQoygld2vofSReGmYSbsGiz+Wkq27CS3Cx12PB9V
 7qpsxR9vpTmE4TAq/o85D4qpJ6Kw1++7g/kuNfqfPFWc/Tfmefnh0i04Qpj/b3sq1xv5pL0g6en
 lkOXRKx5y4q4PlrmyIh+eK0pzdACc8jjkEgQ==
X-Gm-Gg: AYBFou3fgdzNhvhlaLxdFBHyfbqjHYW3HiDy+hWv0WWpA5YJ1IWYrD+Ff1hFkKGhlvs
 72TEqHoI+P3vlrKVdLtvJSzuWKGFrBnhaX8UPxAwkqzW5GkA+zLIy05gjuAybBpNQOC3fhqWza6
 5QeRu9SFuj1T0I4sMcQlfwVRD0d27PH8VUzOUd/Uv+SoH101Yrh1YktnT8AMmVH0kOXL2OuueVy
 Y8dwCK5ZLjZbNQJ
X-Received: by 2002:a53:d00a:0:b0:671:5c2e:82a8 with SMTP id
 956f58d0204a3-672d5860cc0mr131312d50.52.1790098878702; 
 Tue, 22 Sep 2026 10:41:18 -0700 (PDT)
X-Received: by 2002:a53:d00a:0:b0:671:5c2e:82a8 with SMTP id
 956f58d0204a3-672d5860cc0mr131299d50.52.1790098878271; Tue, 22 Sep 2026
 10:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260921205147.1857168-1-jsnow@redhat.com>
 <20260921205147.1857168-8-jsnow@redhat.com>
 <874ifh499p.fsf@pond.sub.org>
In-Reply-To: <874ifh499p.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 22 Sep 2026 13:41:07 -0400
X-Gm-Features: AcwNN1XKAqaiUGp-T_ic9_Q3kmYUYVIeF3HfCLBqlslnjZgQaTuCakqvLJbI_-g
Message-ID: <CAFn=p-ZvFoEfcMj0R6TGWyoYDvbgwSAdJseei0oE41McmSB2Pg@mail.gmail.com>
Subject: Re: [PATCH 7/9] qapi: convert intro sections for
 docs/interop/firmware.json
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Kashyap Chamarthy <kchamart@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, 
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 Jason Wang <jasowangio@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Kostiantyn Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f8CHoCpJ48F9wNujnEt5utR4LHd1SZB4fCc3stD2FJ0_1790098879
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On Tue, Sep 22, 2026 at 11:05=E2=80=AFAM Markus Armbruster <armbru@redhat.c=
om> wrote:
>
> John Snow <jsnow@redhat.com> writes:
>
> > All conversions in this patch do not create a new documentation
> > insertion point, except for one at the very end.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  docs/interop/firmware.json | 76 ++++++++++++++++----------------------
> >  1 file changed, 31 insertions(+), 45 deletions(-)
> >
> > diff --git a/docs/interop/firmware.json b/docs/interop/firmware.json
> > index 421bee0e5ed..1efd32c6315 100644
> > --- a/docs/interop/firmware.json
> > +++ b/docs/interop/firmware.json
>
> [...]
>
> > @@ -250,12 +244,11 @@
> >
> >  ##
> >  # @FirmwareFlashFile:
> > -#
> > -# Defines common properties that are necessary for loading a firmware
> > -# file into a pflash chip.  The corresponding QEMU command line option
> > -# is "-drive file=3D@filename,format=3D@format".  Note however that th=
e
> > -# option-argument shown here is incomplete; it is completed under
> > -# @FirmwareMappingFlash.
> > +#     Defines common properties that are necessary for loading a
> > +#     firmware file into a pflash chip.  The corresponding QEMU
> > +#     command line option is "-drive file=3D@filename,format=3D@format=
".
> > +#     Note however that the option-argument shown here is incomplete;
> > +#     it is completed under @FirmwareMappingFlash.
> >  #
> >  # @filename: Specifies the filename on the host filesystem where the
> >  #     firmware file can be found.
>
> This smells like it could use a split, but it doesn't really matter;
> let's move on.
>
> [...]
>
> > @@ -467,9 +454,8 @@
> >
> >  ##
> >  # @Firmware:
> > -#
> > -# Describes a firmware (or a firmware use case) to management
> > -# software.
> > +#     Describes a firmware (or a firmware use case) to management
> > +#     software.
> >  #
> >  # It is possible for multiple @Firmware elements to match the search
> >  # criteria of management software.  Applications thus need rules to
>
> This is the split you mentioned in the commit message.  Correct?

Yep. Plan is to move this considerably long plaintext section below
the fold when the ordering series hits.


