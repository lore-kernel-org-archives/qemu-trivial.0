Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZVGWB-00059E-C2
	for mharc-qemu-trivial@gnu.org; Fri, 28 Aug 2015 06:04:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZVGW6-00054D-Iq
	for qemu-trivial@nongnu.org; Fri, 28 Aug 2015 06:04:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZVGW5-0005ea-OJ
	for qemu-trivial@nongnu.org; Fri, 28 Aug 2015 06:04:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52089)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZVGVx-0005bk-Gw; Fri, 28 Aug 2015 06:04:05 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 0E2168F017;
	Fri, 28 Aug 2015 10:04:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-73.ams2.redhat.com
	[10.36.116.73])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7SA43XF011633
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 28 Aug 2015 06:04:04 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 754ED303F90B; Fri, 28 Aug 2015 12:04:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?B?S8WRdsOhZ8OzIFpvbHTDoW4=?= <dirty.ice.hu@gmail.com>
References: <cff8241a8e30f0d39e0f50a435965cdd130cd5d5.1436279924.git.DirtY.iCE.hu@gmail.com>
	<CAJSP0QXj07FKi9g0B6mF9nbZi-inPQMEFrVZ_a6w5WPwbJycLQ@mail.gmail.com>
	<878u8ynqbx.fsf@blackfin.pond.sub.org> <55DE3E58.4070906@gmail.com>
Date: Fri, 28 Aug 2015 12:04:02 +0200
In-Reply-To: <55DE3E58.4070906@gmail.com> (=?utf-8?B?IkvFkXbDoWfDsyBab2x0?=
	=?utf-8?B?w6FuIidz?= message of "Thu, 27 Aug 2015 00:31:52 +0200")
Message-ID: <87zj1bbugd.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Stefan Hajnoczi <stefanha@gmail.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] opts: produce valid
	command line in qemu_opts_print
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
X-List-Received-Date: Fri, 28 Aug 2015 10:04:18 -0000

"K=C5=91v=C3=A1g=C3=B3 Zolt=C3=A1n" <dirty.ice.hu@gmail.com> writes:

> 2015-08-26 15:15 keltez=C3=A9ssel, Markus Armbruster =C3=ADrta:
>> Stefan Hajnoczi <stefanha@gmail.com> writes:
>>
>>> On Tue, Jul 7, 2015 at 3:42 PM, K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n
>>> <dirty.ice.hu@gmail.com> wrote:
>>>> This will let us print options in a format that the user would actually
>>>> write it on the command line (foo=3Dbar,baz=3Dasd,etc=3Ddef), without
>>>> prepending a spurious comma at the beginning of the list, or quoting
>>>> values unnecessarily.  This patch provides the following changes:
>>>> * write and id=3D, if the option has an id
>>>> * do not print separator before the first element
>>>> * do not quote string arguments
>>>> * properly escape commas (,) for QEMU
>>>>
>>>> Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.=
com>
>>>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>>>
>>> Feel free to send a "Ping" email reply if your patches haven't been
>>> reviewed after about 1 week.
>>>
>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>
>> Route via qemu-trivial or qemu-block?
>>
>
> Hmm, I originally intended qemu-trivial, qemu-block was added via
> scripts/get_maintainer.pl.

If I remember correctly, the initial patch didn't include the iotests
updates.  The current one does.

Let's give the block maintainers a few days to take this patch.  If none
of them bites, it's -trivial.

