Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bbryP-0005TV-Rk
	for mharc-qemu-trivial@gnu.org; Mon, 22 Aug 2016 12:21:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bbryN-0005RW-PV
	for qemu-trivial@nongnu.org; Mon, 22 Aug 2016 12:21:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bbryM-0003gY-Ik
	for qemu-trivial@nongnu.org; Mon, 22 Aug 2016 12:21:15 -0400
Received: from mail-ua0-x22c.google.com ([2607:f8b0:400c:c08::22c]:35407)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bbryM-0003gS-EU
	for qemu-trivial@nongnu.org; Mon, 22 Aug 2016 12:21:14 -0400
Received: by mail-ua0-x22c.google.com with SMTP id n59so197801480uan.2
	for <qemu-trivial@nongnu.org>; Mon, 22 Aug 2016 09:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iLCTzl5LP3dgptZEtY9yeP6SV3X0FGiQTIqOTCZ2dCo=;
	b=eDxDfOmDnKSiTaIK24gqk9GR3s0fFbRy1OfGc9blCu6/aFZNU2BeM55JVYRVdtit/w
	+qiRQetDvhKrkCvkFktZxspJQh9cbs3zQeqmKRZaiE02WSXbFlzo2FM65rwBkTp1CWJc
	olAxU2yZ9SCu6tyr8gsY7Lk1zmYPHREOY2XRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iLCTzl5LP3dgptZEtY9yeP6SV3X0FGiQTIqOTCZ2dCo=;
	b=Uh2wlVxlFaOmfmtah74E+ny8OqWL6B5RWuLdyJ24iux7BBkbbOsjRVWSXco23D86D6
	PwDaWqxImdi9AEBTrLgYGR/iGt2xbKcm5TKeWJzQiPHBCTreQ+/sN5/9frpGvLttR48a
	E+a5P804C9TeZjPWL681VRkmP7e1H9dJJjmeAqGeIJzgZxrbCIuDMDFyMB9D+Eysn84o
	dHB+8VSQTdrieit2em9hcChpMTtDo3FHwsKHRgYJH01XPpgt2+3aUQJA4lSX/GIGksRW
	3m0BZ7oYCXQvZcMxXsOBQppZSdjvA8hl8eITlqhSm+0bqRHvcEJ/zjMytrd+hPsevKII
	u3PQ==
X-Gm-Message-State: AEkoouslyAKGruT4lyU0m8ggJrkYzrB6IZ8oY7be7p0r+PO56KHOOxSInTl0N4ypu9Vl3XRh5Yr0bt/DQDENqFYA
X-Received: by 10.31.92.86 with SMTP id q83mr11426449vkb.92.1471882874091;
	Mon, 22 Aug 2016 09:21:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.149 with HTTP; Mon, 22 Aug 2016 09:20:53 -0700 (PDT)
In-Reply-To: <1471877833-52343-1-git-send-email-emaste@freebsd.org>
References: <1471877833-52343-1-git-send-email-emaste@freebsd.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Aug 2016 17:20:53 +0100
Message-ID: <CAFEAcA_eQsoDqgU=6ABXYouof_J3hpQea6tb8=GyJ9MW7DdLZg@mail.gmail.com>
To: Ed Maste <emaste@freebsd.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22c
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix bsd-user build after
 d915b7bb
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
X-List-Received-Date: Mon, 22 Aug 2016 16:21:16 -0000

On 22 August 2016 at 15:57, Ed Maste <emaste@freebsd.org> wrote:
> Must include "qemu-version.h" for the QEMU_PKGVERSION definition.
>
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
>  bsd-user/main.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index b4a0a00..0fb08e4 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -17,6 +17,7 @@
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
>  #include "qemu/osdep.h"
> +#include "qemu-version.h"
>  #include <machine/trap.h>
>
>  #include "qapi/error.h"

Awkward that this missed rc4 by an hour or two :-(

-- PMM

