Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W5dTf-00066O-1P
	for mharc-qemu-trivial@gnu.org; Tue, 21 Jan 2014 10:42:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1W5dTX-0005wp-Ja
	for qemu-trivial@nongnu.org; Tue, 21 Jan 2014 10:42:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1W5dTS-0002Bm-4s
	for qemu-trivial@nongnu.org; Tue, 21 Jan 2014 10:42:51 -0500
Received: from cantor2.suse.de ([195.135.220.15]:58693 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1W5dTH-0002B1-GZ; Tue, 21 Jan 2014 10:42:35 -0500
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 74E1DAC65;
	Tue, 21 Jan 2014 15:42:34 +0000 (UTC)
Message-ID: <52DE9568.7020900@suse.de>
Date: Tue, 21 Jan 2014 16:42:32 +0100
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Martin Husemann <martin@duskware.de>, qemu-devel@nongnu.org
References: <20131217085540.GA7891@mail.duskware.de>	<52B02428.20306@redhat.com>
	<52D68012.8090603@redhat.com>
	<20140118134723.GA20716@mail.duskware.de>
In-Reply-To: <20140118134723.GA20716@mail.duskware.de>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qemu 1.7.0 does not
	build on NetBSD
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
X-List-Received-Date: Tue, 21 Jan 2014 15:42:56 -0000

Am 18.01.2014 14:47, schrieb Martin Husemann:
>  Do not rely on int8_t (and friends) not being preprocessor
>  symbols (or symbols expanding to themselves). On NetBSD (for example) =
the
>  glue(u, SDATA_TYPE) results in u__int8_t, which is undefined. There is=
 no way
>  to stop cpp expanding inner macros, so just add the few lines explicit=
ly and
>  get rid of the magic.
>=20
> Signed-off-by: Martin Husemann <martin@NetBSD.org>

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

