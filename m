Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SKD32-0000JC-IU
	for mharc-qemu-trivial@gnu.org; Tue, 17 Apr 2012 14:22:40 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SKD2x-0008Tl-8h
	for qemu-trivial@nongnu.org; Tue, 17 Apr 2012 14:22:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SKD2s-0007FE-Tt
	for qemu-trivial@nongnu.org; Tue, 17 Apr 2012 14:22:34 -0400
Received: from cantor2.suse.de ([195.135.220.15]:38383 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1SKD2k-0007DL-6F; Tue, 17 Apr 2012 14:22:22 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 94AC38FFDD;
	Tue, 17 Apr 2012 20:22:20 +0200 (CEST)
Message-ID: <4F8DB4DA.5090702@suse.de>
Date: Tue, 17 Apr 2012 20:22:18 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120312 Thunderbird/11.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1334685493-6867-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1334685493-6867-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.4
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, Paul Brook <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] arm-dis: Fix spelling in
 comments (iff -> if)
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
X-List-Received-Date: Tue, 17 Apr 2012 18:22:39 -0000

Am 17.04.2012 19:58, schrieb Stefan Weil:
> The spelling 'iff' is sometimes used for 'if and only if'.
> Even if that meaning could be applied here, it is not used
> consistently. It is also quite unusual to use 'if and only if'
> in technical documentation. Therefore a simple 'if' should be
> preferred here.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  arm-dis.c |   22 +++++++++++-----------
>  1 files changed, 11 insertions(+), 11 deletions(-)

Aren't the *-dis.c files imported from binutils? In that case I'd
suggest to stay in sync with how they write/wrote it.
(Would spelling fixes in comments be subject to the GPLv3?)

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

