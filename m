Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vnq4S-0001je-3N
	for mharc-qemu-trivial@gnu.org; Tue, 03 Dec 2013 08:31:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Vnq4I-0001Tz-UH
	for qemu-trivial@nongnu.org; Tue, 03 Dec 2013 08:31:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Vnq4B-0006wd-JE
	for qemu-trivial@nongnu.org; Tue, 03 Dec 2013 08:31:14 -0500
Received: from cantor2.suse.de ([195.135.220.15]:33599 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Vnq3w-0006uV-EV; Tue, 03 Dec 2013 08:30:52 -0500
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 5BE0FA7B7E;
	Tue,  3 Dec 2013 14:30:51 +0100 (CET)
Message-ID: <529DDD08.4030206@suse.de>
Date: Tue, 03 Dec 2013 14:30:48 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1385350750-21468-1-git-send-email-aik@ozlabs.ru>	<529CBE15.8010206@msgid.tls.msk.ru>
	<529D0533.7090402@suse.de> <529D11C5.2080505@ozlabs.ru>
In-Reply-To: <529D11C5.2080505@ozlabs.ru>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl: remove (max_cpus > 255)
 check from smp_parse
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
X-List-Received-Date: Tue, 03 Dec 2013 13:31:22 -0000

Am 03.12.2013 00:03, schrieb Alexey Kardashevskiy:
> On 12/03/2013 09:09 AM, Andreas F=C3=A4rber wrote:
>> Am 02.12.2013 18:06, schrieb Michael Tokarev:
>>> 25.11.2013 07:39, Alexey Kardashevskiy wrote:
>>>> Since modern POWER7/POWER8 chips can have more that 256 CPU threads
>>>> (>2000 actually), remove this check from smp_parse.
>>>>
>>>> The CPUs number is still checked against machine->max_cpus and this =
check
>>>> should be enough not to break other archs.
>>
>> "should be" is not exactly the highest level of confidence for a
>> "trivial" patch... :/
[...]
>> Alexey, did you actually check that, e.g., x86 machines don't break wi=
th
>> 256 or 257 CPUs now?
>=20
> PC_DEFAULT_MACHINE_OPTIONS sets it to 255. And I cannot find any machin=
e
> which would not define max_cpus, have I missed any?

If you've actually *checked* the other machines' code then fine with me,
just say so in the commit message. :)

Cheers,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

