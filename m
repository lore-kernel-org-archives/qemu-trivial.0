Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQJrc-0003bz-Nj
	for mharc-qemu-trivial@gnu.org; Wed, 19 Mar 2014 13:01:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tommusta@gmail.com>) id 1WQIC7-0006FH-Gz
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 11:14:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tommusta@gmail.com>) id 1WQIC1-0003sX-O5
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 11:14:15 -0400
Received: from mail-qg0-x22e.google.com ([2607:f8b0:400d:c04::22e]:62114)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tommusta@gmail.com>)
	id 1WQIC1-0003sH-JV; Wed, 19 Mar 2014 11:14:09 -0400
Received: by mail-qg0-f46.google.com with SMTP id e89so26179364qgf.5
	for <multiple recipients>; Wed, 19 Mar 2014 08:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=9G9UEbqMANbpoY8KZgBjwdliQNx9Klnc72+rSkvTJ1M=;
	b=ac1fk50gVXc98Kipqg78sbAPylMFhqkgLTXRzi0BLG2ThQ+RiP09XXf6XpeB2ZjuNE
	XHsVcIbr4eGbMrWQ9x0Gx35ugS3S8HiBcg54mTaidrPW0iT553/jcLTJxNShib5utf2p
	t63jc2f6mL/FLVxLzLT3lfMF7IXh1AKqniJ6n6ZONrlT60zxitigeJngjU1E0Jp80TfL
	SnQnXIeR0UoVD9mvFUfQU+P2YGcRwFle/rpc8xfLpjuSqo45fqQ/VZnapneweIaeVAki
	XDS43DIu7Dr9U96bfPpLPwpNCbgHLwizJ7pgJxeaHkCju/bpKZx/R24px5auIVpkrzia
	GIqw==
X-Received: by 10.140.92.200 with SMTP id b66mr2613696qge.108.1395242048372;
	Wed, 19 Mar 2014 08:14:08 -0700 (PDT)
Received: from [9.10.80.76] (rchp4.rochester.ibm.com. [129.42.161.36])
	by mx.google.com with ESMTPSA id z9sm31302392qgz.20.2014.03.19.08.14.06
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Mar 2014 08:14:07 -0700 (PDT)
Message-ID: <5329B438.7090104@gmail.com>
Date: Wed, 19 Mar 2014 10:14:00 -0500
From: Tom Musta <tommusta@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Stuart Brady <sdb@zubnet.me.uk>, qemu-trivial@nongnu.org
References: <20140319140726.GA9192@zubnet.me.uk>
In-Reply-To: <20140319140726.GA9192@zubnet.me.uk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::22e
X-Mailman-Approved-At: Wed, 19 Mar 2014 13:01:10 -0400
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-ppc] [PATCH] target-ppc: Fix
	overallocation of opcode tables
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
X-List-Received-Date: Wed, 19 Mar 2014 15:14:22 -0000

On 3/19/2014 9:07 AM, Stuart Brady wrote:
> create_new_table() should allocate 0x20 opc_handler_t pointers, but
> actually allocates 0x20 opc_handler_t structs.  Fix this.
> 
> Signed-off-by: Stuart Brady <sdb@zubnet.me.uk>
> ---
>  translate_init.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c
> index 6084f40..75f34c1 100644
> --- a/target-ppc/translate_init.c
> +++ b/target-ppc/translate_init.c
> @@ -7434,7 +7434,7 @@ static int create_new_table (opc_handler_t **table, unsigned char idx)
>  {
>      opc_handler_t **tmp;
>  
> -    tmp = g_malloc(0x20 * sizeof(opc_handler_t));
> +    tmp = g_new(opc_handler_t *, 0x20);
>      fill_new_table(tmp, 0x20);
>      table[idx] = (opc_handler_t *)((uintptr_t)tmp | PPC_INDIRECT);
>  

Reviewed-by: Tom Musta <tommusta@gmail.com>
Tested-by: Tom Musta <tommusta@gmail.com>

