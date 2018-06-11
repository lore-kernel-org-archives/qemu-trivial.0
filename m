Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSPUL-0007rh-Md
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jun 2018 12:16:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1fSPUJ-0007q9-0O
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 12:16:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1fSPUI-00028l-0W
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 12:16:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43842)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1fSPUC-000244-AA; Mon, 11 Jun 2018 12:16:04 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 019853082A44;
	Mon, 11 Jun 2018 16:16:03 +0000 (UTC)
Received: from w520.home (ovpn-116-135.phx2.redhat.com [10.3.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8CE648C7C4;
	Mon, 11 Jun 2018 16:15:51 +0000 (UTC)
Date: Mon, 11 Jun 2018 10:15:51 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, patches@linaro.org,
	Richard Henderson <rth@twiddle.net>, John Snow <jsnow@redhat.com>, Philippe
	=?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, Thomas Huth
	<thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Markus Armbruster
	<armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf
	<kwolf@redhat.com>
Message-ID: <20180611101551.2f656715@w520.home>
In-Reply-To: <20180611141716.3813-1-peter.maydell@linaro.org>
References: <20180611141716.3813-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 11 Jun 2018 16:16:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2] CODING_STYLE: Define our preferred
 form for multiline comments
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
X-List-Received-Date: Mon, 11 Jun 2018 16:16:12 -0000

On Mon, 11 Jun 2018 15:17:16 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> The codebase has a bit of a mix of different multiline
> comment styles. State a preference for the Linux kernel
> style:
>     /*
>      * Star on the left for each line.
>      * Leading slash-star and trailing star-slash
>      * each go on a line of their own.
>      */
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is not my personal favourite, but seemed to be the
> closest we had to consensus in the mail thread for v1;
> I can live with it in order to avoid getting patches which
> use the styles I like even less :-)
> ---
>  CODING_STYLE | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/CODING_STYLE b/CODING_STYLE
> index 12ba58ee293..2d84f5f26d1 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -124,6 +124,23 @@ We use traditional C-style /* */ comments and avoid // comments.
>  Rationale: The // form is valid in C99, so this is purely a matter of
>  consistency of style. The checkpatch script will warn you about this.
>  
> +Multiline comments blocks should have a row of stars on the left,
> +and the initial /* and terminating */ both on their own lines:
> +    /*
> +     * like
> +     * this
> +     */
> +This is the same format required by the Linux kernel coding style.
> +
> +(Some of the existing comments in the codebase use the GNU Coding
> +Standards form which does not have stars on the left, or other
> +variations; avoid these when writing new comments, but don't worry
> +about converting to the preferred form unless you're editing that
> +comment anyway.)
> +
> +Rationale: Consistency, and ease of visually picking out a multiline
> +comment from the surrounding code.
> +
>  8. trace-events style
>  
>  8.1 0x prefix

Much preferred, thanks  (tabs next? ;)

Reviewed-by: Alex Williamson <alex.williamson@redhat.com>

