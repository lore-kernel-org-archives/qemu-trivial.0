Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qdqxn-0006T7-70
	for mharc-qemu-trivial@gnu.org; Mon, 04 Jul 2011 17:45:55 -0400
Received: from eggs.gnu.org ([140.186.70.92]:39187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1Qdqxl-0006Se-42
	for qemu-trivial@nongnu.org; Mon, 04 Jul 2011 17:45:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1Qdqxk-0002vZ-B1
	for qemu-trivial@nongnu.org; Mon, 04 Jul 2011 17:45:53 -0400
Received: from cantor2.suse.de ([195.135.220.15]:49689 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1Qdqxh-0002vE-OM; Mon, 04 Jul 2011 17:45:50 -0400
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.221.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 12D0F8738D;
	Mon,  4 Jul 2011 23:45:48 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset=us-ascii
From: Alexander Graf <agraf@suse.de>
In-Reply-To: <1309813366-7994-1-git-send-email-peter.maydell@linaro.org>
Date: Mon, 4 Jul 2011 23:45:47 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <3894AA64-4F23-416C-8DDF-EAC95AECAD51@suse.de>
References: <1309813366-7994-1-git-send-email-peter.maydell@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.1084)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-alpha,
	target-ppc: Remove unnecessary setjmp.h include
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
X-List-Received-Date: Mon, 04 Jul 2011 21:45:54 -0000


On 04.07.2011, at 23:02, Peter Maydell wrote:

> Remove the include of setjmp.h from the cpu.h of target-alpha
> and target-ppc. This is unnecessary because cpu-defs.h already
> includes this header; this change brings these two targets
> into line with all the rest.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Yeah, I actually think no code (unless specifically configure'd for it) =
should include non-local headers (<...> instead of "..."). Of course =
that would include device/target specific headers as well ;).


Acked-by: Alexander Graf <agraf@suse.de>

> ---
> target-alpha/cpu.h |    2 --
> target-ppc/cpu.h   |    2 --
> 2 files changed, 0 insertions(+), 4 deletions(-)
>=20
> diff --git a/target-alpha/cpu.h b/target-alpha/cpu.h
> index 411bd55..78caa79 100644
> --- a/target-alpha/cpu.h
> +++ b/target-alpha/cpu.h
> @@ -28,8 +28,6 @@
>=20
> #include "cpu-defs.h"
>=20
> -#include <setjmp.h>
> -
> #include "softfloat.h"
>=20
> #define TARGET_HAS_ICE 1
> diff --git a/target-ppc/cpu.h b/target-ppc/cpu.h
> index 84f8ff6..d903366 100644
> --- a/target-ppc/cpu.h
> +++ b/target-ppc/cpu.h
> @@ -75,8 +75,6 @@
>=20
> #include "cpu-defs.h"
>=20
> -#include <setjmp.h>
> -
> #include "softfloat.h"
>=20
> #define TARGET_HAS_ICE 1
> --=20
> 1.7.4.1
>=20
>=20


