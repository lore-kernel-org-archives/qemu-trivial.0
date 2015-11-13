Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zx99X-0001Dz-Rb
	for mharc-qemu-trivial@gnu.org; Fri, 13 Nov 2015 02:52:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Zx99U-000172-Km
	for qemu-trivial@nongnu.org; Fri, 13 Nov 2015 02:52:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Zx99T-0005a3-Of
	for qemu-trivial@nongnu.org; Fri, 13 Nov 2015 02:52:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52811)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Zx99P-0005ZE-Cx; Fri, 13 Nov 2015 02:52:03 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id B53F842E5A0;
	Fri, 13 Nov 2015 07:52:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAD7q0Av029245
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 13 Nov 2015 02:52:01 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B941D303F90B; Fri, 13 Nov 2015 08:51:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
	<b30d80546421c6ea919096b596887f496c80af0a.1446813769.git.mjt@msgid.tls.msk.ru>
	<5644D222.3070408@suse.de> <5644DB6D.4030308@msgid.tls.msk.ru>
Date: Fri, 13 Nov 2015 08:51:59 +0100
In-Reply-To: <5644DB6D.4030308@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Thu, 12 Nov 2015 21:33:17 +0300")
Message-ID: <87k2pmbalc.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Cao jin <caoj.fnst@cn.fujitsu.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 17/24] qom/object: fix 2
	comment typos
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
X-List-Received-Date: Fri, 13 Nov 2015 07:52:10 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 12.11.2015 20:53, Andreas F=C3=A4rber wrote:
>> Am 06.11.2015 um 13:43 schrieb Michael Tokarev:
>>> From: Cao jin <caoj.fnst@cn.fujitsu.com>
>>>
>>> Also change the misleading definition of macro OBJECT_CLASS_CHECK
>>>
>>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>>=20
>> Michael, please *STOP* queuing QOM patches! You merged the unfixed
>
> I think I do more harm to the project than good, these days.

Nope, you'd have to try much harder for that ;-P

Mistakes happen.  Grieving over them isn't productive.  Looking for
clues on how to avoid repetition can be.

In this particular case, you tried to help out a maintainer, and the
maintainer didn't like the result.  Possible strategy:

0. Make sure to cc: maintainers in your reply to the patch.

1. If you judge the patch not to be trivial, say so.

2. For maintainers who prefer not to be helped out by -trivial (in your
   subjective judgement), reply that you're going to take this only if
   the maintainer gives his blessings.

3. Else, do your usual review and "applied to -trivial" thing.
   Additionally, add any missing cc: maintainer(s) when you commit.
   Perhaps you can even automate this step.  That way, they get cc'ed on
   your pull request, too, giving them a last chance to veto a patch
   they missed / ignored until then.

Basically, just what you do know plus systematic cc'ing.

Thanks for serving as -trivial maintainer!

[...]

