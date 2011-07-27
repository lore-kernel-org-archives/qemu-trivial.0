Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qm5JP-00016r-R4
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jul 2011 10:42:15 -0400
Received: from eggs.gnu.org ([140.186.70.92]:50778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1Qm5JM-000166-RI
	for qemu-trivial@nongnu.org; Wed, 27 Jul 2011 10:42:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1Qm5JL-0000Vw-OZ
	for qemu-trivial@nongnu.org; Wed, 27 Jul 2011 10:42:12 -0400
Received: from e32.co.us.ibm.com ([32.97.110.150]:34493)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>)
	id 1Qm5JL-0000Vm-IE; Wed, 27 Jul 2011 10:42:11 -0400
Received: from d03relay01.boulder.ibm.com (d03relay01.boulder.ibm.com
	[9.17.195.226])
	by e32.co.us.ibm.com (8.14.4/8.13.1) with ESMTP id p6RDWER0012766;
	Wed, 27 Jul 2011 07:32:14 -0600
Received: from d03av06.boulder.ibm.com (d03av06.boulder.ibm.com [9.17.195.245])
	by d03relay01.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	p6REg3oQ194230; Wed, 27 Jul 2011 08:42:03 -0600
Received: from d03av06.boulder.ibm.com (loopback [127.0.0.1])
	by d03av06.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id p6RElaO3011191; Wed, 27 Jul 2011 08:47:37 -0600
Received: from [9.53.41.195] (illuin.austin.ibm.com [9.53.41.195] (may be
	forged))
	by d03av06.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	p6RElae6011154; Wed, 27 Jul 2011 08:47:36 -0600
Message-ID: <4E3023BA.3030105@linux.vnet.ibm.com>
Date: Wed, 27 Jul 2011 09:42:02 -0500
From: Michael Roth <mdroth@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: Alexandre Raymond <cerbere@gmail.com>
References: <1311652562-10794-1-git-send-email-cerbere@gmail.com>
	<1311652562-10794-2-git-send-email-cerbere@gmail.com>
	<m339htczcl.fsf@blackfin.pond.sub.org>
	<CAHWZs7UG9NrAQKAtJN2+eQtbOOGFZrotdfSg3PhQ+FD_mRX4-w@mail.gmail.com>
	<m3k4b4z2nh.fsf@blackfin.pond.sub.org>
	<CAHWZs7VbfrECzwb08-vjRJLcoGXo-OnmPJg0C436qa5FHzFeKA@mail.gmail.com>
In-Reply-To: <CAHWZs7VbfrECzwb08-vjRJLcoGXo-OnmPJg0C436qa5FHzFeKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by e32.co.us.ibm.com id
	p6RDWER0012766
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 32.97.110.150
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Qemu Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] Makefile: distclean
 should clean all possible targets
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
X-List-Received-Date: Wed, 27 Jul 2011 14:42:14 -0000

On 07/27/2011 08:55 AM, Alexandre Raymond wrote:
>> There are many more object files that are built conditionally.  Why is
>> it okay not to delete them?
>
> Perhaps they should be deleted too...
>
> The GNU Make manual says the following about "distclean":
> http://www.gnu.org/s/hello/manual/make/Standard-Targets.html
>
> "Delete all files in the current directory (or created by this
> makefile) that are created by configuring or building the program. If
> you have unpacked the source and built the program without creating
> any other files, =E2=80=98make distclean=E2=80=99 should leave only the=
 files that
> were in the distribution. However, there is no need to delete parent
> directories that were created with =E2=80=98mkdir -p=E2=80=99, since th=
ey could have
> existed anyway. "
>
> Now, if everyone agrees that "distclean" is fine as it is, I won't
> insist on anything.
>
>

I'm with you in that distclean to me reads as "make clean for=20
re-distribution". i.e. a pristine source tree.

But I do agree that if we want to implement it in that fashion there=20
would be a bit more work to do.

>>
>> If you unwisely messed up your source tree by building in it, a simple
>> and reliable way out is to git-clone yourself a new one.  Or if you
>> insist on recovering in-place, remove files outside .git that aren't i=
n
>> git.
>>
>
> Indeed.
>
> Alexandre
>


