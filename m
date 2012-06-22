Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Si2Rc-000231-Uc
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2012 07:54:32 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Si2Ra-0001tp-2O
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 07:54:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Si2RY-00028I-Im
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 07:54:29 -0400
Received: from cantor2.suse.de ([195.135.220.15]:52778 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Si2RO-00026x-1P; Fri, 22 Jun 2012 07:54:18 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 97B68A22BB;
	Fri, 22 Jun 2012 13:54:16 +0200 (CEST)
Message-ID: <4FE45CE4.7060802@suse.de>
Date: Fri, 22 Jun 2012 13:54:12 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120421 Thunderbird/12.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1340364659-20200-1-git-send-email-peter.maydell@linaro.org>
	<1340364659-20200-2-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1340364659-20200-2-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.5pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] cpu-common.h: Remove
 unnecessary guard on including targphys.h
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
X-List-Received-Date: Fri, 22 Jun 2012 11:54:31 -0000

Am 22.06.2012 13:30, schrieb Peter Maydell:
> There's no need to make the include of targphys.h conditional
> on whether TARGET_PHYS_ADDR_BITS is defined, because targphys.h
> itself checks that and does nothing if it isn't.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

/-F

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

