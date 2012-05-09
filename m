Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SS85S-0003K9-Ur
	for mharc-qemu-trivial@gnu.org; Wed, 09 May 2012 10:41:54 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jim@meyering.net>) id 1SS85P-00038T-25
	for qemu-trivial@nongnu.org; Wed, 09 May 2012 10:41:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jim@meyering.net>) id 1SS85M-0007cO-Nt
	for qemu-trivial@nongnu.org; Wed, 09 May 2012 10:41:50 -0400
Received: from mx.meyering.net ([88.168.87.75]:37895)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jim@meyering.net>)
	id 1SS858-0007an-IA; Wed, 09 May 2012 10:41:34 -0400
Received: from rho.meyering.net (localhost.localdomain [127.0.0.1])
	by rho.meyering.net (Acme Bit-Twister) with ESMTP id DC24560555;
	Wed,  9 May 2012 16:41:31 +0200 (CEST)
From: Jim Meyering <jim@meyering.net>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <1336572749-12718-1-git-send-email-peter.maydell@linaro.org>
	(Peter Maydell's message of "Wed, 9 May 2012 15:12:29 +0100")
References: <1336572749-12718-1-git-send-email-peter.maydell@linaro.org>
Date: Wed, 09 May 2012 16:41:31 +0200
Message-ID: <874nrpxvqc.fsf@rho.meyering.net>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 88.168.87.75
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qga/commands-posix.c: Fix
	typo in error message
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
X-List-Received-Date: Wed, 09 May 2012 14:41:53 -0000

Peter Maydell wrote:
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> NB: might trivially textually conflict with Jim Meyering's
> strncpy fix here. (I spotted this typo in the context lines
> for his patch...)
>
>  qga/commands-posix.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index d58730a..0878ec7 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -789,7 +789,7 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
>              strncpy(ifr.ifr_name,  info->value->name, IF_NAMESIZE);
>              if (ioctl(sock, SIOCGIFHWADDR, &ifr) == -1) {
>                  snprintf(err_msg, sizeof(err_msg),
> -                         "failed to get MAC addres of %s: %s",
> +                         "failed to get MAC address of %s: %s",
>                           ifa->ifa_name,
>                           strerror(errno));
>                  error_set(errp, QERR_QGA_COMMAND_FAILED, err_msg);

Obviously fine.
Reminds me of the misspellings script that was recently run on coreutils:

  http://github.com/lyda/misspell-check

It finds common misspellings in comments and code.
There were a few false positives (rela->real, where "rela" is a variable
name), but otherwise it works well:

I ran this to identify the culprits and to massage its
output into a sed script to fix them:

git ls-files|grep -vF .bin | misspellings -f - |grep -v '^ERROR:' |perl \
  -pe 's/^(.*?)\[(\d+)\]: (\w+) -> "(.*?)"$/sed -i '\''${2}s!$3!$4!'\'' $1/' > k

With one more manual tweak (it wasn't sure if "addres"
should be "adders" or "address", so the sed syntax wasn't right),
I got this:

  sed -i '450s!thru!through!' Changelog
  sed -i '260s!neccessary!necessary!' coroutine-sigaltstack.c
  sed -i '54s!miniscule!minuscule!' disas.c
  sed -i '1094s!thru!through!' hw/usb/hcd-ehci.c
  sed -i '1095s!thru!through!' hw/usb/hcd-ehci.c
  sed -i '21s!unecessary!unnecessary!' qapi-schema-guest.json
  sed -i '307s!explictly!explicitly!' qemu-ga.c
  sed -i '490s!preceeding!preceding!' qga/commands-posix.c
  sed -i '792s!addres!address!' qga/commands-posix.c
  sed -i '6s!beeing!being!' tests/tcg/test-mmap.c

Which induces the change I'm posting separately.

