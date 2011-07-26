Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlbQj-000487-I2
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jul 2011 02:47:49 -0400
Received: from eggs.gnu.org ([140.186.70.92]:38313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1QlbQg-0003xn-DJ
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2011 02:47:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1QlbQf-00023q-9c
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2011 02:47:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:10409)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1QlbQc-000235-Mt; Tue, 26 Jul 2011 02:47:42 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6Q6leUK018981
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 26 Jul 2011 02:47:40 -0400
Received: from blackfin.pond.sub.org (ovpn-113-29.phx2.redhat.com
	[10.3.113.29])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p6Q6lejp015964; Tue, 26 Jul 2011 02:47:40 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id C9C43265; Tue, 26 Jul 2011 08:47:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alexandre Raymond <cerbere@gmail.com>
References: <1311652562-10794-1-git-send-email-cerbere@gmail.com>
	<1311652562-10794-2-git-send-email-cerbere@gmail.com>
Date: Tue, 26 Jul 2011 08:47:38 +0200
In-Reply-To: <1311652562-10794-2-git-send-email-cerbere@gmail.com> (Alexandre
	Raymond's message of "Mon, 25 Jul 2011 23:56:01 -0400")
Message-ID: <m339htczcl.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
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
X-List-Received-Date: Tue, 26 Jul 2011 06:47:47 -0000

Alexandre Raymond <cerbere@gmail.com> writes:

> At the moment, "make distclean" relies on the TARGET_DIRS variable, set by
> configure. The problem is that this variable does not always contain all
> possible targets.
>
> For example, the following will leave build data in the tree:
>
> ./configure && make && ./configure --target-list=i386-softmmu \
> && make distclean
>
> as it will only remove the i386-softmmu build directory, although the
> first build created additional directories.

Why is that a problem?

> Solution : pass the full list of targets from configure to make via
> the DEFAULT_TARGET_LIST variable.

Well, I'd expect distclean to remove exactly what *this* makefile can
build, and leave everything else alone.

Your patch adds a special case to that simple rule: also remove
not-configured target directories.  Other not-configured stuff is still
left behind.

Special cases need special justification, hence my question above.

