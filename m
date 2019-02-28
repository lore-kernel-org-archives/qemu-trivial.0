Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzMnV-0001kY-3y
	for mharc-qemu-trivial@gnu.org; Thu, 28 Feb 2019 09:36:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzMnT-0001j0-7B
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 09:36:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzMnS-0006dt-8v
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 09:36:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49362)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzMnM-0006b2-US; Thu, 28 Feb 2019 09:36:21 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E6FD223206C;
	Thu, 28 Feb 2019 14:36:19 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A1A4160F94;
	Thu, 28 Feb 2019 14:36:15 +0000 (UTC)
Date: Thu, 28 Feb 2019 15:36:14 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	philmd@redhat.com, eblake@redhat.com, peter.maydell@linaro.org
Message-ID: <20190228153614.2d6a2a43@redhat.com>
In-Reply-To: <20190225012530.28225-2-richardw.yang@linux.intel.com>
References: <20190225012530.28225-1-richardw.yang@linux.intel.com>
	<20190225012530.28225-2-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 28 Feb 2019 14:36:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v4 1/2] CODING_STYLE: specify the indent
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
X-List-Received-Date: Thu, 28 Feb 2019 14:36:28 -0000

On Mon, 25 Feb 2019 09:25:29 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> We didn't specify the indent rule for multiline code here, which may
> mislead users. And in current code, the code use different rules.
diffrent from what? I'd use "various styles"

> 
> Add this rule in CODING_STYLE to make sure this is clear to every one.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> 
> ---
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
>  CODING_STYLE | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/CODING_STYLE b/CODING_STYLE
> index ec075dedc4..1bccf4f865 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -29,6 +29,35 @@ Spaces of course are superior to tabs because:
>  
>  Do not leave whitespace dangling off the ends of lines.
>  
> +1.1 Multiline Indent
> +
> +There are several places where indent is necessary:
> +
> + - struct definition
> + - if/else
> + - while/for
> + - function definition & call
> +
> +When breaking up a long line to fit within line width, align the secondary
> +lines just after the opening parenthesis of the first.
 Probably it's not true for struct/function, they could use 4 spaces indent
 relative to previous line. I'd drop struct as it just follow generic block
 4 spaces rule. And describe possible function variants separately


> +
> +For example:
> +
> +    if (a == 1 &&
> +        b == 2) {
> +
> +    while (a == 1 &&
> +           b == 2) {
> +
> +    do_something(arg1, arg2,
> +                 arg3);
> +
> +One exception for function is indenting following lines relative to function
> +name start:
it's not really exception and used not only with functions, it's basically
generic 4 spaces indent. Another variant I've seen used is
    foo(x, y(z,
             h);
and variations of that


> +
> +    do_something(arg1, arg2,
> +        arg3);
> +
>  2. Line width
>  
>  Lines should be 80 characters; try not to make them longer.


