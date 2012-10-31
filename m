Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TTThD-00035Z-3f
	for mharc-qemu-trivial@gnu.org; Wed, 31 Oct 2012 04:30:43 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TTTh6-0002mg-Jk
	for qemu-trivial@nongnu.org; Wed, 31 Oct 2012 04:30:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TTTh5-0000Jr-IW
	for qemu-trivial@nongnu.org; Wed, 31 Oct 2012 04:30:36 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:34876)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TTTgr-0000HO-0a; Wed, 31 Oct 2012 04:30:21 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so439447bkc.4
	for <multiple recipients>; Wed, 31 Oct 2012 01:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LWRscaNZe7hH7c1naqPXnMa++Nt6WNvnFKrwgsYMYrs=;
	b=dxyAdFGUW+3FiRTlWI6vf65z9KNCfn6pvUB/d6eKO/kH+XBOWaaUzpNumHAVAqYTJo
	drbtZNYmMjmanWimoRFAn1svYia3L+zXMSQ3FlyoiUOlrR+s3+xFkgA6vpwFPeUuKhOl
	Uw0ZFUD7uRXJFWuDX3F5XLHBYvWh0gZ16N50TGqExu3RdBB+Qh0Fov1VmrJJF7SgU/XR
	QOeQi5CWxJFeYdSBXYfVDQKlV8TPFBs6JfFgMtpqnslwclocbCXUHPH+fuSxBEqwDmUH
	uVzIUd3Tsn1zKC5Ltl0Fh0CMSD1OkJjBOmNcIFsn2kJnAskYmX3bU1hEXeBO5OGZvC2Y
	aixQ==
Received: by 10.204.11.141 with SMTP id t13mr10869494bkt.65.1351672219726;
	Wed, 31 Oct 2012 01:30:19 -0700 (PDT)
Received: from localhost (nat-pool-muc-t.redhat.com. [209.132.186.12])
	by mx.google.com with ESMTPS id v14sm2444454bkv.10.2012.10.31.01.30.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 31 Oct 2012 01:30:18 -0700 (PDT)
Date: Wed, 31 Oct 2012 09:03:51 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Gabriel L. Somlo" <gsomlo@gmail.com>
Message-ID: <20121031080351.GC1116@stefanha-thinkpad>
References: <20121030172039.GN29280@hedwig.ini.cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20121030172039.GN29280@hedwig.ini.cmu.edu>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, rene@exactcode.com, somlo@cmu.edu,
	qemu-devel@nongnu.org, agraf@suse.de
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] e1000: pre-initialize
	RAH/RAL registers
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
X-List-Received-Date: Wed, 31 Oct 2012 08:30:41 -0000

On Tue, Oct 30, 2012 at 01:20:40PM -0400, Gabriel L. Somlo wrote:
> Some guest operating systems' drivers (Mac OS X in particular) fail to
> properly initialize the Receive Address registers (probably expecting
> them to be pre-initialized by an earlier component, such as a proprietary
> BIOS). This patch pre-initializes the RA registers, allowing OS X
> networking to function properly. Other guest operating systems are not
> affected, and free to (re)initialize these registers during boot.
> 
> Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
> ---
>  hw/e1000.c |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/hw/e1000.c b/hw/e1000.c
> index e4f1ffe..6478ff3 100644
> --- a/hw/e1000.c
> +++ b/hw/e1000.c
> @@ -278,6 +278,10 @@ static void e1000_reset(void *opaque)
>      if (d->nic->nc.link_down) {
>          e1000_link_down(d);
>      }
> +
> +  /* Some guests expect pre-initialized RAH/RAL (AddrValid flag + MACaddr) */
> +  d->mac_reg[RA+1] = E1000_RAH_AV;

Please use 4 space indentation (QEMU coding style).

> +  memmove(&d->mac_reg[RA], &d->conf.macaddr, sizeof(struct MACAddr));

When the host is big-endian the filter code will byteswap and the MAC address
will not match:

  for (rp = s->mac_reg + RA; rp < s->mac_reg + RA + 32; rp += 2) {
      if (!(rp[1] & E1000_RAH_AV))
          continue;
      ra[0] = cpu_to_le32(rp[0]);
      ra[1] = cpu_to_le32(rp[1]);
      if (!memcmp(buf, (uint8_t *)ra, 6)) {

Stefan

