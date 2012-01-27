Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RqiJ6-0001ja-8Z
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 04:41:20 -0500
Received: from eggs.gnu.org ([140.186.70.92]:59304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RqiIy-0001GV-1s
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 04:41:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RqiIu-0007xp-47
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 04:41:11 -0500
Received: from cantor2.suse.de ([195.135.220.15]:50274 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1RqiIj-0007wl-FH; Fri, 27 Jan 2012 04:40:57 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id D62E48C061;
	Fri, 27 Jan 2012 10:40:55 +0100 (CET)
Message-ID: <4F2270A3.4060707@suse.de>
Date: Fri, 27 Jan 2012 10:38:43 +0100
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111220 Thunderbird/9.0
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>,
	Vasilis Liaskovitis <vasilis.liaskovitis@profitbricks.com>
References: <1327425457-31313-1-git-send-email-afaerber@suse.de>
	<20120127062355.GA20307@stefanha-thinkpad.localdomain>
In-Reply-To: <20120127062355.GA20307@stefanha-thinkpad.localdomain>
X-Enigmail-Version: 1.3.4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: Kevin Wolf <kwolf@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>,
	Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
	Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Blue Swirl <blauwirbel@gmail.com>,
	Amit Shah <amit.shah@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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
X-List-Received-Date: Fri, 27 Jan 2012 09:41:18 -0000

Am 27.01.2012 07:23, schrieb Stefan Hajnoczi:
> On Tue, Jan 24, 2012 at 06:17:36PM +0100, Andreas F=E4rber wrote:
>> From: Andreas F=E4rber <andreas.faerber@web.de>
>>
>> VMState supports the type bool but qdev instead supports bit, backed b=
y
>> uint32_t. Therefore let's add DEFINE_PROP_BOOL() and qdev_prop_set_boo=
l().
>>
>> bool by definition is either true or false. Should the need arise to
>> parse yes/no, on/off, 1/0 or whatever as well, we can still add that a=
t
>> a later point in time.
>>
>> Signed-off-by: Andreas F=E4rber <andreas.faerber@web.de>
>> Cc: Juan Quintela <quintela@redhat.com>
>> Cc: Markus Armbruster <armbru@redhat.com>
>> Cc: Jan Kiszka <jan.kiszka@siemens.com>
>> Cc: Vasilis Liaskovitis <vasilis.liaskovitis@profitbricks.com>
>> ---
>>  v5 -> v6:
>=20
> Please merge through a qemu.git committer.  v6 and discussion means thi=
s
> isn't trivial.

Unfortunately that hasn't happened for half a year though. Generally no
qemu.git committer seems to care about cherry-picking useful
infrastructures from bigger series even once discussions are resolved.

And for the record, it's net v3 as shown in the part you snipped.

Vasilis, unless Jan or someone has further nitpicks, just prepend my v8
to your series and reuse its DEFINE_PROP_BOOL().

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

