Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h0oXQ-0003Ey-MT
	for mharc-qemu-trivial@gnu.org; Mon, 04 Mar 2019 09:25:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h0oXO-0003DB-K5
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2019 09:25:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h0oXN-0008E0-OP
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2019 09:25:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34532)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h0oXL-00088X-M3; Mon, 04 Mar 2019 09:25:47 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA85830821B3;
	Mon,  4 Mar 2019 14:25:46 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2F7CC19724;
	Mon,  4 Mar 2019 14:25:43 +0000 (UTC)
Date: Mon, 4 Mar 2019 15:25:41 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	philmd@redhat.com, eblake@redhat.com, peter.maydell@linaro.org,
	sgarzare@redhat.com
Message-ID: <20190304152541.7525eafa@redhat.com>
In-Reply-To: <20190304071631.27567-2-richardw.yang@linux.intel.com>
References: <20190304071631.27567-1-richardw.yang@linux.intel.com>
	<20190304071631.27567-2-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 04 Mar 2019 14:25:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v6 1/2] CODING_STYLE: specify the indent
 rule for multiline code
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
X-List-Received-Date: Mon, 04 Mar 2019 14:25:51 -0000

On Mon,  4 Mar 2019 15:16:30 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> We didn't specify the indent rule for multiline code here, which may
> mislead users. And in current code, the code use various styles.
> 
> Add this rule in CODING_STYLE to make sure this is clear to every one.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> v6:
>    * add ) for last example of function
> v5:
>    * different rules -> various styles
>    * describe function variants separately
>    * take struct out
> v4:
>    * widths -> width
>    * add an exception example for function
> v3:
>    * misleading -> mislead
>    * add comma after arg2 in example
> v2:
>    * rephrase changelog suggested by Eric Blake
>      - remove one redundant line
>      - fix some awkward grammar
>      - add { ; at the end of example
> ---
>  CODING_STYLE | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/CODING_STYLE b/CODING_STYLE
> index ec075dedc4..90321e9c28 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -29,6 +29,45 @@ Spaces of course are superior to tabs because:
>  
>  Do not leave whitespace dangling off the ends of lines.
>  
> +1.1 Multiline Indent
> +
> +There are several places where indent is necessary:
> +
> + - if/else
> + - while/for
> + - function definition & call
> +
> +When breaking up a long line to fit within line width, we need a proper indent
> +for the following lines.
> +
> +In case of if/else, while/for, align the secondary lines just after the
> +opening parenthesis of the first.
> +
> +For example:
> +
> +    if (a == 1 &&
> +        b == 2) {
> +
> +    while (a == 1 &&
> +           b == 2) {
> +
> +In case of function, there are several variants:
> +
> +    * 4 spaces indent from the beginning
> +    * align the secondary lines just after the opening parenthesis of the
> +      first
> +
> +For example:
> +
> +    do_something(x, y,
> +        z);
> +
> +    do_something(x, y,
> +                 z);
> +
> +    do_something(x, do_another(y,
> +                               z));
> +
>  2. Line width
>  
>  Lines should be 80 characters; try not to make them longer.


