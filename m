Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TnfkL-0005oI-EG
	for mharc-qemu-trivial@gnu.org; Tue, 25 Dec 2012 20:25:25 -0500
Received: from eggs.gnu.org ([208.118.235.92]:42433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kongjianjun@gmail.com>) id 1TnfkJ-0005jW-Jp
	for qemu-trivial@nongnu.org; Tue, 25 Dec 2012 20:25:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kongjianjun@gmail.com>) id 1TnfkI-0006UH-LV
	for qemu-trivial@nongnu.org; Tue, 25 Dec 2012 20:25:23 -0500
Received: from mail-vc0-f179.google.com ([209.85.220.179]:45012)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kongjianjun@gmail.com>)
	id 1TnfkA-0006TS-Mv; Tue, 25 Dec 2012 20:25:14 -0500
Received: by mail-vc0-f179.google.com with SMTP id p1so8255068vcq.24
	for <multiple recipients>; Tue, 25 Dec 2012 17:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=vTrfR01L5CtLfNm8+Dv7k+INFD8kIQurjHaU0bD4HTQ=;
	b=JhoNqNGqLerEseUbYuPJ8VCeijD8WWiE6X9if9FO2qW3aXlifmKiIRWbsW8rDae/XR
	lOHgu738pjzki9IVRclN3Wx348RxIIe9VGLW/eD+SuYvKx09VUHc96F+NfxqHY36BGU/
	Xfolb/CkiYczZOaVXiixG7f0Lp7PIvHVtBC3WBGYdz9yL9/upab0aWqHHhcFTgXESz7P
	HKmEJfjkusOiwqA7eZq2we8IK0w/2Kmico/TsAgFpTcrxnmp/EGxmXs5U2c0Evk7mMhv
	avb1O8jMkv/eCuhzjW0bdQzBXhbIYSNNZZiafioLHCYPAv+DcEqn+oIRR1YvtuPzINyg
	w/kg==
MIME-Version: 1.0
Received: by 10.220.149.17 with SMTP id r17mr39608073vcv.0.1356485112975; Tue,
	25 Dec 2012 17:25:12 -0800 (PST)
Received: by 10.58.64.34 with HTTP; Tue, 25 Dec 2012 17:25:12 -0800 (PST)
In-Reply-To: <1356479389-1967-1-git-send-email-maillist-qemu@barfooze.de>
References: <1356479389-1967-1-git-send-email-maillist-qemu@barfooze.de>
Date: Wed, 26 Dec 2012 09:25:12 +0800
Message-ID: <CAFeW=pYC192eyUZ3CVsRvCfEx=W_A82_+GR85dHbWPvpXrtmtw@mail.gmail.com>
From: Amos Kong <kongjianjun@gmail.com>
To: John Spencer <maillist-qemu@barfooze.de>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.220.179
Cc: qemu-trivial@nongnu.org, sw@weilnetz.de, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user/syscall.c:
	remove forward declarations
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
X-List-Received-Date: Wed, 26 Dec 2012 01:25:24 -0000

On Wed, Dec 26, 2012 at 7:49 AM, John Spencer <maillist-qemu@barfooze.de> wrote:
>
> instead use the correct headers that define these functions.
>
> Requested-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: John Spencer <maillist-qemu@barfooze.de>
> ---
>  linux-user/syscall.c |    8 +++-----
>  1 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index e99adab..3167a87 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -36,6 +36,9 @@
>  #include <sys/time.h>
>  #include <sys/stat.h>
>  #include <sys/mount.h>
> +#include <sys/file.h>
> +#include <sys/fsuid.h>
> +#include <sys/personality.h>
>  #include <sys/prctl.h>
>  #include <sys/resource.h>
>  #include <sys/mman.h>
> @@ -581,11 +584,6 @@ _syscall4(int, sys_prlimit64, pid_t, pid, int, resource,
>            struct host_rlimit64 *, old_limit)
>  #endif
>
> -extern int personality(int);
> -extern int flock(int, int);
> -extern int setfsuid(int);
> -extern int setfsgid(int);
> -

Reviewed-by: Amos Kong <kongjianjun@gmail.com>

>  /* ARM EABI and MIPS expect 64bit types aligned even on pairs or registers */
>  #ifdef TARGET_ARM
>  static inline int regpairs_aligned(void *cpu_env) {
> --
> 1.7.3.4
>
>

