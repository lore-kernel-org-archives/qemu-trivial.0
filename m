Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UO6FL-0002KQ-14
	for mharc-qemu-trivial@gnu.org; Fri, 05 Apr 2013 08:59:59 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UO6FI-0002FG-8M
	for qemu-trivial@nongnu.org; Fri, 05 Apr 2013 08:59:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UO6FC-0004v4-Sy
	for qemu-trivial@nongnu.org; Fri, 05 Apr 2013 08:59:56 -0400
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d]:37728)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UO6F7-0004tt-74; Fri, 05 Apr 2013 08:59:45 -0400
Received: by mail-wi0-f173.google.com with SMTP id ez12so560649wid.0
	for <multiple recipients>; Fri, 05 Apr 2013 05:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=OMlhPbj/lXLAzL9Ra2B97MMZ/yCgqmmfBt4a1otMblI=;
	b=UnlkgRilb1wQsld/GixqT1QpO3jYZjYzXbMM/xDS5HzrXxsjywTr3nVte3+F6WLk2I
	THDjLcGHKQxFk191Koifwv1iohrtK8JRLou1zOyLEgOjGnuWIympDLnRtW9YA0ELjJId
	4GYfJ/AD4RCfjT5BmB8ZsVtOLSXUxWWqSZCsl/Ds0NVfrB6VyA0KvyUwRzadf5OMEYo4
	cZFMWRGc4+6Z0idkUBoAe4ng9Lfl6298wBY5eP35GSISrgXQwJx/gIVfhStlxaGweBFT
	stE/eepB8KmKdoCRgNldvBnThCPzrEBB4PBG+EZUR4KcsDXvn0ktDka+ZcQg9rkRVl7W
	NaLA==
X-Received: by 10.194.219.162 with SMTP id pp2mr16357283wjc.27.1365166784268; 
	Fri, 05 Apr 2013 05:59:44 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:2d83:6a4a:ca86:7c26])
	by mx.google.com with ESMTPS id er1sm3580460wib.5.2013.04.05.05.59.42
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 05:59:43 -0700 (PDT)
Date: Fri, 5 Apr 2013 14:59:41 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: liguang <lig.fnst@cn.fujitsu.com>
Message-ID: <20130405125941.GD15818@stefanha-thinkpad.redhat.com>
References: <1364779317-3963-1-git-send-email-lig.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1364779317-3963-1-git-send-email-lig.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22d
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel][PATCH v2] hw/i386/pc: reject to
 boot a wrong header magic kernel
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
X-List-Received-Date: Fri, 05 Apr 2013 12:59:58 -0000

On Mon, Apr 01, 2013 at 09:21:57AM +0800, liguang wrote:
> if head magic is missing or wrong unexpectedly, we'd
> better to reject booting.
> e.g.
> I make a mistake to boot a vmlinuz for MIPS(which
> I think it's for x86) like this:
> qemu-system-x86_64 -kernel vmlinuz -initrd demord
> then qemu report:
> "qemu: linux kernel too old to load a ram disk"
> that's misleading.
> 
> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> ---
>  hw/i386/pc.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index b1e06fa..bfbb5fe 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -683,6 +683,9 @@ static void load_linux(void *fw_cfg,
>          if (load_multiboot(fw_cfg, f, kernel_filename, initrd_filename,
>                             kernel_cmdline, kernel_size, header)) {
>              return;
> +        } else {
> +            fprintf(stderr, "not a valid multiboot image!\n");
> +            exit(1);
>          }
>          protocol = 0;

The point of protocol = 0 is to support old Linux kernels.  If we exit
when probing load_multiboot() fails then QEMU will no longer load old
Linux kernels!

I suggest just:
fprintf(stderr, "warning: not a valid multiboot or modern kernel image\n");

Stefan

