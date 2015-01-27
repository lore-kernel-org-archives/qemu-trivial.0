Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YG8kf-0005h2-FV
	for mharc-qemu-trivial@gnu.org; Tue, 27 Jan 2015 11:12:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YG8kS-0005TF-SU
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 11:12:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YG8kJ-0001qP-D1
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 11:12:13 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:39348)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YG8kC-0001pq-Os; Tue, 27 Jan 2015 11:12:01 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6855642F85;
	Tue, 27 Jan 2015 19:11:58 +0300 (MSK)
Message-ID: <54C7B8CE.5020708@msgid.tls.msk.ru>
Date: Tue, 27 Jan 2015 19:11:58 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.3.0
MIME-Version: 1.0
To: Chen Gang S <gang.chen@sunrus.com.cn>, riku.voipio@iki.fi, 
	david.gilbert@linaro.org, Peter Maydell <peter.maydell@linaro.org>
References: <54C4CD81.10503@sunrus.com.cn>
In-Reply-To: <54C4CD81.10503@sunrus.com.cn>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v2] linux-user/main.c: Remove redundant
 end_exclusive() in arm_kernel_cmpxchg64_helper()
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
X-List-Received-Date: Tue, 27 Jan 2015 16:12:24 -0000

25.01.2015 14:03, Chen Gang S wrote:
> start/end_exclusive() need be pairs, except the start_exclusive() in

 "need TO be pairs", or "should be pairs" or "should be called in pairs".

> stop_all_tasks() which is only used by force_sig(), which will be abort=
.

 "which will abort" or "which will call abort()" or "which calls abort()"=
.

> So at present, start_exclusive() in stop_all_task() need not be paired.
>=20
> queue_signal() may call force_sig(), or return after kill pid (or queue
> signal).

 "or return after killing pid (or queuing signal)".

>     If could return from queue_signal(), stop_all_task() would not
> be called in time,

 "if queue_signal() returns

>     the next end_exclusive() would be issue.

 "would be AN issue".

But actually we're interested to know answer to a slightly different
question: whenever queue_signal() returns or not (it doesn't return in
force_sig case).  So whole this part becomes something like:

 queue_signal() may either call force_sig() and die, or return.  In
 the latter case, stop_all_task() would not be called in time, so
 next end_exclusive() will be an issue.

And even more, when you look at this function (arm_kernel_cmpxchg64_helpe=
r),
you'll notice it has two calls to end_exclusive() in sigsegv case, withou=
t
a call to start_exclusive().  _That_ is, I think, the key point here --
the rest of the information here is not really very relevant, because
the actual problem is this double call to end_exclusive() which should
be removed.  It is not really that interesting to know that it's not
_necessary_ to call end_exclusive() in some cases which leads to abort(),
because this is not one of them anyway (since queue_signal() might return
just fine), and because while it is not necessary, it is not an error
either.  With all this extra info, thie commit message becomes just too
confusing.

> So in arm_kernel_cmpxchg64_helper() for ARM, need remove end_exclusive(=
)
> after queue_signal().

"need TO remove", and again the missing subject.  "We need to remove", or
"we should remove", or, yet another variant, "extra end_exclusive() call
should be removed".

>   The related commit: "97cc756 linux-user: Implement
> new ARM 64 bit cmpxchg kernel helper".


So, how about this (the subject is fine):

 start/end_exclusive() should be paired to each other.  However, in
 arm_kernel_cmpxchg64_helper() function, end_exclusive() is called
 twice in a row.  Remove the second, redundrand, call.

 Commit which introduced this problem is"97cc756 linux-user: Implement
 new ARM 64 bit cmpxchg kernel helper".

?

Did I understand the problem correctly?

Thanks,

/mjt

> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  linux-user/main.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 8c70be4..2d52c1f 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -523,8 +523,6 @@ segv:
>      info.si_code =3D TARGET_SEGV_MAPERR;
>      info._sifields._sigfault._addr =3D env->exception.vaddress;
>      queue_signal(env, info.si_signo, &info);
> -
> -    end_exclusive();
>  }
> =20
>  /* Handle a jump to the kernel code page.  */
>=20


