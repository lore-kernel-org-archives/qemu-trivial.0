Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YGQbz-0006eG-Hd
	for mharc-qemu-trivial@gnu.org; Wed, 28 Jan 2015 06:16:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YGQbw-0006Zi-NJ
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 06:16:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YGQbv-0001aX-MV
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 06:16:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60765)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YGQbp-0001Yd-Jf; Wed, 28 Jan 2015 06:16:33 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0SBGWKM011246
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 28 Jan 2015 06:16:32 -0500
Received: from blackfin.pond.sub.org (ovpn-116-51.ams2.redhat.com
	[10.36.116.51])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0SBGU6b014667
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 28 Jan 2015 06:16:31 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C52BE303E241; Wed, 28 Jan 2015 12:16:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
References: <1422376711-31648-1-git-send-email-armbru@redhat.com>
Date: Wed, 28 Jan 2015 12:16:29 +0100
In-Reply-To: <1422376711-31648-1-git-send-email-armbru@redhat.com> (Markus
	Armbruster's message of "Tue, 27 Jan 2015 17:38:25 +0100")
Message-ID: <87k307qho2.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/6] Trivial cleanups around g_malloc()
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
X-List-Received-Date: Wed, 28 Jan 2015 11:16:41 -0000

I screwed up cc: qemu-trivial, my apologies.

Markus Armbruster <armbru@redhat.com> writes:

> I'm routing these patches through qemu-trivial, even though some of
> them touch actively maintained code, and could go through the
> respective tree instead:
>
> * PATCH 1 block (Kevin, Stefan)
>
> * PATCH 3 KVM (Paolo)
>
> * PATCH 4 migration (Juan, Amit)
>
> * PATCH 5 VNC (Gerd)
>
> If you want me to reroute any of them, let me know.
>
> Markus Armbruster (6):
>   onenand: g_malloc() can't fail, bury dead error handling
>   rtl8139: g_malloc() can't fail, bury dead error handling
>   kvm: g_malloc() can't fail, bury dead error handling
>   rdma: g_malloc0() can't fail, bury dead error handling
>   vnc: g_realloc() can't fail, bury dead error handling
>   translate-all: Use g_try_malloc() for dynamic translator buffer
>
>  hw/block/onenand.c |  8 +-------
>  hw/net/rtl8139.c   | 14 --------------
>  kvm-all.c          |  4 ----
>  migration/rdma.c   |  3 ---
>  translate-all.c    |  2 +-
>  ui/vnc.c           |  4 ----
>  6 files changed, 2 insertions(+), 33 deletions(-)

