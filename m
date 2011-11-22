Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSo2m-0002fD-K7
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2011 05:57:40 -0500
Received: from eggs.gnu.org ([140.186.70.92]:49821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RSo2e-0002Ek-NV
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:57:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RSo2a-0007dU-CK
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:57:32 -0500
Received: from mail-qw0-f45.google.com ([209.85.216.45]:39593)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1RSo2Q-0007cP-3R; Tue, 22 Nov 2011 05:57:18 -0500
Received: by qabg14 with SMTP id g14so1353241qab.4
	for <multiple recipients>; Tue, 22 Nov 2011 02:57:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.224.185.6 with SMTP id cm6mr7534532qab.89.1321959437158; Tue,
	22 Nov 2011 02:57:17 -0800 (PST)
Received: by 10.229.88.68 with HTTP; Tue, 22 Nov 2011 02:57:16 -0800 (PST)
In-Reply-To: <20111122104354.GA27846@stefanha-thinkpad.localdomain>
References: <1321730319-21498-1-git-send-email-sw@weilnetz.de>
	<20111122104354.GA27846@stefanha-thinkpad.localdomain>
Date: Tue, 22 Nov 2011 10:57:16 +0000
Message-ID: <CAFEAcA9LHoQRXi2vFmr_bMUEsCU4vqLa7zurw5HFWnTAsjp_rw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <andreas.faerber@web.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] darwin-user: Fix format
 string in debug message
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
X-List-Received-Date: Tue, 22 Nov 2011 10:57:38 -0000

On 22 November 2011 10:43, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Sat, Nov 19, 2011 at 08:18:39PM +0100, Stefan Weil wrote:
>> This was spotted by cppcheck.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>> =C2=A0darwin-user/signal.c | =C2=A0 =C2=A03 +--
>> =C2=A01 files changed, 1 insertions(+), 2 deletions(-)
>
> I am waiting to see if you send a v2 or this thread continues. =C2=A0Not
> applied to trivial-patches.

FWIW I think the patch as it is is fine. We have already printed
sa_handler &c in the immediately preceding line of debug output so
there's nothing gained from printing them again; probably it was
a stray cut-n-paste error in the first place.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

