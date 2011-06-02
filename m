Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QSGo7-0008IB-C5
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jun 2011 18:56:03 -0400
Received: from eggs.gnu.org ([140.186.70.92]:38292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QSGo4-0008HQ-2C
	for qemu-trivial@nongnu.org; Thu, 02 Jun 2011 18:56:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QSGo2-0005Bc-BZ
	for qemu-trivial@nongnu.org; Thu, 02 Jun 2011 18:55:59 -0400
Received: from mail-px0-f174.google.com ([209.85.212.174]:48639)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1QSGny-0005Am-Cn; Thu, 02 Jun 2011 18:55:54 -0400
Received: by pxi15 with SMTP id 15so874127pxi.33
	for <multiple recipients>; Thu, 02 Jun 2011 15:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=XNWgCl+ryY7jMXcU77u/D/m443XHFvru6LncvlrKlPE=;
	b=V24qAqXNlHyRuPEtBtCXUB62j+mo43pUY4kRbETz6pBqkB6CWXRetORaLNHAqR134R
	3IrJ+z+9Weua8zp5CtoAzjB5r3obewM2cc9F5/DJxmiN+D8BGPkZhiWjUTlU4ymDCgSI
	ormJFcB9Oo/LLWO5aPaW4yztTX8aIikKPrTUo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=imN/92XEH8S8h+WZ2HuxRFGxIquR3z9D6ZrjQY4Q39BhCouMEK/iQQ4vftLj6WIfBJ
	xZrJl9cP90i+RL92KBLeqPugE7yoMwNeXZVleQrSyGPBD2HGDlFh57cgt7tj4Mapbdqb
	YdyoPyjYZGjA7ffteRTc1x+5UNDK2aHZG5n90=
Received: by 10.68.9.132 with SMTP id z4mr528352pba.282.1307055351229; Thu, 02
	Jun 2011 15:55:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.55.37 with HTTP; Thu, 2 Jun 2011 15:55:31 -0700 (PDT)
In-Reply-To: <BANLkTi=hHCo6e0aoF1TypAb06vDN_6e+6A@mail.gmail.com>
References: <1306981290-17308-1-git-send-email-cerbere@gmail.com>
	<BANLkTi=hHCo6e0aoF1TypAb06vDN_6e+6A@mail.gmail.com>
From: Alexandre Raymond <cerbere@gmail.com>
Date: Thu, 2 Jun 2011 18:55:31 -0400
Message-ID: <BANLkTinor25LBJqAbHyqPcJW_7KzpaMhsw@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.212.174
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <andreas.faerber@web.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix compilation warning due
 to missing header for sigaction
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
X-List-Received-Date: Thu, 02 Jun 2011 22:56:01 -0000

Thanks Stefan,

Should I send a follow-up patch to remove signal.h wherever
qemu-common.h is already included?

Alexandre

On Thu, Jun 2, 2011 at 6:44 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Thu, Jun 2, 2011 at 3:21 AM, Alexandre Raymond <cerbere@gmail.com> wro=
te:
>> Fix the following warning by including signal.h directly in qemu-common.=
h
>> ----8<----
>> iohandler.c: In function =E2=80=98qemu_init_child_watch=E2=80=99:
>> iohandler.c:172: warning: implicit declaration of function =E2=80=98siga=
ction=E2=80=99
>> iohandler.c:172: warning: nested extern declaration of =E2=80=98sigactio=
n=E2=80=99
>> ----8<----
>>
>> Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
>> ---
>> =C2=A0qemu-common.h | =C2=A0 =C2=A01 +
>> =C2=A01 files changed, 1 insertions(+), 0 deletions(-)
>
> Thanks, applied to the trivial patches tree:
> http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches
>
> Stefan
>

