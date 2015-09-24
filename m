Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zf9EZ-0002zk-In
	for mharc-qemu-trivial@gnu.org; Thu, 24 Sep 2015 12:18:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Zf9EX-0002wV-Fc
	for qemu-trivial@nongnu.org; Thu, 24 Sep 2015 12:18:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Zf9ET-0003RL-6L
	for qemu-trivial@nongnu.org; Thu, 24 Sep 2015 12:18:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57829)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Zf9EN-0003QA-Bi; Thu, 24 Sep 2015 12:18:47 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id BDD99C0B2E07;
	Thu, 24 Sep 2015 16:18:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-56.ams2.redhat.com
	[10.36.116.56])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8OGIhIW032288
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 24 Sep 2015 12:18:45 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3715D303F90D; Thu, 24 Sep 2015 18:18:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
References: <1442231543-23446-1-git-send-email-armbru@redhat.com>
Date: Thu, 24 Sep 2015 18:18:43 +0200
In-Reply-To: <1442231543-23446-1-git-send-email-armbru@redhat.com> (Markus
	Armbruster's message of "Mon, 14 Sep 2015 13:52:23 +0200")
Message-ID: <87oagrbxjw.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, jiri@resnulli.us, sfeldma@gmail.com
Subject: Re: [Qemu-trivial] [PATCH] rocker: Use g_new() & friends where that
	makes obvious sense
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
X-List-Received-Date: Thu, 24 Sep 2015 16:18:58 -0000

Michael, could you take this one through trivial?  Assuming Scott and
Jiri don't mind, and with s/patchas/patch as/ in the commit message.

Markus Armbruster <armbru@redhat.com> writes:

> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
>
> This commit only touches allocations with size arguments of the form
> sizeof(T).  Same Coccinelle semantic patchas in commit b45c03f.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

