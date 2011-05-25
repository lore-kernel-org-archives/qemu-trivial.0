Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QPIDN-0000DQ-3e
	for mharc-qemu-trivial@gnu.org; Wed, 25 May 2011 13:49:49 -0400
Received: from eggs.gnu.org ([140.186.70.92]:50995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QPIDL-00006P-0B
	for qemu-trivial@nongnu.org; Wed, 25 May 2011 13:49:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QPIDK-0002xP-3M
	for qemu-trivial@nongnu.org; Wed, 25 May 2011 13:49:46 -0400
Received: from moutng.kundenserver.de ([212.227.126.187]:56354)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>)
	id 1QPIDH-0002wB-Pm; Wed, 25 May 2011 13:49:44 -0400
Received: from flocke.weilnetz.de (p5086FABF.dip.t-dialin.net [80.134.250.191])
	by mrelayeu.kundenserver.de (node=mreu0) with ESMTP (Nemesis)
	id 0MVq96-1Q9swl2o36-00XR9a; Wed, 25 May 2011 19:49:40 +0200
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <weil@mail.berlios.de>)
	id 1QPIDC-0005K7-FF; Wed, 25 May 2011 19:49:38 +0200
Message-ID: <4DDD4132.1080708@mail.berlios.de>
Date: Wed, 25 May 2011 19:49:38 +0200
From: Stefan Weil <weil@mail.berlios.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20110307 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1306344617-1645-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1306344617-1645-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V02:K0:svSjhilo9BD2wfYfz5gsKoTtedxMnAjHezgbMzA1hSS
	I0sU6MSwUbT7UrcTND36LGmdf1dLC1Kg0IqWngWdK21JBk10jY
	3ZCiVxbboFXY/101V6ZxZgzf4r1oiv/+eSkPxt+YLKj3EHbFVo
	gF6odpiUQ9JdPUIgqQXFYKRVhBCqyUBGVyQ1ZnAuy6Cfih/4qk
	V/gAThz5SSS5tlejSoJgNb/qfaRulptidSt6HXyhHa+8W8+PpZ IcsLo5/9pSojM
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.126.187
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] configure: Don't create
 symlinks to	nonexistent targets
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
X-List-Received-Date: Wed, 25 May 2011 17:49:47 -0000

Am 25.05.2011 19:30, schrieb Peter Maydell:
> When we create the symlinks to source tree files, don't create them
> if the file is not actually present in the source tree; this will
> happen if the file is in a git submodule that wasn't checked out.
>
> This also avoids the odd effect where an in-source-tree configure
> will end up creating the missing file as a symlink to itself.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v2: Remove the debug printing. Oops.
>
> configure | 4 +++-
> 1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/configure b/configure
> index a318d37..a648f3d 100755
> --- a/configure
> +++ b/configure
> @@ -3564,7 +3564,9 @@ for bios_file in $source_path/pc-bios/*.bin 
> $source_path/pc-bios/*.rom $source_p
> done
> mkdir -p $DIRS
> for f in $FILES ; do
> - test -e $f || symlink $source_path/$f $f
> + if [ -e "$source_path/$f" -a ! -e "$f" ]; then
> + symlink "$source_path/$f" "$f"
> + fi
> done
>
> # temporary config to build submodules


Hi,

very good, those bad links which we get today are really annoying,
so for most developers this is an improvement.

Let me add some additional thoughts nevertheless.

* What happens if a git submodule is checked out after configure
   was done? Then the link is missing (until configure is called again).
   Maybe the links should be created from Makefile* instead from
   configure.

* On some restricted hosts which don't create symbolic links (w32),
   the copies which are created instead of links are not updated
   when the original file changes. This is not directly related to
   your change, but could be fixed, too, when the link creation is
   moved to Makefile*.

Cheers,
Stefan W.


