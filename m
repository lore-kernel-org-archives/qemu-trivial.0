Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjQqW-0008QE-Kn
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2013 05:14:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UjQqU-0008LY-7e
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 05:14:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UjQqS-0004yC-VW
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 05:14:30 -0400
Received: from mail-qe0-f54.google.com ([209.85.128.54]:62524)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1UjQqP-0004xJ-39; Mon, 03 Jun 2013 05:14:25 -0400
Received: by mail-qe0-f54.google.com with SMTP id ne12so1616740qeb.27
	for <multiple recipients>; Mon, 03 Jun 2013 02:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=kUc9oLtpgmMKVUIG4uadcKg+jc51P1B93TIJDb+8WOk=;
	b=0gTOXUPgopuIYILEfF2tHIG+LSqbzjGjO5wkdEbRocbtTDvB+Amc0y/njXLuRul3vY
	Y2Xk3R57r+zyMKO3aPsZKPqyMfwy2GCm0hIZ+HAtdnsLvERWxPPV4wd+oMHPEOhZSPWB
	7TT0M+RgFl8AtxKugTN4k7qECPHPGzcT3IZ+PDXJWQLSm9CdHThR88e8nTg+1qrIexqP
	ucTSb+DFgTkMcGTGbcK67m3s+cxG5eAdUxNOKHa5L1+7XV8Uthfk8wDmarPy0Oddouu2
	afWYDAaJAqxZsja2SnilP9s1xzf30JkdUxZ61cl+3aSnREFkpOMVQAdMux5pUTaFQyGw
	8lqQ==
X-Received: by 10.229.123.138 with SMTP id p10mr2830993qcr.155.1370250864650; 
	Mon, 03 Jun 2013 02:14:24 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-116-217-184.cust.dsl.vodafone.it. [37.116.217.184])
	by mx.google.com with ESMTPSA id bc5sm58299065qeb.3.2013.06.03.02.14.22
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 03 Jun 2013 02:14:23 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <51AC5E64.3080002@redhat.com>
Date: Mon, 03 Jun 2013 11:14:12 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1370186269-24353-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1370186269-24353-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.54
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] softfloat: Fix shift128Right for shift
	counts 64..127
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
X-List-Received-Date: Mon, 03 Jun 2013 09:14:31 -0000

Il 02/06/2013 17:17, Peter Maydell ha scritto:
> shift128Right would give the wrong result for a shift count
> between 64 and 127. This was never noticed because all of
> our uses of this function are guaranteed not to use shift
> counts in this range.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Found by code inspection. This contribution can be licensed
> under either the softfloat-2a or -2b license.
> 
>  fpu/softfloat-macros.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fpu/softfloat-macros.h b/fpu/softfloat-macros.h
> index b5164af..9b09545 100644
> --- a/fpu/softfloat-macros.h
> +++ b/fpu/softfloat-macros.h
> @@ -168,7 +168,7 @@ INLINE void
>          z0 = a0>>count;
>      }
>      else {
> -        z1 = ( count < 64 ) ? ( a0>>( count & 63 ) ) : 0;
> +        z1 = (count < 128) ? (a0 >> (count & 63)) : 0;
>          z0 = 0;
>      }
>      *z1Ptr = z1;
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

