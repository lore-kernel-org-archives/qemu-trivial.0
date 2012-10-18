Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TOnZN-0007SB-2F
	for mharc-qemu-trivial@gnu.org; Thu, 18 Oct 2012 06:43:17 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1TOnZG-0007Pz-5i
	for qemu-trivial@nongnu.org; Thu, 18 Oct 2012 06:43:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1TOnZF-0007ZC-4K
	for qemu-trivial@nongnu.org; Thu, 18 Oct 2012 06:43:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:19163)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1TOnZE-0007Z8-Sk; Thu, 18 Oct 2012 06:43:09 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q9IAh7Gb001048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 18 Oct 2012 06:43:08 -0400
Received: from dhcp-5-188.str.redhat.com (vpn1-7-183.ams2.redhat.com
	[10.36.7.183])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q9IAh56r014643
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO);
	Thu, 18 Oct 2012 06:43:06 -0400
Message-ID: <507FDD38.2010009@redhat.com>
Date: Thu, 18 Oct 2012 12:43:04 +0200
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Tim Hardeck <thardeck@suse.de>
References: <1350220128-10140-1-git-send-email-thardeck@suse.de>
	<1350220128-10140-3-git-send-email-thardeck@suse.de>
	<507EC7FF.90603@suse.de> <1359569.y3MYGdvym5@thinktank.site>
In-Reply-To: <1359569.y3MYGdvym5@thinktank.site>
Content-Type: text/plain; charset=ISO-8859-1
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	q9IAh7Gb001048
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] qemu queue: fix
	uninitialized removals
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
X-List-Received-Date: Thu, 18 Oct 2012 10:43:16 -0000

Am 17.10.2012 23:24, schrieb Tim Hardeck:
> Hi Andreas,
>=20
> On Wednesday 17 October 2012 17:00:15 Andreas F=E4rber wrote:
>> Tim,
>>
>> Am 14.10.2012 15:08, schrieb Tim Hardeck:
>>> When calling QTAILQ_REMOVE or QLIST_REMOVE on an unitialized list
>>> QEMU segfaults.
>>
>> Can this be reproduced by a user today? Or is this just fixing the cas=
e
>> that a developer forgot to initialize a list?
> I am not sure but in this case it happened during an early VNC connecti=
on=20
> state failure which most likely wouldn't happen to regular users.
> I triggered it while working on the VNC connection part.
>=20
> The issue could most likely be also fixed in the VNC connection initial=
ization=20
> process but if this changes doesn't have a relevant performance impact =
they=20
> might prevent some other/future crashes.

At the same time, it could be hiding real bugs, where ignoring the
QLIST_REMOVE() isn't the right fix. I can see your point, but I would be
careful with making interfaces less strict.

In any case, I don't think this qualifies for qemu-trivial, Andreas.

Kevin

