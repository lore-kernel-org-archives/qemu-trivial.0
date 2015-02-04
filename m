Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YIwVI-00026E-1C
	for mharc-qemu-trivial@gnu.org; Wed, 04 Feb 2015 04:44:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YIwVF-00020y-KA
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 04:44:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YIwVE-0006tN-LL
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 04:44:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41798)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YIwV8-0006sb-G7; Wed, 04 Feb 2015 04:44:02 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t149i1U5024970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 4 Feb 2015 04:44:01 -0500
Received: from blackfin.pond.sub.org (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t149i0gr006212
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 4 Feb 2015 04:44:01 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B081E3040D2D; Wed,  4 Feb 2015 10:43:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
References: <1422456844-13043-1-git-send-email-armbru@redhat.com>
Date: Wed, 04 Feb 2015 10:43:59 +0100
In-Reply-To: <1422456844-13043-1-git-send-email-armbru@redhat.com> (Markus
	Armbruster's message of "Wed, 28 Jan 2015 15:54:00 +0100")
Message-ID: <87lhke810g.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/4] Pair g_malloc() with g_free(),
	not free()
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
X-List-Received-Date: Wed, 04 Feb 2015 09:44:10 -0000

Got reviews, want qemu-trivial: *ping* :)

Markus Armbruster <armbru@redhat.com> writes:

> I'm routing these patches through qemu-trivial, even though some of
> them touch actively maintained code, and could go through the
> respective tree instead:
>
> * PATCH 3 sPAPR (Alex)
>
> * PATCH 4 USB (Gerd)
>
> If you want me to reroute any of them, let me know.
>
> Markus Armbruster (4):
>   qemu-option: Replace pointless use of g_malloc0() by g_malloc()
>   qemu-option: Pair g_malloc() with g_free(), not free()
>   spapr_vio: Pair g_malloc() with g_free(), not free()
>   usb: Pair g_malloc() with g_free(), not free()
>
>  hw/ppc/spapr_vio.c | 2 +-
>  hw/usb/desc-msos.c | 2 +-
>  util/qemu-option.c | 8 ++++----
>  3 files changed, 6 insertions(+), 6 deletions(-)

