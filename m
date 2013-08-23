Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VCwOz-00017b-OY
	for mharc-qemu-trivial@gnu.org; Fri, 23 Aug 2013 14:48:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VCwOs-0000xD-8h
	for qemu-trivial@nongnu.org; Fri, 23 Aug 2013 14:48:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VCwOm-0008Rk-Vh
	for qemu-trivial@nongnu.org; Fri, 23 Aug 2013 14:47:58 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:53689)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VCwOa-0008Lp-4G; Fri, 23 Aug 2013 14:47:40 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	8241B7281C18; Fri, 23 Aug 2013 20:47:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id CBEw9ubn1_gu; Fri, 23 Aug 2013 20:47:26 +0200 (CEST)
Received: from [192.168.0.103] (p54840ACD.dip0.t-ipconnect.de [84.132.10.205])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	1ADBF7280101; Fri, 23 Aug 2013 20:47:24 +0200 (CEST)
Message-ID: <5217AE38.3060105@weilnetz.de>
Date: Fri, 23 Aug 2013 20:47:20 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Christoffer Dall <christoffer.dall@linaro.org>
References: <1377279256-4303-1-git-send-email-christoffer.dall@linaro.org>
In-Reply-To: <1377279256-4303-1-git-send-email-christoffer.dall@linaro.org>
X-Enigmail-Version: 1.4.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, linaro-kernel@lists.linaro.org,
	qemu-devel@nongnu.org, patches@linaro.org, kvmarm@lists.cs.columbia.edu
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] migration: Fix debug
	print type
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
X-List-Received-Date: Fri, 23 Aug 2013 18:48:03 -0000

Am 23.08.2013 19:34, schrieb Christoffer Dall:
> The printf args are uint64_t and with -Werr QEMU doesn't compile with
> migration debugging turned on unless this is fixed.  Fix it.
>
> Signed-off-by: Christoffer Dall <christoffer.dall@linaro.org>
> ---
>
> [Changelog v1 -> v2]:
>   - Use PRIu64 instead of %llu
>
>  migration.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/migration.c b/migration.c
> index 1402fa7..e9b83f6 100644
> --- a/migration.c
> +++ b/migration.c
> @@ -566,7 +566,8 @@ static void *migration_thread(void *opaque)
>          if (!qemu_file_rate_limit(s->file)) {
>              DPRINTF("iterate\n");
>              pending_size = qemu_savevm_state_pending(s->file, max_size);
> -            DPRINTF("pending size %lu max %lu\n", pending_size, max_size);
> +            DPRINTF("pending size %" PRIu64 " max %" PRIu64 "\n",
> +                    pending_size, max_size);
>              if (pending_size && pending_size >= max_size) {
>                  qemu_savevm_state_iterate(s->file);
>              } else {

Reviewed-by: Stefan Weil <sw@weilnetz.de>

max_size is not uint64_t but int64_t, so PRId64 would be even better
for that argument, but I don't think this is worth an additional iteration.

CC'ing qemu-trivial, the patch can be applied there.

Regards,
Stefan


