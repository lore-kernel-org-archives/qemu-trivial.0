Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aWQ6o-0001Jm-Dp
	for mharc-qemu-trivial@gnu.org; Thu, 18 Feb 2016 10:03:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aWQ6l-0001Ew-Nd
	for qemu-trivial@nongnu.org; Thu, 18 Feb 2016 10:03:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aWQ6k-0006vm-Dt
	for qemu-trivial@nongnu.org; Thu, 18 Feb 2016 10:03:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38277)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1aWQ6b-0006tV-FN; Thu, 18 Feb 2016 10:02:57 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 98021550D5;
	Thu, 18 Feb 2016 15:02:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-34.ams2.redhat.com
	[10.36.116.34])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1IF2sl8031998
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 18 Feb 2016 10:02:56 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9B4B7303F903; Thu, 18 Feb 2016 16:02:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Greg Kurz <gkurz@linux.vnet.ibm.com>
References: <20160218144045.7349.67293.stgit@bahia.huguette.org>
Date: Thu, 18 Feb 2016 16:02:53 +0100
In-Reply-To: <20160218144045.7349.67293.stgit@bahia.huguette.org> (Greg Kurz's
	message of "Thu, 18 Feb 2016 15:40:45 +0100")
Message-ID: <87povuawo2.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] spapr: initialize local
	Error pointer
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
X-List-Received-Date: Thu, 18 Feb 2016 15:03:09 -0000

Greg Kurz <gkurz@linux.vnet.ibm.com> writes:

> This fixes a crash in the target QEMU during migration.
>
> Fixes: c5f54f3e31bf693f70a98d4d73ea5dbe05689857

Suggest to word that as "Broken in commit c5f54f3."

> Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>
> ---
>  hw/ppc/spapr.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index e214a34257b3..c119f5582429 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1528,7 +1528,7 @@ static int htab_load(QEMUFile *f, void *opaque, int version_id)
>      section_hdr = qemu_get_be32(f);
>  
>      if (section_hdr) {
> -        Error *local_err;
> +        Error *local_err = NULL;
>  
>          /* First section gives the htab size */
>          spapr_reallocate_hpt(spapr, section_hdr, &local_err);

Easy mistake to make (I've made it myself).  I wish I had the time to
figure out how to make Coccinelle catch it.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

