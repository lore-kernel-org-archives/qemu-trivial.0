Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ciooD-0005YQ-Ep
	for mharc-qemu-trivial@gnu.org; Tue, 28 Feb 2017 15:55:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1ciooB-0005WC-8l
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 15:55:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1ciooA-0005uo-92
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 15:55:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34004)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1cioo3-0005rq-S0; Tue, 28 Feb 2017 15:55:35 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 112ECC05B1C5;
	Tue, 28 Feb 2017 20:55:35 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-21.phx2.redhat.com
	[10.3.116.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1SKtWJM026196; Tue, 28 Feb 2017 15:55:33 -0500
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1488303601-23741-1-git-send-email-thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	Alexey Kardashevskiy <aik@ozlabs.ru>, Eric Blake <eblake@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <58ebd52a-2cd0-e910-1baa-ec4a0f272edd@redhat.com>
Date: Tue, 28 Feb 2017 21:55:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <1488303601-23741-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 28 Feb 2017 20:55:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] docs: Add a note about mixing bootindex
 with "-boot order"
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Feb 2017 20:55:44 -0000

On 02/28/17 18:40, Thomas Huth wrote:
> Occasionally the users try to mix the bootindex properties with the
> "-boot order" parameter - and this likely does not give the expected
> results. So let's add a proper statement that these two concepts
> should not be used together.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/bootindex.txt | 9 +++++++++

Wow, a document from 2011!

commit 466b58648a7b2ba7edb280b585e0b0c26e3be31e
Author: Gleb Natapov <gleb@redhat.com>
Date:   Sun Jan 30 12:29:19 2011 +0200

    Add boot index documentation.

So cool. I didn't know this existed.

>  qemu-options.hx    | 5 ++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/bootindex.txt b/docs/bootindex.txt
> index f84fac7..9e0ac07 100644
> --- a/docs/bootindex.txt
> +++ b/docs/bootindex.txt
> @@ -41,3 +41,12 @@ has three bootable devices target1, target3, target5 connected to it,
>  the option ROM will have a boot method for each of them, but it is not
>  possible to map from boot method back to a specific target.  This is a
>  shortcoming of the PC BIOS boot specification.
> +
> +== Mixing bootindex and boot order parameters ==
> +
> +Note that it does not make sense to use the bootindex property together
> +with the "-boot order=..." (or "-boot once=...") parameter. The guest
> +firmware implementations normally either support the one or the other,
> +but not both parameters at the same time. Mixing them will result in
> +undefined behavior, and thus the guest firmware will likely not boot
> +from the expected devices.
> diff --git a/qemu-options.hx b/qemu-options.hx
> index bf458f8..aa11420 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -234,7 +234,10 @@ drive letters depend on the target architecture. The x86 PC uses: a, b
>  (floppy 1 and 2), c (first hard disk), d (first CD-ROM), n-p (Etherboot
>  from network adapter 1-4), hard disk boot is the default. To apply a
>  particular boot order only on the first startup, specify it via
> -@option{once}.
> +@option{once}. Note that the @option{order} or @option{once} parameter
> +should not be used together with the @option{bootindex} property of
> +devices, since the firmware implementations normally do not support both
> +at the same time.
>  
>  Interactive boot menus/prompts can be enabled via @option{menu=on} as far
>  as firmware/BIOS supports them. The default is non-interactive boot.
> 

Awesome. Thank you for this.

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

