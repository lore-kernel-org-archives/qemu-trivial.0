Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSPd2-0004sd-3D
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jun 2018 12:25:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fSPcz-0004nt-GL
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 12:25:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fSPcy-0007sn-Ly
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 12:25:09 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41446 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fSPct-0007jZ-CK; Mon, 11 Jun 2018 12:25:03 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B97F7401EF0D;
	Mon, 11 Jun 2018 16:25:02 +0000 (UTC)
Received: from [10.36.116.112] (ovpn-116-112.ams2.redhat.com [10.36.116.112])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D687E84434;
	Mon, 11 Jun 2018 16:24:51 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org, Richard Henderson <rth@twiddle.net>,
	John Snow <jsnow@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>, Alex Williamson <alex.williamson@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20180611141716.3813-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7f9e886b-4fb0-8f95-bb06-760cde90daec@redhat.com>
Date: Mon, 11 Jun 2018 18:24:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180611141716.3813-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 11 Jun 2018 16:25:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 11 Jun 2018 16:25:02 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
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
X-List-Received-Date: Mon, 11 Jun 2018 16:25:10 -0000

On 11.06.2018 16:17, Peter Maydell wrote:
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

s/multiline/multi-line/g maybe? That seems to be the more common
spelling...? Anyway:

Reviewed-by: Thomas Huth <thuth@redhat.com>

