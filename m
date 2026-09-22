Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A35C98302
	for <qemu-trivial@archiver.kernel.org>; Tue, 22 Sep 2026 17:29:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1x94JF-0005Fa-Fx; Tue, 22 Sep 2026 13:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x94J9-0005Ak-Gx
 for qemu-trivial@nongnu.org; Tue, 22 Sep 2026 13:29:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x94J5-0006MX-DB
 for qemu-trivial@nongnu.org; Tue, 22 Sep 2026 13:29:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790098166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IZkmkyZLtQRZlbDdg5kxl0/7JqUe3aN6Dowu+4nYfRo=;
 b=bx1C5XVSEDGaHVaTef0fCjRLmFam2MVb5aSLiXDCyM6sf/sEvsYlw5JH2Xa4xDlP//AFiV
 IrTNovKAW4x1yZ9NQP9NrmIhrQcskijXBw5W4/c1p9OCBMlBCJzcirBY8oBWAx+NAVTnoB
 o7KBnsgululz8eedPEmANQuL3M+3apw=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-fqw52gyUMVK_IC3S-Xo3RQ-1; Tue, 22 Sep 2026 13:29:25 -0400
X-MC-Unique: fqw52gyUMVK_IC3S-Xo3RQ-1
X-Mimecast-MFC-AGG-ID: fqw52gyUMVK_IC3S-Xo3RQ_1790098164
Received: by mail-yx1-f69.google.com with SMTP id
 956f58d0204a3-66cf1803125so94498d50.0
 for <qemu-trivial@nongnu.org>; Tue, 22 Sep 2026 10:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790098164; x=1790702964;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=IZkmkyZLtQRZlbDdg5kxl0/7JqUe3aN6Dowu+4nYfRo=;
 b=ndpcDBELJomcO0q6rd80YCc9FZvvdGDi59RGAycIBlcn6UupuzMC7DXC8/eVkT34Kt
 PD/R/7TnNXKthxi1LJKKggyjzVx493McBM4NtHtu0mXadOqh2j2nsXK7u/CDRZmqVpVJ
 b7pTvpHnpPnF7zi5ehoLbkrfcALXvY4BS+Lb7J0MS+OLZK09k5iYBMjjESMA1ljsnLfm
 uOkZB1sILTIeNhAeCuxfn1QHwxx7Dgp1w114gkBgSPJJJYXSQaOVwOIsQ8YT111UT1dm
 ujHoZlMGlil1oK7ef2WmgnPciiB7t1Iz+IpIHIynwYG7r85ZRBtPy33cs7iveXCXSpHx
 pdCg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwqDtrmvqUpjFxi4ulXgz4Z/mZ5P78dj29SNo+9zZ4QbOmP8h+4m6HQb5UkAmcJDYW/yRrSbEnRWHFsNXM=@nongnu.org
X-Gm-Message-State: AFuF++kV2HCUo6LKQLsiNUYo0D2kdMUcfYq1klta8PHn0eCEHc3vPRUv
 K0ArAk6x8u/M+oZZQ/rd15LLmIOaJxPpjPLfMdbTmn186sai66akvQyNP+PcPEYRgQ1wqos2Fv+
 TVvFgSHOQGBnQAIAklr1Qy/cUMK0Og/Jj8DmeMfep64WRzur1UnFHafSEzIvXzNIL6CvLWySClp
 lRLk5aftAeYxxTgqJ37dkLWr+bP8HgXRIDJw==
X-Gm-Gg: AYBFou3Z5jvpK/naK21lGdC/x/M340lYK3nDBPYE7q9bA29lITsZjz1N/quPJzv2lUg
 LNS5n+N7SVdmNd2zGjUfEfwMOKD531poDOv0ophFH9A3tTkfIy0IKg7RsMey4Xzc6+dTIhEPQWg
 mlJN0evVzr8GRS5IZ4KyfMLtR6dfiGjn8vfiYvTrB/JSsK8Y7INB56jVXB8HsG9ub93uOS6QO19
 1AtIZM6M0xpyj0g
X-Received: by 2002:a05:690e:4507:20b0:671:54f1:b92a with SMTP id
 956f58d0204a3-672d574c0a5mr113527d50.29.1790098164360; 
 Tue, 22 Sep 2026 10:29:24 -0700 (PDT)
X-Received: by 2002:a05:690e:4507:20b0:671:54f1:b92a with SMTP id
 956f58d0204a3-672d574c0a5mr113517d50.29.1790098163925; Tue, 22 Sep 2026
 10:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260921205147.1857168-1-jsnow@redhat.com>
 <20260921205147.1857168-3-jsnow@redhat.com>
 <87a4p92p3k.fsf@pond.sub.org>
In-Reply-To: <87a4p92p3k.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 22 Sep 2026 13:29:12 -0400
X-Gm-Features: AcwNN1Wiej_-uzE2D_vQBun2VWaKSLsrzpoAyOm58lRnA9ICEqhMf263Bw9m4AY
Message-ID: <CAFn=p-Z1gTHSk1=G_eU=MRCT93j7kpcnub=O2o1vXL95kD9B=g@mail.gmail.com>
Subject: Re: [PATCH 2/9] qapi: convert intro sections for unit tests
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
X-Mimecast-MFC-PROC-ID: prsmw0ay8IA5jk-XIizg17pb93J9Ra64uS7gveDlMhk_1790098164
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Tue, Sep 22, 2026 at 1:06=E2=80=AFPM Markus Armbruster <armbru@redhat.co=
m> wrote:
>
> John Snow <jsnow@redhat.com> writes:
>
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  tests/qapi-schema/doc-good.json                | 10 +++++-----
> >  tests/qapi-schema/doc-good.out                 | 13 +++++--------
> >  tests/qapi-schema/doc-interleaved-section.err  |  2 +-
> >  tests/qapi-schema/doc-interleaved-section.json |  3 +--
> >  4 files changed, 12 insertions(+), 16 deletions(-)
> >
> > diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-go=
od.json
> > index fac13425b72..00721d5c522 100644
> > --- a/tests/qapi-schema/doc-good.json
> > +++ b/tests/qapi-schema/doc-good.json
> > @@ -94,12 +94,11 @@
> >
> >  ##
> >  # @Variant1:
> > +#     A paragraph
> >  #
> > -# A paragraph
> > +#     Another paragraph
> >  #
> > -# Another paragraph
> > -#
> > -# @var1 is undocumented
> > +#     @var1 is undocumented
>
> Let's keep '@var1 is undocumented' plain.  That way, it stays close to
> "author forgot the colon after the member name", which I find useful.

OK, but it will very soon be disallowed in that position; it will have
to be moved below Features et al, eventually. Making this change, but
heads up that it necessitates another patch in the order enforcement
series.

>
> >  #
> >  # Features:
> >  # @variant1-feat: a feature
> > @@ -206,7 +205,8 @@
> >
> >  ##
> >  # @cmd-boxed:
> > -# If you're bored enough to read this, go see a video of boxed cats
> > +#     If you're bored enough to read this, go see a video of boxed
> > +#     cats
> >  #
> >  # Features:
> >  # @cmd-feat1: a feature
> > diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-goo=
d.out
> > index 371dd25ffc7..8c0818a3f0d 100644
> > --- a/tests/qapi-schema/doc-good.out
> > +++ b/tests/qapi-schema/doc-good.out
> > @@ -126,13 +126,11 @@ doc symbol=3DBase
> >   minimally indented
> >  doc symbol=3DVariant1
> >      Intro
> > +    A paragraph
> >
> > -    Plain
> > -A paragraph
> > +    Another paragraph
> >
> > -Another paragraph
> > -
> > -@var1 is undocumented
> > +    @var1 is undocumented
> >      Member=3Dvar1
> >
> >      Feature=3Dvariant1-feat
> > @@ -213,9 +211,8 @@ Note::
> >  2.10
> >  doc symbol=3Dcmd-boxed
> >      Intro
> > -
> > -    Plain
> > -If you're bored enough to read this, go see a video of boxed cats
> > +    If you're bored enough to read this, go see a video of boxed
> > +    cats
> >      Feature=3Dcmd-feat1
> >  a feature
> >      Feature=3Dcmd-feat2
>
> I'm mildly surprised that the intro's indentation isn't stripped.  Maybe
> we discussed that already, and I forgot.  Anyway, it works, and changing
> it is way out of scope right now.

*searching resident databanks*

I think I was striving for minimal processing of the text prior to
handoff to sphinx for reasons of preserving accurate source
information.

qapidoc.py has this code:
```
    def visit_plaintext(self, section: QAPIDoc.Section) -> None:
        # Squelch empty paragraphs.
        if not section.text:
            return

        # Intro sections, which are indented in QAPI source, need to
        # be dedented to avoid accidental block quotes in ReST syntax.
        dedent =3D bool(section.kind =3D=3D QAPIDoc.Kind.INTRO)
        self.ensure_blank_line()
        self.add_lines(section.text, section.info, dedent)
        self.ensure_blank_line()
```

As a result, the unit test plaintext versions retain that indentation.
This actually matches how we treat indentation for member text, which
is also preserved and represented in the plaintext test output!

Granted, now that I have excised the backwards compatibility demon
from qapidoc, it is possible we can conduct another audit on source
information preservation and some things might be able to be
simplified, but I think this is fine and good for now.

>
> > diff --git a/tests/qapi-schema/doc-interleaved-section.err b/tests/qapi=
-schema/doc-interleaved-section.err
> > index e5d1ef54c1b..85f01fa57a7 100644
> > --- a/tests/qapi-schema/doc-interleaved-section.err
> > +++ b/tests/qapi-schema/doc-interleaved-section.err
> > @@ -1 +1 @@
> > -doc-interleaved-section.json:15:1: description of '@foobar:' follows a=
 section
> > +doc-interleaved-section.json:14:1: description of '@foobar:' follows a=
 section
> > diff --git a/tests/qapi-schema/doc-interleaved-section.json b/tests/qap=
i-schema/doc-interleaved-section.json
> > index eec01ed5650..bc0937b8601 100644
> > --- a/tests/qapi-schema/doc-interleaved-section.json
> > +++ b/tests/qapi-schema/doc-interleaved-section.json
> > @@ -2,8 +2,7 @@
> >
> >  ##
> >  # @TestStruct:
> > -#
> > -# body
> > +#     body
> >  #
> >  # @integer: foo
> >  #           blah
>


