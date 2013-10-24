Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VZI9r-0008Va-VC
	for mharc-qemu-trivial@gnu.org; Thu, 24 Oct 2013 06:28:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1VZI9l-0008Th-07
	for qemu-trivial@nongnu.org; Thu, 24 Oct 2013 06:28:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1VZI9g-0003mu-CE
	for qemu-trivial@nongnu.org; Thu, 24 Oct 2013 06:28:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56312)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1VZI9g-0003mo-4D; Thu, 24 Oct 2013 06:28:40 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9OASbXc028161
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 24 Oct 2013 06:28:37 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-46.ams2.redhat.com
	[10.36.112.46])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r9OASZlK004312; Thu, 24 Oct 2013 06:28:36 -0400
Message-ID: <5268F652.4070109@redhat.com>
Date: Thu, 24 Oct 2013 11:28:34 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1382344550-10769-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1382344550-10769-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] configure: create fsdev/ directory
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
X-List-Received-Date: Thu, 24 Oct 2013 10:28:49 -0000

Il 21/10/2013 09:35, Michael Tokarev ha scritto:
> In some cases when building with parallelism (make -jN),
> build fails because the directory where output files are
> supposed to be does not exist.  In particular, when make
> decides to build virtfs-proxy-helper.1 before other files
> in fsdev/, build will fail with the following error:
> 
> perl -Ww -- BUILDDIR/scripts/texi2pod.pl BUILDDIR/fsdev/virtfs-proxy-helper.texi fsdev/virtfs-proxy-helper.pod && pod2man --utf8 --section=1 --center=" " --release=" " fsdev/virtfs-proxy-helper.pod > fsdev/virtfs-proxy-helper.1
> opening "fsdev/virtfs-proxy-helper.pod": No such file or directory
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  configure |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configure b/configure
> index 57ee62a..61bb27c 100755
> --- a/configure
> +++ b/configure
> @@ -4647,6 +4647,7 @@ fi
>  
>  # build tree in object directory in case the source is not in the current directory
>  DIRS="tests tests/tcg tests/tcg/cris tests/tcg/lm32 tests/libqos tests/qapi-schema tests/tcg/xtensa tests/qemu-iotests"
> +DIRS="$DIRS fsdev"
>  DIRS="$DIRS pc-bios/optionrom pc-bios/spapr-rtas pc-bios/s390-ccw"
>  DIRS="$DIRS roms/seabios roms/vgabios"
>  DIRS="$DIRS qapi-generated"
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Please queue it through trivial.

Paolo

