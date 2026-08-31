Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8668DC61DFD
	for <qemu-trivial@archiver.kernel.org>; Mon, 31 Aug 2026 18:44:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1x16zO-0006Cb-4k; Mon, 31 Aug 2026 14:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x16zJ-0006BY-9o
 for qemu-trivial@nongnu.org; Mon, 31 Aug 2026 14:44:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x16zG-00056I-Vo
 for qemu-trivial@nongnu.org; Mon, 31 Aug 2026 14:44:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788201844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iy0jZcKpecBsRYb0oiNpQgveju/GEQS8bQ6zsdRVYxU=;
 b=W7ZqcO7i+SyERvLg8JFTFRaCK0Es2NjOZfOaMNgCQf6HCHLciVSDOzKYwasUqC1BjsUgw7
 7n24ezXizgzHD6t/Z/2Emhn+4qZQdPBlGuJ6fyFfl/+R/kxeP6R1LYHEOQT8oynJ7bPxyj
 GZ6JQ7POG/5VllEfv5dnmC68E9/+Lu0=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-YgwsSx0cO1-wd7ZkmbA9Yw-1; Mon, 31 Aug 2026 14:44:03 -0400
X-MC-Unique: YgwsSx0cO1-wd7ZkmbA9Yw-1
X-Mimecast-MFC-AGG-ID: YgwsSx0cO1-wd7ZkmbA9Yw_1788201842
Received: by mail-yx1-f70.google.com with SMTP id
 956f58d0204a3-66c70d0dd81so5788210d50.0
 for <qemu-trivial@nongnu.org>; Mon, 31 Aug 2026 11:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788201842; x=1788806642;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Iy0jZcKpecBsRYb0oiNpQgveju/GEQS8bQ6zsdRVYxU=;
 b=Oqy40DYiAgTZ1KpQbiLLRe3M/G1HXUBGVSdUfVbByra9q/gn3V4pN5csu0TtpX6YAz
 k+ZQC9gbAVxkBKbNSWHhrDTAtzmS67/EG9B4F7iqXO6tHlsrT1PruhuUZQHAzieqVW54
 Bsuhla3SVkZ3jnRTOfYJbHRTsysOcI9HdWXAFZmV/P/XyR3LX+frFAPUvSH7xVyVmNLG
 xOTr4/KThOoZElvq8M90lZROu9xIDYYydkbegdFmq0s8iIG3WdXYv6+vsnZhyOkCY68k
 NzdUJLDp3meAhKmViAVnco8Ls1Xs5fA8pP7aXGUK5SJUBbbJE9eDqAEW5fabWwlQ36SQ
 A9QA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwfAsrP6BXHL0OrOz8Y/YXFN2d5oiVPZPmkEHAkA//CQT+TDbQEiTRrifPCnvkokchz0BvdNg4hGiI/SkU=@nongnu.org
X-Gm-Message-State: AFuF++kAflFvIGMd5N1BBxcniabt+97TzrCVQw18nsL+cGVomVJyHS9R
 iBhW4bU1NPoWoiRMKpxWuRzwbd9cQkD2ZnWl3IYzswoo2cuSqraxUqJJ1Qp8x6ayY2yytoH7F8o
 u6LHauz9W3zbKoy7+tY3Ot4evPY/ToG1LzwcFlxlA3nxNVToF9T79YtkukZ7LFgDJv6JdugzV4I
 svDm72wziuNBCFmxBpWZLAvDJUormG2tPPJA==
X-Gm-Gg: AYBFou306FlGYrRXqQrScjJ+3+YEibAWP2nAY1mAziVYUaODnMS7wdVIiQOL+QZ2V5a
 QR+OcGW5XkRbjv10Ze7PsUxA8J1Ui5aFBNp8gaRFbZ7KcZ6zDgDTXEkBJEfxeHf1FQI/R0PUq0L
 /rBeldEAt4lcTNKhR+zed4LhqJMCvqXxTkvuEZWkx4l/FfCWN+NFIFqVOX8AmKHQcx9KTexG+RL
 B3dKOyLqRz8utlf
X-Received: by 2002:a53:e031:0:b0:66b:b123:edf7 with SMTP id
 956f58d0204a3-66e4c7640a7mr7909076d50.41.1788201842217; 
 Mon, 31 Aug 2026 11:44:02 -0700 (PDT)
X-Received: by 2002:a53:e031:0:b0:66b:b123:edf7 with SMTP id
 956f58d0204a3-66e4c7640a7mr7909044d50.41.1788201841638; Mon, 31 Aug 2026
 11:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260826193840.2152000-1-jsnow@redhat.com>
 <20260826193840.2152000-2-jsnow@redhat.com>
 <ao_-_38raHK0rWkX@redhat.com> <87jypb90c0.fsf@pond.sub.org>
 <apA-CzGqrlFNfjp5@redhat.com>
In-Reply-To: <apA-CzGqrlFNfjp5@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 31 Aug 2026 14:43:50 -0400
X-Gm-Features: AcwNN1U7U_H0llO6PbcP2SiDomkf5aFXIboSJ6KTmuVOJVPeh4fAMV8BIicxfUc
Message-ID: <CAFn=p-bUTApw73Ddz-tH1FzY97Ct5rfFZ=domFhm-OO3G8COug@mail.gmail.com>
Subject: Re: [PATCH v3 01/43] qapi: convert trivial intro sections for
 error.json
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 Alex Williamson <alex@shazbot.org>, linux-cxl@vger.kernel.org, 
 Michael Tokarev <mjt@tls.msk.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 zhenwei pi <zhenwei.pi@linux.dev>, qemu-trivial@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>, Kevin Wolf <kwolf@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, 
 Jiri Pirko <jiri@resnulli.us>, qemu-block@nongnu.org, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, 
 linux-edac@vger.kernel.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Zhao Liu <zhao1.liu@intel.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Jason Wang <jasowangio@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zYuG_p5qczdcRhgAnvknYVrxfEsNMioGbmugMaLezqw_1788201842
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

On Thu, Aug 27, 2026 at 9:39=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Thu, Aug 27, 2026 at 03:09:35PM +0200, Markus Armbruster wrote:
> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
> >
> > > On Wed, Aug 26, 2026 at 03:37:58PM -0400, John Snow wrote:
> > >> Signed-off-by: John Snow <jsnow@redhat.com>
> > >> ---
> > >>  qapi/error.json | 3 +--
> > >>  1 file changed, 1 insertion(+), 2 deletions(-)
> > >>
> > >> diff --git a/qapi/error.json b/qapi/error.json
> > >> index 54cb02fb880..a53b13e55c9 100644
> > >> --- a/qapi/error.json
> > >> +++ b/qapi/error.json
> > >> @@ -9,8 +9,7 @@
> > >>
> > >>  ##
> > >>  # @QapiErrorClass:
> > >> -#
> > >> -# QEMU error classes
> > >> +#     QEMU error classes
> > >
> > > Where is this need for indent coming from ?  From the POV of someone
> > > writing comments, the need to indent the introductory text like this
> > > feels very counter-intuitive, an exception from any other inline
> > > docs syntax I've typically used. Is there any way we can avoid this ?
> >
> > The cover letter explains the need:
>
> Yes, I just didn't see the connection from that, to the use
> of indent.
>
> >
> >     This is being done primarily for the benefit of the forthcoming
> >     "inliner", a feature for the rendered HTML QMP documentation that
> >     seeks to "inline" QMP command argument documentation into the argum=
ent
> >     list for each command.
> >
> >     There are two main motives here:
> >
> >     (1) We want the split between the "introduction" and "details"
> >         sections to be mechanically obvious, so that auto-generated or
> >         inlined documentation has a well-defined, obvious spot to go.
> >
> >     (2) We do not want to inline irrelevant, introductory text describi=
ng
> >         structures to be copied into command documentation.
>
> So IIUC, you're saying that we are going to rely on indentation
> to distinguish introduction from details ?
>
>
> > Note that the inliner elided Netdev's Intro "Captures the configuration
> > of a network device."
> >
> > However, when Intro and Details bleed together, the inliner elides more
> > than it should.  I consider that a fairly serious issue.
> >
> > I'm afraid forgetting to mark the end of Intro with "Details:" would be
> > a common mistake, easy to miss in review.  So I explored possible
> > alternatives:
> >
> >     Subject: Re: [PATCH v2 00/10] qapi: enforce section ordering
> >     Date: Wed, 15 Apr 2026 11:43:45 +0200
> >     Message-ID: <87zf341ru6.fsf@pond.sub.org>
> >     https://lore.kernel.org/qemu-devel/87zf341ru6.fsf@pond.sub.org/
> >
> > John is working towards "3. Make the end of intro syntactically obvious=
"
> > always, specifically "3c. Indent intro like descriptions and tagged
> > sections" with the ultimate goal to reject unindented Intro.  That way,
> > we cannot write an Intro with an unclear end.  John, correct me if I'm
> > accidentally misrepresenting your work.
> >
> > Questions?  Better ideas?
>
> As an author, how substantive is "Intro" expected to be? I guess on
> QAPI docs I've written I've not ever been aware of there even being
> a distinct concept of Intro vs Details to think about. It is all just
> some lines of prose to me.

In most cases, not very substantial. For commands and events, it *can*
be quite a bit more substantial. For structs, enums, etc it is almost
always laughably trivial.

When the syntactical delineation of intro is complete, further QAPI
parser changes will make it even more obvious: any free text that
exists between the intro and the other sections will be flagged as an
error, where you will be urged to move any detail text to below the
metadata fields. This physical relocation will help suggest to the
documentation author what goes "above the fold" and what goes "below
the fold", so to speak.

>
> My only alternative idea to indentation would be to declare that the
> "Intro" is always the 1st paragraph of text and anything beyond that
> is the "Details". That might match up with the way that contributors
> naturally write text where the 1st paragraph conveys the key idea,
> such that they dno't need to think about Intro vs Details as a
> concept.

Yeah, that's roughly the idea; and some prototypes used this idea in
the past - but Markus wanted an explicit, obvious delineation
precisely to *force* documentation authors to think about the split.
It has implications for what gets generated into the documentation and
in which scenarios.

I do usually try to make my upgrades "invisible" to the user, but in
this case I believe we are erring on the side of "explicit is better
than implicit" because of the implications of the text not always
being copied in a precisely straightforward manner to the HTML docs.

I will address the subtleties of this issue when the inliner is being
merged by updating a documentation writer's guide that covers what
goes where and why. For now, we are just trying to do the bulk
conversion.

>
> With regards,
> Daniel

--js


