Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQ0c1-0006FH-CA
	for mharc-qemu-trivial@gnu.org; Mon, 04 Jun 2018 21:18:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1fQ0bz-0006D5-0f
	for qemu-trivial@nongnu.org; Mon, 04 Jun 2018 21:18:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1fQ0bx-0005IC-VI
	for qemu-trivial@nongnu.org; Mon, 04 Jun 2018 21:18:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34184)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1fQ0bs-0005GS-Iw; Mon, 04 Jun 2018 21:18:04 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com
	[10.5.11.25])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC9BD30C4F55;
	Tue,  5 Jun 2018 01:18:02 +0000 (UTC)
Received: from w520.home (ovpn-116-135.phx2.redhat.com [10.3.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2640A2010CE6;
	Tue,  5 Jun 2018 01:18:02 +0000 (UTC)
Date: Mon, 4 Jun 2018 19:17:56 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Richard Henderson
	<rth@twiddle.net>, patches@linaro.org
Message-ID: <20180604191756.1ae61871@w520.home>
In-Reply-To: <20180604162140.20688-1-peter.maydell@linaro.org>
References: <20180604162140.20688-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.25
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 05 Jun 2018 01:18:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] CODING_STYLE: Define our
 preferred form for multiline comments
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
X-List-Received-Date: Tue, 05 Jun 2018 01:18:12 -0000

On Mon,  4 Jun 2018 17:21:40 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> The codebase has a bit of a mix of
>  /* multiline comments
>   * like this
>   */
> and
>  /* multiline comments like this
>     in the GNU Coding Standards style */
> 
> State a preference for the former.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I admit that to some extent I'm imposing my aesthetic
> preferences here; pretty sure we have a lot more style
> 1 comments than style 2, though.
> ---
>  CODING_STYLE | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/CODING_STYLE b/CODING_STYLE
> index 12ba58ee293..fb1d1f1cd62 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -124,6 +124,19 @@ We use traditional C-style /* */ comments and avoid // comments.
>  Rationale: The // form is valid in C99, so this is purely a matter of
>  consistency of style. The checkpatch script will warn you about this.
>  
> +Multiline comments blocks should have a row of stars on the left
> +and the terminating */ on its own line:
> +    /* like
> +     * this
> +     */
> +Putting the initial /* on its own line is accepted, but not required.

Could we say "at maintainer discretion", or is that always implied?  The
asymmetry of the proposed standard is not my favorite and a mostly
blank line before and after further supports standing out from
surrounding code.  Note that the kernel coding style, except for
certain exceptions, is:

/*
 * This is a
 * multi-line
 * comment
 */

Thanks,

Alex

> +(Some of the existing comments in the codebase use the GNU Coding
> +Standards form which does not have stars on the left; avoid this
> +when writing new comments.)
> +
> +Rationale: Consistency, and ease of visually picking out a multiline
> +comment from the surrounding code.
> +
>  8. trace-events style
>  
>  8.1 0x prefix


