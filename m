Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SHcbU-0005Lz-H6
	for mharc-qemu-trivial@gnu.org; Tue, 10 Apr 2012 11:03:32 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SHcbO-0005BQ-Rf
	for qemu-trivial@nongnu.org; Tue, 10 Apr 2012 11:03:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SHcbI-0004vw-Jz
	for qemu-trivial@nongnu.org; Tue, 10 Apr 2012 11:03:26 -0400
Received: from cantor2.suse.de ([195.135.220.15]:53332 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1SHcb0-0004s0-1A; Tue, 10 Apr 2012 11:03:02 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 5842B95B1F;
	Tue, 10 Apr 2012 17:03:00 +0200 (CEST)
Message-ID: <4F844BA4.5060309@suse.de>
Date: Tue, 10 Apr 2012 17:03:00 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120312 Thunderbird/11.0
MIME-Version: 1.0
To: David Gibson <david@gibson.dropbear.id.au>
References: <1333515728-9769-1-git-send-email-david@gibson.dropbear.id.au>
	<1333515728-9769-3-git-send-email-david@gibson.dropbear.id.au>
In-Reply-To: <1333515728-9769-3-git-send-email-david@gibson.dropbear.id.au>
X-Enigmail-Version: 1.4
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, benh@kernel.crashing.org, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, scottwood@freescale.com
Subject: Re: [Qemu-trivial] [Qemu-ppc] [PATCH 2/4] pseries: Remove unused
 fields from VIOsPAPRBus structure
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
X-List-Received-Date: Tue, 10 Apr 2012 15:03:31 -0000

Am 04.04.2012 07:02, schrieb David Gibson:
> The VIOsPAPRBus structure, used on the pseries machine contains some ol=
d
> fields which are no longer used anywhere.  This patch removes them.
>=20
> Cc: qemu-trivial@nongnu.org
>=20
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---

Thanks, applied to ppc-next:
http://repo.or.cz/w/qemu/agraf.git/shortlog/refs/heads/ppc-next

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

