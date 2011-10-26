Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJ30P-0002Ck-C1
	for mharc-qemu-trivial@gnu.org; Wed, 26 Oct 2011 08:54:53 -0400
Received: from eggs.gnu.org ([140.186.70.92]:60919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RJ30H-0001ni-KD
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2011 08:54:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RJ30C-0005nm-0T
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2011 08:54:45 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:40771)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RJ307-0005mz-Og; Wed, 26 Oct 2011 08:54:35 -0400
Received: by wyh15 with SMTP id 15so1788500wyh.4
	for <multiple recipients>; Wed, 26 Oct 2011 05:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FIhJqbTU5c3XZayPcQvTvRVNz8YFmKdFq+sDsLOrA8Q=;
	b=Dsm/Y+pZg7wP4BYxf6mRuLQCT2WClDec8f/5bqjVkvkgwJNUShEPm9mNw6sRq7EGIy
	MSO5ZMSJ1k22ZoJTICz+ZNxdO3G28jvJ0/xczGyltSP+Ao6m+l74cHoT4MEGyKs3RnW6
	JpHcpyzk8izYgKXo6z8Hm7V85Kj5x5pylRYDc=
Received: by 10.227.204.141 with SMTP id fm13mr9821943wbb.12.1319633674585;
	Wed, 26 Oct 2011 05:54:34 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id gd18sm3025821wbb.5.2011.10.26.05.54.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Oct 2011 05:54:33 -0700 (PDT)
Date: Wed, 26 Oct 2011 13:54:31 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20111026125431.GC27267@stefanha-thinkpad.localdomain>
References: <1319487523-19978-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1319487523-19978-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix compiler warning
	(always return a value)
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
X-List-Received-Date: Wed, 26 Oct 2011 12:54:51 -0000

On Mon, Oct 24, 2011 at 10:18:43PM +0200, Stefan Weil wrote:
> For compilations with -DNDEBUG, the default case did not return
> a value which caused a compiler warning.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/ppce500_spin.c |   11 ++++++++---
>  1 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ppce500_spin.c b/hw/ppce500_spin.c
> index cccd940..5b5ffe0 100644
> --- a/hw/ppce500_spin.c
> +++ b/hw/ppce500_spin.c
> @@ -168,17 +168,22 @@ static uint64_t spin_read(void *opaque, target_phys_addr_t addr, unsigned len)
>  {
>      SpinState *s = opaque;
>      uint8_t *spin_p = &((uint8_t*)s->spin)[addr];
> +    uint64_t result = 0;
>  
>      switch (len) {
>      case 1:
> -        return ldub_p(spin_p);
> +        result = ldub_p(spin_p);
> +        break;
>      case 2:
> -        return lduw_p(spin_p);
> +        result = lduw_p(spin_p);
> +        break;
>      case 4:
> -        return ldl_p(spin_p);
> +        result = ldl_p(spin_p);
> +        break;
>      default:
>          assert(0);

I would replace assert(3) with abort(3).  If this ever happens the
program is broken - returning 0 instead of an undefined value doesn't
help.

Stefan

