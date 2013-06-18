Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uomw0-0005ln-NF
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jun 2013 23:50:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uomvx-0005gg-Ms
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 23:50:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uomvw-0001TT-AM
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 23:50:17 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35334)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Uomvt-0001Sv-T4; Mon, 17 Jun 2013 23:50:14 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8A71541974;
	Tue, 18 Jun 2013 07:50:12 +0400 (MSK)
Message-ID: <51BFD8F3.8050807@msgid.tls.msk.ru>
Date: Tue, 18 Jun 2013 07:50:11 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: li guang <lig.fnst@cn.fujitsu.com>
References: <1370927720-4348-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<1370927720-4348-4-git-send-email-lig.fnst@cn.fujitsu.com>
	<51B70B35.3090305@msgid.tls.msk.ru>
	<1371522779.31705.29.camel@liguang.fnst.cn.fujitsu.com>
In-Reply-To: <1371522779.31705.29.camel@liguang.fnst.cn.fujitsu.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/5] memory: use '=' instead
 of '|=' for memory_region_update_pending
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
X-List-Received-Date: Tue, 18 Jun 2013 03:50:18 -0000

18.06.2013 06:32, li guang =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> =E5=9C=A8 2013-06-11=E4=BA=8C=E7=9A=84 15:34 +0400=EF=BC=8CMichael Toka=
rev=E5=86=99=E9=81=93=EF=BC=9A
>> 11.06.2013 09:15, liguang wrote:
>>> because memory_region_update_pending is bool
>>>
>>> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
>>> ---
>>>  memory.c |   18 +++++++++---------
>>>  1 files changed, 9 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/memory.c b/memory.c
>>> index 5cb8f4a..d99eecd 100644
>>> --- a/memory.c
>>> +++ b/memory.c
>>> @@ -1114,7 +1114,7 @@ void memory_region_set_log(MemoryRegion *mr, bo=
ol log, unsigned client)
>>> =20
>>>      memory_region_transaction_begin();
>>>      mr->dirty_log_mask =3D (mr->dirty_log_mask & ~mask) | (log * mas=
k);
>>> -    memory_region_update_pending |=3D mr->enabled;
>>> +    memory_region_update_pending =3D mr->enabled;
>>
>> This is wrong, and the original code was right.  Here and in all other=
 places.
>=20
> Is it valid to do '|' operation for boolean?

Yes it is.  Why do you think it might be problematic?

Thanks,

/mjt

