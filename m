Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwIA9-00046K-K0
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 22:03:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gwIA5-00044z-Pe
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 22:03:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gwIA3-0002Cm-RJ
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 22:03:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57776)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gwI9l-000253-Sx; Tue, 19 Feb 2019 22:02:46 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D275C10F84;
	Wed, 20 Feb 2019 03:02:40 +0000 (UTC)
Received: from [10.3.116.222] (ovpn-116-222.phx2.redhat.com [10.3.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E021860BF6;
	Wed, 20 Feb 2019 03:02:34 +0000 (UTC)
To: Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: mjt@tls.msk.ru, imammedo@redhat.com, philmd@redhat.com,
	peter.maydell@linaro.org
References: <20190220003113.20746-1-richardw.yang@linux.intel.com>
	<20190220003113.20746-2-richardw.yang@linux.intel.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <6b850e7b-78ed-b68e-6a46-9bdbb2962507@redhat.com>
Date: Tue, 19 Feb 2019 21:02:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190220003113.20746-2-richardw.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 20 Feb 2019 03:02:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 1/2] CODING_STYLE: specify the indent
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
X-List-Received-Date: Wed, 20 Feb 2019 03:03:06 -0000

On 2/19/19 6:31 PM, Wei Yang wrote:
> We didn't specify the indent rule for multiline code here, which may
> misleading users. And in current code, the code use different rules.

s/misleading/mislead/

> 
> Add this rule in CODING_STYLE to make sure this is clear to every one.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> 
> ---
> v2:
>    * rephrase changelog suggested by Eric Blake
>      - remove one redundant line
>      - fix some awkward grammar
>      - add { ; at the end of example
> ---
>  CODING_STYLE | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

> +
> +    do_something(arg1, arg2
> +                 arg3);

Missing a comma after arg2. With that fixed,
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

