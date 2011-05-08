Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QJ1xa-0007UB-Jz
	for mharc-qemu-trivial@gnu.org; Sun, 08 May 2011 07:15:38 -0400
Received: from eggs.gnu.org ([140.186.70.92]:52752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QJ1xY-0007R9-GH
	for qemu-trivial@nongnu.org; Sun, 08 May 2011 07:15:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QJ1xX-0005ge-P5
	for qemu-trivial@nongnu.org; Sun, 08 May 2011 07:15:36 -0400
Received: from mail-yw0-f45.google.com ([209.85.213.45]:63265)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QJ1xW-0005gM-2i; Sun, 08 May 2011 07:15:34 -0400
Received: by ywl41 with SMTP id 41so1882324ywl.4
	for <multiple recipients>; Sun, 08 May 2011 04:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=SXycKLC40mnAqARAXb8vwp7RSjONHg+44Rr8tPDmTTE=;
	b=vgMFrZVAQSpsPQPBRqKNQTMwtj3MGGiRDXo3NbIR7lmAVpCtgVHF0AGPEpbj7AIl6w
	HoLqdyZwxCUEBPHhe+gCjgkbKAYgo69aunAduIV3U0UOvKqDyuyiB5i1I6aK9S82cz7L
	ZSPZeHIltOVvvRi+Ka7ucFqOrR9DMMHSoUfW0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=mW+4M4VF9ZB6lFBP4YE1W0PamCiji6CIL9pFq1Tuhd5tRQnRs3XVMxSDLlleH2g2yA
	E2GKKlf8NTOzSkWIA9XuGfPpl7RlGFWF88VyzAxoAhabrMIX0ezvFX5yiCNeZ9NqpVZD
	oiNcPfc6ibKvusBncMTgDwew1yOzHZxMLpMdA=
MIME-Version: 1.0
Received: by 10.150.2.11 with SMTP id 11mr706110ybb.186.1304853333100; Sun, 08
	May 2011 04:15:33 -0700 (PDT)
Received: by 10.147.172.9 with HTTP; Sun, 8 May 2011 04:15:33 -0700 (PDT)
In-Reply-To: <1304322846-24376-4-git-send-email-pbonzini@redhat.com>
References: <1304322846-24376-4-git-send-email-pbonzini@redhat.com>
Date: Sun, 8 May 2011 12:15:33 +0100
Message-ID: <BANLkTikq7uuwZOhdFdJD4a1PkHneD6a=Fg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 4/4] fix compilation when reconfiguring
 without dtrace backend
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
X-List-Received-Date: Sun, 08 May 2011 11:15:37 -0000

On Mon, May 2, 2011 at 8:54 AM, Paolo Bonzini <pbonzini@redhat.com> wrote:
> If QEMU is configured with the dtrace backend, then built, then
> reconfigured without, the build fails.
>
> The culprit is the trace-dtrace.h dependency that many files will
> have. =A0Due to this dependency, make will attempt to rebuild
> trace-dtrace.dtrace. =A0This is the step that fails. =A0Fix by wrapping
> the dtrace rules with ifeq/endif.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Cc: qemu-trivial@nongnu.org
> ---
> =A0Makefile.objs | =A0 =A02 ++
> =A01 files changed, 2 insertions(+), 0 deletions(-)

I think the real problem is that dependencies need to be regenerated
after ./configure?

Stefan

