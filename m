Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghAot-0002zy-98
	for mharc-qemu-trivial@gnu.org; Wed, 09 Jan 2019 05:10:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghAoq-0002wu-6r
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 05:10:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghAop-0002fX-Ie
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 05:10:40 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:44645)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ghAop-0002eo-9N; Wed, 09 Jan 2019 05:10:39 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1M2wbS-1giGkD1fpM-003PRW; Wed, 09 Jan 2019 11:10:37 +0100
To: Priit Laes <plaes@plaes.org>, Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20181226003722.31257-1-plaes@plaes.org>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <ead8c68c-66af-f7a4-fd92-fb0db785b226@vivier.eu>
Date: Wed, 9 Jan 2019 11:10:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20181226003722.31257-1-plaes@plaes.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:gWoD11aco/VgQ7TRI9bWC8wOemDcbF8lX7A+i/5OVywfTC7h1fO
	wuydB/L2sCN9OvJ7ifhuB95MceWDGRXn+/EonM7zNbx+1+qQH0G37okAIiAHofTC7CphXK7
	X1PwON2bymA8f+33F338njA4aHpZc7Kc5vwuQuPGR63kJv+wKVgrWtxroais3NXMwiT6PKu
	1+KI9YcNbM+38v8J56xhg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zbU2y/oE02I=:p2ziJISOolViogbgMkET1Q
	qe4RBxqmBINdO3FhuhgqGunQDjYPxrIg6s+rHjImaACgkkyRwc8yQKkHNgh7XdkZD9N/6B7eK
	LqGOQCT/synLSeXZf0Ak6N58vKmHIIG7IJjJdwrIYtMvCQM19RmwTv5kR9WVtgDlBIePSaYz8
	XTCo+3b17SBZqcKDXbzvzzNqTP8PIWcz6FrJCK9O9GaRrjLfKGwhN+h/h9TEH8oDFoA0M104J
	mnQWZ3gx7Gf4ZFFrf2/3zQdvZpV0lvAayNaTg69nU4ruizQKPsbRwfh7jFV9vqGQaazLNaG+u
	s2Pr7cKBUQt25kKxXdW6Ie000m9fZTssyIHCWij1w6j6CDOwaBs4B7BwD9lpUjmqdaRCv3rfO
	0TetRXVRa1VdfrIwSOUhR+5ZIykrD5NuILm66yIlUCJIXKcsRd+q07eQpDJDND+jPu8geRc2C
	gNXs0G0wcLhizsJQwJTCzbLMJMHmQ4Hgsgi83xpaChrS54uaYeoswdsnSduZQ0SlzlvtIZqBL
	/ymo80QCX95zCmJuwyeVlXkED0lgSUFHqYqF6jsU7kTwyahzS8i1EHPone5mFP+r+vQOdL4t7
	L6B7Hr0mzbQqqsAFssGRu7ddp80204JVfUTPQApOb/MzA/t/DH6fRjdCbAV+5zzA+h9TmQtRw
	vYs2eFufggHYrpj1tHxLeILH4nyec7Zic9OxWI7chCOEhx41+uJIjQ93qats/KbmB/QJnOzm2
	zsRU5hGFWswxdkHnZ8rlPHx+MthGwM+KdJPx24DXRvqHf78x/tmx/z5ugqM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
Subject: Re: [Qemu-trivial] [PATCH] qom: Include qemu/fprintf-fn.h in cpu.h
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
X-List-Received-Date: Wed, 09 Jan 2019 10:10:42 -0000

On 26/12/2018 01:37, Priit Laes wrote:
> QOM cpu.h uses fprintf_function which requires Qemu's
> qemu/fprintf-fn.h header. Include it.
> 
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---
>  include/qom/cpu.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index 1396f53e5b..6d1ba53d72 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -26,6 +26,7 @@
>  #include "exec/memattrs.h"
>  #include "qapi/qapi-types-run-state.h"
>  #include "qemu/bitmap.h"
> +#include "qemu/fprintf-fn.h"
>  #include "qemu/rcu_queue.h"
>  #include "qemu/queue.h"
>  #include "qemu/thread.h"
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

