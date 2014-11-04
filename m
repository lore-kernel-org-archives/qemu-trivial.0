Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XleN4-0004Gd-2a
	for mharc-qemu-trivial@gnu.org; Tue, 04 Nov 2014 08:42:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1XleMy-00047H-Cm
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 08:42:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1XleMt-0002WH-9x
	for qemu-trivial@nongnu.org; Tue, 04 Nov 2014 08:42:00 -0500
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:50113 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1XleMj-0002Jo-Ej; Tue, 04 Nov 2014 08:41:45 -0500
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1Xletb-0006RE-SS; Tue, 04 Nov 2014 15:15:44 +0100
References: <1415098223-32404-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1415098223-32404-6-git-send-email-zhang.zhanghailiang@huawei.com>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
In-reply-to: <1415098223-32404-6-git-send-email-zhang.zhanghailiang@huawei.com>
Date: Tue, 04 Nov 2014 13:41:45 +0000
Message-ID: <87y4rrt752.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com, armbru@redhat.com, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 5/5] spice-qemu-char:
	convert some functions to use Error API
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
X-List-Received-Date: Tue, 04 Nov 2014 13:42:05 -0000


zhanghailiang <zhang.zhanghailiang@huawei.com> writes:

> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
<snip>
>  
> -CharDriverState *qemu_chr_open_spice_vmc(const char *type)
> +CharDriverState *qemu_chr_open_spice_vmc(const char *type, Error **errp)
>  {
<snip>
> diff --git a/stubs/qemu-chr-open-spice.c b/stubs/qemu-chr-open-spice.c
> index f1c4849..55826ed 100644
> --- a/stubs/qemu-chr-open-spice.c
> +++ b/stubs/qemu-chr-open-spice.c
> @@ -1,7 +1,7 @@
>  #include "qemu-common.h"
>  #include "ui/qemu-spice.h"
>  
> -CharDriverState *qemu_chr_open_spice_vmc(const char *type)
> +CharDriverState *qemu_chr_open_spice_vmc(const char *type, Error **errp)
>  {
>      return NULL;
>  }

Ahh I may have missed it was a stub in the previous patch.


-- 
Alex Bennée

