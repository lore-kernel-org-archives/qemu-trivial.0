Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UaiNw-0005qp-3A
	for mharc-qemu-trivial@gnu.org; Fri, 10 May 2013 04:09:00 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UaiNs-0005ll-MY
	for qemu-trivial@nongnu.org; Fri, 10 May 2013 04:08:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UaiNq-0006oV-Om
	for qemu-trivial@nongnu.org; Fri, 10 May 2013 04:08:56 -0400
Received: from cantor2.suse.de ([195.135.220.15]:44471 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UaiNm-0006n4-Up; Fri, 10 May 2013 04:08:51 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id F0764A55CB;
	Fri, 10 May 2013 10:08:49 +0200 (CEST)
Message-ID: <518CAB0D.7040904@suse.de>
Date: Fri, 10 May 2013 10:08:45 +0200
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1368006380-3125-1-git-send-email-trivial@linux.vnet.ibm.com>
	<1368006380-3125-2-git-send-email-trivial@linux.vnet.ibm.com>
	<518A4A2E.200@msgid.tls.msk.ru> <87vc6t61te.fsf@codemonkey.ws>
	<518B40CD.7030604@msgid.tls.msk.ru>
In-Reply-To: <518B40CD.7030604@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Trival <trivial@linux.vnet.ibm.com>,
	qemu-devel@nongnu.org, Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] remove needless
	semicolon
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
X-List-Received-Date: Fri, 10 May 2013 08:08:59 -0000

Am 09.05.2013 08:23, schrieb Michael Tokarev:
> 08.05.2013 17:25, Anthony Liguori wrote:
>> Michael Tokarev <mjt@tls.msk.ru> writes:
>>
>>> 08.05.2013 13:46, Trival wrote:
>>>> Signed-off-by: Trival <trivial@linux.vnet.ibm.com>
>>
>> Something went wrong in sending this.  This is not a valid SoB.
>=20
> So, do we not accept it?

No, we don't. See SubmitAPatch.

>  Should I revert it in the
> trivial-patches-next ?

Yes, please drop it from your queue until you get a replacement (or
instructions from the author how to fix it up).

Cheers,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

