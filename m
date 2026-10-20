Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312C4606A31F
	for <qemu-trivial@archiver.kernel.org>; Tue, 20 Oct 2026 15:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MF8XDVFf
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1xJC4k-0001Wv-JR; Tue, 20 Oct 2026 11:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <filip.hejsek@gmail.com>)
 id 1xJC4i-0001Vu-FX
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2026 11:48:29 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <filip.hejsek@gmail.com>)
 id 1xJC4f-0008LO-2A
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2026 11:48:28 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a018792ab3so26391775e9.0
 for <qemu-trivial@nongnu.org>; Tue, 20 Oct 2026 08:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792511301; x=1793116101; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id
 :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=3guLV4Of/zrYlWr8Uw84u1DpXlzhNs80hbZWEYjYFvI=;
 b=MF8XDVFf7Oe5z8/djtYEElvuVMH2t60e8SttXbcKdq8ZYsDcYYL7wSkH2w9dwo9Bgn
 W5vkLhzSTnfavxuhc7mdZlnr6fP2pPv0rz9Aef7/pWkc2fUIHB/+RwQ/cHAby/pCQddD
 QDEOLpd/m428mZpuQORLaHBpcKNhMOHnneRf9T2PoVOW8t20GFYG3g3ChVHPXMtJ4H0A
 gs9IxEGrhehecxd/4Lb/+W60b0waqsOaJPTZGim5SyqiSE8iqrv6hrxXt3bNVWXj0KRH
 c40RMJknRp0d1ayLqbdlEisbM+6ch/lVAHoCi5nILjYuNv+c+r82IcOx4aCPYQgYXFt5
 N6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792511301; x=1793116101;
 h=content-transfer-encoding:content-type:mime-version:message-id
 :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3guLV4Of/zrYlWr8Uw84u1DpXlzhNs80hbZWEYjYFvI=;
 b=a+Y7aSIGdhf+veMRQKcEnDm9xn4EYYaswjM8xbKE2r96b6fMBovN4HhqrQYbI0qb8k
 gV7Ml/qNk8cQYnOFC/yKmseEAvWRdmV12u7gyt+7cM2l2aW3+EDpoX+NC9V3k/K+su7O
 U7CEZStqLSrKVbjo/CVHi/CxGgZrVT4NRH0nD5HMdDAixKsk5d+flbFVakChLYGFt24L
 DUnje9x6u3qNBWSpuwMoWqAPlL3JYIZu0PsiUWGPtUKv+pCMp7FpaLSXsURQ9ubPUi7W
 ceJIDa7wUqhXukI40m/wA0koA+evN3OHDlWwOvLdXJ4Z57iYMvFGTM/yuw2pnMkMNwRG
 cX4g==
X-Forwarded-Encrypted: i=1;
 AKwUvBze5dWlmdU4aawAv09zJVkt7vNoNPDTRbvpdPzASLigkvP7lZwb6/eC+7OIxzdp//KOTtLrNdN0refdj8o=@nongnu.org
X-Gm-Message-State: AFq9FYK0awDuDBSzsR2D90ztdjZXJsc1CVm4Rim7HdLVb6cY0dn2FPc1
 9vzDy4V7dAqUx6VvxBkT7czbS93yshiTH3SGM4gMrmBjrlM1G3rH76s/
X-Gm-Gg: AYBFou1kOQwR7uRgEBi+NmzU2ZtEyN/jzcK05H+AzzhJIWnKWYxCsZsqpIgil0uLEUL
 Csfv33JGcVrEACmA6vkWH3IN7darXJE4iuG7Vn7aIZw8sVoBDaWv9PVULfYxuVrEARrYB054muC
 7px0LL0rkK3VGx5l4M9SzjpI0BlKV0OEXUyaA9ztdeizYPdD00U/IRy6wzJ1I3t02++GPc+2xH2
 WReNPSP3ShjFzVtDvvlWiARzLrFtshC6ebdrxccQtgH2v4dE15wlaXOsop51g3TLrNZHPHJ565X
 osAixIcks/MSf7zxZrdL1DxhBgl2CdJ6WUW2ewiejc616uFmF5epvzC9Y40K98HRZz5eEVhj+0N
 oDSDLqrX4nZ5JpzAWcS0wc3ovLEl2WqdwVSIC/frVpmoy/+J9r1D34ba9mDtG2PYdXPsfHaoy+y
 pGdkpqVyqHDARFA5TuYvjw6FgCuFErKMRTgfhg4V+RQAm87F3BxkWKw3DenQ0PybOy7p06G1U7c
 YmJyaWKKj1Q
X-Received: by 2002:a05:600c:3ba7:b0:4a1:e6cb:25bb with SMTP id
 5b1f17b1804b1-4a1e6cb2ad6mr177079855e9.2.1792511300724; 
 Tue, 20 Oct 2026 08:48:20 -0700 (PDT)
Received: from ehlo.thunderbird.net ([109.183.17.110])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e1d6dd2a2sm7488640f8f.7.2026.10.20.08.48.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2026 08:48:20 -0700 (PDT)
Date: Tue, 20 Oct 2026 17:48:18 +0200
From: Filip Hejsek <filip.hejsek@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
CC: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_not-so-trivial_v2=5D_treew?=
 =?US-ASCII?Q?ide=3A_use_qemu=5Fdup=28=29_instead_of_dup=28=29?=
User-Agent: Thunderbird for Android
In-Reply-To: <d70fcc30-a9f7-4615-95de-610be38f9274@tls.msk.ru>
References: <20261013-use-qemu-dup-v2-1-12ecd94263b7@gmail.com>
 <as3lliIKDs6aTRnS@redhat.com>
 <d70fcc30-a9f7-4615-95de-610be38f9274@tls.msk.ru>
Message-ID: <06E420BE-B0DC-4EB4-92B5-9669C7B6F777@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=filip.hejsek@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On October 20, 2026 5:38:06 PM GMT+02:00, Michael Tokarev <mjt@tls=2Emsk=2E=
ru> wrote:
> On 10/13/26 11:02, Daniel P=2E Berrang=C3=A9 wrote:
> > On Tue, Oct 13, 2026 at 12:01:58AM +0200, Filip Hejsek wrote:
> >> Use qemu_dup() to ensure the cloexec flag is set on dup'd fds=2E
> >>=20
> >> The following dup() instances were left unchanged:
> >>=20
> >>      FILE                     REASON
> >>      util/osdep=2Ec             implementation of qemu_dup
> >>      migration/cpr-exec=2Ec     fd is intentionally kept across exec
> >=20
> > IMHO that should use qemu_dup() too, and then explicitly
> > clear the O_CLOEXEC flag so intended behaviour is clear=2E
> > Right now it looks like a mistaken failure to use qemu_dup=2E
> >=20
> >>      tests/*                  left for future work
> >=20
> > Why not fix them now ? There are only a few uses which look suitable
> > to change=2E
>=20
> I'd say let's apply this one and fix the rest later=2E
>=20
> I don't see a big need to do that in tests/ - if not only for
> consistency=2E
>=20
> Thanks,
>=20
> /mjt

I already sent a v3 which fixes the tests too=2E

After changing my mind on whether this counts as trivial, I dropped qemu-t=
rivial from Cc in v3 and forgot to send a note about that to qemu-trivial=
=2E That was my mistake, sorry if you didn't notice my v3 because of that=
=2E

Best regards,
Filip

