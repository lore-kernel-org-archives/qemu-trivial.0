Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FDC606A31A
	for <qemu-trivial@archiver.kernel.org>; Thu, 29 Oct 2026 07:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KxtBsL5c
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1xMKZd-0006te-9s; Thu, 29 Oct 2026 03:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1xMKZJ-0006sN-8a
 for qemu-trivial@nongnu.org; Thu, 29 Oct 2026 03:29:04 -0400
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1xMKZH-0000xw-E7
 for qemu-trivial@nongnu.org; Thu, 29 Oct 2026 03:29:01 -0400
Received: by mail-dy1-x1332.google.com with SMTP id
 5a478bee46e88-36a1947498bso1079809eec.1
 for <qemu-trivial@nongnu.org>; Thu, 29 Oct 2026 00:28:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793258934; cv=none;
 d=google.com; s=arc-20260327;
 b=gbK+jHQ+UcDcJLgj4TZC9t06QSpsQrQNAwVJ9LtmEdGNKFTxkt/Wy8oySUwxKPQePw
 OPcR2y25Lcr22jdY7H+9EQqMDzbuXv3r+NncxuB+owzfvrEKdzalkBVR10LD/qbsBz+l
 QNlscCz54HdJMQZnQ4n0q1KOcDuZNi5PTp5/xzCdsL31XtjIjYRSxKfb/uthsgnQ21WK
 LLsi91/Xb2cJzzSnxN4OWRFna4ZBbKPw3RacNMy5QQVoDpa6sn43y1xn52NpZ/NxVaar
 LcODHZ0k2rfgsgIHpcyYW0kHrkg8piUWUyNhKdXg7vhxEUDfA+Mq0ebUAgqAZyL+bNNr
 3SJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=eo8hPxsvdDg879uDKM8KiBgf7tWS1lmd7toGk8Rmhxg=;
 fh=R+Qy8AB71OGMM8WcotsgGkf01ntTaZuI34EvuGRTzMQ=;
 b=fxURzXjnXNTZXnSWkzTs/O5IkbqRsQPXbZ7IG3dz9v2fxYFc/8YmnI2xy+8PLY78Xj
 CNvuYqsAWB9sK+lym2yayTckI92buMFnnhuxkZGSUXmFmFuA7tqw/60nkM4JVzj8679j
 vo0MCpjpPIR5dS+9jhkLxmpieZ+asanZmmtYsGqATrQuBrAnqBpwV7cNsg09Es1Mp3ni
 upCuHTymLgmroAd8NJNf9STDOgzxYcOG7Gu0SkYPJEjGr3ZqZEfDP63Ot+c/+M2L9eLW
 OD9t95nM7QqIc4hFsCsWHgm5AzuTyCuX6LgzRo5SrpTW/W3pEUrQacwtOfxsFHzhzUVY
 JKYQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793258934; x=1793863734; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=eo8hPxsvdDg879uDKM8KiBgf7tWS1lmd7toGk8Rmhxg=;
 b=KxtBsL5c+61mQa3Mj+1eFQWpvOVifubNjHIhC5m9K9KqiUypZsSgqymQ1T5ZG2jYIT
 KMN08+fDkN4n70Xs1RrKMZzUW7wIRCxSm8hV/xBzShMeWgRipXf817147WSh2ea/Ju4Q
 JdbysR2yngniCol0Yy3x8thnRAMLxrCfG8T1cwXAFE86pdNxwpJJjzrllynMRV4Mys+O
 r91mZ6z2f/ujr5G3lidl0ARQLBeNjTWV9amBLn9wtVYJqIjzU8yOCAzS4vYmdcIY4gcr
 OD4ZowM1kPaM34ox6nmL0fdx+wdmV38fSN3dpexCa6sq1Ehf8/gj45GA+1MEZEpPYgHi
 C2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793258934; x=1793863734;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=eo8hPxsvdDg879uDKM8KiBgf7tWS1lmd7toGk8Rmhxg=;
 b=EOUZJGR3KkQJnV7THCSIKrzS8/b2KmWCMRujfT6CdkUgkOuk6+C/iG2xNgPHlX/pr1
 TqkVPnK9yHgVqcbPebvfbQT3ZF9vDCiFC38lRRkyJnXIq9wE75ZCMLDykgoBViBnqWIM
 A7yOjAzjleO5bBwCWvN5QWbt1Bnaztd/IgVLfCaTf14OSqaFwyrt7OSXWMZxmgwpc1dw
 /aE+84vxDz9TMtQo3IFIS8XmeMSNSNhtLfKKbubfyXzyVQSsQPSanTby28XTdsOYVOr3
 /35n008ABhY236AtAiRUyWwOqIboHLgMBOmdyw1sthXEGFjZJtEMfv+EceSWUkpYqkc+
 WToQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwh9DYUD3SW4vWaSK6lBWW9zfq29AUUcOe5NXseHHtzgpJ3CaorMOS21rg0UEJH5MRlgWV3CI5+G7o0HLU=@nongnu.org
X-Gm-Message-State: AFq9FYK2yJVD+LGn3aaPi5Fj7JdzlL+VvMpDxljwaqVRgFdHuQ2HZzzY
 KxD4qjopzGUTI0SawGRZ5uplUdDL/vHrJVX6fxuZnCfWU8ZmtWpi6SAVghyW7H03dfd8P10wp1M
 +Q3dAJQaG/FxJiTE0lXUtb8PnvS98ddY=
X-Gm-Gg: AYBFou2kbXRHP6ZO/8UPD23cEc63gQzTrvcXrAiPwSEaAAQsxpXt4y22ttwsZpc73OU
 X+YQ5fqjSuFgnwoR4U7n4i9eurXXTvYOo72BVbFrBzrPvCCSpgR+/d64fGHQ8buPKJGcP1PNexV
 JESy9o4WvGT59jT/YJGbuULqBiR1ARgbnkHkLo1awEnubCtTjUsUIK5PEkZ8KW7XFyfEKcwJlr/
 dsyb70UQRUPxEv1Osx1EXmNPpqHm14Rcf4/nTUWjuq6l4XTaXbdFs4VeYbfka5rCdyuZAH9dXa3
 LRdWO4s/ccjiXcrlhvQ/aHyk2OOBsENnbo5ogtU2LTgNuJMMiH+jz3bISw+5fGhSjBq6Miu754e
 DTwjxoL68oruBhc1KcaTL/IzooLhgWX64HY+xphUTHV6rWI59Sv7tIw/B76Z2lRd4NSKY9hveod
 vnonHp8biOaIAegw==
X-Received: by 2002:a05:693c:87d0:10b0:347:8d01:164f with SMTP id
 5a478bee46e88-36a203ceca6mr7048141eec.19.1793258933779; Thu, 29 Oct 2026
 00:28:53 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029070521.1170540-1-armbru@redhat.com>
In-Reply-To: <20261029070521.1170540-1-armbru@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 29 Oct 2026 11:28:41 +0400
X-Gm-Features: AclHuK_h-10lyPpGwAtMqDkiZynkV4N-e32ZBYNkd4-VlgXxcM0s330SXk2Zy5Q
Message-ID: <CAJ+F1CJgAiEyM1r5R0DMbvzYo-bvRojCM0CPqQsYVEGE1RZF6w@mail.gmail.com>
Subject: Re: [PATCH] hw/audio/intel-hda: Belatedly update comment for removal
 of -soundhw
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, pbonzini@redhat.com, 
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1332;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-dy1-x1332.google.com
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 11:05=E2=80=AFAM Markus Armbruster <armbru@redhat.c=
om> wrote:
>
> Comment is stale since commit 039a68373c4 (introduce -audio as a
> replacement for -soundhw).
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  hw/audio/intel-hda.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
> index 3d361a4976..431deb2211 100644
> --- a/hw/audio/intel-hda.c
> +++ b/hw/audio/intel-hda.c
> @@ -1303,8 +1303,8 @@ static const TypeInfo hda_codec_device_type_info =
=3D {
>  };
>
>  /*
> - * create intel hda controller with codec attached to it,
> - * so '-soundhw hda' works.
> + * Create intel hda controller with codec attached to it,
> + * so '-audio model=3Dhda' works.
>   */
>  static void intel_hda_and_codec_init(const char *audiodev)
>  {
> --
> 2.55.0
>
>


--=20
Marc-Andr=C3=A9 Lureau

