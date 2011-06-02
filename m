Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QSGdU-0006Lj-Eo
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jun 2011 18:45:04 -0400
Received: from eggs.gnu.org ([140.186.70.92]:52626)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QSGdQ-0006Km-9K
	for qemu-trivial@nongnu.org; Thu, 02 Jun 2011 18:45:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QSGdO-0003yV-W3
	for qemu-trivial@nongnu.org; Thu, 02 Jun 2011 18:45:00 -0400
Received: from mail-yw0-f45.google.com ([209.85.213.45]:56685)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QSGdJ-0003xv-62; Thu, 02 Jun 2011 18:44:53 -0400
Received: by ywl41 with SMTP id 41so647446ywl.4
	for <multiple recipients>; Thu, 02 Jun 2011 15:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=HkdG+2RdPdDawa+XL4t6rPhywzmBYrkzuXEUuEQHq9U=;
	b=agH43fjv8qFT1VwYJXRvCbVdzqxH+MHeAP2SE5j1sd89cm/hVTBCqbn4+XRv/jNHZ/
	ozI0racj0xKLZU8Qghw4g1s/GbfYBtqFaw2F/6l5C65yKmNZBwtuYjvygH5RqDkzqhrm
	aApO3mW30/6plSB0g3PJ5ctZLVwVoCvKCPO8Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=DAOjIgk4G7nEcjlCqtBXyIfr0EX58Mh12MMcSbSgR36q2bIthNsBBQec6NrWMuNXkH
	z0emt4JLCgU0ETdhgp91/45P3BXOHKO44bZTg2uzVRAcQbetF0F4cwTdeeWxYjOryPqx
	wDLBTOwOjg7YyjcVJwgSmwSp2zIcQ+wAfo1rA=
MIME-Version: 1.0
Received: by 10.236.170.34 with SMTP id o22mr1768525yhl.83.1307054691906; Thu,
	02 Jun 2011 15:44:51 -0700 (PDT)
Received: by 10.146.86.2 with HTTP; Thu, 2 Jun 2011 15:44:51 -0700 (PDT)
In-Reply-To: <1306981290-17308-1-git-send-email-cerbere@gmail.com>
References: <1306981290-17308-1-git-send-email-cerbere@gmail.com>
Date: Thu, 2 Jun 2011 23:44:51 +0100
Message-ID: <BANLkTi=hHCo6e0aoF1TypAb06vDN_6e+6A@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alexandre Raymond <cerbere@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.45
Cc: qemu-trivial@nongnu.org,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>,
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
X-List-Received-Date: Thu, 02 Jun 2011 22:45:02 -0000

On Thu, Jun 2, 2011 at 3:21 AM, Alexandre Raymond <cerbere@gmail.com> wrote=
:
> Fix the following warning by including signal.h directly in qemu-common.h
> ----8<----
> iohandler.c: In function =91qemu_init_child_watch=92:
> iohandler.c:172: warning: implicit declaration of function =91sigaction=
=92
> iohandler.c:172: warning: nested extern declaration of =91sigaction=92
> ----8<----
>
> Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
> ---
> =A0qemu-common.h | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

