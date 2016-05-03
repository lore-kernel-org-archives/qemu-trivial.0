Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axOmM-0001T0-1T
	for mharc-qemu-trivial@gnu.org; Mon, 02 May 2016 21:05:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1axOmE-0001DG-89
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:05:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1axOm2-0000IC-Fp
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:05:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59916)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1axOld-0008VE-3h; Mon, 02 May 2016 21:04:49 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81DE037E81;
	Tue,  3 May 2016 01:04:32 +0000 (UTC)
Received: from localhost (dhcp-15-133.nay.redhat.com [10.66.15.133])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4314VLP031124; Mon, 2 May 2016 21:04:31 -0400
Date: Tue, 3 May 2016 09:04:35 +0800
From: Fam Zheng <famz@redhat.com>
To: Christopher Friedt <chrisfriedt@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: mst@redhat.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20160503010435.GT1421@ad.usersys.redhat.com>
References: <1462236478-61645-1-git-send-email-chrisfriedt@gmail.com>
	<1462236478-61645-2-git-send-email-chrisfriedt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1462236478-61645-2-git-send-email-chrisfriedt@gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 1/2] Use libtool instead of ar to create
 static libraries on Darwin.
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
X-List-Received-Date: Tue, 03 May 2016 01:05:32 -0000

Cc'ing Peter Maydell, who must have better ideas than me on building on Mac.

On Mon, 05/02 20:47, Christopher Friedt wrote:
> 
> Currently, at least on Mac OS X 10.11.4 (El Capitan), Qemu fails to build for a few reasons.
> 
> One of those reasons is that Apple's ld (at least ld64) does not properly process archive files created with ar (even Apple's ar).
> 
> After some RTFM'ing, I came upon this tidbit, which is unfortunate. Luckily, autotools packages are not broken.
> 
> "Libtool with -static is intended to replace ar(5) and ranlib."
> http://www.manpages.info/macosx/libtool.1.html
> 
> In any case, this change takes Apple's recommendations into account and allows Qemu to build on Mac OS X El Capitan.
> 
> Signed-off-by: Christopher Friedt <chrisfriedt@gmail.com>
> ---
>  rules.mak | 4 ++++
>  1 file changed, 4 insertions(+)
> 

> diff --git a/rules.mak b/rules.mak
> index d1ff311..44421af 100644
> --- a/rules.mak
> +++ b/rules.mak
> @@ -105,7 +105,11 @@ modules:
>  	$(call LINK,$(filter %.o %.a %.mo, $^))
>  
>  %.a:
> +ifeq ($(shell uname),Darwin)

I think you can use "ifdef CONFIG_DARWIN" here.

> +	$(call quiet-command,rm -f $@ && libtool -static -o $@ $^,"  libtool    $(TARGET_DIR)$@")

Is libtool always available on Mac OS X? If not, we may need to add the
detection to ./configure.

Fam

> +else
>  	$(call quiet-command,rm -f $@ && $(AR) rcs $@ $^,"  AR    $(TARGET_DIR)$@")
> +endif
>  
>  quiet-command = $(if $(V),$1,$(if $(2),@echo $2 && $1, @$1))
>  


