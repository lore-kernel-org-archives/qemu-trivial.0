Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UBUmD-0008Kp-Ku
	for mharc-qemu-trivial@gnu.org; Fri, 01 Mar 2013 13:33:49 -0500
Received: from eggs.gnu.org ([208.118.235.92]:57505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UBUm9-0008E5-GL
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2013 13:33:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UBUm8-0004cS-Im
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2013 13:33:45 -0500
Received: from cantor2.suse.de ([195.135.220.15]:50598 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UBUm4-0004bh-Fg; Fri, 01 Mar 2013 13:33:40 -0500
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id F2AAAA4F01;
	Fri,  1 Mar 2013 19:33:39 +0100 (CET)
Message-ID: <5130F483.3090003@suse.de>
Date: Fri, 01 Mar 2013 19:33:39 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130215 Thunderbird/17.0.3
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1362157061-438-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1362157061-438-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] pci_host: Drop write-only address_space
	field
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
X-List-Received-Date: Fri, 01 Mar 2013 18:33:46 -0000

Am 01.03.2013 17:57, schrieb Peter Maydell:
> The address_space field of PCIHostState was only ever written, never us=
ed.
> Drop it completely.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

