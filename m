Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zww4C-0000dZ-MX
	for mharc-qemu-trivial@gnu.org; Thu, 12 Nov 2015 12:53:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Zww49-0000WY-L7
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 12:53:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Zww48-0007z5-I5
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 12:53:45 -0500
Received: from mx2.suse.de ([195.135.220.15]:40027)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Zww44-0007xc-4p; Thu, 12 Nov 2015 12:53:40 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 2FDF9AD40;
	Thu, 12 Nov 2015 17:53:17 +0000 (UTC)
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
	<b30d80546421c6ea919096b596887f496c80af0a.1446813769.git.mjt@msgid.tls.msk.ru>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Linux GmbH
Message-ID: <5644D222.3070408@suse.de>
Date: Thu, 12 Nov 2015 18:53:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <b30d80546421c6ea919096b596887f496c80af0a.1446813769.git.mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Cao jin <caoj.fnst@cn.fujitsu.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 17/24] qom/object: fix 2
	comment typos
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
X-List-Received-Date: Thu, 12 Nov 2015 17:53:46 -0000

Am 06.11.2015 um 13:43 schrieb Michael Tokarev:
> From: Cao jin <caoj.fnst@cn.fujitsu.com>
>=20
> Also change the misleading definition of macro OBJECT_CLASS_CHECK
>=20
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

Michael, please *STOP* queuing QOM patches! You merged the unfixed
version now - it's supposed to have just "qom:", and the parenthesis and
full stop are missing, too, that I had on qom-next before it disappeared
with today's rebase...

And why was I not CC'ed on this submission as include/qom/object.h
maintainer? You did not reply to the patch either, where I did.

Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG N=FC=
rnberg)

