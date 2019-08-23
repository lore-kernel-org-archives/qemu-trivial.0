Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i12oz-0006y0-BP
	for mharc-qemu-trivial@gnu.org; Fri, 23 Aug 2019 02:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52514)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1i12ox-0006vr-NI
 for qemu-trivial@nongnu.org; Fri, 23 Aug 2019 02:13:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1i12ow-0002Us-NR
 for qemu-trivial@nongnu.org; Fri, 23 Aug 2019 02:13:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54902)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1i12ou-0002Sq-BK; Fri, 23 Aug 2019 02:13:08 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BE89F3082131;
 Fri, 23 Aug 2019 06:13:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB8CC5E1CB;
 Fri, 23 Aug 2019 06:13:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5B0431162B63; Fri, 23 Aug 2019 08:13:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org
References: <20190822230916.576-1-philmd@redhat.com>
Date: Fri, 23 Aug 2019 08:13:02 +0200
In-Reply-To: <20190822230916.576-1-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 23 Aug 2019 01:09:13
 +0200")
Message-ID: <874l2876kx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 23 Aug 2019 06:13:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/3] mailmap: Clean up
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Aug 2019 06:13:12 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Trivial cleanup of .mailmap to have a nice 'git shortlog' output.
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   mailmap: Reorder by sections
>   mailmap: Update philmd email address
>   mailmap: Add many entries to improve 'git shortlog' statistics
>
>  .mailmap | 123 +++++++++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 115 insertions(+), 8 deletions(-)

Series
Reviewed-by: Markus Armbruster <armbru@redhat.com>

However, it increases the difference to contrib/gitdm/aliases.  I'm just
as guilty; my recent "[PATCH 2/2] contrib/gitdm: Add armbru@pond.sub.org
to group-map-redhat" updates only that. and not .mailmap.

Perhaps we want to keep the two in sync manually.  We should then add
suitable comments to each file.

Could we instead teach gitdm to use .mailmap, and ditch
contrib/gitdm/aliases?

aliases' format is documented in gitdm's README.  Each line maps a
non-canonical e-mail address to a canonical one.

.mailmap's format is documented in git-shortlog(1).  It can do a bit
more.  Even the common part differs: it has two addresses in different
order *boggle*.

