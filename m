Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk4eD-0008G6-Rn
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 03:30:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk4eB-0008El-Ju
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:30:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk4eA-00038X-GB
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:30:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56314)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk4e4-00036l-S1; Wed, 14 Sep 2016 03:30:13 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C1E14416E3;
	Wed, 14 Sep 2016 10:30:07 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 53818AAB;
	Wed, 14 Sep 2016 10:30:07 +0300 (MSK)
To: Christopher Friedt <chrisfriedt@gmail.com>, famz@redhat.com, mst@redhat.com
References: <1462237852-61856-1-git-send-email-chrisfriedt@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <269ab2fb-a43b-c5ee-3ff4-c08f99054f8b@msgid.tls.msk.ru>
Date: Wed, 14 Sep 2016 10:30:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1462237852-61856-1-git-send-email-chrisfriedt@gmail.com>
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH 1/2v2] [RESENT-INLINE] Use libtool
 instead of ar to create static libraries on Darwin.
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
X-List-Received-Date: Wed, 14 Sep 2016 07:30:20 -0000

03.05.2016 04:10, Christopher Friedt wrote:
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
> +ifdef CONFIG_DARWIN
> +	$(call quiet-command,rm -f $@ && libtool -static -o $@ $^,"  libtool    $(TARGET_DIR)$@")
> +else
>  	$(call quiet-command,rm -f $@ && $(AR) rcs $@ $^,"  AR    $(TARGET_DIR)$@")
> +endif
>
>  quiet-command = $(if $(V),$1,$(if $(2),@echo $2 && $1, @$1))

Hmm.  Is this patch still relevant?  Apparently I missed it back then.

Thanks,

/mjt


