Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE10C53209
	for <qemu-trivial@archiver.kernel.org>; Mon, 27 Jul 2026 17:16:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1woOwT-00053D-2K; Mon, 27 Jul 2026 13:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1woOwM-00052R-M7
 for qemu-trivial@nongnu.org; Mon, 27 Jul 2026 13:16:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1woOwK-0000eO-ET
 for qemu-trivial@nongnu.org; Mon, 27 Jul 2026 13:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1785172587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W3mGFXZevARNc878mJv43Auua4IFTv4YphZThywYfhE=;
 b=CJR5dYLnLcVYHErYGDBAts50/28pD1j53NHXhOjNr0YjdgdiW+5BegcnE86/woW6///wjg
 Yw4YySq5GFUL/NlQXEvHLNc6FvwdMUDzTjsIOFIqr8D+pcEHFfwiI3JoDkurzhYzTF617q
 mVmO33KF7lGhUElBOU50gkRefwxvcqU=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-pNbItihEP52BR3MVsRzCDA-1; Mon, 27 Jul 2026 13:16:25 -0400
X-MC-Unique: pNbItihEP52BR3MVsRzCDA-1
X-Mimecast-MFC-AGG-ID: pNbItihEP52BR3MVsRzCDA_1785172585
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-81eddfe28b4so77349667b3.3
 for <qemu-trivial@nongnu.org>; Mon, 27 Jul 2026 10:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785172585; x=1785777385;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=W3mGFXZevARNc878mJv43Auua4IFTv4YphZThywYfhE=;
 b=maSh95G9YDjX0iirTl+kOj0VcSHShcLWjR/G0L3yznlJTJh4Tl4AWvko26MfCvMpsq
 UcXol5tc0bgmD7WP/XRE9RHMe6WhlXXqyil0EW9gGVV2DyGnYNzJrF3X5zBiwAwm9Kx8
 CihJaj67GhnHoy84i4UpRqqwGdHehDSU16RGIonXaw45hM0X5FPQovAJRMa4Nq1PW61F
 cO6smvkj7ElRdNvgxXI3cLx6f79hh6EGZ23BuUc5XpMD2RTbo/749fTLyeNj+Eo3L9eI
 x/BohdTlggpCC4yxm+yG8cZIfLdOzsgg/WRqlIcQd1CWwVJh75QO2F0MUuXnDF5a9Huk
 /e2w==
X-Forwarded-Encrypted: i=1;
 AHgh+RrXD8ccUctOQBNHirTowHn5nCwnVzBWfJbvL4dISnUAfEnWre4IT3osokme26ChsOq+XjBC5AwWhgzSzdw=@nongnu.org
X-Gm-Message-State: AOJu0Yw+oCcR9JUr9ZMk5VGr2gahiKE0crwp5icZe38Yl3IQr+UjC4Dy
 YyRXpCqFfBCXbFkWyrosFxU1+S2ykBey/ncBuNDkDTEf+arB3+fE793SBNSemWBs3rfwBRUOe7e
 //nUL/bny9j1g7jye2wwFHege1rqZx5IQZZ6L4Q+kziEozkTuvF/buX5rQuoniQaGZ77eva3epl
 vcChF46tFMCLTuJZ9E/IlgtbJypm4G51AvEA==
X-Gm-Gg: AR+sD10ndIlarTkKX+c2WIQo4If/aW4bAK2E4FGgiTXvtB/9jHdgxs1K9hssyTycM+r
 +hJk6nke1dgsvNpnzfn9pRKbPGcvbyvFbS+gRD6SFmUTnC9yQUTvpqGnJvdWWuFI8R1GEmG81ai
 yFuPmSGAOgNwYHCWBu7LC9VUT9ZG69piV+XmTewSsX+NrAooT9I98Qt4G19fGVYXgITSU+4OE9u
 /78ZERj1UmTRnXR
X-Received: by 2002:a53:d94e:0:b0:667:af58:8d68 with SMTP id
 956f58d0204a3-668ffdf6f05mr48374d50.61.1785172584873; 
 Mon, 27 Jul 2026 10:16:24 -0700 (PDT)
X-Received: by 2002:a53:d94e:0:b0:667:af58:8d68 with SMTP id
 956f58d0204a3-668ffdf6f05mr48336d50.61.1785172584382; Mon, 27 Jul 2026
 10:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260723044805.527643-1-jsnow@redhat.com>
 <87ik65g8xm.fsf@pond.sub.org> <87h5lobypc.fsf@pond.sub.org>
In-Reply-To: <87h5lobypc.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Mon, 27 Jul 2026 13:16:13 -0400
X-Gm-Features: AUfX_mxQww8G_sDN4rPtGqGYLANzGPwYtpBIHqm73aQVX56k63-nE7PKd7bUCQA
Message-ID: <CAFn=p-Z0Ys6FoUqRPY7d5CaN4YfHE4DUN6VLtMeWRJgUk3Khkg@mail.gmail.com>
Subject: Re: [PATCH v2 00/44] qapi: convert trivial intro sections
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Lukas Straub <lukasstraub2@web.de>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Zhao Liu <zhao1.liu@intel.com>, 
 Laurent Vivier <laurent@vivier.eu>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Alex Williamson <alex@shazbot.org>, zhenwei pi <zhenwei.pi@linux.dev>,
 Hanna Reitz <hreitz@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>, qemu-block@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 linux-cxl@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Fabiano Rosas <farosas@suse.de>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, 
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-edac@vger.kernel.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Jason Wang <jasowangio@gmail.com>, qemu-trivial@nongnu.org, 
 Jonathan Cameron <jic23@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s9YRAT9dMg4u7jt3pMnnkiLrnKnjB4GDKG4k7kGldXo_1785172585
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.58,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Jul 24, 2026 at 4:04=E2=80=AFAM Markus Armbruster <armbru@redhat.co=
m> wrote:
>
> Markus Armbruster <armbru@redhat.com> writes:
>
> [...]
>
> > Converting single first paragraps is mechanical.  For it to be correct,
> > this single paragraph must actually be the overview, and not some other
> > crap.  I expect it to be almost always overview.  Not sure how to best
> > look for the exceptions.
>
> The separation truly matters only when the inliner inlines the doc
> comment.  It potentially matters when it would inline it if the type was
> used differently.

It also (potentially) matters for auto-generated docs, such as
undocumented members, return types, features*, errors*. The break
point is where these fields get inserted.

(*Not currently performed. Not asserting that it will be performed, or
that it is necessarily valuable to do so. Just fleshing out the
category.)

>
> If I remember correctly, the inliner inlines doc of struct / union base
> type, union branch type, command / event argument type.
>
> Argument can only be struct or union.  Base and branch can only be
> struct.
>
> We talked about maybe inlining return types some day.  This would be
> struct, union, or array of struct or union.
>
> So, for anything other than struct and union, the inliner doesn't get
> involved, and separating the overview cleanly is just a matter of
> writing style.  I'm not sure we care.  Even if we elect to care,
> cleaning it up is hardly this series' business.  In short, your
> mechanical conversion of single first paragraphs to overview syntax
> should be fine even where a paragraph's contents isn't clearly overview.

Except in cases where stub positioning matters, see also the former
"TODO:" syntax used to delineate intro/details.

>
> Structs and unions, however, could use an eye-over.
>
> [...]
>


