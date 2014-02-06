Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WBKhy-0007MD-6p
	for mharc-qemu-trivial@gnu.org; Thu, 06 Feb 2014 03:53:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1WBKhs-0007ES-90
	for qemu-trivial@nongnu.org; Thu, 06 Feb 2014 03:53:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1WBKhn-0001Br-Tl
	for qemu-trivial@nongnu.org; Thu, 06 Feb 2014 03:53:12 -0500
Received: from host-82-135-62-35.customer.m-online.net ([82.135.62.35]:38373
	helo=mail.embedded-brains.de) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1WBKhe-00019S-FS; Thu, 06 Feb 2014 03:52:58 -0500
Received: by mail.embedded-brains.de (Postfix, from userid 65534)
	id 33760652CF6; Thu,  6 Feb 2014 09:52:54 +0100 (CET)
Received: from [192.168.100.11] (unknown [192.168.100.11])
	by mail.embedded-brains.de (Postfix) with ESMTP id 955D765205E;
	Thu,  6 Feb 2014 09:52:54 +0100 (CET)
Message-ID: <52F34D61.6010809@embedded-brains.de>
Date: Thu, 06 Feb 2014 09:52:49 +0100
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1391419091-3020-1-git-send-email-sebastian.huber@embedded-brains.de>
	<52F34A67.7060902@msgid.tls.msk.ru>
In-Reply-To: <52F34A67.7060902@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 82.135.62.35
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] sparc/leon3: Initialize
 stack pointer
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
X-List-Received-Date: Thu, 06 Feb 2014 08:53:16 -0000

On 2014-02-06 09:40, Michael Tokarev wrote:
> 03.02.2014 13:18, Sebastian Huber wrote:
>> A lot of real world LEON3 systems are shipped with the GRMON boot
>> loader.  This boot loader initializes the stack pointer with the end o=
f
>> RAM address.  The application can use this to detect the RAM size of a
>> particular board variant.
>
> I don't really know much about sparc or leon3 stuff.  But having a
> reviewed-by from Fabien I can apply it to trivial-patches.  I'm not
> really sure why it can't go to sparc tree instead.

I sent this patch to the trivial patches list, since the last tiny patch =
for=20
the LEON3 was ignored by the SPARC maintainer for several weeks.  Even af=
ter=20
review by Fabien Chouteau and Richard Henderson.

http://lists.gnu.org/archive/html/qemu-devel/2013-11/msg03488.html
http://lists.gnu.org/archive/html/qemu-devel/2014-01/msg01783.html

--=20
Sebastian Huber, embedded brains GmbH

Address : Dornierstr. 4, D-82178 Puchheim, Germany
Phone   : +49 89 189 47 41-16
Fax     : +49 89 189 47 41-09
E-Mail  : sebastian.huber@embedded-brains.de
PGP     : Public key available on request.

Diese Nachricht ist keine gesch=C3=A4ftliche Mitteilung im Sinne des EHUG=
.

