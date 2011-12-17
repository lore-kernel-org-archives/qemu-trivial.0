Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rbux2-0004al-8m
	for mharc-qemu-trivial@gnu.org; Sat, 17 Dec 2011 09:09:24 -0500
Received: from eggs.gnu.org ([140.186.70.92]:55214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Rbuwy-0004MT-RO
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 09:09:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Rbuwx-0001fw-Qr
	for qemu-trivial@nongnu.org; Sat, 17 Dec 2011 09:09:20 -0500
Received: from mail-qy0-f173.google.com ([209.85.216.173]:38960)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1Rbuwv-0001ff-Eo; Sat, 17 Dec 2011 09:09:17 -0500
Received: by qcsd15 with SMTP id d15so2517378qcs.4
	for <multiple recipients>; Sat, 17 Dec 2011 06:09:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.224.203.202 with SMTP id fj10mr16903294qab.66.1324130956912;
	Sat, 17 Dec 2011 06:09:16 -0800 (PST)
Received: by 10.229.211.4 with HTTP; Sat, 17 Dec 2011 06:09:16 -0800 (PST)
In-Reply-To: <4EEC86E9.7080404@weilnetz.de>
References: <1324110459-3932-1-git-send-email-sw@weilnetz.de>
	<1324110459-3932-4-git-send-email-sw@weilnetz.de>
	<CAFEAcA8MY3zc7xLD_PosE_fHnOL+jn54wX7TAS8MxE=4vVa+Bw@mail.gmail.com>
	<4EEC86E9.7080404@weilnetz.de>
Date: Sat, 17 Dec 2011 14:09:16 +0000
Message-ID: <CAFEAcA-Dpy1a-hsN6oxPn6M=3LTwtfpR2c8J2Gz_a7-TfYQv-A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 03/11] configure: Fix
 compiler warning in config.log (integer from pointer)
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
X-List-Received-Date: Sat, 17 Dec 2011 14:09:21 -0000

On 17 December 2011 12:11, Stefan Weil <sw@weilnetz.de> wrote:
> Am 17.12.2011 12:29, schrieb Peter Maydell:
>>> + =C2=A0return s !=3D (const char *)0;
>>
>> You don't need this cast, I think.
>
> Indeed, a quick test with gcc-4.4.5 shows no new warning when
> I remove the type cast. Are you sure that this works with all
> supported versions of gcc and any set of warning options?

Yes. Both 0 and (void*)0 are null pointer constants;
comparing explicitly for "if (ptr !=3D 0)" is equivalent to
"if (ptr)"; qemu style prefers the latter but there are
a few of the former in the codebase, so practically speaking
we know it compiles fine.

> Normally NULL is used for this kind of code, but it needs
> stddef.h.

Only in some coding styles. NULL is just a convenience
macro if you like that kind of thing.

> Typically NULL is defined to be ((void *)0 for C
> (that's the reason why I used a type cast, too). Only for
> C++ it is defined without a type cast.

The C standard permits plain "0" as a definition of NULL.

> The type cast won't harm and is not in "normal" code,
> so it can be committed as it is. I also don't mind if it is
> removed by whoever commits it. If it is preferred that
> I send an updated patch, I'd use NULL with stddef.h
> (just to be safe).

We use plain 0 for a null pointer constant in various
existing tests in configure; this is simpler and avoids
dragging in stddef.h. I would prefer that.

-- PMM

