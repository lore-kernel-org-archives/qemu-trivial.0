Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UfqMo-0004Z0-3Z
	for mharc-qemu-trivial@gnu.org; Fri, 24 May 2013 07:41:02 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UfqMh-0004Uq-Dc
	for qemu-trivial@nongnu.org; Fri, 24 May 2013 07:41:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UfqMc-0001B6-1S
	for qemu-trivial@nongnu.org; Fri, 24 May 2013 07:40:55 -0400
Received: from cantor2.suse.de ([195.135.220.15]:47087 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UfqMS-00019M-Ah; Fri, 24 May 2013 07:40:40 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 7972FA67E8;
	Fri, 24 May 2013 13:40:39 +0200 (CEST)
Message-ID: <519F51B3.4010707@suse.de>
Date: Fri, 24 May 2013 13:40:35 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1369390765-32117-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1369390765-32117-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Evgeny Voevodin <e.voevodin@samsung.com>,
	qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	qemu-devel@nongnu.org, Paul Brook <paul@codesourcery.com>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Remove unnecessary break
	statements
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
X-List-Received-Date: Fri, 24 May 2013 11:41:01 -0000

Am 24.05.2013 12:19, schrieb Stefan Weil:
> Fix these warnings from cppcheck:
>=20
> hw/display/cirrus_vga.c:2603:
> hw/sd/sd.c:348:
> hw/timer/exynos4210_mct.c:1033:
> target-arm/translate.c:9886:
> target-s390x/mem_helper.c:518:
> target-unicore32/translate.c:1936:
>  style: Consecutive return, break, continue, goto or throw statements a=
re unnecessary.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Also removes a tab while at it. :)

Thanks,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

