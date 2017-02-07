Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cb7RC-0006Av-QC
	for mharc-qemu-trivial@gnu.org; Tue, 07 Feb 2017 10:12:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cb7R6-00065O-8K
	for qemu-trivial@nongnu.org; Tue, 07 Feb 2017 10:12:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cb7R5-0003rZ-0D
	for qemu-trivial@nongnu.org; Tue, 07 Feb 2017 10:12:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58852)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cb7Qw-0003ju-NZ; Tue, 07 Feb 2017 10:11:54 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA60F80477;
	Tue,  7 Feb 2017 15:11:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-50.ams2.redhat.com
	[10.36.116.50])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v17FBrDx014335
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 7 Feb 2017 10:11:54 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B0CA51138646; Tue,  7 Feb 2017 16:11:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170127094154.19778-1-berto@igalia.com>
Date: Tue, 07 Feb 2017 16:11:51 +0100
In-Reply-To: <20170127094154.19778-1-berto@igalia.com> (Alberto Garcia's
	message of "Fri, 27 Jan 2017 11:41:54 +0200")
Message-ID: <87wpd211e0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 07 Feb 2017 15:11:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-doc: Clarify that -vga
 std is now the default
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
X-List-Received-Date: Tue, 07 Feb 2017 15:12:10 -0000

Alberto Garcia <berto@igalia.com> writes:

> The QEMU manual page states that Cirrus Logic is the default video
> card if the user doesn't specify any. However this is not true since
> QEMU 2.2.
>
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>  qemu-options.hx | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 80df52651a..66ee562821 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1195,12 +1195,12 @@ Select type of VGA card to emulate. Valid values for @var{type} are
>  Cirrus Logic GD5446 Video card. All Windows versions starting from
>  Windows 95 should recognize and use this graphic card. For optimal
>  performances, use 16 bit color depth in the guest and the host OS.
> -(This one is the default)
> +(This card was the default before QEMU 2.2)
>  @item std
>  Standard VGA card with Bochs VBE extensions.  If your guest OS
>  supports the VESA 2.0 VBE extensions (e.g. Windows XP) and if you want
>  to use high resolution modes (>= 1280x1024x16) then you should use
> -this option.
> +this option. (This card is the default since QEMU 2.2)
>  @item vmware
>  VMWare SVGA-II compatible adapter. Use it if you have sufficiently
>  recent XFree86/XOrg server or Windows guest with a driver for this

Do we want to cover history in the user manual?  Or should we simply
move the "(This one is the default)" phrase?

Hmm, the default seems to depend on the machine type:

    if (default_vga) {
        if (machine_class->default_display) {
            vga_model = machine_class->default_display;
        } else if (vga_interface_available(VGA_CIRRUS)) {
            vga_model = "cirrus";
        } else if (vga_interface_available(VGA_STD)) {
            vga_model = "std";
        }
    }

The pc-*-2.2 and newer set ->default_display = "std".

Everything else keeps it null, and therefore gets "cirrus" if compiled
in, else "std".

The easy way out is to simply delete "(This one is the default)".

