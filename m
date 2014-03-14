Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOWtc-0001Fg-Or
	for mharc-qemu-trivial@gnu.org; Fri, 14 Mar 2014 14:31:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1WOWtW-0000up-8B
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 14:31:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1WOWtR-0008Tu-Cw
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 14:31:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58511)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1WOWtH-0008Q1-BU; Fri, 14 Mar 2014 14:31:31 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2EIUPDY022235
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 14 Mar 2014 14:30:26 -0400
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-32.ams2.redhat.com
	[10.36.116.32])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s2EIUHbO013216; Fri, 14 Mar 2014 14:30:20 -0400
Message-ID: <53234AB9.8050008@redhat.com>
Date: Fri, 14 Mar 2014 19:30:17 +0100
From: Laszlo Ersek <lersek@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Cole Robinson <crobinso@redhat.com>, qemu-devel@nongnu.org
References: <7bd1da678bd39335a69894433070611baf7c2968.1394815484.git.crobinso@redhat.com>
In-Reply-To: <7bd1da678bd39335a69894433070611baf7c2968.1394815484.git.crobinso@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.0]
 scripts/make-release: Don't distribute .git directories
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
X-List-Received-Date: Fri, 14 Mar 2014 18:31:51 -0000

On 03/14/14 17:45, Cole Robinson wrote:
> [crobinso@localhost qemu-2.0.0-rc0]$ find . -name .git
> ./dtc/.git
> ./pixman/.git
> 
> This is already done for the rom submodules.
> 
> https://bugs.launchpad.net/qemu/+bug/1224414
> Signed-off-by: Cole Robinson <crobinso@redhat.com>
> ---
>  scripts/make-release | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/make-release b/scripts/make-release
> index 196c755..cb7c2da 100755
> --- a/scripts/make-release
> +++ b/scripts/make-release
> @@ -18,7 +18,7 @@ git clone "${src}" ${destination}
>  pushd ${destination}
>  git checkout "v${version}"
>  git submodule update --init
> -rm -rf .git roms/*/.git
> +rm -rf .git roms/*/.git dtc/.git pixman/*.git
>  popd
>  tar cfj ${destination}.tar.bz2 ${destination}
>  rm -rf ${destination}
> 

This seems to be complete:

.gitmodules:[submodule "roms/vgabios"]
.gitmodules:[submodule "roms/seabios"]
.gitmodules:[submodule "roms/SLOF"]
.gitmodules:[submodule "roms/ipxe"]
.gitmodules:[submodule "roms/openbios"]
.gitmodules:[submodule "roms/openhackware"]
.gitmodules:[submodule "roms/qemu-palcode"]
.gitmodules:[submodule "roms/sgabios"]
.gitmodules:[submodule "pixman"]
.gitmodules:[submodule "dtc"]

but did you in fact mean

  pixman/*.git

rather tan

  pixman/.git

?

Thanks
Laszlo

