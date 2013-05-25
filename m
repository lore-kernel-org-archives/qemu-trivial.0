Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UgJtl-0006Ik-PV
	for mharc-qemu-trivial@gnu.org; Sat, 25 May 2013 15:13:01 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UgJth-0006DE-RM
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 15:13:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UgJte-0006wF-Sb
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 15:12:57 -0400
Received: from cantor2.suse.de ([195.135.220.15]:35119 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UgJtY-0006ln-W8; Sat, 25 May 2013 15:12:49 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 43A37A50DD;
	Sat, 25 May 2013 21:12:44 +0200 (CEST)
Message-ID: <51A10D25.2010503@suse.de>
Date: Sat, 25 May 2013 21:12:37 +0200
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Brad Smith <brad@comstyle.com>
References: <20130524230046.GA2671@rox.home.comstyle.com>
In-Reply-To: <20130524230046.GA2671@rox.home.comstyle.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Remove OSS support for
	OpenBSD
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
X-List-Received-Date: Sat, 25 May 2013 19:13:00 -0000

Am 25.05.2013 01:01, schrieb Brad Smith:
> Remove the OSS support for OpenBSD. The OSS API has not been usable
> for quite some time.
>=20
> Signed-off-by: Brad Smith <brad@comstyle.com>

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

CC'ing qemu-trivial.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

