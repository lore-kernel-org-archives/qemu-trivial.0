Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g2bmK-0005DW-QD
	for mharc-qemu-trivial@gnu.org; Wed, 19 Sep 2018 08:40:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1g2bmE-0005C2-Kr
	for qemu-trivial@nongnu.org; Wed, 19 Sep 2018 08:40:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1g2bm8-0002x2-RN
	for qemu-trivial@nongnu.org; Wed, 19 Sep 2018 08:40:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42902)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1g2bm4-0002pR-Nn; Wed, 19 Sep 2018 08:40:08 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BD1513084039;
	Wed, 19 Sep 2018 12:40:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-77.ams2.redhat.com
	[10.36.116.77])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57E881001F5E;
	Wed, 19 Sep 2018 12:40:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C8F7B11385CB; Wed, 19 Sep 2018 14:40:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Li Qiang <liq3ea@gmail.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <1536150548-2797-1-git-send-email-liq3ea@gmail.com>
Date: Wed, 19 Sep 2018 14:40:04 +0200
In-Reply-To: <1536150548-2797-1-git-send-email-liq3ea@gmail.com> (Li Qiang's
	message of "Wed, 5 Sep 2018 05:29:08 -0700")
Message-ID: <87musdoe3f.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 19 Sep 2018 12:40:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] cpu.h: fix a typo in comment
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
X-List-Received-Date: Wed, 19 Sep 2018 12:40:24 -0000

Could be merged via qemu-trivial (cc'ed).

Li Qiang <liq3ea@gmail.com> writes:

> Found by reading the code.
>
> Signed-off-by: Li Qiang <liq3ea@gmail.com>
> ---
>  include/qom/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index dc130cd307..5bb94a9f86 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -852,7 +852,7 @@ extern CPUInterruptHandler cpu_interrupt_handler;
>  /**
>   * cpu_interrupt:
>   * @cpu: The CPU to set an interrupt on.
> - * @mask: The interupts to set.
> + * @mask: The interrupts to set.
>   *
>   * Invokes the interrupt handler.
>   */

