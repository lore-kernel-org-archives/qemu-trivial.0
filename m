Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E68DC98302
	for <qemu-trivial@archiver.kernel.org>; Tue, 22 Sep 2026 17:48:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1x94ak-0002TU-50; Tue, 22 Sep 2026 13:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x94aT-0002B0-UF
 for qemu-trivial@nongnu.org; Tue, 22 Sep 2026 13:47:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x94aR-0008K1-4x
 for qemu-trivial@nongnu.org; Tue, 22 Sep 2026 13:47:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790099242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Au1S03sZuhKhQA7TY1/gr8SPznpnyCN3Z0wO3TBERwA=;
 b=UqywXuAQlwsCZu2qoAHoTzRsb247KMRXa5WYzVbsqhC7D0y1T6q4yRuOiFr+YIB9cHu9/j
 Qpj25WWgHafF1n44OWEuao/iXDZCJsEXJxUZ75Zv7qSPhAccwYpePXRUn4S9IcS7XY1cdc
 3KhR9I1+ZM4nt6vaZUmFe5eEw9iU06A=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-z8ixvtixMKCXhDQd960HLA-1; Tue, 22 Sep 2026 13:47:21 -0400
X-MC-Unique: z8ixvtixMKCXhDQd960HLA-1
X-Mimecast-MFC-AGG-ID: z8ixvtixMKCXhDQd960HLA_1790099240
Received: by mail-yx1-f72.google.com with SMTP id
 956f58d0204a3-67109c1b071so77112d50.3
 for <qemu-trivial@nongnu.org>; Tue, 22 Sep 2026 10:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790099240; x=1790704040;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Au1S03sZuhKhQA7TY1/gr8SPznpnyCN3Z0wO3TBERwA=;
 b=Ic2sahHTToD5kWu7JBO8BLotoa1Zpm10v0wOzCzRyWIyIbeQWfobzUsjj2g7GveXGH
 DSA1v5+v2y4B/hwOWWOM/oN7DeefdCTCtQdnXBXcjv5bBnHIETA6/3+ZTbcOIq9/2UFs
 08kvdULFEgArNkeQR6xu2ExPrHgvF8Qv21+K2eyS9p7yY14HqGbRqDSApqgZ1EdfnXFm
 B8ZosnyXc5cMv4s3xzeefWbNpksrNryTEkneDux/Uunnh0kmaWnzaFUGbPRb6Hm/3Q7I
 JxCJrsahj5BA4CPkdqxv95yVHx1zUtYzRmToeGUkZ8qiAoFoAuhhSLlKcZvLff0yLwuZ
 n/Pw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzD+S8prYJjt2QIO5nz1pi2WFUsw21E64P7JyuS5kS7d6frvgC8FOjmghO0mfzXQMBYZ18f4ZatkqeIli8=@nongnu.org
X-Gm-Message-State: AFuF++mrivziDd57Upudh/vrdxG0ETLGI46Vd1loIO1lLZ3hFLbG24FL
 NCTV7Ru2/pjVAcupENiQ2X0ot5c8Bidl0VHpmOfAEURbWJe5UBmE0bUasg9ZTzHM1Y7aQRBeAaz
 xjbHnjsKFhcJg3hw/Qg04gzYEF9xYVeQVDwFlg8uyVUTvDFsVf37LrzwIkI4vk4ZfJtinSEEStz
 d9+nV9EFVv2Qo2gV5ZFPUy1Ij1OTwJkPYjrQ==
X-Gm-Gg: AYBFou3OtxD93/KqQG4sRD9fXZoASG+2orC0hG7dbxcDtfxWn9+113xXNAUKWMjRHsu
 1fc1XIHqVO/Tqpg8XTXEPxH9dl56Ltii1WyNxu4Z9UF4DhO8ZfYUfqubhHS7h13ztTiwtV4d2gX
 8LF/WGYHYUmH9YSX8flyskSe+m26IayuBpwWwcIigsst/X73Eyaqj98Fx/ZRgSnV5UssOebpSTA
 VkX5XwGJDiGr0I4
X-Received: by 2002:a05:690e:454f:20b0:671:203c:2fce with SMTP id
 956f58d0204a3-672d5751276mr146676d50.17.1790099240431; 
 Tue, 22 Sep 2026 10:47:20 -0700 (PDT)
X-Received: by 2002:a05:690e:454f:20b0:671:203c:2fce with SMTP id
 956f58d0204a3-672d5751276mr146649d50.17.1790099240021; Tue, 22 Sep 2026
 10:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260921205147.1857168-1-jsnow@redhat.com>
In-Reply-To: <20260921205147.1857168-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 22 Sep 2026 13:47:06 -0400
X-Gm-Features: AcwNN1VWMem5c6zZaljL-lEPK92qlepT5HJ0RAuuYZABnkXPAvzGq3TYMRYqcPg
Message-ID: <CAFn=p-Z+UCaZKo8RBnmRECSUHU+jnYe-5K9CyLeoNn2-1s=Zjg@mail.gmail.com>
Subject: Re: [PATCH 0/9] qapi: convert intros for qga, firmware, etc
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Kashyap Chamarthy <kchamart@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, 
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 Jason Wang <jasowangio@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Kostiantyn Kostiuk <kkostiuk@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BDNDBt62lEI6fAMSRje6tV1pz7DZP3nExlcA0KtCCcA_1790099240
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

On Mon, Sep 21, 2026 at 4:52=E2=80=AFPM John Snow <jsnow@redhat.com> wrote:
>
> One day I will send patches that do something else.
> Today is not that day.
>
> John Snow (9):
>   qapi: convert remaining simple sections
>   qapi: convert intro sections for unit tests
>   qapi: convert trivial intros for qga/qapi-schema.json
>   qapi: convert simple intros for qga/qapi-schema.json
>   qapi: split intros at natural cutoff points for qga/qapi-schema.json
>   qapi: split intros for qga/qapi-schema.json
>   qapi: convert intro sections for docs/interop/firmware.json
>   qapi: convert intro sections for docs/interop/vhost-user.json
>   tests/qapi: generate output in source order
>
>  docs/interop/firmware.json                    |  76 +++---
>  docs/interop/vhost-user.json                  |  27 +-
>  qapi/block.json                               |   5 +-
>  qapi/machine-s390x.json                       |   3 +-
>  qapi/machine.json                             |   3 +-
>  qapi/net.json                                 |  24 +-
>  qga/qapi-schema.json                          | 249 +++++++-----------
>  tests/qapi-schema/doc-good.json               |  10 +-
>  tests/qapi-schema/doc-good.out                |  95 ++++---
>  tests/qapi-schema/doc-interleaved-section.err |   2 +-
>  .../qapi-schema/doc-interleaved-section.json  |   3 +-
>  tests/qapi-schema/test-qapi.py                |   9 +-
>  12 files changed, 206 insertions(+), 300 deletions(-)
>
> --
> 2.55.0

Markus: assuming I should wait for your reviews on 3, 4, and 8 before
I send a revision.

--js


