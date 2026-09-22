Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACF1C98302
	for <qemu-trivial@archiver.kernel.org>; Tue, 22 Sep 2026 17:47:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1x94a1-0001yy-JF; Tue, 22 Sep 2026 13:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x94ZV-0001p4-5F
 for qemu-trivial@nongnu.org; Tue, 22 Sep 2026 13:46:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x94ZS-0008Fl-RC
 for qemu-trivial@nongnu.org; Tue, 22 Sep 2026 13:46:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790099180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xB0VdGjmuHuXZmi+LIdPZNLU9gjo6gQ/lH1Fp/WLkM8=;
 b=dw3J9U7Qnabb/4qKK44Uo1nHwQakpQG/9Cu7TskzfYD0/0cIi3FgPaOodkzu3Y7qhD+G/R
 DEy4GXL94bkfPCSY/c/EW9OVwBPEskTHbTNpXwOK+OizOpGekxZHg6bKiSeUASZo6XBBcN
 36e5dVht/eWLQ9XKHHY8uBCJ5BGYRVs=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-CY15mRq9OgObUjniWmNhFQ-1; Tue, 22 Sep 2026 13:46:19 -0400
X-MC-Unique: CY15mRq9OgObUjniWmNhFQ-1
X-Mimecast-MFC-AGG-ID: CY15mRq9OgObUjniWmNhFQ_1790099179
Received: by mail-yx1-f72.google.com with SMTP id
 956f58d0204a3-66e5862a158so44783d50.2
 for <qemu-trivial@nongnu.org>; Tue, 22 Sep 2026 10:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790099178; x=1790703978;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xB0VdGjmuHuXZmi+LIdPZNLU9gjo6gQ/lH1Fp/WLkM8=;
 b=ZU5PtbPlqRA1TGzoAzkEuEbxg+XNHkPuVhGGW39h793uzc68ZCCcx5xf6XvxZXEDVX
 RLKOypN2ydEq0xrMVOAa+z54is4vcVk4Nctd3xL/vz2IV4WaOswj/pCVtXgN3Kpcg1W6
 HjunEUKe18DwTMVw9gb6X7sOhbjihEqR681wmVMQjomoQ3h0ZiG7Y4WE5KhQtpBeMPTP
 0SWwiZ67P7DuJ26rm85CbXGlKRI9w+8Q7t+8RUqKo16hx4ymfDsXCFo8yNCw0RnyWCDm
 oMnBbIOlYQ+3TbqiwGcFXsPvmWRw/yuMeA/9P9lZHRhPLczzzk8M3d5vTJCyevz/6XuS
 cbZQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwR44cPB63FiZUyJbyEWJVKjoDkLq1EWql3JUvfQlFqeK3V/fqSMyDbWnpR7m/F9j0zg8I9T+fubBSuYrk=@nongnu.org
X-Gm-Message-State: AFuF++nfhnmEyVnAQgl8JoBIn1ogbH0rmQsWFz9pF7TKAEefnnWHZBp6
 DK7okaKH1k0p35vIxlDN1Aecxz+rY74rCbt6ceyK+tnEV4o/sgtVt+hQpOTbLJvffOlu62l/YR/
 ZqLSkw0XXEQ4KdPn3s7JYZmuz3uOoDyYqVhPH0mdhE9UvzNJ8gYZgPvl79QYiN+87hW7/yAeaox
 4yE6NglA44g6X2d+N0mxMp9ZQFg6GUsuXuAw==
X-Gm-Gg: AYBFou3qxWhVVtZxd3ineAqcO9VfWeJMVrO1jWzaDp0QAhXIQkpVrXdxuEkqaJEBsXt
 tOFLTAjOCLYfXRs/7/cerKGqE7J9ODH0pXD38K60ijViSx3tVbbv84EZKlVZQSdibyRqtWxQibm
 EaTYd0AYq9QsyNxxH+iQAdLMvjPa/Q/+ydek1nayZSzywWgdbwarSdMAoj3e5QYJ1Olmo5CLIGF
 OaXbZ4duMWVdWqI
X-Received: by 2002:a05:690e:458a:20b0:670:f743:6ec2 with SMTP id
 956f58d0204a3-672d5897536mr98774d50.60.1790099178580; 
 Tue, 22 Sep 2026 10:46:18 -0700 (PDT)
X-Received: by 2002:a05:690e:458a:20b0:670:f743:6ec2 with SMTP id
 956f58d0204a3-672d5897536mr98760d50.60.1790099178154; Tue, 22 Sep 2026
 10:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260921205147.1857168-1-jsnow@redhat.com>
 <20260921205147.1857168-10-jsnow@redhat.com>
 <875wzx2ovl.fsf@pond.sub.org>
In-Reply-To: <875wzx2ovl.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 22 Sep 2026 13:46:05 -0400
X-Gm-Features: AcwNN1X3clkubVPauZPhIEb3CKA1FY04S8lLG-_q_3Twr1zVAF7I0w5qamCIzHo
Message-ID: <CAFn=p-bhYcWQq8qxi-STh4wDwvNigKWYpZ2Ac+apU27s-89c0g@mail.gmail.com>
Subject: Re: [PATCH 9/9] tests/qapi: generate output in source order
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
X-Mimecast-MFC-PROC-ID: 8G559kuEd_c9WCujFuAF0nx2X9sCBxOPIQKto-dcNGo_1790099179
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

On Tue, Sep 22, 2026 at 1:10=E2=80=AFPM Markus Armbruster <armbru@redhat.co=
m> wrote:
>
> John Snow <jsnow@redhat.com> writes:
>
> > Rewrite the test doc generator to produce output in source order,
> > instead of arbitrarily.
>
> Really?  As far as I can tell, the patch changes format, but not order.
>
> Dig, dig, ...  you already switched it to source order in commit
> 9606414d46 (tests/qapi: generate output in source order, 2026-06-11).

Ah, funny! This is probably the leftover bits we didn't agree on at
the time and I didn't notice that this patch became anemic. Well, this
is just a preference patch now and not really strictly necessary. I
like seeing the "section=3D" text because it's a clue for me as I read
the text, but it's not really important, I'll scrap it unless you also
like the formatting change.

>
> > Signed-off-by: John Snow <jsnow@redhat.com>
>


