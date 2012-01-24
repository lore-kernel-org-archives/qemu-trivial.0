Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rpf8B-0000f4-SL
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2012 07:05:43 -0500
Received: from eggs.gnu.org ([140.186.70.92]:51245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Rpf84-0000OE-4o
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2012 07:05:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Rpf7y-00084a-Cm
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2012 07:05:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:64792)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Rpf7s-00083u-RT; Tue, 24 Jan 2012 07:05:25 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0OC5NSJ008692
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 24 Jan 2012 07:05:24 -0500
Received: from blackfin.pond.sub.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q0OC5Mcv000731; Tue, 24 Jan 2012 07:05:23 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 23EF06006E; Tue, 24 Jan 2012 13:05:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jan Kiszka <jan.kiszka@web.de>
References: <4F1AC0EB.3050304@web.de> <4F1AE974.2090401@suse.de>
	<4F1AF0E2.8050907@web.de>
Date: Tue, 24 Jan 2012 13:05:22 +0100
In-Reply-To: <4F1AF0E2.8050907@web.de> (Jan Kiszka's message of "Sat, 21 Jan
	2012 18:07:46 +0100")
Message-ID: <m3zkddmhkt.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qdev-property: Make bit
	property parsing stricter
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
X-List-Received-Date: Tue, 24 Jan 2012 12:05:42 -0000

Jan Kiszka <jan.kiszka@web.de> writes:

> On 2012-01-21 17:36, Andreas F=C3=A4rber wrote:
>> Am 21.01.2012 14:43, schrieb Jan Kiszka:
>>> By using strncasecmp, we allow for arbitrary characters after the
>>> "on"/"off" string. Fix this by switching to strcasecmp.
>>>
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>=20
>> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>=20
>> An alternative might be to increase the char count by one. For a const
>> char* parameter I see the responsibility for nul-terminating at the
>> caller though, so this seems right. Did you check all callers?
>
> For any normal function that takes a char * string without a maximum
> length, the responsibility for terminating is on caller side. Also
> because we checks against patterns of different length. So we don't need
> to jump through hoops here.

I agree.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

