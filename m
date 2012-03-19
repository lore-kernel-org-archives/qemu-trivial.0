Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9ZSE-0006xr-IG
	for mharc-qemu-trivial@gnu.org; Mon, 19 Mar 2012 06:04:42 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S9ZS7-0006qt-7w
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 06:04:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S9ZS3-0000Jj-LS
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 06:04:34 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:58566)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S9ZS3-0000J7-Ci; Mon, 19 Mar 2012 06:04:31 -0400
Received: by wibhr17 with SMTP id hr17so3132141wib.10
	for <multiple recipients>; Mon, 19 Mar 2012 03:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mg6PZnZw6p4lrURHNcN80f2lP2Eh+3Vb26vg9IeIZ9c=;
	b=Q+veLdqntJzNylqDPJ1QifWIYRH9KHJUnOr5Xw/F/niHt2pvRmMkpesSoZ0k1FWqFl
	dKAZ7g8puWXuPRNbZ4ANAwZka1w9s6IMhL40FQ3YgXVDmeYCfdZbg/Tqc2i+DZkjZrCS
	zIrazRaqWH9TWUps7IzquAomCesdd5DT/EWsog4IVe15xClG3GpFZng4/dmyfOnjL0A5
	ib/rBIZ+yvKpzyzp7nJLVBPY2KnX7YKRQatnmdhI1uCpGqVxNGxT46FBYV2Vz1bW45Fh
	BhJaFWhDZQIgeKrkTgvHUuOpUj08iFhvfQ0MFtMY5Nt7StRBwBvmIxDqJaSMELwqBSTY
	CTqw==
Received: by 10.216.139.140 with SMTP id c12mr6104679wej.43.1332151468711;
	Mon, 19 Mar 2012 03:04:28 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	o2sm39346462wiv.11.2012.03.19.03.04.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 03:04:28 -0700 (PDT)
Date: Mon, 19 Mar 2012 08:47:06 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20120319084706.GA21364@stefanha-thinkpad.localdomain>
References: <1332133125-7832-1-git-send-email-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1332133125-7832-1-git-send-email-david@gibson.dropbear.id.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, anthony@codemonkey.ws
Subject: Re: [Qemu-trivial] [PATCH] .gitignore update
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
X-List-Received-Date: Mon, 19 Mar 2012 10:04:41 -0000

On Mon, Mar 19, 2012 at 03:58:45PM +1100, David Gibson wrote:
> This adds a few previously missing generated files to .gitignore: the
> qemu-bridge-helper binary, and more generated versions of the
> linuxboot, multiboot and kvmvapic roms from pc-bios/optionrom.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  .gitignore |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

