Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qlx7t-0003ia-Ra
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jul 2011 01:57:49 -0400
Received: from eggs.gnu.org ([140.186.70.92]:36406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Qlx7q-0003Zh-WA
	for qemu-trivial@nongnu.org; Wed, 27 Jul 2011 01:57:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Qlx7p-0003Fs-T2
	for qemu-trivial@nongnu.org; Wed, 27 Jul 2011 01:57:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:29282)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Qlx7n-0003FR-A9; Wed, 27 Jul 2011 01:57:43 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6R5vf0M026758
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 27 Jul 2011 01:57:41 -0400
Received: from blackfin.pond.sub.org (ovpn-113-62.phx2.redhat.com
	[10.3.113.62])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6R5veVp032262; Wed, 27 Jul 2011 01:57:40 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 882C7265; Wed, 27 Jul 2011 07:57:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alexandre Raymond <cerbere@gmail.com>
References: <1311652562-10794-1-git-send-email-cerbere@gmail.com>
	<1311652562-10794-2-git-send-email-cerbere@gmail.com>
	<m339htczcl.fsf@blackfin.pond.sub.org>
	<CAHWZs7UG9NrAQKAtJN2+eQtbOOGFZrotdfSg3PhQ+FD_mRX4-w@mail.gmail.com>
Date: Wed, 27 Jul 2011 07:57:38 +0200
In-Reply-To: <CAHWZs7UG9NrAQKAtJN2+eQtbOOGFZrotdfSg3PhQ+FD_mRX4-w@mail.gmail.com>
	(Alexandre Raymond's message of "Tue, 26 Jul 2011 09:51:21 -0400")
Message-ID: <m3k4b4z2nh.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Qemu Developers <qemu-devel@nongnu.org>
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
X-List-Received-Date: Wed, 27 Jul 2011 05:57:48 -0000

Alexandre Raymond <cerbere@gmail.com> writes:

> Hi Markus,
>
>> Well, I'd expect distclean to remove exactly what *this* makefile can
>> build, and leave everything else alone.
>
> I was expecting "distclean" to bring back the source directory to
> however it was after checkout, removing anything that might have been
> created by the build/configure process.
>
>
>> Your patch adds a special case to that simple rule: also remove
>> not-configured target directories. =C2=A0Other not-configured stuff is s=
till
>> left behind.
>>
>> Special cases need special justification, hence my question above.
>
> This patch stems from the discussion in "Makefile: fix out-of-tree builds"
> http://lists.gnu.org/archive/html/qemu-devel/2011-07/msg02707.html
>
> What happens is that SRC_PATH is set in the VPATH variable in the
> Makefile, which causes it to search for files inside the source
> directory (and outside the current build directory).
>
> Say you're building out-of-tree, and the Makefile happens to pick up
> old files from your main source directory, it can lead to errors in
> the build. If you are "unable" to delete old build data because you've
> run a more restricted "configure" after an earlier build, this earlier
> build data will not go away if you distclean.
>
> For example:
[...]

There are many more object files that are built conditionally.  Why is
it okay not to delete them?

If you unwisely messed up your source tree by building in it, a simple
and reliable way out is to git-clone yourself a new one.  Or if you
insist on recovering in-place, remove files outside .git that aren't in
git.

