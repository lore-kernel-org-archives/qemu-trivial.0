Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S0HDB-0004zW-Rx
	for mharc-qemu-trivial@gnu.org; Wed, 22 Feb 2012 13:46:45 -0500
Received: from eggs.gnu.org ([140.186.70.92]:45168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1S0HD8-0004oQ-RK
	for qemu-trivial@nongnu.org; Wed, 22 Feb 2012 13:46:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1S0HD7-0000O9-Lb
	for qemu-trivial@nongnu.org; Wed, 22 Feb 2012 13:46:42 -0500
Received: from mail-pz0-f45.google.com ([209.85.210.45]:51148)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1S0HD5-0000NT-Bg; Wed, 22 Feb 2012 13:46:39 -0500
Received: by dadp14 with SMTP id p14so381529dad.4
	for <multiple recipients>; Wed, 22 Feb 2012 10:46:37 -0800 (PST)
Received: by 10.68.208.136 with SMTP id me8mr75470909pbc.55.1329936397399;
	Wed, 22 Feb 2012 10:46:37 -0800 (PST)
Received: from [192.168.0.108] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id y7sm19620732pbp.25.2012.02.22.10.46.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Feb 2012 10:46:35 -0800 (PST)
Message-ID: <4F453808.7020401@codemonkey.ws>
Date: Wed, 22 Feb 2012 12:46:32 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1329835480-22192-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1329835480-22192-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Gm-Message-State: ALoCoQm5EOLqtLXBRmkomtRdf/+vfWVbsn89k911ypIFySppMNNB8A/aPp78O4KdJrnA7BfKntAS
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.45
Cc: qemu-trivial@nongnu.org, Corey Bryant <coreyb@linux.vnet.ibm.com>,
	qemu-devel@nongnu.org, =?UTF-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: Add dependency to
 fix linux-user-only build
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
X-List-Received-Date: Wed, 22 Feb 2012 18:46:44 -0000

On 02/21/2012 08:44 AM, Peter Maydell wrote:
> Make qemu-bridge-helper explicitly depend on $(GENERATED_HEADERS)
> so that it doesn't fail to build when we configured for linux-user
> targets only. (Build breakage introduced in commit 7b93fad.)
>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>

Applied.  Thanks.

Regards,

Anthony Liguori

> ---
> I suspect we could handle generated headers better in our makefile
> than having to scatter $(GENERATED_HEADERS) dependencies into almost
> everything (eg "%.o: $(GENERATED_HEADERS)" ??) but this is the minimal
> fix for the build breakage which we should apply for now I think.
>
>   Makefile |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index e66e885..c67493e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -159,6 +159,7 @@ qemu-nbd$(EXESUF): qemu-nbd.o $(tools-obj-y) $(block-obj-y)
>   qemu-io$(EXESUF): qemu-io.o cmd.o $(tools-obj-y) $(block-obj-y)
>
>   qemu-bridge-helper$(EXESUF): qemu-bridge-helper.o
> +qemu-bridge-helper.o: $(GENERATED_HEADERS)
>
>   fsdev/virtfs-proxy-helper$(EXESUF): fsdev/virtfs-proxy-helper.o fsdev/virtio-9p-marshal.o oslib-posix.o $(trace-obj-y)
>   fsdev/virtfs-proxy-helper$(EXESUF): LIBS += -lcap


