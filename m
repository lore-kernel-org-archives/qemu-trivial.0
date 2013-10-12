Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VV24C-0005ii-1R
	for mharc-qemu-trivial@gnu.org; Sat, 12 Oct 2013 12:29:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VV244-0005Y2-0k
	for qemu-trivial@nongnu.org; Sat, 12 Oct 2013 12:29:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VV23y-0003Fp-Ti
	for qemu-trivial@nongnu.org; Sat, 12 Oct 2013 12:29:15 -0400
Received: from mail-ee0-x22b.google.com ([2a00:1450:4013:c00::22b]:62540)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1VV23o-0003Ct-GU; Sat, 12 Oct 2013 12:29:00 -0400
Received: by mail-ee0-f43.google.com with SMTP id e52so2513665eek.16
	for <multiple recipients>; Sat, 12 Oct 2013 09:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=OwABq0IHVMIlVyyZoQYtOAWXD8xBfAcKZDK9hFnRLRY=;
	b=fHAsqW8PPcZdCxvJvrG6tDc9V4cyVCtXEwRfZizIPwmxZlXdYDzi4f3aHGo0ywsZDq
	aoLwXJG2nNp26c/P5iZnIc8giXpoJpTnWKk1H7iNdGNms/d1kaRaB8SYi69C3m+B70XS
	oQtHOCHuoPTsXWoxjfJiXmsxpdVC0AtQGc4MnNRCqhTFzbmYxd8J/0vZ+CKtF73ExpN2
	1d3roZmi/iI20ZE6kri7Pd/O9l1O2ucG8nflHtxvmkdo2mDi3HO9b4Ic437NKp/WSnH6
	G2rDWZrk8Vjcyk31XaI0Zvn9BDM3+lk+zjxQLDVnGLCO1zFzft/Rt5n/89cilcFofdaE
	vRGA==
X-Received: by 10.15.83.2 with SMTP id b2mr39562737eez.28.1381595339456;
	Sat, 12 Oct 2013 09:28:59 -0700 (PDT)
Received: from yakj.usersys.redhat.com (net-37-116-196-7.cust.dsl.vodafone.it.
	[37.116.196.7]) by mx.google.com with ESMTPSA id
	h52sm129356081eez.3.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 12 Oct 2013 09:28:58 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <525978C8.9010002@redhat.com>
Date: Sat, 12 Oct 2013 18:28:56 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1381482317-25433-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1381482317-25433-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::22b
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: create fsdev/ directory
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
X-List-Received-Date: Sat, 12 Oct 2013 16:29:21 -0000

Il 11/10/2013 11:05, Michael Tokarev ha scritto:
> In some cases when building with parallelism (make -jN),
> build fails because the directory where output files are
> supposed to be does not exist.  In particular, when make
> decides to build virtfs-proxy-helper.1 before other files
> in fsdev/, build will fail with the following error:
> 
> perl -Ww -- BUILDDIR/scripts/texi2pod.pl BUILDDIR/fsdev/virtfs-proxy-helper.texi fsdev/virtfs-proxy-helper.pod && pod2man --utf8 --section=1 --center=" " --release=" " fsdev/virtfs-proxy-helper.pod > fsdev/virtfs-proxy-helper.1
> opening "fsdev/virtfs-proxy-helper.pod": No such file or directory
> 
> Create the `fsdev' subdir the same way as other "conditional"
> subdirs (eg, dtc or pixman) are created in configure.
> 
> Might be better to extract all dirs from $tools and other
> common vars and run mkdir on all of these, but this needs
> some review/restructuring first.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  configure |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configure b/configure
> index 23dbaaf..203084a 100755
> --- a/configure
> +++ b/configure
> @@ -3576,6 +3576,7 @@ if test "$softmmu" = yes ; then
>      if test "$cap" = yes && test "$linux" = yes && test "$attr" = yes ; then
>        virtfs=yes
>        tools="$tools fsdev/virtfs-proxy-helper\$(EXESUF)"
> +      mkdir -p fsdev
>      else
>        if test "$virtfs" = yes; then
>          error_exit "VirtFS is supported only on Linux and requires libcap-devel and libattr-devel"
> 

Please modify around

DIRS="tests tests/tcg tests/tcg/cris tests/tcg/lm32 tests/libqos
tests/qapi-schema tests/tcg/xtensa tests/qemu-iotests"
DIRS="$DIRS pc-bios/optionrom pc-bios/spapr-rtas pc-bios/s390-ccw"
DIRS="$DIRS roms/seabios roms/vgabios"
DIRS="$DIRS qapi-generated"

instead.

Paolo

