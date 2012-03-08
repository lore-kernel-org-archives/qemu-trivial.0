Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5fFW-0005Hb-ER
	for mharc-qemu-trivial@gnu.org; Thu, 08 Mar 2012 10:27:26 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S5fFP-0005H6-7h
	for qemu-trivial@nongnu.org; Thu, 08 Mar 2012 10:27:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S5fEx-0007lk-7N
	for qemu-trivial@nongnu.org; Thu, 08 Mar 2012 10:27:18 -0500
Received: from mail-yw0-f45.google.com ([209.85.213.45]:41578)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S5fEm-0007ia-4J; Thu, 08 Mar 2012 10:26:40 -0500
Received: by yhoo21 with SMTP id o21so325171yho.4
	for <multiple recipients>; Thu, 08 Mar 2012 07:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=q4WlRkbJ3zec0kEHuDllFeboR8DXS9By7qSgz10z/Cs=;
	b=JuGyXwj5XtoKxxFlhGkdgchn8QoBNYmQS9WkHypwsUWDjJgHSLd/ogdncwSxcyv20Q
	B0FcETGoJBG1ziFpsuVf7prPOki6eNaGf8aAOtYCXS7NyUxuyzU9/S03I793dFO3gDx5
	pehuZPKz3cKOHr7LiLSsEk5ObS9Czrxv929K+RJMlthDaxi9c44pK0t2+7HM5vogr49a
	hN5fF13Ezu17qVwdrwHO/aBDwNyHQRqvVwF2jFklMtcOxsaVJNUEaXv/P2YigXIGL0DV
	X0T2wp7OjUOVfM4OxwDzNf/OiH5yNLL2SYJEA3Q1GcNoV7UjvYHGly+ZRLB2gNFFMZqs
	jIGA==
MIME-Version: 1.0
Received: by 10.50.217.163 with SMTP id oz3mr17820838igc.6.1331220396461; Thu,
	08 Mar 2012 07:26:36 -0800 (PST)
Received: by 10.231.15.198 with HTTP; Thu, 8 Mar 2012 07:26:36 -0800 (PST)
In-Reply-To: <1330176948-14379-1-git-send-email-sw@weilnetz.de>
References: <1330176948-14379-1-git-send-email-sw@weilnetz.de>
Date: Thu, 8 Mar 2012 15:26:36 +0000
Message-ID: <CAJSP0QXAc5S6dvh-6EJkL8RNfDCkD=7QcbT0DMZTiS5D+xTQsg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.45
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vnc: Fix packed boolean
	struct members
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
X-List-Received-Date: Thu, 08 Mar 2012 15:27:25 -0000

On Sat, Feb 25, 2012 at 1:35 PM, Stefan Weil <sw@weilnetz.de> wrote:
> This patch fixes warnings reported by splint:
>
> For variables which are packed in a single bit, a signed data type
> like 'int' does not make much sense.
>
> There is no obvious reason why the two values should be packed,
> so I removed the packing and changed the data type to bool
> because both are used as boolean values.
>
> Cc: Anthony Liguori <aliguori@us.ibm.com>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> =A0ui/vnc-auth-sasl.h | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/ui/vnc-auth-sasl.h b/ui/vnc-auth-sasl.h
> index fd9b18a..ee243a9 100644
> --- a/ui/vnc-auth-sasl.h
> +++ b/ui/vnc-auth-sasl.h
> @@ -37,9 +37,9 @@ typedef struct VncDisplaySASL VncDisplaySASL;
> =A0struct VncStateSASL {
> =A0 =A0 sasl_conn_t *conn;
> =A0 =A0 /* If we want to negotiate an SSF layer with client */
> - =A0 =A0int wantSSF :1;
> + =A0 =A0bool wantSSF;
> =A0 =A0 /* If we are now running the SSF layer */
> - =A0 =A0int runSSF :1;
> + =A0 =A0bool runSSF;

I had to drop this patch from the trivial patches tree, it tickles a
new gcc warning.  Please resend with the necessary change.

I cannot reproduce it on my build host here with gcc Debian 4.6.2-12
but Anthony reports the following Ubuntu/Linaro 4.5.2-8ubuntu4:

  CC    ui/vnc-auth-sasl.o
cc1: warnings being treated as errors
/home/anthony/git/qemu/ui/vnc-auth-sasl.c: In function
=91vnc_sasl_client_cleanup=92:
/home/anthony/git/qemu/ui/vnc-auth-sasl.c:34:9: error: suggest
parentheses around assignment used as truth value
make: *** [ui/vnc-auth-sasl.o] Error 1

