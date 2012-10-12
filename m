Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TMmJd-0001JD-Cr
	for mharc-qemu-trivial@gnu.org; Fri, 12 Oct 2012 16:58:41 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1TMmJb-0001EK-NI
	for qemu-trivial@nongnu.org; Fri, 12 Oct 2012 16:58:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1TMmJa-0007ZK-JS
	for qemu-trivial@nongnu.org; Fri, 12 Oct 2012 16:58:39 -0400
Received: from cantor2.suse.de ([195.135.220.15]:59777 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1TMmJX-0007WT-Bn; Fri, 12 Oct 2012 16:58:35 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 7E6F59D938;
	Fri, 12 Oct 2012 22:58:32 +0200 (CEST)
Message-ID: <50788472.3000707@suse.de>
Date: Fri, 12 Oct 2012 22:58:26 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120825 Thunderbird/15.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1350064784-13058-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1350064784-13058-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.4.4
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel@nongnu.org, patches@linaro.org, Avi Kivity <avi@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] targphys.h: Don't define
 target_phys_addr_t for user-mode emulators
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
X-List-Received-Date: Fri, 12 Oct 2012 20:58:40 -0000

Am 12.10.2012 19:59, schrieb Peter Maydell:
> Commit 4be403c accidentally defined the target_phys_addr_t type when
> building user-mode emulators. Since the type doesn't really make
> any sense except for system emulators, avoid defining it when building
> in user mode.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Andreas F=E4rber <afaerber@suse.de>

I do ask myself though why we would include targphys.h in user mode. ;)

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

