Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE294C98302
	for <qemu-trivial@archiver.kernel.org>; Wed, 23 Sep 2026 17:18:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1x9QcN-0006ds-1V; Wed, 23 Sep 2026 13:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x9QcK-0006Eo-CQ
 for qemu-trivial@nongnu.org; Wed, 23 Sep 2026 13:18:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x9QcI-0002DK-KT
 for qemu-trivial@nongnu.org; Wed, 23 Sep 2026 13:18:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790183925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BQTYGQ8XMx/wG661iZtKKtWEJuVr1FPtmdfh9ejEAJw=;
 b=X9ojJh8X5Q/4t0+V6USKXRxxf78hzpaBv+gR1i78F0fvBUSNKq8OwkISBpQg1CBwfm4nkk
 9EIJbojowAJME9pQnzBOU1y3vE1BPShevsXjXqqNqFZiiPDS6bVrjudFZZRAr9BY8zk7QX
 /D4CmJnfJx4D6Ki6xUzJ7FO5ZDYFb24=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-XKxgp4YkPrqigRL9z6VVXA-1; Wed, 23 Sep 2026 13:18:44 -0400
X-MC-Unique: XKxgp4YkPrqigRL9z6VVXA-1
X-Mimecast-MFC-AGG-ID: XKxgp4YkPrqigRL9z6VVXA_1790183924
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-879b1d03d5fso25059137b3.0
 for <qemu-trivial@nongnu.org>; Wed, 23 Sep 2026 10:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183924; x=1790788724;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=BQTYGQ8XMx/wG661iZtKKtWEJuVr1FPtmdfh9ejEAJw=;
 b=ng8Axe9z5ZkKtOHzXN4Ez37fLXvbeIFrEtXDtkPUapjpi93dRzRk40KdkMDtF7tH8n
 TttBdk5hAb8weUV5j7B1pRXi1NlShOGGPvlxjp9K4wv+dI7J9m3DY2SzHzMW0RbyVdYu
 L+LOJ38JKa5mXuUcya5s+S3L1L749eGml6jSEHbBYaVilrVOrIPAKW9Y8rATWbUWY5rs
 GPJB1rG3m2HZLaWVc0SydX0Xnk6YZ5uD/RFf0cohu1wDkA+LcOPCs7lwnYtXthRlMDFU
 zGSCdpqsm6cFc+NjW3BJRetknVr1rrKkwAla9/F0cq2Jlcudd4HkyObRToLc2/JphsiX
 /fnA==
X-Forwarded-Encrypted: i=1;
 AKwUvByJpGximf89kwV5qQKvoc4zFHqSKXNlLFbwBn0ZiBfoaHcCEnBLtzZ8EoMW71Y9kbywvv7HBOH3Bc0jBUU=@nongnu.org
X-Gm-Message-State: AFuF++lGc+gkw2NsRKPPKTjXaWhEyMA6IOMj4tHddbtbnv+Zij0z5VCm
 xt6C8xkeq9YzM31e1KCSMzmHCi2au2Puo9oLkJTLnTfQvMi0MhE5a1o4b2GmUOUBVq7ywajZxKE
 xTrmfQaCKSIyUGzp0lgOw3eVF3IPAWWHDFtP8ScvzFXtAuwmV0h2/7OLhbXs4Fy+CCWUHzB7xJf
 OjBo8n37tPB88ys5GF6xVj0OhdNb4Aw7EoBA==
X-Gm-Gg: AYBFou098/sucvHRHVZu3pRUP/orZPJZhqa+Tr+0qlZw+Av6ZlKF4OuAgycDsSQupnF
 u7f9trqem35AN08leMd8XOrOgoMpy2MHS6pH2qo4mH4HiGHXj41cL1su78mUfDc9+fbxNb8k45o
 qiMPj5HLMd1Zo+Yf/0DvD4bP8K67jJanxuQcsECpaQTJnlGt92+q9EqNQiS09i+24uQwpcLfT5e
 mwrredPczf2VQNW
X-Received: by 2002:a05:690e:80a:10b0:668:e1:6292 with SMTP id
 956f58d0204a3-672d57406acmr1041940d50.28.1790183924155; 
 Wed, 23 Sep 2026 10:18:44 -0700 (PDT)
X-Received: by 2002:a05:690e:80a:10b0:668:e1:6292 with SMTP id
 956f58d0204a3-672d57406acmr1041914d50.28.1790183923677; Wed, 23 Sep 2026
 10:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260922205605.501602-1-jsnow@redhat.com>
 <20260922205605.501602-6-jsnow@redhat.com>
 <87h5jgzdp7.fsf@pond.sub.org>
In-Reply-To: <87h5jgzdp7.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Wed, 23 Sep 2026 13:18:32 -0400
X-Gm-Features: AcwNN1UXK4JYOPTaV-NlMRX3eEOaqZ8WzpzO5cMKi-VAHFPoc6W6iyB7ZwsTNl4
Message-ID: <CAFn=p-a9jon7HuAj819CqmVBS+M5dznpCKMDeo8pS8cW_KbCWA@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] qapi: split intros at natural cutoff points for
 qga/qapi-schema.json
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, 
 Kostiantyn Kostiuk <kkostiuk@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Michael Roth <michael.roth@amd.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Jason Wang <jasowangio@gmail.com>, qemu-trivial@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Stefano Garzarella <sgarzare@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 qemu-block@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9TGp8jT-c3WJHCe-rtIiP2V8HPX3FPJ97h2d6RKlvm4_1790183924
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

On Wed, Sep 23, 2026 at 2:25=E2=80=AFAM Markus Armbruster <armbru@redhat.co=
m> wrote:
>
> John Snow <jsnow@redhat.com> writes:
>
> > Note that these intro conversions introduce a new intro/details split
> > point. This new split point may or may not change the rendered output
> > depending on if any documentation is auto-generated and inserted for
> > this definition.
> >
> > This has tangible effects on how @guest-fsfreeze-status documentation
> > is rendered, while the other two appear unchanged.
>
> Doesn't say how it changes, and it's not visible in the patch.  Suggest
>
>   How @guest-fsfreeze-status documentation is rendered improves
>   slightly: "Note:" moves from above "Return" to below.  The other
>   conversions don't change rendered documentation.
>

Thank you, this is good.

> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
>


