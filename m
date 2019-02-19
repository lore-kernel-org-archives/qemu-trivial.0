Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gw9ZL-0001Fh-Ic
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 12:52:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gw9ZK-0001Ez-3X
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 12:52:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gw9ZJ-0001rT-Al
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 12:52:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43088)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gw9ZH-0001q2-FD; Tue, 19 Feb 2019 12:52:31 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B1DBD30EF90;
	Tue, 19 Feb 2019 17:52:30 +0000 (UTC)
Received: from [10.3.116.222] (ovpn-116-222.phx2.redhat.com [10.3.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3103E60856;
	Tue, 19 Feb 2019 17:52:30 +0000 (UTC)
To: Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: imammedo@redhat.com, mjt@tls.msk.ru
References: <20190219013106.17538-1-richardw.yang@linux.intel.com>
	<20190219013106.17538-2-richardw.yang@linux.intel.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <baff8fc6-8d22-02c8-6bea-5b1ede1d4bfa@redhat.com>
Date: Tue, 19 Feb 2019 11:52:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190219013106.17538-2-richardw.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 19 Feb 2019 17:52:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] CODING_STYLE: specify
 the indent rule for multiline code
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
X-List-Received-Date: Tue, 19 Feb 2019 17:52:35 -0000

On 2/18/19 7:31 PM, Wei Yang wrote:
> We didn't specify the indent rule for multiline code here, which may
> misleading users. And in current code, the code use different rules.
> 
> Add this rule in CODING_STYLE to make sure this is clear to every one.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  CODING_STYLE | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/CODING_STYLE b/CODING_STYLE
> index ec075dedc4..73f66ca185 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -29,6 +29,32 @@ Spaces of course are superior to tabs because:
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
> +All the above cases apply the same rule: indent with four spaces.

Is this redundant with the earlier statement that "QEMU indents are four
spaces."?

> +
> +While the last three case may face another situation: code should spread into
> +several lines. In this case the rule is align the new line with first
> +parentheses.

Grammar is awkward - the leading 'while' makes it sound like that you
have a dependent clause, but then never provide the independent clause.
Maybe a completely different wording is better:

When breaking up a long line to fit within line widths, align the
secondary lines just after the opening parenthesis of the first.

> +
> +For example:
> +
> +    if (a == 1 &&
> +        b == 2)
> +

Maybe:

if (a == 1 &&
    b == 2) {

to match our later recommendations on always using {}.

> +    while (a == 1 &&
> +           b == 2)
> +

Similar.

> +    do_something(arg1, arg2
> +                 arg3)
> +

and here, I'd include the ';' to make it a valid statement.

>  2. Line width
>  
>  Lines should be 80 characters; try not to make them longer.
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

