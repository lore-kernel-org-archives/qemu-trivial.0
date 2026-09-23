Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49031C98302
	for <qemu-trivial@archiver.kernel.org>; Wed, 23 Sep 2026 17:21:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1x9Qdy-0000yX-0f; Wed, 23 Sep 2026 13:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x9QdU-0000Vw-H8
 for qemu-trivial@nongnu.org; Wed, 23 Sep 2026 13:20:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1x9QdT-0002Sn-53
 for qemu-trivial@nongnu.org; Wed, 23 Sep 2026 13:20:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790183997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DqCoiyetJCiNXCm1ENnKql5Uq9D63xlELsxdyd41qe8=;
 b=LfGowUvSiXjM5CtlxNfE6h3yboo3i2BrbZUisiEL1XD/Shxr+A+pO14WfmRp5aujTXkbOq
 SR+otyT2tkz3KtlTpSt2l670oSvBvxnnvWmpLWNgZa2+DrHW5gzhdw8X9q6FihqWTbO4WU
 WoA+X3kwnKCzVOxrosdhcphXZHXPliM=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-wv1bv9LBMiqehb-n2ah-3A-1; Wed, 23 Sep 2026 13:19:56 -0400
X-MC-Unique: wv1bv9LBMiqehb-n2ah-3A-1
X-Mimecast-MFC-AGG-ID: wv1bv9LBMiqehb-n2ah-3A_1790183996
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-88e06764219so24873917b3.1
 for <qemu-trivial@nongnu.org>; Wed, 23 Sep 2026 10:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183996; x=1790788796;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DqCoiyetJCiNXCm1ENnKql5Uq9D63xlELsxdyd41qe8=;
 b=d/B4gXePiUYUX5paa09jFU1daXmvUug8rX2xU/GVuW8p7yIupTNWScK2WXywcful7P
 o+TFhOypFCGwAARO8IBl6Zcb4pAu4edEcj6TY4D1aOHjTdMNdJ7fn8JOwPT0MFpM710y
 6xpzLFZT2lPDbBByMLe0vEhqd4k9sg0yO/tILi4tvMGaDcnWRb6dt5SuN6Qc8uNMoaaM
 T8u8om1jZf1yWTaV0bZIpvV/yShampZrknz3WRd44yd0gKI2wHDuWB2K8udaiEetOF7U
 kelT1R3wMp+NCKqlClOQye1a6Dv2HzS/UpR+2HrCVVTbbBrm1JOF40r/hNqtvX1Mbbok
 2ALA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwScXxXFase/UiAGNCdurXRQ42LMN6VUOKaws5TlHhe/saepPUXjeZjg/IVQJT0uqlmUkyxjHqqPIUozjo=@nongnu.org
X-Gm-Message-State: AFuF++kNZAwdV7NvUQC3+a5C4MpMkglR0GxiODurWYjHZiBDZE5H/G/S
 Fho/OYWsskshc3k83/qtDkQ8oVJO1k/YUvNfqd2+0lgIsfKsosBMGJDtLN54zilZI5nlZInrjXi
 Q18OedhwZ5LVyIROAdJRXOjtTq8d5SrwPvYKVIowPQ5UC+pBiT4pOUWgo1qo9Jk2QopPEqzl7P2
 stuQqsOwx4fKW1sHjhUKSvRAchiOPC1dg4Uw==
X-Gm-Gg: AYBFou3SWvlqWxm+vyEakDfUiQ4zxUgdHmQcpBAzfWIP9F+tWeuuT1EiG7H21kQNSaS
 YcaH6OdJ06V1K414FK6eKJMNyjdKDl+0LXITUKa9L4KpQPv0yU7esBYTjlJwg+sueWK4HdQp2eZ
 3jF8EnsktgIV4h3E0H+fbXpSJVjdfqP54CIPETdstHi8Rf3fXD3DlsokflYUQfx1MW0fkC4s0yR
 KtBc/1JtgvGfvyF
X-Received: by 2002:a05:690e:4553:10b0:672:99e1:11e0 with SMTP id
 956f58d0204a3-672d591dbaemr1140885d50.125.1790183996030; 
 Wed, 23 Sep 2026 10:19:56 -0700 (PDT)
X-Received: by 2002:a05:690e:4553:10b0:672:99e1:11e0 with SMTP id
 956f58d0204a3-672d591dbaemr1140866d50.125.1790183995662; Wed, 23 Sep 2026
 10:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260922205605.501602-1-jsnow@redhat.com>
 <8733v0zcsm.fsf@pond.sub.org> <87jyocxy0p.fsf@pond.sub.org>
In-Reply-To: <87jyocxy0p.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Wed, 23 Sep 2026 13:19:44 -0400
X-Gm-Features: AclHuK_ze6zfAffM4QDcVLsXj-18mpNU7S_ok6e6QdEQjIS1oEE6AWyizU-z2qE
Message-ID: <CAFn=p-bjeCtgY0Jr47P0czwKBeB6xv6YCR_S8PU65wH59hdrtg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] qapi: convert intros for qga, firmware, etc
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
X-Mimecast-MFC-PROC-ID: 5VEhqQqmmNqeFd-KHAlrYMG2LpwYsi6EIzB-8Ju02vE_1790183996
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

On Wed, Sep 23, 2026 at 2:49=E2=80=AFAM Markus Armbruster <armbru@redhat.co=
m> wrote:
>
> Markus Armbruster <armbru@redhat.com> writes:
>
> > Series
> > Reviewed-by: Markus Armbruster <armbru@redhat.com>
>
> With the update to tests/qapi-schema/doc-good.txt squashed into PATCH 2,
> of course.  I'll also make the commit message tweak for PATCH 5 if you
> like it.

Yes, please!


