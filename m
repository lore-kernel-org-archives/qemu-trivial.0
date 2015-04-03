Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ye2QC-0006vM-GC
	for mharc-qemu-trivial@gnu.org; Fri, 03 Apr 2015 10:18:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1Ye2QA-0006v2-Ap
	for qemu-trivial@nongnu.org; Fri, 03 Apr 2015 10:18:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1Ye2Q3-000505-TI
	for qemu-trivial@nongnu.org; Fri, 03 Apr 2015 10:18:06 -0400
Received: from mail-qg0-x233.google.com ([2607:f8b0:400d:c04::233]:35130)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1Ye2Q3-0004zx-Ow; Fri, 03 Apr 2015 10:17:59 -0400
Received: by qgej70 with SMTP id j70so7566070qge.2;
	Fri, 03 Apr 2015 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=BOu4/zK9UHW5PrP04JcS/wgb+n2HJhJSLueQUYShXvE=;
	b=sPU114f0fOJRUlrBzxSLBvIx4eiQiZANJHUwbsfvmlUfSQa5a9s6j9hUIb/vZTOb/p
	bxSVvdbVpbQ+MXSE+kgt1aiTA+qsIk17K0XROIn60uBGQI4Vo59YF9x9+Baz/p7SAFUB
	vQjDfAtKFW3kcsrWqTzNbk5evmHwx7IUmuQg3u8tUfGhOLUpoNJpeoPA0dEbAmPpcFW4
	WyyqYUbAN49ZYQo938PbDyGKq8lFVmLAoHI/IrtF/PeBxRrxUqiQfQAVidsUv4twi37S
	7zIr9UQ1DegIwSeiPIMdfbPC7efZl59x0j+kNnSnHSkp/WDMo6fNugzj20+vHxmFOKH/
	39fw==
X-Received: by 10.140.87.10 with SMTP id q10mr2772750qgd.67.1428070678545;
	Fri, 03 Apr 2015 07:17:58 -0700 (PDT)
Received: from pike.twiddle.home
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by mx.google.com with ESMTPSA id 133sm3647260qhu.15.2015.04.03.07.17.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Apr 2015 07:17:57 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <551EA111.5040808@twiddle.net>
Date: Fri, 03 Apr 2015 07:17:53 -0700
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Emilio G. Cota" <cota@braap.org>, Stefan Weil <sw@weilnetz.de>
References: <5518E291.6020708@weilnetz.de>
	<1428019673-920-1-git-send-email-cota@braap.org>
In-Reply-To: <1428019673-920-1-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::233
Cc: qemu-trivial@nongnu.org, Laurent Desnogues <laurent.desnogues@gmail.com>,
	=?UTF-8?B?QWxleCBCZW5u?= =?UTF-8?B?w6ll?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] tcg: optimise memory layout of TCGTemp
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
X-List-Received-Date: Fri, 03 Apr 2015 14:18:07 -0000

On 04/02/2015 05:07 PM, Emilio G. Cota wrote:
> After:
> $ taskset -c 0 perf stat -r 15 -- x86_64-linux-user/qemu-x86_64 img/bntest-x86_64 >/dev/null
>  Performance counter stats for 'x86_64-linux-user/qemu-x86_64 img/bntest-x86_64' (15 runs):
> 
>       10459.968847 task-clock (msec)         #    0.999 CPUs utilized            ( +-  0.30% )
>                739 context-switches          #    0.071 K/sec                    ( +-  1.71% )
>                  0 cpu-migrations            #    0.000 K/sec                    ( +- 68.14% )
>              2,204 page-faults               #    0.211 K/sec                    ( +-  0.10% )
>       10.473900411 seconds time elapsed                                          ( +-  0.30% )
> 
> Suggested-by: Stefan Weil <sw@weilnetz.de>
> Suggested-by: Richard Henderson <rth@twiddle.net>
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>  tcg/tcg.h | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>

I'll put this in a queue for 2.4.


r~

