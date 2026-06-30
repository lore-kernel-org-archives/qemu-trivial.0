Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F65C43458
	for <qemu-trivial@archiver.kernel.org>; Tue, 30 Jun 2026 11:14:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1weWPA-0000Dx-3u; Tue, 30 Jun 2026 07:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1weWP8-0000Cf-C6
 for qemu-trivial@nongnu.org; Tue, 30 Jun 2026 07:13:26 -0400
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1weWP6-0001tt-Rl
 for qemu-trivial@nongnu.org; Tue, 30 Jun 2026 07:13:26 -0400
Received: by mail-dy1-x132f.google.com with SMTP id
 5a478bee46e88-30edbb0dc5fso2425035eec.0
 for <qemu-trivial@nongnu.org>; Tue, 30 Jun 2026 04:13:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782818003; cv=none;
 d=google.com; s=arc-20260327;
 b=XrUZAhzlUOGQCWvDoke+YF2JBMrzF94yoKTB6HDmjRe/4puWU329YYHNTk8nCvNZsY
 DM8z0fAEXkUdviqT/cS9ine3owmk3bZgE6FJ90eGek4H386Teh+wOd0+eaxjKB+LwecJ
 Mcwq5PPe4HgRqqBWR6C4MMvJq2Z0qVNbzTOK1MIhKn/3D9aXtujkSBe5iKdBdBU5LndN
 mxnmACRDxYa1XFHhMynmeiYkDkt81BLaiQDEMg3jB/cCPuEot9DhgzEuuVihKYnGi1WV
 yNZQa5SKRMzjhuL1B72H7SwIKdO+reaWSuiNMxfkP+w8YhEbMdWYiqggIlNoOZl6fnqN
 S6pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=WRI3qR7U8QFgsfiRa3Q0fJwXioyWf8zhdfv59Awc77Y=;
 fh=IQ4E0PjUhhUsx9iyEhQNuuQvF+bBQYGK6XLM7quk4lw=;
 b=pNln2CV7iemz0hFT0K7TOssz9S4NSkDOZa7hwDkZpeSQt6xj4UDmltUJusAdgQbPDK
 4QuaAVi+Ch59C2dUU6zG2/aMtqp9KGZigkYl3oJcxoQw0zjX0bB+nCuyVsj2V+bY+bbf
 BIVIfLNnZUfd+76B/TnZj14gV7lv2z6ebQOYonqZeph3SxSN3gAXVtA4xIsDz2zaWgPR
 yQ+yD3HxGo3V9RiOZanS/YUX+0g6f/kdXDKt5yn648W1X/ZZR9BST9u/p8ceaVpJT096
 pXKl/RFpx869BYzAp2V3EsNToQpXyNv1BEYnPovra2VpCkUznHTBXAYlfCOu22p8lcYA
 ectQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1782818003; x=1783422803; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WRI3qR7U8QFgsfiRa3Q0fJwXioyWf8zhdfv59Awc77Y=;
 b=G0lu9/+jUdpgsiQi/ItqEGxkgP8+4gcTOc/d52Uqq+o9QpCes6mQCQhMdiCsBZF3lT
 Ahu8L/IvSuTEWzoIsEV5byU18NH7JTluPeOoD2U4PPHFJNR9dVxsLBbEU/aJHDoc288S
 4Ed63keluz/jegpvy6+o8jjgMh6xfu+t/9T5Q7nqacbdyIxnxKcem+qaur8HZ5iqHVum
 KDtARZTMxKqVJSHWjK8Y9t7z55iat2uo0ZNAjJdn0o7R2ls29HceVpoKFFECMeFVIAnC
 h+Xtg/nHZOPZrRqDCVhHd88SPkpRqaAtZmzzBy0e64T7ayCPVTTTaG88Ayw0NS5EAc11
 AQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782818003; x=1783422803;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WRI3qR7U8QFgsfiRa3Q0fJwXioyWf8zhdfv59Awc77Y=;
 b=Lbkwmr0VmQ9d+D9y1OTIHSdMzbvh5EpJdASX8/X8M69xBmjiMHnKfmfGCjdn4trmUa
 L7Zl3jH4Sv+dMR0ELroVTrdFrKWkbbuF1sdTzREAQDy0Le8kblry1sJL25mMGE2b1ZLs
 AVYX6g129Ps+JDX1w3ZBojz7PS3XSVKRS6SXI+wATVS9mBYYi+BnTJJFqZHHfAmuzUTC
 fkU9SGGYEI97989c10/ggZxxMh1H/SozEhuF0ZdLRQkCUOM4x9oc7jAOGlCNJrCR71iX
 41GGGn5O1iMRMDa1NbVtPFyEs5IVCp/SmHeSqm/FisyLQgqGQ0fzugzXK9ZU2KhyLxEM
 MtOg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqQvfhFz7TvmaXIa7XK/7r63wu5Quh4BbjTOWDJnqgkbjCJQnnCk+6ysmLKDaWHAeKMfb7IILJn36VEeHg=@nongnu.org
X-Gm-Message-State: AOJu0YwqPsKvwS/Pv01uPgz4iTAabcZWaWZfezRy2YkiD1yo10rJd3WF
 wpNQFZM7eCsBYpJm1erbjY/EtXiG+YshLMY/OH2hSAePqPvNgW0H27MVnsdAnoPeBGmGO+ngLxw
 1KpOJedpebHOLURAQSsJZruket0BP8lA=
X-Gm-Gg: AfdE7ckeyQq0HyxzL6R6dCitwJGhJWutYGRcTSMKADkDI/kypLalpD5ztXMi4cGGEJZ
 coeXw2sj0xtJfrdCA9fz0YqcVKi7NjX3042f+2NUwbimrY7optNUpNo/B7yG6UiZ8Bgg5QbOVC7
 J2h5oRnvdw+KKcguHrAjImJlMdUJnNS7Gcur2/xhMd4tznBZDdJDCRnFPbS3b72AES8V9S8nUYM
 OoDpL23Ld09u+tHzU2Ueh4VhA1nyKN5vQkm2UfvjikhDfBk/3MWeCbkunVGTL/FdybJWrd91FAb
 NjfKZyl/jH56Wkn8MTgd8yRg62IztbOPIYvp/zw=
X-Received: by 2002:a05:7301:578a:b0:30b:ed93:5cda with SMTP id
 5a478bee46e88-30ee12c5ccbmr2115638eec.9.1782818003094; Tue, 30 Jun 2026
 04:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+F1C+cS7c=Mc2GAn-WQ-XmCPU-hQM4JuDFsEkS87q0yTdrNg@mail.gmail.com>
 <20260630110601.736019-1-frolov@swemel.ru>
In-Reply-To: <20260630110601.736019-1-frolov@swemel.ru>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 30 Jun 2026 15:13:10 +0400
X-Gm-Features: AVVi8CdDtcNkwBKejsRP95wBxMg4i2FjBvbCRbZhgJayD4rOPhX58lnBBXOu9VI
Message-ID: <CAJ+F1CKNMjregp+gS1+whvj6tt2-HY7UkN1UoRvsk+CRV670fw@mail.gmail.com>
Subject: Re: [PATCH v2] utils/module: fix memleak in module_load()
To: Dmitry Frolov <frolov@swemel.ru>
Cc: sdl.qemu@linuxtesting.org, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::132f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-dy1-x132f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Tue, Jun 30, 2026 at 3:07=E2=80=AFPM Dmitry Frolov <frolov@swemel.ru> wr=
ote:
>
> Memory for version_dir, allocated by g_strdup, is not freed
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> v1: fix with g_free()
> v2: fix with g_autofree
>
> Signed-off-by: Dmitry Frolov <frolov@swemel.ru>

either way
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  util/module.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/util/module.c b/util/module.c
> index 09dc43f51e..8f8e6994f1 100644
> --- a/util/module.c
> +++ b/util/module.c
> @@ -203,7 +203,7 @@ int module_load(const char *prefix, const char *name,=
 Error **errp)
>  {
>      int rv =3D -1;
>  #ifdef CONFIG_MODULE_UPGRADES
> -    char *version_dir;
> +    g_autofree char *version_dir =3D NULL;
>  #endif
>      const char *search_dir;
>      char *dirs[5];
> --
> 2.34.1
>
>

