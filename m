Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f93rH-0008Kl-VB
	for mharc-qemu-trivial@gnu.org; Thu, 19 Apr 2018 03:19:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1f93rF-0008J9-D8
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2018 03:19:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1f93rE-0000Wp-D6
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2018 03:19:53 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38108 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1f93r8-0000Pd-7d; Thu, 19 Apr 2018 03:19:46 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE4838185331;
	Thu, 19 Apr 2018 07:19:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
	[10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B2EA2026DFD;
	Thu, 19 Apr 2018 07:19:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C21F011386D7; Thu, 19 Apr 2018 09:19:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>,  Peter Maydell
	<peter.maydell@linaro.org>,  Olaf Hering <olaf@aepfle.de>,  Fam Zheng
	<famz@redhat.com>, qemu-trivial@nongnu.org, Philippe =?utf-8?Q?Mathieu-?=
	=?utf-8?Q?Daud=C3=A9?= <f4bug@amsat.org>, "open list\:All patches CC here"
	<qemu-devel@nongnu.org>,  Gerd Hoffmann <kraxel@redhat.com>,  Paolo
	Bonzini <pbonzini@redhat.com>
References: <20180418123838.3511-1-olaf@aepfle.de>
	<20180418144538.4aa2f492.cohuck@redhat.com>
	<20180418125545.GN27579@redhat.com>
Date: Thu, 19 Apr 2018 09:19:28 +0200
In-Reply-To: <20180418125545.GN27579@redhat.com> ("Daniel P. =?utf-8?Q?Ber?=
	=?utf-8?Q?rang=C3=A9=22's?=
	message of "Wed, 18 Apr 2018 13:55:45 +0100")
Message-ID: <87sh7rvf27.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 19 Apr 2018 07:19:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 19 Apr 2018 07:19:35 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] configure: require
 glib-2.24
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
X-List-Received-Date: Thu, 19 Apr 2018 07:19:54 -0000

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Apr 18, 2018 at 02:45:38PM +0200, Cornelia Huck wrote:
>
>> Are we ready to give up support for whatever distro is still on 2.22?
>> (If yes, can we bump to an even newer glib version?) Or should we
>> rather solve this by adding a g_realloc_n implementation for that case?
>
> Version 2.22 was released in Sep 2009, so coming up for 9 years old now.
>
> At some point we should to declare that platforms shipping >=3D NNN year
> old versions of software are not a desirable target for QEMU. What is
> our desired NNN value - 9 years feels awfully long to me.
>
> For libvirt we recently decided to become more aggressive[1] in culling o=
ld
> distros as supportable targets, declaring we'll only support non-EOL
> distros (for short life distros), or for long life distros (RHEL, LTS, et=
c)
> the most recent version, and the recent minus-1 for 2 years overlap.
>
> Should we formalize similar guidelines for QEMU to give developers a
> guide for when it is reasonable to increase the min required version of
> any 3rd party library ?  glib is a mandatory dep, but we've countless
> other optional libraries we might wish to increase min versions for too,
> and no guide on when it is reasonable todo so.

Yes, please.

>
> Regards,
> Daniel
>
> [1]   https://libvirt.org/platforms.html

This policy looks sensible to me

