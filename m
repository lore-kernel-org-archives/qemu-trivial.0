Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVGBt-0001OJ-Fq
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 05:11:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>) id 1YVGBq-0001Ir-8w
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 05:11:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>) id 1YVGBl-0000Fl-9C
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 05:11:02 -0400
Received: from lekensteyn.nl ([178.21.112.251]:40846)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>) id 1YVGBl-0000FW-2r
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 05:10:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lekensteyn.nl; s=s2048-2014-q3; 
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=ytII1z0TeZYVaBplcI23HSk3Lcsegvp2hIR76KMjcI0=; 
	b=rCSbLmytln5hFxTVTjnU+fmBK9YAqfScyX/IZBGFq5tEInEIsx8XhQyufhfFeqbLV4OrLcyrpS3GtaZ25ns8b328mYQlh7nlfQtsrDl8xv+8R6uG6oOlGwNYyQj4LySfCY8o86j992FVkbvKH1ztYd4hGC7D3VlmkRTVBY/SDMKnfHqPsrGoHOIjiGF/wCY287+f42DR7MDJPFGT9uDAx2eJ4UuvCYvXALY2fgycQVshYZCQ+wbJ4MpYooimDxpZ96HWLZxHv25sHUbnY1b7G5vEALbyD74qp7bAo8QYOfd+IfCourQmqGFs5lT20dKHdTxHcGlrOcguuytnpZyAKw==;
Received: by lekensteyn.nl with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
	(Exim 4.80) (envelope-from <peter@lekensteyn.nl>)
	id 1YVGBf-0007ZF-J2; Tue, 10 Mar 2015 10:10:51 +0100
Date: Tue, 10 Mar 2015 10:10:49 +0100
From: Peter Wu <peter@lekensteyn.nl>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20150310091049.GE23387@al>
References: <1425971164-9845-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425971164-9845-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.23+64 (e44d7de51fa8) (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.21.112.251
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] block/dmg: make it modular if using
	additional library
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
X-List-Received-Date: Tue, 10 Mar 2015 09:11:03 -0000

On Tue, Mar 10, 2015 at 10:06:04AM +0300, Michael Tokarev wrote:
> block/dmg can use additional library (libbz2) to read
> bzip2-compressed files.  Make the block driver to be
> a module if libbz2 support is requested, to avoid extra
> library dependency by default.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

Tested-by: Peter Wu <peter@lekensteyn.nl>
Reviewed-by: Peter Wu <peter@lekensteyn.nl>

> --
> 
> This might be questionable, to make the thing to be either
> module or built-in depending on build environment, so a
> better idea may be to make it modular unconditionally.
> This block device format isn't used often.

I do not mind making it a module unconditionally, that would make it
easier to disable should a security bug come around the corner.

Kind regards,
Peter

>  block/Makefile.objs | 3 ++-
>  configure           | 3 +++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/block/Makefile.objs b/block/Makefile.objs
> index db2933e..440c51f 100644
> --- a/block/Makefile.objs
> +++ b/block/Makefile.objs
> @@ -1,7 +1,8 @@
> -block-obj-y += raw_bsd.o qcow.o vdi.o vmdk.o cloop.o dmg.o bochs.o vpc.o vvfat.o
> +block-obj-y += raw_bsd.o qcow.o vdi.o vmdk.o cloop.o bochs.o vpc.o vvfat.o
>  block-obj-y += qcow2.o qcow2-refcount.o qcow2-cluster.o qcow2-snapshot.o qcow2-cache.o
>  block-obj-y += qed.o qed-gencb.o qed-l2-cache.o qed-table.o qed-cluster.o
>  block-obj-y += qed-check.o
> +block-obj-$(CONFIG_DMG) += dmg.o
>  block-obj-$(CONFIG_VHDX) += vhdx.o vhdx-endian.o vhdx-log.o
>  block-obj-$(CONFIG_QUORUM) += quorum.o
>  block-obj-y += parallels.o blkdebug.o blkverify.o
> diff --git a/configure b/configure
> index 7ba4bcb..1dd5721 100755
> --- a/configure
> +++ b/configure
> @@ -4772,6 +4772,9 @@ fi
>  if test "$bzip2" = "yes" ; then
>    echo "CONFIG_BZIP2=y" >> $config_host_mak
>    echo "BZIP2_LIBS=-lbz2" >> $config_host_mak
> +  echo "CONFIG_DMG=m" >> $config_host_mak
> +else
> +  echo "CONFIG_DMG=y" >> $config_host_mak
>  fi
>  
>  if test "$libiscsi" = "yes" ; then
> -- 
> 2.1.4
> 

