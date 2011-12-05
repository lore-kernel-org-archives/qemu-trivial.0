Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RXZT6-0007df-LO
	for mharc-qemu-trivial@gnu.org; Mon, 05 Dec 2011 09:24:32 -0500
Received: from eggs.gnu.org ([140.186.70.92]:44973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1RXZSz-0007Gm-GJ
	for qemu-trivial@nongnu.org; Mon, 05 Dec 2011 09:24:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1RXZSt-0001UK-HG
	for qemu-trivial@nongnu.org; Mon, 05 Dec 2011 09:24:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:9926)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1RXZSj-0001T9-Et; Mon, 05 Dec 2011 09:24:09 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pB5EO8qB030321
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 5 Dec 2011 09:24:08 -0500
Received: from yakj.usersys.redhat.com (ovpn-112-20.ams2.redhat.com
	[10.36.112.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pB5EO4i5010710; Mon, 5 Dec 2011 09:24:05 -0500
Message-ID: <4EDCD403.4030109@redhat.com>
Date: Mon, 05 Dec 2011 15:24:03 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <4EDCD2CE.9080703@siemens.com>
In-Reply-To: <4EDCD2CE.9080703@siemens.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Rename get_tls to tls_var
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
X-List-Received-Date: Mon, 05 Dec 2011 14:24:31 -0000

On 12/05/2011 03:18 PM, Jan Kiszka wrote:
> get_tls() can serve as a lvalue as well, so 'get' might be confusing.
>
> Signed-off-by: Jan Kiszka<jan.kiszka@siemens.com>
> ---
>   cpu-all.h  |    2 +-
>   qemu-tls.h |    4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/cpu-all.h b/cpu-all.h
> index 5f47ab8..8888016 100644
> --- a/cpu-all.h
> +++ b/cpu-all.h
> @@ -336,7 +336,7 @@ void QEMU_NORETURN cpu_abort(CPUState *env, const char *fmt, ...)
>       GCC_FMT_ATTR(2, 3);
>   extern CPUState *first_cpu;
>   DECLARE_TLS(CPUState *,cpu_single_env);
> -#define cpu_single_env get_tls(cpu_single_env)
> +#define cpu_single_env tls_var(cpu_single_env)
>
>   /* Flags for use in ENV->INTERRUPT_PENDING.
>
> diff --git a/qemu-tls.h b/qemu-tls.h
> index 5b70f10..b92ea9d 100644
> --- a/qemu-tls.h
> +++ b/qemu-tls.h
> @@ -41,12 +41,12 @@
>   #ifdef __linux__
>   #define DECLARE_TLS(type, x) extern DEFINE_TLS(type, x)
>   #define DEFINE_TLS(type, x)  __thread __typeof__(type) tls__##x
> -#define get_tls(x)           tls__##x
> +#define tls_var(x)           tls__##x
>   #else
>   /* Dummy implementations which define plain global variables */
>   #define DECLARE_TLS(type, x) extern DEFINE_TLS(type, x)
>   #define DEFINE_TLS(type, x)  __typeof__(type) tls__##x
> -#define get_tls(x)           tls__##x
> +#define tls_var(x)           tls__##x
>   #endif
>
>   #endif

Good idea.

Paolo

