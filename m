Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g86sO-00071p-Rf
	for mharc-qemu-trivial@gnu.org; Thu, 04 Oct 2018 12:53:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1g86sN-00070V-3g
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 12:53:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1g86sM-0007aP-6k
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 12:53:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39284)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1g86sC-0006n0-Sy; Thu, 04 Oct 2018 12:53:14 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A42F46202;
	Thu,  4 Oct 2018 16:53:09 +0000 (UTC)
Received: from dhcp-17-10.bos.redhat.com (dhcp-17-10.bos.redhat.com
	[10.18.17.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FD232DE68;
	Thu,  4 Oct 2018 16:53:08 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-2-crosa@redhat.com>
	<5616e4d4-938c-4e5f-6fe0-64e52d2fe6a7@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <0a405ae6-d69a-8e04-e3dc-3b7883447248@redhat.com>
Date: Thu, 4 Oct 2018 12:53:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <5616e4d4-938c-4e5f-6fe0-64e52d2fe6a7@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 04 Oct 2018 16:53:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 01/10] qemu-img.c: comment
 typo fix
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2018 16:53:23 -0000



On 10/4/18 12:48 PM, Eric Blake wrote:
> On 10/4/18 11:18 AM, Cleber Rosa wrote:
>> A trivial comment typo fix.
>>
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> ---
>> =C2=A0 qemu-img.c | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/qemu-img.c b/qemu-img.c
>> index b12f4cd19b..a96b76c187 100644
>> --- a/qemu-img.c
>> +++ b/qemu-img.c
>> @@ -1085,7 +1085,7 @@ static int64_t find_nonzero(const uint8_t *buf,
>> int64_t n)
>> =C2=A0 }
>> =C2=A0 =C2=A0 /*
>> - * Returns true iff the first sector pointed to by 'buf' contains at
>> least
>> + * Returns true if the first sector pointed to by 'buf' contains at
>> least
>=20
> NACK.=C2=A0 You're not the first person to propose this change.=C2=A0 H=
owever,
> "iff" is an English word (albeit archaic) which is shorthand for "if an=
d
> only if", which has a distinct logical meaning separate from the weaker
> "if".=C2=A0 Spelling it out in longhand instead of calling it a typo is
> probably acceptable, though.
>=20

Wow, thanks for the explanation.  I agree that spelling it out is a good
option, as it'll probably prevent other people from falling into the
same "language trap" as I did.

Thanks!
- Cleber.

