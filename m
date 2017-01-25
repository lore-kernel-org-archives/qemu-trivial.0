Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cWIgq-0005RM-DS
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jan 2017 03:12:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cWIgn-0005PB-Q6
	for qemu-trivial@nongnu.org; Wed, 25 Jan 2017 03:12:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cWIgm-0005Ef-JD
	for qemu-trivial@nongnu.org; Wed, 25 Jan 2017 03:12:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:7041)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cWIgf-0005Cn-Ec; Wed, 25 Jan 2017 03:12:13 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B64E7F368;
	Wed, 25 Jan 2017 08:12:13 +0000 (UTC)
Received: from [10.36.116.44] (ovpn-116-44.ams2.redhat.com [10.36.116.44])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0P8C779000895
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 25 Jan 2017 03:12:10 -0500
To: Valentin Plotkin <caliborn@SDF.ORG>
References: <Pine.NEB.4.64.1701241855380.2138@sdf.lonestar.org>
	<4b93a2b8-097e-a502-875e-21ea394c617a@redhat.com>
	<Pine.NEB.4.64.1701242127070.28647@sdf.lonestar.org>
Cc: Alexander Graf <agraf@suse.de>, David Gibson <david@gibson.dropbear.id.au>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3743fb8d-99cf-1016-facf-a5be3c0b0fdd@redhat.com>
Date: Wed, 25 Jan 2017 09:12:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <Pine.NEB.4.64.1701242127070.28647@sdf.lonestar.org>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 25 Jan 2017 08:12:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-ppc] [PATCH] PPC: MMU compatibility check.
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
X-List-Received-Date: Wed, 25 Jan 2017 08:12:23 -0000

On 24.01.2017 22:41, Valentin Plotkin wrote:
> On Tue, 24 Jan 2017, Thomas Huth wrote:
>=20
>> Date: Tue, 24 Jan 2017 21:32:44 +0100
>> From: Thomas Huth <thuth@redhat.com>
>> To: Valentin Plotkin <caliborn@SDF.ORG>, qemu-trivial@nongnu.org
>> Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
>> Subject: Re: [Qemu-ppc] [PATCH] PPC: MMU compatibility check.
>>
>> On 24.01.2017 19:56, Valentin Plotkin wrote:
>>>
>>> Hi everyone,
>>>
>>> I looked at the "qemu-system-ppc -nographic -cpu G2leGP3 -M ppce500" =
on
>>> the BiteSizedTasks page. The segfault was caused by machine
>>> initialization code which expected a certain MMU model, checked, so
>>> unused SPR were read, returning zeros. bamboo and virtex machines are
>>> affected as well, but it doesn't always cause segfault, usually runni=
ng
>>> into unmapped memory and failing somewhat more nicely.
>>>
>>> I added the checks. It would be possible to add support for other MMU
>>> models, but I'm not sure if there is any point (would any guest OS
>>> support mutually exclusive CPU and machine)?
>>
>> Hi,
>>
>> great to have a fix for this crash! I don't think it make much sense t=
o
>> add support for other MMU models here, so the simple checks should be
>> good enough.
>> However, your new code obviously does not follow the QEMU coding style=
.
>> Could you please run your patch through scripts/checkpatch.pl and fix
>> all issues that it reports? And when you resubmit, please make sure to
>> copy the maintainers on CC: as well (scripts/get_maintainers.pl is you=
r
>> friend here).
>=20
> Here is fengshuised version (at least I hope so). Thanks for guiding me=
.

Thanks, code looks better now!
Now to get your patch included, you've got to send it in a separate
mail, with only the patch description in it, i.e. not as a reply to
another mail with the history of the mail thread. Reason for this is
simply that the maintainers can pick up your patch with "git am" without
having to edit things manually. Please see also
http://qemu-project.org/Contribute/SubmitAPatch#Write_a_meaningful_commit=
_message
if you haven't read that page yet.

Ah, and two more things that came to my mind:

1) Please use "exit(1)" (or "exit(EXIT_FAILURE)") instead of "exit(-1)",
since that's the more common way to do that (since AFAIK the -1 will be
cast to 255 at the shell level, which is just ugly).

2) Maybe it would also be better to do the check right after the
cpu_ppc_init() in the machine's init function already, instead of doing
it in the mmubooke_create_initial_mapping() function? That way we could
be sure that wrong CPUs are blocked right from the start.

 Thanks,
  Thomas


