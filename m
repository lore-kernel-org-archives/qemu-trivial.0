Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UXaqh-0007ge-UD
	for mharc-qemu-trivial@gnu.org; Wed, 01 May 2013 13:29:47 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UXaqf-0007dN-C3
	for qemu-trivial@nongnu.org; Wed, 01 May 2013 13:29:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UXaqe-0000mc-Al
	for qemu-trivial@nongnu.org; Wed, 01 May 2013 13:29:45 -0400
Received: from cantor2.suse.de ([195.135.220.15]:35891 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UXaqY-0000hW-4r; Wed, 01 May 2013 13:29:38 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 5384AA50DE;
	Wed,  1 May 2013 19:29:37 +0200 (CEST)
Message-ID: <518150FE.1000501@suse.de>
Date: Wed, 01 May 2013 19:29:34 +0200
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1367290790-19159-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<51814C37.4060000@msgid.tls.msk.ru>
In-Reply-To: <51814C37.4060000@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>, liguang <lig.fnst@cn.fujitsu.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] translate: remove
	redundantly included qemu/timer.h
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
X-List-Received-Date: Wed, 01 May 2013 17:29:46 -0000

Am 01.05.2013 19:09, schrieb Michael Tokarev:
> 30.04.2013 06:59, liguang wrote:
>> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
>> ---
>>  translate-all.c |    1 -
>>  1 files changed, 0 insertions(+), 1 deletions(-)
>=20
> Hmm.  Does we require S-o-b line even for such a trivial (but neverthel=
ess important) stuff?

Yes: http://wiki.qemu.org/Contribute/SubmitAPatch

If it's missing, author can either reply with Signed-off-by - if you're
willing to fix it up - or resend.

And whenever you pick up patches, you sign them off as well.

> Also, Peter, does your followup email mean your Rewieved-by should be a=
dded too?

No, generally not if it was not explicitly given. Exception from the
rule: We have allowed to turn an informal "ack" into an Acked-by.

Thanks for taking over qemu-trivial!

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

