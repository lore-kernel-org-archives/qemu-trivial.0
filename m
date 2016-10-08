Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsuBT-0005AE-Pr
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 12:09:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bsuBR-00058w-UB
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 12:09:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bsuBQ-0005Oz-M6
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 12:09:09 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:33764)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bsuBL-0005IE-C6; Sat, 08 Oct 2016 12:09:03 -0400
Received: from [IPv6:2602:30a:c7d0:7100:7657:7b6:d81b:9143] (unknown
	[IPv6:2602:30a:c7d0:7100:7657:7b6:d81b:9143])
	(Authenticated sender: eric@blake.one)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id D4B88A80C1;
	Sat,  8 Oct 2016 18:08:58 +0200 (CEST)
From: Eric Blake <eblake@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>
References: <1475920807-13485-1-git-send-email-laurent@vivier.eu>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Message-ID: <7b5db00d-d567-4969-f991-e5affb34c1dd@redhat.com>
Date: Sat, 8 Oct 2016 11:08:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1475920807-13485-1-git-send-email-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.70.183.195
Subject: Re: [Qemu-trivial] [PATCH v2] MAINTAINERS: qemu-trivial information
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
X-List-Received-Date: Sat, 08 Oct 2016 16:09:11 -0000

On 10/08/2016 05:00 AM, Laurent Vivier wrote:
> Information about "qemu-trivial" ML can be found in the wiki:
> 
>     http://wiki.qemu.org/Contribute/TrivialPatches
> 
> But the first place where a developer looks is the file MAINTAINERS.
> 
> This also allows the get_maintainer.pl script to display
> the qemu-trivial ML address when the mail subject contains "trivial".
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
> v2:
> - move to the top
> - add my name to help Michael to manage trivial-patches
> 
>  MAINTAINERS | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9bca506..18e38e8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -63,6 +63,17 @@ W: http://wiki.qemu.org/SecurityProcess
>  M: Michael S. Tsirkin <mst@redhat.com>
>  L: secalert@redhat.com
>  
> +Trivial patches
> +---------------
> +Trivial patches
> +M: Michael Tokarev <mjt@tls.msk.ru>
> +M: Laurent Vivier <laurent@vivier.eu>
> +S: Maintained
> +L: qemu-trivial@nongnu.org
> +K: ^Subject:.*(?i)trivial
> +T: git git://git.corpit.ru/qemu.git trivial-patches
> +T: git git://github.com/vivier/qemu.git trivial-patches
> +
>  Guest CPU cores (TCG):
>  ----------------------
>  Overall
> 

-- 
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org

