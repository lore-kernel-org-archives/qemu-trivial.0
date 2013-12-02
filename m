Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VnbhO-0001Di-2q
	for mharc-qemu-trivial@gnu.org; Mon, 02 Dec 2013 17:10:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1VnbhC-00014f-92
	for qemu-trivial@nongnu.org; Mon, 02 Dec 2013 17:10:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Vnbh4-00087r-Ow
	for qemu-trivial@nongnu.org; Mon, 02 Dec 2013 17:10:26 -0500
Received: from cantor2.suse.de ([195.135.220.15]:34492 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Vnbgp-0007tj-1O; Mon, 02 Dec 2013 17:10:03 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 822A5A7B6A;
	Mon,  2 Dec 2013 23:09:59 +0100 (CET)
Message-ID: <529D0533.7090402@suse.de>
Date: Mon, 02 Dec 2013 23:09:55 +0100
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>,
	Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1385350750-21468-1-git-send-email-aik@ozlabs.ru>
	<529CBE15.8010206@msgid.tls.msk.ru>
In-Reply-To: <529CBE15.8010206@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
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
X-List-Received-Date: Mon, 02 Dec 2013 22:10:35 -0000

Am 02.12.2013 18:06, schrieb Michael Tokarev:
> 25.11.2013 07:39, Alexey Kardashevskiy wrote:
>> Since modern POWER7/POWER8 chips can have more that 256 CPU threads
>> (>2000 actually), remove this check from smp_parse.
>>
>> The CPUs number is still checked against machine->max_cpus and this ch=
eck
>> should be enough not to break other archs.

"should be" is not exactly the highest level of confidence for a
"trivial" patch... :/

> []
>> -    if (max_cpus > 255) {
>> -        fprintf(stderr, "Unsupported number of maxcpus\n");
>> -        exit(1);
>> -    }

I believe Eduardo touched that code last for NUMA, so let's CC him.

> I don't know whenever this is actually safe.  Do we have any static arr=
ays
> of size 255 somewhere, which will be overflowed without this check? :)

s390 has the ipi_states[] array, but not fixed to that size.

x86 APIC IDs I think have or had a limitation to 255 rather than 16-bit?
Igor?

Alexey, did you actually check that, e.g., x86 machines don't break with
256 or 257 CPUs now?

Adding a qtest would be one way to prove that at least the QEMU code of
all other architectures doesn't break with the ppc change.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

