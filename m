Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V4YbE-0006lg-2Z
	for mharc-qemu-trivial@gnu.org; Wed, 31 Jul 2013 11:46:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1V4Yb6-0006iu-Jd
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 11:46:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1V4Xdv-0000qP-NV
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 10:44:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:63756)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1V4Xde-0000Vk-Vs; Wed, 31 Jul 2013 10:44:31 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r6VEiUoM024000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 31 Jul 2013 10:44:30 -0400
Received: from blackfin.pond.sub.org (ovpn-116-32.ams2.redhat.com
	[10.36.116.32])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r6VEiTbc005611; Wed, 31 Jul 2013 10:44:29 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C54B0200B7; Wed, 31 Jul 2013 16:44:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
References: <1371542723-926-1-git-send-email-armbru@redhat.com>
Date: Wed, 31 Jul 2013 16:44:27 +0200
In-Reply-To: <1371542723-926-1-git-send-email-armbru@redhat.com> (Markus
	Armbruster's message of "Tue, 18 Jun 2013 10:05:23 +0200")
Message-ID: <871u6e23hw.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, berrange@redhat.com, qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] acl: acl_add can't insert before last
	list element, fix
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
X-List-Received-Date: Wed, 31 Jul 2013 15:46:01 -0000

Ping re 1.5.3

Markus Armbruster <armbru@redhat.com> writes:

> Watch this:
>
>     $ upstream-qemu -nodefaults -S -vnc :0,acl,sasl -monitor stdio
>     QEMU 1.5.50 monitor - type 'help' for more information
>     (qemu) acl_add vnc.username drei allow
>     acl: added rule at position 1
>     (qemu) acl_show vnc.username
>     policy: deny
>     1: allow drei
>     (qemu) acl_add vnc.username zwei allow 1
>     acl: added rule at position 2
>     (qemu) acl_show vnc.username
>     policy: deny
>     1: allow drei
>     2: allow zwei
>     (qemu) acl_add vnc.username eins allow 1
>     acl: added rule at position 1
>     (qemu) acl_show vnc.username
>     policy: deny
>     1: allow eins
>     2: allow drei
>     3: allow zwei
>
> The second acl_add inserts at position 2 instead of 1.
>
> Root cause is an off-by-one in qemu_acl_insert(): when index ==
> acl->nentries, it appends instead of inserting before the last list
> element.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  util/acl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/util/acl.c b/util/acl.c
> index a7f33ff..938b7ae 100644
> --- a/util/acl.c
> +++ b/util/acl.c
> @@ -138,9 +138,9 @@ int qemu_acl_insert(qemu_acl *acl,
>  
>      if (index <= 0)
>          return -1;
> -    if (index >= acl->nentries)
> +    if (index > acl->nentries) {
>          return qemu_acl_append(acl, deny, match);
> -
> +    }
>  
>      entry = g_malloc(sizeof(*entry));
>      entry->match = g_strdup(match);

