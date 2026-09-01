Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFBEC61DD3
	for <qemu-trivial@archiver.kernel.org>; Tue,  1 Sep 2026 17:02:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1x1RsD-0004Nf-BB; Tue, 01 Sep 2026 13:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x1RsB-0004NQ-GP
 for qemu-trivial@nongnu.org; Tue, 01 Sep 2026 13:02:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x1RsA-0000xp-3N
 for qemu-trivial@nongnu.org; Tue, 01 Sep 2026 13:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788282129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=60T+l3AlwkUKJ6uA4fVa+g+7QEfq9adnME/zrJKlEjU=;
 b=eYY/5igzkO7MBu5bWLNBgayGuHO38YifNm22CKPOgEzHFGdk/IPvg/s8RSsjh8kZXDgmTF
 8tvbsY+XPRzggwHI3+leB0KScxQvmXg+uezBEfRmnUoZIHKRlM47MjkWUlRy00lYAk1XZf
 4+gW6w5FVUwD0+QNrs7bcgNAwE8ZdGM=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685--191Q-o1M_ClEN3ORXXl6g-1; Tue, 01 Sept 2026 13:02:08 -0400
X-MC-Unique: -191Q-o1M_ClEN3ORXXl6g-1
X-Mimecast-MFC-AGG-ID: -191Q-o1M_ClEN3ORXXl6g_1788282127
Received: by mail-yx1-f70.google.com with SMTP id
 956f58d0204a3-66d309b367dso63135d50.3
 for <qemu-trivial@nongnu.org>; Tue, 01 Sep 2026 10:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788282127; x=1788886927;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=60T+l3AlwkUKJ6uA4fVa+g+7QEfq9adnME/zrJKlEjU=;
 b=J+IHr8O0En100ob0xXPMiiayz5wdcNx5VCHLQYaGOeY+CZdfo1jCRQXeLT4ILGL1Dx
 jvy9X9/KOE5CAw2T+bTFsY8Dt9HRRprjArg/gFyQ2gS3VUKXfCM+7qtbzZh9j4ba0wFr
 rv/pzlWm6Alj/fTzvQhwQ9R2Di5f5VCjoE5LZGP4D9bQ3tBv6AyssXIKgoRm2lwtB74J
 Y2yOW8zvHvypHOklD027veAAnPwRAuBlYwehU66Ls3HCmKmHypqqo4DNzs4p97LxU8Y9
 IV8P3XWRkfh3H+04vCdwRlgyIKOVz9ziJW5iAFDfdmeClb5nHml41LxGMdDUmSHTC4u+
 zB0g==
X-Forwarded-Encrypted: i=1;
 AKwUvBxRe0UC5UWSFCcnclxhZo25mv3Oiy4EahezjcfajK6Aj1pGExbrVFwrwoO3LlixUqTYP/O63uJ1+x0g54I=@nongnu.org
X-Gm-Message-State: AFuF++naSTnK/oE7wsyY0MVzXiU+GFbTuXxnxr5327HI/mzLl/6aaN5z
 sUtFLwFgm1PrFz/ya0SfPe4SugAe0gSCJHaXTJkyrsxDcxTpgLf9BP+dgL3fdVodpRGEjZr7T1u
 1KHN07cu1Gj4G2A/2xSRLQinBnJw1ymhO6VGuy1U42iwwiRqmA0Cuasp/EDkr4LG3NgHzjqDx+l
 D8oA/dgM4tSLJRdcRyty5N4l0egSAEajCQXA==
X-Gm-Gg: AYBFou35FSzXRV+PLBFNTxe2kV/BwpErl6dfOc5L0yKn16p0v3Y2t6owvSCtm0nE+gB
 LVPCaBsMtzXSHMP+pd5aUwL22j8SpU48QGJ/1NNxvSeq9fFAiExoZV4+RTvvKTa7zBrMaOzwKks
 KiTe2v47BgMrvvK9LUQMitfx4gZoCXkFDpgPgutNn/U8drVRNM/CPMqt9YH9OxLkz0Dr/TEJUZy
 GGhv2nSMp5dBkRG
X-Received: by 2002:a05:690e:134b:b0:66e:5def:7fb with SMTP id
 956f58d0204a3-66f873db286mr2861690d50.9.1788282122161; 
 Tue, 01 Sep 2026 10:02:02 -0700 (PDT)
X-Received: by 2002:a05:690e:134b:b0:66e:5def:7fb with SMTP id
 956f58d0204a3-66f873db286mr2861611d50.9.1788282121503; Tue, 01 Sep 2026
 10:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260831201945.287730-1-jsnow@redhat.com>
 <871pbd9qpy.fsf@pond.sub.org>
In-Reply-To: <871pbd9qpy.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 1 Sep 2026 13:01:49 -0400
X-Gm-Features: AcwNN1WwY9KhOHhEffsoAqUdDjHzsfzGhf3WCZkKFn57tI6T-m4ZzTC2sD0ecwY
Message-ID: <CAFn=p-YBpsxy-3tr0SZ0CBfXUYnb6eg6AxNWpwUQmsuY5ZuykA@mail.gmail.com>
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
X-Mimecast-MFC-PROC-ID: 1dOZh9Tn-ZiRCMyeD4GSwRfi2INeQYNO-pUVvmp_1pE_1788282127
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

On Tue, Sep 1, 2026 at 7:05=E2=80=AFAM Markus Armbruster <armbru@redhat.com=
> wrote:
>
> Series
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>

Thank you for your suffering :)

So, I think there's actually no real problem in checking in a partial
conversion as the infrastructure was coded specifically to allow it,
however you're the maintainer so I will follow your lead. I'm more
interested in moving forward than telling you how to do your job ;)

The series will eventually enforce strict ordering, so there is no
chance we will miss anything. If we send a PR now, we also don't have
to keep rebasing the partial series against master. If you don't want
to submit a PR, please create a branch I can track and submit patches
against, and please periodically rebase it against origin/master.

Thanks,
--js


