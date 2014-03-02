Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WK8l0-00032u-Vq
	for mharc-qemu-trivial@gnu.org; Sun, 02 Mar 2014 10:56:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1WK8kv-0002wa-7c
	for qemu-trivial@nongnu.org; Sun, 02 Mar 2014 10:56:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1WK8kq-000304-QN
	for qemu-trivial@nongnu.org; Sun, 02 Mar 2014 10:56:45 -0500
Received: from host-82-135-62-35.customer.m-online.net ([82.135.62.35]:53838
	helo=mail.embedded-brains.de) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1WK8kf-0002xP-TC; Sun, 02 Mar 2014 10:56:30 -0500
Received: by mail.embedded-brains.de (Postfix, from userid 65534)
	id A365E652CFF; Sun,  2 Mar 2014 16:56:26 +0100 (CET)
Received: from [192.168.126.38] (38.vpnclient.eb.z [192.168.126.38])
	by mail.embedded-brains.de (Postfix) with ESMTP id 6C1E5652CFC;
	Sun,  2 Mar 2014 16:56:25 +0100 (CET)
Message-ID: <531354A9.9020705@embedded-brains.de>
Date: Sun, 02 Mar 2014 16:56:25 +0100
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1392549158-6009-1-git-send-email-sebastian.huber@embedded-brains.de>
	<530D9D92.5030800@embedded-brains.de>
	<53132F68.9070001@msgid.tls.msk.ru>
In-Reply-To: <53132F68.9070001@msgid.tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 82.135.62.35
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] hw/timer/grlib_gptimer:
 Avoid integer overflows
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
X-List-Received-Date: Sun, 02 Mar 2014 15:56:49 -0000

On 03/02/2014 02:17 PM, Michael Tokarev wrote:
> 26.02.2014 11:53, Sebastian Huber wrote:
>> Ping.
> There was another comment on this, about the first hunk,
> see https://lists.gnu.org/archive/html/qemu-trivial/2014-02/msg00067.ht=
ml
>
> Note that the comment below this line mentions the +1 which is
> being removed.

I think I addressed this issue with the following sentence in the commit=20
message of v2:

"Use the GPTIMER counter value for tracing to avoid an overflow of the=20
32-bit value passed to trace_grlib_gptimer_enable()."

--=20
Sebastian Huber, embedded brains GmbH

Address : Dornierstr. 4, D-82178 Puchheim, Germany
Phone   : +49 89 189 47 41-16
Fax     : +49 89 189 47 41-09
E-Mail  : sebastian.huber@embedded-brains.de
PGP     : Public key available on request.

Diese Nachricht ist keine gesch=E4ftliche Mitteilung im Sinne des EHUG.


