Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKmAJ-0002Vx-EH
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 05:29:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKmAC-0002Kw-Db
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 05:29:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKmA7-0004M3-3P
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 05:29:12 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41274)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VKllb-0003Yq-7r; Sat, 14 Sep 2013 05:03:47 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 854F541074;
	Sat, 14 Sep 2013 13:03:46 +0400 (MSK)
Message-ID: <52342672.9030506@msgid.tls.msk.ru>
Date: Sat, 14 Sep 2013 13:03:46 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: armbru@redhat.com
References: <1379062191-7475-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1379062191-7475-1-git-send-email-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] trace-events: Clean up with
 scripts/cleanup-trace-events.pl again
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
X-List-Received-Date: Sat, 14 Sep 2013 09:29:17 -0000

13.09.2013 12:49, armbru@redhat.com =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> From: Markus Armbruster <armbru@redhat.com>
>
> Event qxl_render_blit_guest_primary_initialized is unused since commit
> c58c7b9, drop it.
>
> Commit 42e5b4c moved hw/ppc/xics.c to hw/intc/xics.c without updating
> the comment in trace-events.
>
> "scripts/cleanup-trace-events.pl trace-events | diff trace-events" is
> now clean again.

Thanks, applied to the trivial-patches queue.

/mjt

