Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TbDnj-000348-Kc
	for mharc-qemu-trivial@gnu.org; Wed, 21 Nov 2012 12:09:27 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1TbDnh-0002xB-5P
	for qemu-trivial@nongnu.org; Wed, 21 Nov 2012 12:09:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1TbDnf-0005v4-MM
	for qemu-trivial@nongnu.org; Wed, 21 Nov 2012 12:09:25 -0500
Received: from cantor2.suse.de ([195.135.220.15]:38883 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1TbDnT-0005pe-I8; Wed, 21 Nov 2012 12:09:11 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 851CFA3D7A;
	Wed, 21 Nov 2012 18:09:10 +0100 (CET)
Message-ID: <50AD0AB3.7020207@suse.de>
Date: Wed, 21 Nov 2012 18:09:07 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121025 Thunderbird/16.0.2
MIME-Version: 1.0
To: Richard Henderson <rth@twiddle.net>
References: <1351805797-31899-1-git-send-email-rth@twiddle.net>
	<50AD06A6.3000602@twiddle.net>
In-Reply-To: <50AD06A6.3000602@twiddle.net>
X-Enigmail-Version: 1.5a1pre
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/3] trivial: Remove some
 pre-TCG CPUArchState members
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
X-List-Received-Date: Wed, 21 Nov 2012 17:09:26 -0000

Am 21.11.2012 17:51, schrieb Richard Henderson:
> Ping.

I had a brief look at these when you posted this, and it's generally
fine with me. I just didn't get around to testing/verifying yet.

Not sure if this fits our current Hard Freeze definition though. ;)

Andreas

>=20
> On 2012-11-01 14:36, Richard Henderson wrote:
>> Best I can figure, these temporaries were used by the dyngen
>> code generator, last seen in qemu 0.9.0.  Certainly there are
>> no references to these members remaining.
>>
>> Built x86_64 and i686 hosts.
>>
>>
>> r~
>>
>>
>> Richard Henderson (3):
>>   target-alpha: Remove t0, t1 from CPUAlphaState
>>   target-m68k: Remove t1 from CPUM68KState
>>   target-sparc: Remove t0, t1 from CPUSPARCState
>>
>>  target-alpha/cpu.h | 7 -------
>>  target-m68k/cpu.h  | 3 ---
>>  target-sparc/cpu.h | 1 -
>>  3 files changed, 11 deletions(-)

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

