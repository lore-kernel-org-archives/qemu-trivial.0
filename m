Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bihl1-0002BL-T4
	for mharc-qemu-trivial@gnu.org; Sat, 10 Sep 2016 08:51:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1bihkz-0002B9-FZ
	for qemu-trivial@nongnu.org; Sat, 10 Sep 2016 08:51:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1bihkt-0000pI-5Z
	for qemu-trivial@nongnu.org; Sat, 10 Sep 2016 08:51:41 -0400
Received: from mail.uni-paderborn.de ([131.234.142.9]:52834)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1bihks-0000oS-Ud; Sat, 10 Sep 2016 08:51:35 -0400
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1473455829-27400-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <d01d595a-01a9-b584-72b5-95d9ef47980e@mail.uni-paderborn.de>
Date: Sat, 10 Sep 2016 14:51:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1473455829-27400-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.3.0.2556906, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2016.9.10.124517
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] MAINTAINERS: Add
 include/hw/tricore/ to TriCore section
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
X-List-Received-Date: Sat, 10 Sep 2016 12:51:42 -0000

On 09/09/2016 11:17 PM, Thomas Huth wrote:
> get_maintainer.pl now properly recognizes that the file in
> include/hw/tricore/ belongs to TriCore.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7196dba..dad82e7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -228,6 +228,7 @@ M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>  S: Maintained
>  F: target-tricore/
>  F: hw/tricore/
> +F: include/hw/tricore/
>  
>  Guest CPU Cores (KVM):
>  ----------------------
> 

Woops :). I'm fine with this change. I guess this goes through trivial
tree?

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheer,
    Bastian

