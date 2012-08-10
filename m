Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SzpUO-0002Kn-NQ
	for mharc-qemu-trivial@gnu.org; Fri, 10 Aug 2012 09:42:56 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SzpUI-0002Jp-EU
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 09:42:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SzpUH-0005Sl-82
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 09:42:50 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:55843)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SzpUH-0005SF-1k; Fri, 10 Aug 2012 09:42:49 -0400
Received: by weyz53 with SMTP id z53so989159wey.4
	for <multiple recipients>; Fri, 10 Aug 2012 06:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WgS37IYfJX67Wb5uPp4oSjnbVraTANktThcVFHaTMBc=;
	b=cXJp/UFMwaRXTegiSKh6PitjIt38S6w+F/sMzGPvbwdcfTUYkbs3XKi4gMBQPzmQhp
	iVCJRBuauEwsOfOEz5yN/phr4xIQCUuSTfbfUvwabXSIJIeVDBdmfSi2eT9Gdw6fQmT+
	kT73QCtREhbDfnma4HFTj2dASAKtfHwx46cIhI8z+eMnwW046qERqvztGfO1e3F6pRFl
	K0A02WNGs4F/L25m4yqo0auw/oBQ8j6spcI1sABP7B+2Unn37ge7A4gcsKnpuHaOPstc
	YBchmRHnir+HdEEgMlMvz/5fBebhSqcqWF5vVmFvExTyoNK3HvyGQAeUdIuAOZ60Rx5P
	jFUg==
Received: by 10.180.103.136 with SMTP id fw8mr6128125wib.20.1344606167897;
	Fri, 10 Aug 2012 06:42:47 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id l5sm11610263wix.5.2012.08.10.06.42.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:42:47 -0700 (PDT)
Date: Fri, 10 Aug 2012 14:42:45 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>
Message-ID: <20120810134245.GC14122@stefanha-thinkpad.localdomain>
References: <1344570866-28595-1-git-send-email-peter.crosthwaite@petalogix.com>
	<1344570866-28595-2-git-send-email-peter.crosthwaite@petalogix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1344570866-28595-2-git-send-email-peter.crosthwaite@petalogix.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, agraf@suse.de, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] device_tree:
 load_device_tree(): Allow NULL sizep
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
X-List-Received-Date: Fri, 10 Aug 2012 13:42:56 -0000

On Fri, Aug 10, 2012 at 01:54:26PM +1000, Peter A. G. Crosthwaite wrote:
> The sizep arg is populated with the size of the loaded device tree. Since this
> is one of those informational "please populate" type arguments it should be
> optional. Guarded writes to *sizep against NULL accordingly.
> 
> Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>
> Acked-by: Alexander Graf <agraf@suse.de>
> ---
>  device_tree.c |    8 ++++++--
>  1 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/device_tree.c b/device_tree.c
> index d7a9b6b..641a48a 100644
> --- a/device_tree.c
> +++ b/device_tree.c
> @@ -71,7 +71,9 @@ void *load_device_tree(const char *filename_path, int *sizep)
>      int ret;
>      void *fdt = NULL;
>  
> -    *sizep = 0;
> +    if (sizep) {
> +        *sizep = 0;
> +    }
>      dt_size = get_image_size(filename_path);
>      if (dt_size < 0) {
>          printf("Unable to get size of device tree file '%s'\n",
> @@ -104,7 +106,9 @@ void *load_device_tree(const char *filename_path, int *sizep)
>              filename_path);
>          goto fail;
>      }
> -    *sizep = dt_size;
> +    if (sizep) {
> +        *sizep = dt_size;
> +    }

What can the caller do with this void* buffer without knowing its size?

They cannot hand the buffer to the guest unless they duplicate the
get_image_size() call, which is pointless, or we're assuming a fixed
size, which is unsafe.  I'm asking what the legitimate use case for
sizep == NULL is?

Stefan

