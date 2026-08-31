Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34A1C61DFD
	for <qemu-trivial@archiver.kernel.org>; Mon, 31 Aug 2026 18:56:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1x17Ap-0008Ng-CD; Mon, 31 Aug 2026 14:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x17Ah-0008Lc-DF
 for qemu-trivial@nongnu.org; Mon, 31 Aug 2026 14:55:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x17Af-0007sa-S1
 for qemu-trivial@nongnu.org; Mon, 31 Aug 2026 14:55:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788202553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xJ5EPZcsW3BeU/Du4PIisPviXsXnrKzOxO6xL0idyrw=;
 b=Nie0B+f4DgJZPUHkS2ss7BGkBJTpCIJBg5SBabIra3jzmvf6COW/evH2IlllvC8R0htH/e
 om/xf7Aop3kwMEDgxJ1t4S/ueVu0etTZ11yaNncgP0mbyQq9q9D8A96w8nn1FHtWQXhGa3
 o02F3d11lwcJDIpccBDvUkK6dxqqmbI=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-E6IcecupO8aJSyIAfGJ6EQ-1; Mon, 31 Aug 2026 14:55:51 -0400
X-MC-Unique: E6IcecupO8aJSyIAfGJ6EQ-1
X-Mimecast-MFC-AGG-ID: E6IcecupO8aJSyIAfGJ6EQ_1788202551
Received: by mail-yx1-f70.google.com with SMTP id
 956f58d0204a3-66c70bf18a1so4581954d50.0
 for <qemu-trivial@nongnu.org>; Mon, 31 Aug 2026 11:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788202551; x=1788807351;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xJ5EPZcsW3BeU/Du4PIisPviXsXnrKzOxO6xL0idyrw=;
 b=UX2M2hlmV/B2kYA8/WrcqLG6IjVGOnioqDazUceHeArqeA9t4x6WWzafS8le0CpYER
 tbgK14d/+dFEUosSl5Fjj9TDxQW/g3vm3+AqWantjbXXWLiYouejzHQg1wUfxmNF5DmW
 eiI1MajqtYkYFaZkAQJtPAlUKydlIpuyidcqFLavRfOZS7V/yPsOyd35vAkeVRk4uzXW
 GcYPP6rnSx/VeGHOEXLUJHO2wLaMUQPjlXVIUsHAiiBQ5EDpc6UPciXcITO98bBCcfCs
 WKEUb0MEBhgDzoivn3aDzuRohPkMVxFNM6TbBWu27ScZJpBlWtBDi+7X/OxowBCVgkCS
 Gsvw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzuiKlS+a7Xyi+SQquc+V4AXzO/68nkiMBw/XBimLuzxRnCCYggal5e5orOwthr5UAffD/4/2xXiuLUpE4=@nongnu.org
X-Gm-Message-State: AFuF++kiQjyDies6I0cIP5r/+eqox23oClvkxB55GlQhBSKw30My1fI+
 n4CSAdLmBNZxIU6k8tKs7Zq6IjkTbGvlRKxOYR8gC5fMD9hDv0luE33ATZdQgzyEa5qy+a/dkYY
 vsPSunHZsRM6LOblRpQPTOFGevicfe/YvwvPwhDGmBZrE9cXG1dHQ+FCFkIbweDfey6QLqNxz/Q
 PZnjMP+dyocvk98r1srLKIxJd+33kK4Cz5bw==
X-Gm-Gg: AYBFou0PEWqHwrSoYYJbjHqrMIeLNiylaXNCMGJoReD5V/vVz7TfiIw+fwmR8UAbPN6
 82T3mHGhOPx5jF4/Gpn71cFtvAAScf30l8XeXxKh5IeN+7MXLNa8FwsSM1NUQ/ywtDaBngm0GRq
 6qWX7CkOq8EuC69CIw5Ji2Kx/+je541F69ueMO9Y5D0Z8mjMN+bf7VVHgVtmFK5p4QGrM8ITtY4
 1oQVsbn5rYJGzF5
X-Received: by 2002:a53:c30f:0:b0:66f:8731:8d1 with SMTP id
 956f58d0204a3-66f87311ba5mr991252d50.39.1788202550159; 
 Mon, 31 Aug 2026 11:55:50 -0700 (PDT)
X-Received: by 2002:a53:c30f:0:b0:66f:8731:8d1 with SMTP id
 956f58d0204a3-66f87311ba5mr991075d50.39.1788202544932; Mon, 31 Aug 2026
 11:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260826193840.2152000-1-jsnow@redhat.com>
 <20260826193840.2152000-32-jsnow@redhat.com>
 <877bl6e6so.fsf@pond.sub.org>
In-Reply-To: <877bl6e6so.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Mon, 31 Aug 2026 14:55:33 -0400
X-Gm-Features: AcwNN1UG_VbNhAzp5JMRR0NLbU9hcA9dfPYFAhsnI6iviTHK2XjRUfYMif3KYDc
Message-ID: <CAFn=p-Y7AO1QRXGHFsahnWtiERbDuBtFtAj0c6wphrLdZmy4_g@mail.gmail.com>
Subject: Re: [PATCH v3 31/43] qapi: convert trivial intro sections for
 block.json
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex@shazbot.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 linux-cxl@vger.kernel.org, Michael Tokarev <mjt@tls.msk.ru>, 
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
X-Mimecast-MFC-PROC-ID: wvbaj2qVmxqRKTPxzg4HLsTGYY2cJzkYGkgye-43oVA_1788202551
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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

On Mon, Aug 31, 2026 at 9:52=E2=80=AFAM Markus Armbruster <armbru@redhat.co=
m> wrote:
>
> John Snow <jsnow@redhat.com> writes:
>
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  qapi/block.json | 41 +++++++++++++++++------------------------
> >  1 file changed, 17 insertions(+), 24 deletions(-)
> >
> > diff --git a/qapi/block.json b/qapi/block.json
> > index 46955bbb3e3..189f2e28204 100644
> > --- a/qapi/block.json
> > +++ b/qapi/block.json
>
> [...]
>
> > @@ -314,12 +310,11 @@
> >
> >  ##
> >  # @blockdev-change-medium:
> > -#
> > -# Changes the medium inserted into a block device by ejecting the
> > -# current medium and loading a new image file which is inserted as the
> > -# new medium (this command combines `blockdev-open-tray`,
> > -# `blockdev-remove-medium`, `blockdev-insert-medium` and
> > -# `blockdev-close-tray`).
> > +#     Changes the medium inserted into a block device by ejecting the
> > +#     current medium and loading a new image file which is inserted as
> > +#     the new medium (this command combines `blockdev-open-tray`,
> > +#     `blockdev-remove-medium`, `blockdev-insert-medium` and
> > +#     `blockdev-close-tray`).
> >  #
> >  # @device: Block device name
> >  #
>
> Not sure the parenthesis belongs into the intro.
>
> I'm okay with keeping this hunk anyway.

In this case, it will be fine as this is a command and the precise
split between intro and details is a lot less crucial. It can be
adjusted later at our leisure.

--js


