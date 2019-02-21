Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwplE-0002mp-C6
	for mharc-qemu-trivial@gnu.org; Thu, 21 Feb 2019 09:55:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gwplB-0002ja-4e
	for qemu-trivial@nongnu.org; Thu, 21 Feb 2019 09:55:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gwplA-00073S-DJ
	for qemu-trivial@nongnu.org; Thu, 21 Feb 2019 09:55:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34964)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gwpl5-0006wB-BR; Thu, 21 Feb 2019 09:55:32 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3169D13ABD;
	Thu, 21 Feb 2019 14:55:25 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DE0992E03B;
	Thu, 21 Feb 2019 14:55:20 +0000 (UTC)
Date: Thu, 21 Feb 2019 15:55:19 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	philmd@redhat.com, eblake@redhat.com, peter.maydell@linaro.org
Message-ID: <20190221155519.5f199561@redhat.com>
In-Reply-To: <20190220031557.26293-2-richardw.yang@linux.intel.com>
References: <20190220031557.26293-1-richardw.yang@linux.intel.com>
	<20190220031557.26293-2-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 21 Feb 2019 14:55:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v3 1/2] CODING_STYLE: specify the indent
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
X-List-Received-Date: Thu, 21 Feb 2019 14:55:38 -0000

On Wed, 20 Feb 2019 11:15:56 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> We didn't specify the indent rule for multiline code here, which may
> mislead users. And in current code, the code use different rules.
> 
> Add this rule in CODING_STYLE to make sure this is clear to every one.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 
> ---
> v3:
>    * misleading -> mislead
>    * add comma after arg2 in example
> v2:
>    * rephrase changelog suggested by Eric Blake
>      - remove one redundant line
>      - fix some awkward grammar
>      - add { ; at the end of example
> 
> c1
> ---
>  CODING_STYLE | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/CODING_STYLE b/CODING_STYLE
> index ec075dedc4..1359f9ab81 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -29,6 +29,29 @@ Spaces of course are superior to tabs because:
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
> +When breaking up a long line to fit within line widths, align the secondary
s/widths/width/

> +lines just after the opening parenthesis of the first.
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

there is also another widely used acceptable pattern
  func_name(arg1, arg2,
      arg3)

where we indent relative to function name start
(sound weird to me but I'm not sure how to word it properly)

>  2. Line width
>  
>  Lines should be 80 characters; try not to make them longer.


