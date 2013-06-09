Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UljPe-0001YY-Uu
	for mharc-qemu-trivial@gnu.org; Sun, 09 Jun 2013 13:28:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UljPc-0001VM-5m
	for qemu-trivial@nongnu.org; Sun, 09 Jun 2013 13:28:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UljPb-0008LM-5c
	for qemu-trivial@nongnu.org; Sun, 09 Jun 2013 13:28:16 -0400
Received: from cantor2.suse.de ([195.135.220.15]:41981 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UljPZ-0008Ku-31; Sun, 09 Jun 2013 13:28:13 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 988F8A5211;
	Sun,  9 Jun 2013 19:28:12 +0200 (CEST)
Message-ID: <51B4BB28.2070307@suse.de>
Date: Sun, 09 Jun 2013 19:28:08 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1370780536-28150-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1370780536-28150-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	"Vassili Karpov \(malc\)" <av1474@comtv.ru>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] audio: Replace macro
 GCC_ATTR by GCC_FMT_ATTR and use inline functions
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
X-List-Received-Date: Sun, 09 Jun 2013 17:28:17 -0000

Am 09.06.2013 14:22, schrieb Stefan Weil:
> GCC_ATTR was only used in audio_int.h, so it is now unused and
> the definition can be removed from compiler.h.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

