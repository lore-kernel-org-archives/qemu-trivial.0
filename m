Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TEEIE-0003o0-E2
	for mharc-qemu-trivial@gnu.org; Wed, 19 Sep 2012 03:01:54 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TEEIB-0003fD-MK
	for qemu-trivial@nongnu.org; Wed, 19 Sep 2012 03:01:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TEEIA-0004kP-NH
	for qemu-trivial@nongnu.org; Wed, 19 Sep 2012 03:01:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47816)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1TEEI0-0004fH-JF; Wed, 19 Sep 2012 03:01:40 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q8J71bMo029497
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 19 Sep 2012 03:01:38 -0400
Received: from blackfin.pond.sub.org (ovpn-116-49.ams2.redhat.com
	[10.36.116.49])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q8J71a6r022900; Wed, 19 Sep 2012 03:01:37 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 24F7620069; Wed, 19 Sep 2012 09:01:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1347976422-2859-1-git-send-email-peter.maydell@linaro.org>
	<5058A6ED.4040902@weilnetz.de>
	<CAFEAcA_EoxhN7VPJ9kCP=-E=DHa1=kRUkM07g4Rb__LJqq5Ggg@mail.gmail.com>
Date: Wed, 19 Sep 2012 09:01:36 +0200
In-Reply-To: <CAFEAcA_EoxhN7VPJ9kCP=-E=DHa1=kRUkM07g4Rb__LJqq5Ggg@mail.gmail.com>
	(Peter Maydell's message of "Tue, 18 Sep 2012 18:11:28 +0100")
Message-ID: <878vc6o5rj.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/pflash_cfi0[12]: Use
	host-utils.h ctz32()
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
X-List-Received-Date: Wed, 19 Sep 2012 07:01:52 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On 18 September 2012 17:53, Stefan Weil <sw@weilnetz.de> wrote:
>> What about moving the ctz32 function (or even all of host-utils.h) to
>> bitops.h?
>
> I guess that would make some sense, though I'm not generally
> a huge fan of shuffling code around.
>
> (bitops.h and host-utils.h are not under the same license terms,
> which might complicate things slightly.)

Have a look at hw/hd-geometry.c for a suitable boilerplate comment.

