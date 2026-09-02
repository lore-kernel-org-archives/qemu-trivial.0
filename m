Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E868C61DD6
	for <qemu-trivial@archiver.kernel.org>; Wed,  2 Sep 2026 17:25:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1x1ohi-0001Vz-AD; Wed, 02 Sep 2026 13:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x1ohh-0001Vl-JX
 for qemu-trivial@nongnu.org; Wed, 02 Sep 2026 13:24:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x1ohg-0007fI-22
 for qemu-trivial@nongnu.org; Wed, 02 Sep 2026 13:24:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788369890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JtfXQonqbMU0qfMOMFckgTdI7kxhGi1jaT13EBgtRUU=;
 b=ZdEt63qHX+d4eCB0vPNU7Sx3Z6HqoI+5sgbj1RNjEcwyiWpxtgeU4ylPMvNSxPJY2SX+WT
 tzegRB5qNF5FHm6vUr0H+m9Iq4wHgs4g/wM2/RUJVAI6TOCaGdl/8RsPH26OLEFkdjhRCN
 FRiaLnVN5Ru5Ki4CY4nxXgRaGO9BZZg=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-ItxYF20PNvGRCj8Ee_HwIw-1; Wed, 02 Sep 2026 13:24:48 -0400
X-MC-Unique: ItxYF20PNvGRCj8Ee_HwIw-1
X-Mimecast-MFC-AGG-ID: ItxYF20PNvGRCj8Ee_HwIw_1788369888
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-85da2b96c35so21885697b3.2
 for <qemu-trivial@nongnu.org>; Wed, 02 Sep 2026 10:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788369888; x=1788974688;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=JtfXQonqbMU0qfMOMFckgTdI7kxhGi1jaT13EBgtRUU=;
 b=dzkPhvwypceJB5zCKfRt8qepbUNhl0h4lNJvAK/amt1bL8PoYhU8EA9JMCqj9ZXhMf
 ROR7otam5eOJnogmF+Vam6l+h23axEBg5YBIBAwbm8O4fFOoUq6RR5czSnrGD/C04k6I
 nuN/BHgAPJz3o7o9xFNhrxTseUIlLFav8qu78PMB/dv69ql+eEDnGk1MG0d5Y5idv4zL
 Zsfk+MzWyCujuSONU81Dae0io0z+ec4787IZQ2s7xqeTuN0jvtKs/LN9YbibsHoEt+RL
 +EawWn6XbxDjMi6LZStQ+v3TXzkoDnJ/o4/h2P6/1PqvYPpI2UHUm+umQKVP0rpVujIM
 xj2Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBy/5fkJtUGin6VaPQt5VFJ6zdAa+3b+bSuKJfEy2Nu90vceZorflj9aSFxo8rlzOBlBA9U4e0ZWcmn/9fA=@nongnu.org
X-Gm-Message-State: AFuF++nH01YmWJr29Gfu9CNBalNFCQ5E6fFNh91aj98HvL2B9Cs+K8fb
 BPEY4h5IRk7THQmCjOVIYHsWY+fn1ZhwLljtd6iHLR/77V340/HC+r+aSfKp/YEhaGzZXg49aSS
 NilYRPJmfR8Krk22uquiPN4opcKLvbYnhyWKfBxuDob7gfiASXtUmw16NkxLc8NrmsFsA0JbzJh
 XbB3npnqpw+FABiqjt6JoN0ingilt2XVDZXQ==
X-Gm-Gg: AYBFou1jRtiPfKYoCCaXLawYfMd0cY5SYQjdM37wI0oGgiTFqhZjCUWsuuP3UF6cexV
 UOFvyAXeWIRafvj+eAtl2aA3YOGZrmgg5CgEsPzGjBdNCr4xgdqWilOscpFfrfbbEia4BWXmTzF
 mtnphY3+LmuevKLZsE3ezK2frtpBvc6ene7RoUaqcapIeVVTo1GZa3DkJ/OGJOO+DOREWfsTe+U
 +a8V0sqMvIO0EXi
X-Received: by 2002:a53:c051:0:20b0:66d:2c09:fb70 with SMTP id
 956f58d0204a3-66f9b6c6c7emr1993914d50.0.1788369888109; 
 Wed, 02 Sep 2026 10:24:48 -0700 (PDT)
X-Received: by 2002:a53:c051:0:20b0:66d:2c09:fb70 with SMTP id
 956f58d0204a3-66f9b6c6c7emr1993889d50.0.1788369887644; Wed, 02 Sep 2026
 10:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260831201945.287730-1-jsnow@redhat.com>
 <871pbd9qpy.fsf@pond.sub.org>
 <CAFn=p-YBpsxy-3tr0SZ0CBfXUYnb6eg6AxNWpwUQmsuY5ZuykA@mail.gmail.com>
 <874ig7539j.fsf@pond.sub.org>
In-Reply-To: <874ig7539j.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Wed, 2 Sep 2026 13:24:36 -0400
X-Gm-Features: AcwNN1XBjb54T3mVZMsXOfq2ujX90-DJwsczseD1fmwpMjm1p4yXf5IyvbishUI
Message-ID: <CAFn=p-ZMj03qA0tvLU34FHLcwBJjU0c2q2Ex1p06FJfZpwyuJA@mail.gmail.com>
Subject: Re: [PATCH v4 00/43] qapi: convert (very) trivial intro sections
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 zhenwei pi <zhenwei.pi@linux.dev>, 
 Jonathan Cameron <jic23@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Jiri Pirko <jiri@resnulli.us>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 qemu-block@nongnu.org, Ani Sinha <anisinha@redhat.com>, 
 Jason Wang <jasowangio@gmail.com>, linux-cxl@vger.kernel.org, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Alex Williamson <alex@shazbot.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 linux-edac@vger.kernel.org, 
 Michael Tokarev <mjt@tls.msk.ru>, Fabiano Rosas <farosas@suse.de>,
 Zhao Liu <zhao1.liu@intel.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eric Blake <eblake@redhat.com>, 
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, qemu-trivial@nongnu.org, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lnz0HjMPY6KKN39IOtvUqbNRLf2p5BTXpXmw0YZqeJk_1788369888
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Sep 2, 2026 at 6:58=E2=80=AFAM Markus Armbruster <armbru@redhat.com=
> wrote:
>
> John Snow <jsnow@redhat.com> writes:
>
> > On Tue, Sep 1, 2026 at 7:05=E2=80=AFAM Markus Armbruster <armbru@redhat=
.com> wrote:
> >>
> >> Series
> >> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> >>
> >
> > Thank you for your suffering :)
>
> You're welcome; it's my job[*]!
>
> > So, I think there's actually no real problem in checking in a partial
> > conversion as the infrastructure was coded specifically to allow it,
> > however you're the maintainer so I will follow your lead. I'm more
> > interested in moving forward than telling you how to do your job ;)
> >
> > The series will eventually enforce strict ordering, so there is no
> > chance we will miss anything. If we send a PR now, we also don't have
> > to keep rebasing the partial series against master. If you don't want
> > to submit a PR, please create a branch I can track and submit patches
> > against, and please periodically rebase it against origin/master.
>
> I worry a bit that having intros split about half between two styles
> would cause confusion and friction.  I'd much prefer to get to >90%
> fairly quickly.  If we think that's possible, I'm happy to queue up
> things in my tree, and take care of the rebasing.

Everything up until the "convert multi-paragraph intros" patch (#44 in
my pending work) is approximately 87% of the total volume of
conversions. In the most recent off-list mail I sent you, that's
Sections 1-7 -- which is essentially all of the stuff that was
factored out as "semi-trivial"/"simple", plus the "TODO" conversions.
I believe these are pretty trivial to burn through, but would require
a bit of dedicated time. We could probably do it in a week if we
really pushed ...

Existing volume of what you have reviewed and accepted is 55%.

Well, either way, I just don't want to have to juggle so many patches
in the interim, so I am pushing a bit to just merge it to make
subsequent series easier to rebase and juggle so that e.g. I don't
have to have increasingly long "based-on" tags.

(Makes sad, pouting noises.)

>
>
> [*] Some days my compensation is compensation for suffering ;)
>


