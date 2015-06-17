Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z5Fkb-0005GA-9h
	for mharc-qemu-trivial@gnu.org; Wed, 17 Jun 2015 11:59:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z5FkY-0005Bc-C4
	for qemu-trivial@nongnu.org; Wed, 17 Jun 2015 11:59:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z5FkX-0003v1-Ch
	for qemu-trivial@nongnu.org; Wed, 17 Jun 2015 11:59:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36780)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Z5FkS-0003tF-V5; Wed, 17 Jun 2015 11:59:33 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 70503C4634;
	Wed, 17 Jun 2015 15:59:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-46.ams2.redhat.com
	[10.36.116.46])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5HFxUQA013522
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 17 Jun 2015 11:59:32 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 188B2303F904; Wed, 17 Jun 2015 17:59:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Lin Ma <lma@suse.com>
References: <1434554094-6040-1-git-send-email-lma@suse.com>
Date: Wed, 17 Jun 2015 17:59:30 +0200
In-Reply-To: <1434554094-6040-1-git-send-email-lma@suse.com> (Lin Ma's message
	of "Wed, 17 Jun 2015 23:14:54 +0800")
Message-ID: <87twu6xr4t.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: show
	--disable-vte and --enable-vte in help message
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
X-List-Received-Date: Wed, 17 Jun 2015 15:59:39 -0000

Copying qemu-trivial.

Lin Ma <lma@suse.com> writes:

> Signed-off-by: Lin Ma <lma@suse.com>
> ---
>  configure | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/configure b/configure
> index 222694f..4f895e3 100755
> --- a/configure
> +++ b/configure
> @@ -1420,6 +1420,8 @@ Advanced options (experts only):
>    --enable-numa            enable libnuma support
>    --disable-tcmalloc       disable tcmalloc support
>    --enable-tcmalloc        enable tcmalloc support
> +  --disable-vte            disable vte
> +  --enable-vte             enable vte
>  
>  NOTE: The object files are built at the place where configure is launched
>  EOF

