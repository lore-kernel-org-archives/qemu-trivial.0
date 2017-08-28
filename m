Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dmIDT-0007IT-VT
	for mharc-qemu-trivial@gnu.org; Mon, 28 Aug 2017 07:28:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dmIDO-0007FM-Pv
	for qemu-trivial@nongnu.org; Mon, 28 Aug 2017 07:28:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dmIDN-0005I6-TM
	for qemu-trivial@nongnu.org; Mon, 28 Aug 2017 07:28:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36898)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dmIDJ-0005Fi-FB; Mon, 28 Aug 2017 07:28:17 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4EAA7C04B927;
	Mon, 28 Aug 2017 11:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4EAA7C04B927
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=armbru@redhat.com
Received: from blackfin.pond.sub.org (ovpn-116-75.ams2.redhat.com
	[10.36.116.75])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E77860605;
	Mon, 28 Aug 2017 11:28:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8AAB81138662; Mon, 28 Aug 2017 13:28:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-trivial@nongnu.org,  qemu-devel@nongnu.org
References: <20170728053610.15770-1-f4bug@amsat.org>
Date: Mon, 28 Aug 2017 13:28:14 +0200
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri,
	28 Jul 2017 02:35:23 -0300")
Message-ID: <87mv6k2apd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 28 Aug 2017 11:28:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 00/47] add missing entries
 in MAINTAINERS
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
X-List-Received-Date: Mon, 28 Aug 2017 11:28:26 -0000

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Hi,
>
> I first prepared this series thinking about 2.10 but then realized if som=
eone
> is calling ./scripts/get_maintainer.pl he better is using an updated git
> clone :)
>
> Distribs do provide docs/ files in /usr/share/doc/qemu* but not the
> MAINTAINERS file so no hurry for this series.
>
> I provided the script I used in the last patch, I plan to improve it so
> patchew/travis can start to use it: if a new file is added to the reposit=
ory
> without being covered in MAINTAINERS the script remember the submitter ab=
out
> it and eventually he'll resend his patch, I think this is a good practice=
 and
> help the next contributors (anyway this is a valuable experience to look =
at a
> file history to see who has been hacking around when there is no MAINTAIN=
ERS
> entry).
>
> I don't want to overburden current maintainers, so the last patches add
> Orphans entries but I tried to select relevant commiters and include them=
 in
> each patch.
>
> The criteria I used is "If I change this file, who should I notify? Who w=
ould
> be interested?"

Where do we stand with this series?

