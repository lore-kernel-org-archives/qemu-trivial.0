Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RLJGd-0008Ak-22
	for mharc-qemu-trivial@gnu.org; Tue, 01 Nov 2011 14:40:59 -0400
Received: from eggs.gnu.org ([140.186.70.92]:38052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1RLJGW-0007qL-Ov
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2011 14:40:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1RLJGR-0003fd-6x
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2011 14:40:52 -0400
Received: from fmmailgate03.web.de ([217.72.192.234]:44862)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1RLJGK-0003et-7t; Tue, 01 Nov 2011 14:40:40 -0400
Received: from moweb001.kundenserver.de (moweb001.kundenserver.de
	[172.19.20.114])
	by fmmailgate03.web.de (Postfix) with ESMTP id E13311A946845;
	Tue,  1 Nov 2011 19:40:38 +0100 (CET)
Received: from envy.site ([95.239.219.30]) by smtp.web.de (mrweb001) with
	ESMTPA (Nemesis) id 0Mf0a9-1Rb1fV0o6T-00OZUa;
	Tue, 01 Nov 2011 19:40:36 +0100
Message-ID: <4EB03CDA.1030405@web.de>
Date: Tue, 01 Nov 2011 19:39:22 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Eric Sunshine <sunshine@sunshineco.com>
References: <1320140389-22079-1-git-send-email-sunshine@sunshineco.com>
In-Reply-To: <1320140389-22079-1-git-send-email-sunshine@sunshineco.com>
Content-Type: text/plain; charset=ISO-8859-15
X-Provags-ID: V02:K0:IsccsAnqWeJ8T4k+ESqtKIvEJQ6Qiz5iJUSs4+XtsBl
	7V1+HqQM0Knc1l6qJUufmCpv2/WXUDq9c3rn0o8AxRD+nIymSs
	gh2Ldt1RNIxrhaUa1B0Oc9VJSJgP3hZb+L3smPmPNGCpSr4jX/
	bb/kES7TfdFQinF4ilXcPdr6xQdQCFrwrtqBJ+S/87A7XShGOa
	9+HiCMTKNMhJFLbDS/IhQ==
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.234
Cc: qemu-trivial@nongnu.org, malc <av1474@comtv.ru>, qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-barrier: Fix build
 failure on PowerPC Mac OS X
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
X-List-Received-Date: Tue, 01 Nov 2011 18:40:58 -0000

Am 01.11.2011 10:39, schrieb Eric Sunshine:
> qemu-barrier.h tests if macro __powerpc__ is defined, however, the
> preprocessor on PowerPC Mac OS X defines only __POWERPC__, not
> __powerpc__.

> Resolve by testing instead for qemu-provided _ARCH_PPC.

This part is actually wrong: _ARCH_PPC is compiler-provided.

>=20
> Signed-off-by: Eric Sunshine <sunshine@sunshineco.com>

I currently don't have access to my ppc64 box, so

Reviewed-by: Andreas F=E4rber <andreas.faerber@web.de>

Next time please cc malc (TCG ppc) and me (Darwin) on this.

Thanks,
Andreas

> ---
>=20
> The anomalous __powerpc__ test appears only in qemu-barrier.h.
> No other source files reference this name.
>=20
> Cc: David Gibson <david@gibson.dropbear.id.au>
>=20
>  qemu-barrier.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/qemu-barrier.h b/qemu-barrier.h
> index 735eea6..c11bb2b 100644
> --- a/qemu-barrier.h
> +++ b/qemu-barrier.h
> @@ -14,7 +14,7 @@
>   */
>  #define smp_wmb()   barrier()
> =20
> -#elif defined(__powerpc__)
> +#elif defined(_ARCH_PPC)
> =20
>  /*
>   * We use an eieio() for a wmb() on powerpc.  This assumes we don't


