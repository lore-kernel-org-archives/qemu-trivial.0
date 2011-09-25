Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R7uty-00053M-1c
	for mharc-qemu-trivial@gnu.org; Sun, 25 Sep 2011 16:02:14 -0400
Received: from eggs.gnu.org ([140.186.70.92]:42069)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1R7utu-0004t2-Hn
	for qemu-trivial@nongnu.org; Sun, 25 Sep 2011 16:02:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1R7utt-0005cA-Ek
	for qemu-trivial@nongnu.org; Sun, 25 Sep 2011 16:02:10 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:32800)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>)
	id 1R7utq-0005bV-TS; Sun, 25 Sep 2011 16:02:07 -0400
Received: by wwg14 with SMTP id 14so4890396wwg.10
	for <multiple recipients>; Sun, 25 Sep 2011 13:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=loLb4zPr/wiP6wCvvQ8K4C7gd8x6JAKVo4tzoadBPy0=;
	b=sf0mPLYjvG/O6k9g58dW5YHgUuUOoFiCaMrse86DyN3wiekhNTF8jnfH2ZTiSDFA1W
	iVzku//bPJELYMpY60z5GrXcCklrHonn71WVcWeVbgobGZlz/g5SgDin8gSWItzBNJeN
	HITgbx2WelK7iyftgeq71rj4wvMVznMFdHl60=
MIME-Version: 1.0
Received: by 10.216.230.89 with SMTP id i67mr6309359weq.51.1316980925540; Sun,
	25 Sep 2011 13:02:05 -0700 (PDT)
Received: by 10.216.47.211 with HTTP; Sun, 25 Sep 2011 13:02:05 -0700 (PDT)
In-Reply-To: <CAFEAcA8w644h4YCYOyoj79xNPNQFHjAORi=n5ka5sg1gm9kYoQ@mail.gmail.com>
References: <1316974483-16947-1-git-send-email-antonynpavlov@gmail.com>
	<CAFEAcA8w644h4YCYOyoj79xNPNQFHjAORi=n5ka5sg1gm9kYoQ@mail.gmail.com>
Date: Mon, 26 Sep 2011 00:02:05 +0400
Message-ID: <CAA4bVAHCc3nwAvFip0b6NW=N_uRtgPhyqeOq45=FN71y2CY1hA@mail.gmail.com>
From: Antony Pavlov <antonynpavlov@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] gt64xxx.c: fix length
 modifier in DPRINTF format string
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
X-List-Received-Date: Sun, 25 Sep 2011 20:02:12 -0000

On 25 September 2011 23:22, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 25 September 2011 19:14, Antony Pavlov <antonynpavlov@gmail.com> wrote=
:
>> The commit fc2bf44972349b078d8310466c3866615500e67f
>> changed the type of val argument of the function gt64120_writel()
>> from uint32_t to uint64_t, so we need to change the corresponding
>> length modifier from '%x' to '%llx'.
>
> For a uint64_t you need to use PRIx64 -- '%llx' won't work on
> systems where uint64_t isn't typedefed as 'long long'.

Thanks! I will resend patches in a few seconds.

--=20
Best regards,
=A0 Antony Pavlov

