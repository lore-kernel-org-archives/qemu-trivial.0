Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RMQzL-0007oD-9t
	for mharc-qemu-trivial@gnu.org; Fri, 04 Nov 2011 17:07:47 -0400
Received: from eggs.gnu.org ([140.186.70.92]:47830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RMQzJ-0007hi-7c
	for qemu-trivial@nongnu.org; Fri, 04 Nov 2011 17:07:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RMQzI-0001Nq-2v
	for qemu-trivial@nongnu.org; Fri, 04 Nov 2011 17:07:45 -0400
Received: from mail-qy0-f173.google.com ([209.85.216.173]:54561)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1RMQzG-0001NI-2y; Fri, 04 Nov 2011 17:07:42 -0400
Received: by qyk30 with SMTP id 30so1979369qyk.4
	for <multiple recipients>; Fri, 04 Nov 2011 14:07:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.240.7 with SMTP id ky7mr2057848qcb.243.1320440860695; Fri,
	04 Nov 2011 14:07:40 -0700 (PDT)
Received: by 10.229.124.72 with HTTP; Fri, 4 Nov 2011 14:07:40 -0700 (PDT)
In-Reply-To: <4EB45011.6070609@tribudubois.net>
References: <4EB45011.6070609@tribudubois.net>
Date: Fri, 4 Nov 2011 21:07:40 +0000
Message-ID: <CAFEAcA8sjUJ01sgWh-jNdzuXnxTnEpBWLijuQcMSqfDg35DFMA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, paul@codesourcery.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] arm: Fix CP15 FSR (C5)
	domain setting
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
X-List-Received-Date: Fri, 04 Nov 2011 21:07:46 -0000

On 4 November 2011 20:50, Jean-Christophe DUBOIS <jcd@tribudubois.net> wrot=
e:
> During Xvisor development, it was noted that qemu did not return
> the correct domain value in the Cp15 [Data] FSR register (C5).
>
> This patch is a proposal to fix it.

> --- qemu-0.15.1.org/target-arm/helper.c =C2=A0 =C2=A02011-10-12 18:41:43.=
000000000
> +0200
> +++ qemu-0.15.1/target-arm/helper.c =C2=A0 =C2=A02011-11-04 00:49:03.2470=
62518 +0100
> @@ -924,12 +924,12 @@

This is on my todo list to review. In the meantime:
 * you should submit patches against current qemu git master,
   not an old released version, please
 * if you can send emails via a path that doesn't line wrap long
   lines this makes life much easier on the receiving end
 * this is definitely not a trivial patch
 * it's worth running patches through ./scripts/checkpatch.pl
   to catch minor coding style issues
 * if you resend a patch please include a note about what has
   changed since the previous version and put a 'v2/v3/...'
   note in the email subject.

thanks
-- PMM

