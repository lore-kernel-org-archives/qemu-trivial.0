Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TJP9P-0001zH-2D
	for mharc-qemu-trivial@gnu.org; Wed, 03 Oct 2012 09:38:11 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1TJP9J-0001hQ-0v
	for qemu-trivial@nongnu.org; Wed, 03 Oct 2012 09:38:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1TJP9B-0002L6-GP
	for qemu-trivial@nongnu.org; Wed, 03 Oct 2012 09:38:04 -0400
Received: from cantor2.suse.de ([195.135.220.15]:47526 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1TJP91-0002Ew-RC; Wed, 03 Oct 2012 09:37:48 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id E8B43A0FF5;
	Wed,  3 Oct 2012 15:37:41 +0200 (CEST)
Message-ID: <506C3F9C.20900@suse.de>
Date: Wed, 03 Oct 2012 15:37:32 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120825 Thunderbird/15.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1349255979-5404-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1349255979-5404-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.4.4
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw: Add missing 'static'
	attribute for QEMUMachine
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
X-List-Received-Date: Wed, 03 Oct 2012 13:38:09 -0000

Am 03.10.2012 11:19, schrieb Stefan Weil:
> It was missing for leon3 and mips_fulong2e.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

/-F

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

