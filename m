Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WNfmI-00065K-In
	for mharc-qemu-trivial@gnu.org; Wed, 12 Mar 2014 05:48:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1WNfmC-0005yk-SC
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 05:48:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1WNfm8-00068F-JG
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 05:48:40 -0400
Received: from host-82-135-62-35.customer.m-online.net ([82.135.62.35]:55502
	helo=mail.embedded-brains.de) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1WNflz-0005rL-O4; Wed, 12 Mar 2014 05:48:27 -0400
Received: by mail.embedded-brains.de (Postfix, from userid 65534)
	id A00CA652CFB; Wed, 12 Mar 2014 10:48:23 +0100 (CET)
Received: from [192.168.100.11] (unknown [192.168.100.11])
	by mail.embedded-brains.de (Postfix) with ESMTP id C9F15652CFB;
	Wed, 12 Mar 2014 10:48:21 +0100 (CET)
Message-ID: <53202D65.2090805@embedded-brains.de>
Date: Wed, 12 Mar 2014 10:48:21 +0100
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1392549158-6009-1-git-send-email-sebastian.huber@embedded-brains.de>
	<530D9D92.5030800@embedded-brains.de>
	<53132F68.9070001@msgid.tls.msk.ru>
	<531354A9.9020705@embedded-brains.de>
In-Reply-To: <531354A9.9020705@embedded-brains.de>
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
X-List-Received-Date: Wed, 12 Mar 2014 09:48:45 -0000

Hello,

On 2014-03-02 16:56, Sebastian Huber wrote:
> On 03/02/2014 02:17 PM, Michael Tokarev wrote:
>> 26.02.2014 11:53, Sebastian Huber wrote:
>>> Ping.
>> There was another comment on this, about the first hunk,
>> see https://lists.gnu.org/archive/html/qemu-trivial/2014-02/msg00067.h=
tml
>>
>> Note that the comment below this line mentions the +1 which is
>> being removed.
>
> I think I addressed this issue with the following sentence in the commi=
t
> message of v2:
>
> "Use the GPTIMER counter value for tracing to avoid an overflow of the =
32-bit
> value passed to trace_grlib_gptimer_enable()."
>

should I better split the patch into two parts?

--=20
Sebastian Huber, embedded brains GmbH

Address : Dornierstr. 4, D-82178 Puchheim, Germany
Phone   : +49 89 189 47 41-16
Fax     : +49 89 189 47 41-09
E-Mail  : sebastian.huber@embedded-brains.de
PGP     : Public key available on request.

Diese Nachricht ist keine gesch=E4ftliche Mitteilung im Sinne des EHUG.

