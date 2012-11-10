Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TXGjD-000320-TW
	for mharc-qemu-trivial@gnu.org; Sat, 10 Nov 2012 14:28:27 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TXGj8-0002it-3b
	for qemu-trivial@nongnu.org; Sat, 10 Nov 2012 14:28:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TXGj4-0006Y7-TK
	for qemu-trivial@nongnu.org; Sat, 10 Nov 2012 14:28:21 -0500
Received: from mail-pb0-f45.google.com ([209.85.160.45]:65532)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TXGiy-0006Ti-Ht; Sat, 10 Nov 2012 14:28:12 -0500
Received: by mail-pb0-f45.google.com with SMTP id mc8so864775pbc.4
	for <multiple recipients>; Sat, 10 Nov 2012 11:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=1+ndYsZmAIcM7UIkzvNC8amsK7iOKxfS0tsBnJqboWM=;
	b=HVb2qn1hnWboFlWpxThoy1Kszw8A3HyMuB6obCiF2hKBtkhN2+34jlFcD6Pi6OkM0T
	/5mwbrUswXgp4mqaP5Q40aJD4BoJtI2wnb5jDUIMcxi4hHrhyHORZHxM6Hf3vtkBpxx9
	jPrnCIcIAFUWpoI+nBbGf2v8BNCD5mUO/I9hkbzpchKm8AF2AvbCT2jsxLJwdBveZNND
	QrzI5jGBv9n055rTxHmGG7XgPEfmqneZmn95jRGr31gzN2n+yQHTn/lBuQXBWgfsWebZ
	Gk3h1K1gTUg+xoLAhMdwtf0KQQLy3Z7KgiKCWgefk0BTTj2s9hxmBLBzQ3xaAsFTfCyx
	w+lA==
Received: by 10.68.245.167 with SMTP id xp7mr45423685pbc.75.1352575692061;
	Sat, 10 Nov 2012 11:28:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.68.49.101 with HTTP; Sat, 10 Nov 2012 11:27:51 -0800 (PST)
In-Reply-To: <1352061728-30617-1-git-send-email-sw@weilnetz.de>
References: <1352061728-30617-1-git-send-email-sw@weilnetz.de>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sat, 10 Nov 2012 19:27:51 +0000
Message-ID: <CAAu8pHtVwoVDFhqs7UUtc+p+P=dSJG+H8Ac-rNxX=sdMsL57QQ@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-timer: Fix compilation
	for non-POSIX hosts
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 10 Nov 2012 19:28:25 -0000

Thanks, applied.

On Sun, Nov 4, 2012 at 8:42 PM, Stefan Weil <sw@weilnetz.de> wrote:
> A compiler warning is caused by the unused local function reinit_timers
> on non-POSIX hosts. Include that function only for POSIX hosts.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  qemu-timer.c |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/qemu-timer.c b/qemu-timer.c
> index 8d9cf38..0d2bb94 100644
> --- a/qemu-timer.c
> +++ b/qemu-timer.c
> @@ -745,6 +745,7 @@ static void quit_timers(void)
>      t->stop(t);
>  }
>
> +#ifdef CONFIG_POSIX
>  static void reinit_timers(void)
>  {
>      struct qemu_alarm_timer *t = alarm_timer;
> @@ -755,6 +756,7 @@ static void reinit_timers(void)
>      }
>      qemu_rearm_alarm_timer(t);
>  }
> +#endif /* CONFIG_POSIX */
>
>  int init_timer_alarm(void)
>  {
> --
> 1.7.10.4
>
>

