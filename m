Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzMe3-0006L1-VC
	for mharc-qemu-trivial@gnu.org; Thu, 28 Feb 2019 09:26:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gzMe2-0006KF-MH
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 09:26:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gzMe0-0001BC-OL
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 09:26:42 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:45906)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gzMdy-00016S-UD
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 09:26:40 -0500
Received: by mail-oi1-x241.google.com with SMTP id t82so16562453oie.12
	for <qemu-trivial@nongnu.org>; Thu, 28 Feb 2019 06:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TfSEoUhGAXpmAkst00rQjlhrVo+l409dxgqV21L0XOY=;
	b=gc7D4aFFlSixzcc+QQyl7mu8voYKPyfednWw7Dz+4PIRQvW1ZT8z91/icgdKKk/NHo
	hk0OmnEU8YpilM7osiKxNvtnMzHjfVdf10XXk7mx3wR+UazYe+aGIYZJB/baW7w+odgS
	2kwjEG+PyB5oRQEBLfx07jIR3m37P7wEVvxfadz46Rd8I9j0rqW4XL4bFwlNsi9HmBZA
	UjmbprYiWv5D1sCkHKmBMf+DPopaT/Sfor9n5puacQBg9SDw9hBONPDVDL/QCDlm1EZe
	gSmh28AtSRwwONzdfcNWrt3re/8smsHq4DcNzoNRnHGgVPsU+l2kTXbXwCd61D/MY3hA
	aZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TfSEoUhGAXpmAkst00rQjlhrVo+l409dxgqV21L0XOY=;
	b=i/LAX+AqMocKJfrqA+7l9EKbGO+KpE7mThOFF/4CP4pH2DIRzxF6ioKXi7wSChriMn
	CU4x64lC+ycUPACdTwouehxYA9NgLcHqZVF8OZCs+DpGWOxG/UznzEy1ueAh1pu1CI3h
	lxOjOQJCzT2eD7KUd5T6I0prJGDe+SkxjgRIwZl74I6/QfJhzV/O0Vo8FXxlFvyyUhDP
	/MA6VVflS4+iwJZwoQEEHdqYcJQ46jAmZ5vfOCAaQ4n9fGytgr1KVBbqEEiTkbKZyGg7
	8YRA0xBuiq5bdQ7eKNEnW4rarOp2Qxmv9f6I4o9JUbAAEyyaQYRosolbWw6P2KB6zdyZ
	3BuA==
X-Gm-Message-State: AHQUAubysQ7NQ24Zya7Rw4qaChUko8tOaj5MW/3nPXRIC1pVRNSNR0ya
	hKQZ07NdP/gIwb45h5xhci/10TowqR7yWaAfdy2vsg==
X-Google-Smtp-Source: AHgI3IZTvIOLAsyRFAL53As2CvIxA2V1gnAQVtadjOWe3AIDCC9hoefdvx1xnJYGols4g2duK/LLeHxQBSULspxccsU=
X-Received: by 2002:aca:fd91:: with SMTP id b139mr3211147oii.170.1551363990920;
	Thu, 28 Feb 2019 06:26:30 -0800 (PST)
MIME-Version: 1.0
References: <4817f5c3b20aedba869608c06e76d11a722f4864.camel@gmail.com>
	<3aaecc9d-d03b-a754-0ef0-a65609777b2e@redhat.com>
In-Reply-To: <3aaecc9d-d03b-a754-0ef0-a65609777b2e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Feb 2019 14:26:19 +0000
Message-ID: <CAFEAcA8ZxNPTcPWJZLBN7dir1-6Kj7-2LuLX3f58SfDMM7xyTw@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: Aarushi Mehta <mehta.aaru20@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Stefan Hajnoczi <stefanha@gmail.com>, Julia Suvorova <jusual@mail.ru>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] trivial malloc to g_malloc
 in thunk
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2019 14:26:43 -0000

On Thu, 28 Feb 2019 at 14:00, Eric Blake <eblake@redhat.com> wrote:
>
> On 2/28/19 7:42 AM, Aarushi Mehta wrote:
> > Hi
> >
> > This is a trivial contribution part of the BiteSizedTasks on the wiki.
> > I found this discussion http://git.corpit.ru/?p=qemu.git;a=commit;h=b45c03f585ea9bb1af76c73e82195418c294919d
> > on migrating even g_malloc to g_new, is this not appropriate for the same?
> > The wiki can presumably use an update regarding this.
> >
> > Signed-off-by: Aarushi <mehta.aaru20@gmail.com>
> > ---
> >  thunk.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/thunk.c b/thunk.c
> > index d5d8645cd4..03fb2abab7 100644
> > --- a/thunk.c
> > +++ b/thunk.c
> > @@ -89,7 +89,7 @@ void thunk_register_struct(int id, const char *name, const argtype *types)
> >      for(i = 0;i < 2; i++) {
> >          offset = 0;
> >          max_align = 1;
> > -        se->field_offsets[i] = malloc(nb_fields * sizeof(int));
> > +        se->field_offsets[i] = g_malloc(nb_fields * sizeof(int));
>
> Where is the counterpart free() that needs to be changed to g_free()?

There is none, because this code sets up a data structure at
startup which then lasts for the lifetime of the QEMU process.
This is definitely worth noting in the commit message.

thanks
-- PMM

