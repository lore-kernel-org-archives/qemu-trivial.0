Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7D5606A321
	for <qemu-trivial@archiver.kernel.org>; Thu, 12 Nov 2026 03:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBb7QDD7
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1xRLCY-0000vE-NZ; Wed, 11 Nov 2026 22:10:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <filip.hejsek@gmail.com>)
 id 1xRLCW-0000qf-Ih
 for qemu-trivial@nongnu.org; Wed, 11 Nov 2026 22:10:12 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <filip.hejsek@gmail.com>)
 id 1xRLCU-00075D-Io
 for qemu-trivial@nongnu.org; Wed, 11 Nov 2026 22:10:12 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a35a60499eso29156625e9.0
 for <qemu-trivial@nongnu.org>; Wed, 11 Nov 2026 19:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794453008; x=1795057808; darn=nongnu.org;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=1b3j/8xvpd2OysDp3MfDlvefXaxBDQmHnb5ZTTxmJn8=;
 b=ZBb7QDD722skl5Qgt+Xppvc3fRuFBFIuqkVY93WNltZISmHR0bCoLpODIALPTuYJyh
 6kVS4UXWW+6GJL555xhPPXqjHNBF+MaSU5o5g2wgE4Mj4ZjJjCDKAk4TlDQvLbEKQk9O
 rMSAzdvhvgtndZkjr5vfqVg2DNDiAJB95Z8u3pfX1Wkt6CARUgYTHicJPZGeNcH8vB4O
 Pey57Ld8SjA0IALlJt1yNphOs4OZUz9U2oVAImTc1OtIKGtrlWgc5jNxcjDVBYxjWTQk
 Nx8QetubSnE35cdC3MYJJiFvJPjGap6rlT5LNe/b9+gfqUu4ofWajzxcyIozMeZcM4vz
 cYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794453008; x=1795057808;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=1b3j/8xvpd2OysDp3MfDlvefXaxBDQmHnb5ZTTxmJn8=;
 b=tj92LsSuv4ysBSy6lNDbFG+gYIxIvxQvM0TftDqfnK6hTXxKvgW2WS/fZo+WAlZ0ti
 N5bOf3QxHwSLooLFWLM/2Zpe16ljl4xoRmE6sFpC7tQKtBXCqxJ9e0jg9yvd1HIuOXqy
 vxMfDN92DjMZQMZp3glSbtKaBK9ylptwPaiNZLK2YlLw0fXLdEReBz2KIGXQC23Rc8iw
 yi1bbnfNjOVPz56ZUu24YWhJtXt6KcuCpKUaJpyacQgEIQU6fkexDJ8C3fUbjO1qKt2D
 FYxNIvjuEsBGsRw+/KhLVIQeP4F/TQlohmr44+R+kNuOm2PrWk782qKxeLEb0epX6rG5
 nEaA==
X-Forwarded-Encrypted: i=1;
 AL+hErH9XqQoK2AVXXe5wt3caC1NQDOG2BiScIfRRup/2tmZSqRAkFhvVUQzMJIfTMwZYPm5CLbqcEMdgcm6g2c=@nongnu.org
X-Gm-Message-State: APuU4Z/yYuVK+eSM4yn3DvRAMhnGaT+96BwbwnlrP/fEWpt556VIj0L5
 yZTA2gOfcXYtMozIOFccm4icY3SUYBj5km+B68KI818mrodQxil29jmo
X-Gm-Gg: AYBFou2MLkD59dkQRdibZGQWMP3OXSMORUBWKyKnyNPCWbxiii0GAxY0Go1RlF9QSe2
 feNkxZxdHMlvHY6zzRk4RO8lAaIBtPopIVgsz72kRnIYTz/pBIjXG9APsA0XHl6pTHLRjQhSF0L
 ASkIi2PtC7dlZRcxslONv6k/MfMsxiefCTY+wMi2dWI6RuyrXxxetphY/bgsX9o+REf5BwGWanq
 EcEK1DNCqutKtYLlrMRu45HHVFhVhVI3KbN3ibnNbAHdefkwiTI/LI+2F2ZIPkx+jCefFx8lwDS
 7bw4CcIvd9/3/Cnba+SrEc+lxbC+f7dazGPulsH+T7bCAW2XAuYAnFI62pH7VHSGBDMlMmR+hkP
 al2t+2b9bDDwKz0wK2CIS7we1HuGya9bPYO38AqPzHrUE5rqlH0P5RyJbU96NWv3yhZKGUNQsqA
 pAnzSm8oLnn+tlRdu6VZA3/tFXv/3WzrmliVLqhww4YYYvuhkRPfKrble+Od/jEL+KfC+p51KLc
 0WRr1FOuf8sRcTlFpahm/Y8OEsTTLKhvP+eDsu9IcD6DTTCO1ZxCQn3purO7e5GzbByyXX1RYqU
 u33NAL0x0TYIAhvIwmNCyJwnGQ65isA9bQd1+Gy4LFgdo5so9CkmcPgsSC56Bto=
X-Received: by 2002:a05:600c:4e03:b0:4a2:84c:52f3 with SMTP id
 5b1f17b1804b1-4ba09379bd0mr76924225e9.6.1794453008219; 
 Wed, 11 Nov 2026 19:10:08 -0800 (PST)
Received: from [10.33.80.40] (mem-185.47.220.165.jmnet.cz. [185.47.220.165])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e271378sm39427965e9.13.2026.11.11.19.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 19:10:07 -0800 (PST)
Message-ID: <ad189334ed90d17253f9087a6fb89a9fdd20174a.camel@gmail.com>
Subject: Re: [PATCH TRIVIAL] io: avoid potential double close of
 qio_channel_file's fd
From: Filip Hejsek <filip.hejsek@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Laurent
 Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
Date: Thu, 12 Nov 2026 04:10:07 +0100
In-Reply-To: <5a08b9a9-4a45-4311-98ae-d1cb8c3618c5@tls.msk.ru>
References: <20261012-fix-double-close-v1-1-d37f2224dcb0@gmail.com>
 <5a08b9a9-4a45-4311-98ae-d1cb8c3618c5@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=filip.hejsek@gmail.com; helo=mail-wm1-x330.google.com
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

On Thu, 2026-11-12 at 05:07 +0300, Michael Tokarev wrote:
> On 10/12/26 20:38, Filip Hejsek wrote:
> > Make qio_channel_file_close() set fd to -1 even if qemu_close() returns
> > an error so that qio_channel_file_finalize() doesn't call close again.
> >=20
> > On Linux, close() always closes the fd, even when it returns an error.
> > Because the fd can be reused after it is closed, the close must not
> > be retried.
> >=20
> > Signed-off-by: Filip Hejsek <filip.hejsek@gmail.com>
> > ---
> >   io/channel-file.c | 12 +++++++++---
> >   1 file changed, 9 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/io/channel-file.c b/io/channel-file.c
> > index 5cef75a67c..afc9640518 100644
> > --- a/io/channel-file.c
> > +++ b/io/channel-file.c
> > @@ -255,12 +255,18 @@ static int qio_channel_file_close(QIOChannel *ioc=
,
> >   {
> >       QIOChannelFile *fioc =3D QIO_CHANNEL_FILE(ioc);
> >  =20
> > -    if (qemu_close(fioc->fd) < 0) {
> > +    int ret =3D qemu_close(fioc->fd);
> > +    /*
> > +     * The fd should now have been closed even if we got an error. The=
re are
> > +     * obscure systems where this isn't always the case, but an fd lea=
k on
> > +     * obscure systems is less bad than double close on common systems=
.
> > +     */
>=20
> Hmm.  It looks like linux is the obscure system now, not the other way
> around.  Before, POSIX.1-2008 stated that after EINTR, the state of the
> FD is unspecified.  However, POSIX.1-2024 states that after EINTR, the
> FD should remain open.  And linux isn't going to change the way close(2)
> works there.

The system where close() may keep the fd open is HP-UX, which QEMU
doesn't support. On Linux, macOS, Windows, and FreeBSD/NetBSD/OpenBSD,
the fd is always closed. Of these, at least Linux can close the fd and
return EINTR when the syscall is interrupted, in violation of POSIX.1-
2024.

> And there's no posix_close(fd, flags).  Which is not available on linux
> (yet).
>=20
> And there's also an additional possible errno value here: EINPROGRESS.

Linux doesn't use EINPROGRESS. I think the kernel folks were opposed to
it. Also see <https://sourceware.org/bugzilla/show_bug.cgi?id=3D14627>.

> The other possible failure cases seems to be consistent.
>=20
> So at least, it looks like, the comment needs to be updated.  Yes,
> linux is the main target of qemu, but not only, -- and channel-file is
> used in the tools too (qemu-nbd, qemu-img, etc) - where it is rather
> irrelevant - keep it open or close it again later.
>=20
> Why do we care about this close(2) return value here anyway?
> Have you seen actual failure case?

This was spotted while reading the code, so no failures observed. But
the risk isn't an incorrect return value, it's about finalize()
calling close() a second time. That applies to the tools as well.

So what about changing the comment to this? I can send a v2 if we agree
on wording.

  Set fioc->fd to -1, to prevent qio_channel_file_finalize() from
  closing it again.

  POSIX.1-2024 specifies that the fd is closed even when close()
  returns an error, except when the error is EINTR. The systems that
  QEMU supports however violate the standard and always close the fd,
  even when returning EINTR. If the fd was actually closed, we must not
  try to close it a second time as we could accidentally close someone
  else's fd.

Regards,
Filip Hejsek

