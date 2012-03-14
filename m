Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S7sdq-0000cK-Pc
	for mharc-qemu-trivial@gnu.org; Wed, 14 Mar 2012 14:09:42 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1S7sdo-0000bj-PA
	for qemu-trivial@nongnu.org; Wed, 14 Mar 2012 14:09:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1S7sdQ-0006q6-Av
	for qemu-trivial@nongnu.org; Wed, 14 Mar 2012 14:09:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:21597)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1S7sdE-0006ef-4r; Wed, 14 Mar 2012 14:09:04 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2EI9226008275
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 14 Mar 2012 14:09:02 -0400
Received: from blackfin.pond.sub.org (ovpn-116-75.ams2.redhat.com
	[10.36.116.75])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2EI91rt027652; Wed, 14 Mar 2012 14:09:01 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 0C3D56007D; Wed, 14 Mar 2012 19:09:01 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Miroslav Rezanina <mrezanin@redhat.com>
References: <e75eb36d-b680-4cb5-bf90-f95c2273f47c@zmail17.collab.prod.int.phx2.redhat.com>
	<20585aca-cce1-4305-9ef8-69e51321930c@zmail17.collab.prod.int.phx2.redhat.com>
	<20120314085310.GA4042@lws.brq.redhat.com>
Date: Wed, 14 Mar 2012 19:09:00 +0100
In-Reply-To: <20120314085310.GA4042@lws.brq.redhat.com> (Miroslav Rezanina's
	message of "Wed, 14 Mar 2012 09:53:11 +0100")
Message-ID: <m3wr6nrr5v.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Man page: Add -global
	description
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
X-List-Received-Date: Wed, 14 Mar 2012 18:09:42 -0000

Miroslav Rezanina <mrezanin@redhat.com> writes:

> There's only TODO information in qemu man page for -global option. This is a basic description of this option with simple example.
>
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
>
> Patch:
> --
> diff --git a/qemu-options.hx b/qemu-options.hx
> index daefce3..876f929 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -292,9 +292,13 @@ DEF("global", HAS_ARG, QEMU_OPTION_global,
>      "                set a global default for a driver property\n",
>      QEMU_ARCH_ALL)
>  STEXI
> -@item -global
> +@item -global @var{driver}.@var{property}=@var{value}
>  @findex -global
> -TODO
> +Set default value of @var{driver}'s @var{property} to @var{value}, e.g.:
> +
> +@example
> +qemu -global ide-drive.physical_block_size=4096 -drive file=file,if=ide,index=0
> +@end example
>  ETEXI
>  
>  DEF("mtdblock", HAS_ARG, QEMU_OPTION_mtdblock,

Much better than nothing.  Stefan, would you like to take this through
your trivial queue?

