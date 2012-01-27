Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RqlnG-0005YE-0C
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 08:24:42 -0500
Received: from eggs.gnu.org ([140.186.70.92]:39487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Rqln8-00054l-4U
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 08:24:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Rqln6-0003M7-Vm
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 08:24:34 -0500
Received: from cantor2.suse.de ([195.135.220.15]:33371 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Rqlmz-0003L4-Hs; Fri, 27 Jan 2012 08:24:25 -0500
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id E865390349;
	Fri, 27 Jan 2012 14:24:23 +0100 (CET)
Message-ID: <4F22A502.5020509@suse.de>
Date: Fri, 27 Jan 2012 14:22:10 +0100
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111220 Thunderbird/9.0
MIME-Version: 1.0
To: Anthony Liguori <anthony@codemonkey.ws>
References: <1327425457-31313-1-git-send-email-afaerber@suse.de>	<20120127062355.GA20307@stefanha-thinkpad.localdomain>
	<4F2270A3.4060707@suse.de> <4F229B8E.6000908@codemonkey.ws>
In-Reply-To: <4F229B8E.6000908@codemonkey.ws>
X-Enigmail-Version: 1.3.4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: Kevin Wolf <kwolf@redhat.com>, Blue Swirl <blauwirbel@gmail.com>,
	Anthony Liguori <aliguori@us.ibm.com>,
	Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Vasilis Liaskovitis <vasilis.liaskovitis@profitbricks.com>,
	Jan Kiszka <jan.kiszka@siemens.com>, Amit Shah <amit.shah@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v6] qdev: Add support for
	property type bool
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
X-List-Received-Date: Fri, 27 Jan 2012 13:24:40 -0000

Am 27.01.2012 13:41, schrieb Anthony Liguori:
> On 01/27/2012 03:38 AM, Andreas F=E4rber wrote:
>> Am 27.01.2012 07:23, schrieb Stefan Hajnoczi:
>>> On Tue, Jan 24, 2012 at 06:17:36PM +0100, Andreas F=E4rber wrote:
>>>> From: Andreas F=E4rber<andreas.faerber@web.de>
>>>>
>>>> VMState supports the type bool but qdev instead supports bit, backed=
 by
>>>> uint32_t. Therefore let's add DEFINE_PROP_BOOL() and
>>>> qdev_prop_set_bool().
>>>>
>>>> bool by definition is either true or false. Should the need arise to
>>>> parse yes/no, on/off, 1/0 or whatever as well, we can still add that=
 at
>>>> a later point in time.
>>>>
>>>> Signed-off-by: Andreas F=E4rber<andreas.faerber@web.de>
>>>> Cc: Juan Quintela<quintela@redhat.com>
>>>> Cc: Markus Armbruster<armbru@redhat.com>
>>>> Cc: Jan Kiszka<jan.kiszka@siemens.com>
>>>> Cc: Vasilis Liaskovitis<vasilis.liaskovitis@profitbricks.com>
>>>> ---
>>>>   v5 ->  v6:
>>>
>>> Please merge through a qemu.git committer.  v6 and discussion means t=
his
>>> isn't trivial.
>>
>> Unfortunately that hasn't happened for half a year though. Generally n=
o
>> qemu.git committer seems to care about cherry-picking useful
>> infrastructures from bigger series even once discussions are resolved.
>=20
> So... why are we introducing a type that's not being used anywhere?
>=20
> Are you planning to use this type somewhere or is this purely speculati=
ve?

My ISA series and later the 40P series used it (therefore
"cherry-picking" above; additionally it turned out recently that there
had been confusion over who was supposed to pull for PReP - thanks for
recently doing so btw).

Now Jan and I agreed that Vasilis should reuse it for his series in
place of uint32. Therefore I would've appreciated a quick merge (thus
qemu-trivial) so that it can be rebased upon.

Unfortunately I didn't have code for testing all paths handy, my bad.

But nevertheless all these discussions never opposed the core idea, only
the exact way things were printed or parsed. When using
qdev_prop_set_bool() internally, like I did for the pc87312 Super I/O,
none of this matters except for 'info qtree'. So if we could decide on
the DEFINE_PROP_*() macro name, all of the parsing and printing can
still be changed back and forth in a central place including when
someone ventures to translate QEMU to non-English, then everything gets
ugly anyway. :) Correct me if I'm wrong, but as far as I saw, your QOM
series only moved this around and the qdev macros remained.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

