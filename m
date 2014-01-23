Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W6Dg0-0007Aa-EQ
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jan 2014 01:22:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1W6Dfr-0006ye-PH
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 01:22:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1W6Dfk-0006Qf-EP
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 01:21:59 -0500
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:59255)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1W6DfV-0006Cf-89; Thu, 23 Jan 2014 01:21:37 -0500
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id 6F2AB1022C1;
	Thu, 23 Jan 2014 07:21:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (smtp.mail.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 54MMrXGgoSgx; Thu, 23 Jan 2014 07:21:34 +0100 (CET)
Received: from [192.168.178.35] (p54AD837B.dip0.t-ipconnect.de
	[84.173.131.123])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPSA id 15249102275;
	Thu, 23 Jan 2014 07:21:34 +0100 (CET)
Message-ID: <52E0B4EC.4040904@weilnetz.de>
Date: Thu, 23 Jan 2014 07:21:32 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Stewart Smith <stewart@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <1390452896-20146-1-git-send-email-stewart@linux.vnet.ibm.com>
In-Reply-To: <1390452896-20146-1-git-send-email-stewart@linux.vnet.ibm.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 134.155.96.80
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: helpfully output
 package names for some missing dependencies.
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
X-List-Received-Date: Thu, 23 Jan 2014 06:22:07 -0000

Hi Steward,

Am 23.01.2014 05:54, schrieb Stewart Smith:
> This just makes it a tiny bit easier for new developers to get started
> by making it easy to see what package they need to install to get
> the dependency.
> 
> Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
> ---
>  configure | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 3782a6a..87303f6 100755
> --- a/configure
> +++ b/configure
> @@ -1532,7 +1532,9 @@ EOF
>          :
>      else
>          error_exit "zlib check failed" \
> -            "Make sure to have the zlib libs and headers installed."
> +            "Make sure to have the zlib libs and headers installed." \
> +            "Debian/Ubuntu: zlib1g-dev" \
> +            "Fedora/RHEL: zlib-devel"
>      fi
>  fi

Removing that zlib check is on my private todo list since QEMU uses
glib2, because glib2 already depends on zlib.


>  libs_softmmu="$libs_softmmu -lz"
> @@ -2348,7 +2350,9 @@ if $pkg_config --atleast-version=$glib_req_ver gthread-2.0; then
>      LIBS="$glib_libs $LIBS"
>      libs_qga="$glib_libs $libs_qga"
>  else
> -    error_exit "glib-$glib_req_ver required to compile QEMU"
> +    error_exit "glib-$glib_req_ver required to compile QEMU."\
> +               "Debian/Ubuntu: libglib2.0-dev" \
> +               "Fedora/RHEL: glib2-devel"
>  fi
>  
>  ##########################################
> @@ -2380,6 +2384,8 @@ else
>      error_exit "pixman not present. Your options:" \
>          "  (1) Preferred: Install the pixman devel package (any recent" \
>          "      distro should have packages as Xorg needs pixman too)." \
> +	"      Ubuntu/Debian: libpixman-1-dev" \
> +        "      Fedora/RHEL: pixman-devel"\
>          "  (2) Fetch the pixman submodule, using:" \
>          "      git submodule update --init pixman"
>    fi
> @@ -2656,6 +2662,8 @@ EOF
>      # have neither and want - prompt for system/submodule install
>      error_exit "DTC not present. Your options:" \
>          "  (1) Preferred: Install the DTC devel package" \
> +	"      Ubuntu/Debian: libfdt-dev" \

The previous line uses a tab character. Replace it by blanks.

Here a small hint might by useful because searching for 'DTC' packages
will usually fail. What about writing "DTC (libfdt) devel package"?

> +        "      Fedora/RHEL: libfdt-devel" \
>          "  (2) Fetch the DTC submodule, using:" \
>          "      git submodule update --init dtc"
>    else
> 

I'm not sure whether the file 'configure' is the right place for the
precise package information. Here are some thoughts:

* Those help messages are only useful for Debian / Fedore based Linux
  distributions, but not for OpenSuSE and definitely not for other
  hosts (Mac OS X, Windows, BSD).

* They only cover a very limited set of packages. For a really useful
  QEMU, lots of more packages are needed.

* Package names are not really good interfaces because they tend to
  change over time.

My personal impression is that the current hints in configure are
sufficient (with the one exception DTC) and that the QEMU wiki is a
better place to document build dependencies for the different platforms.

Cheers
Stefan


