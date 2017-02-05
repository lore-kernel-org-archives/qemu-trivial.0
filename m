Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1caR9I-0003ku-6T
	for mharc-qemu-trivial@gnu.org; Sun, 05 Feb 2017 13:02:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1caR9G-0003k8-3J
	for qemu-trivial@nongnu.org; Sun, 05 Feb 2017 13:02:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1caR9F-000142-Ei
	for qemu-trivial@nongnu.org; Sun, 05 Feb 2017 13:02:50 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:52093)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1caR9A-00010u-Va; Sun, 05 Feb 2017 13:02:45 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue005 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0MgJKE-1clwPj3J8o-00Niv2; Sun, 05 Feb 2017 19:02:37 +0100
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1486144722-6021-1-git-send-email-peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, patches@linaro.org
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <5f8d7bb8-613c-e2f2-75dc-964524e8653e@vivier.eu>
Date: Sun, 5 Feb 2017 19:02:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1486144722-6021-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:c3JgsotstgB5S+lBxd754Qybdyxk5C4rL7fX1ihuV/njukNmFnf
	hnYt/DKzvbJ+iPVfG9mH41BuTfAE02alq3FzDodJoqD6nGaZSpHQCP971lOXWBndGFOEule
	SqSMOSzdes5yw5DBktsWFWG1WKL/0Z7iy+ZRE/5i5qOuDFm3y4QwIJa9XHpr7soxPMDnz2a
	cJW1xlfnmABIDICaprN1w==
X-UI-Out-Filterresults: notjunk:1;V01:K0:+Lssy3b8P6Y=:X1fbgc/c13Oe8+DzETVHch
	Tnl8/23OrC8Y05+Fs4/fCwjKb9ArGVZWpd+CumuyDsBdCP+k6yLHKrXDGky5hVTBUUm9P8ed6
	3HTa4ADltWK+pkL+Z7DHUlszYo90K3IWxJTVSDZuCs4sNSPA49Aax3i2ruaujlgB1AO2aj53W
	rrdC4hHtKA4S/ZZ5vP3nqjGzFnCP1vMq+WLlcEx3BU6zdge1AaVH0Lg6IzZCujRP/Ir/JQ9dM
	S8aPVtqvaaS4UO9gKsFvKfOT2BHFfcrYkBKNIRTqo87fvQJ4OvHaVkPnV5mq4mnv1T/Gm8iZ0
	JqhXF9Aj+p+56yWwdSo692sy0KKEMPpWccm0R/AQgvU7jxFhhWNC+Uame4Gj4P41OT7kQ18b7
	Gg7G/YSaDWhwWlqnTwipOWizEFtjVFqQuNeJRNeyPzabvRfR8bqWwd9SsYTc2+wgZMyW6FyYQ
	EyxyEhtZET+mOOwHThmbV7IXBc80ZBYskWKyXM/0/Bbm7Ad8+NMu+CURNSOzvsMJUPpAq/cZU
	jMXFq8Sz0jlOfm8QkXVxHAr0w/LmIebOQDPaBrtH4JH933mPxYMWXA7+rTG+E3xEvHhv7HyyD
	IauJiMa+W+dmKViagkILa11ENPe2r3dHosnZ3idJxVsBuIx3HjaxniGtjBx8ZrSgCUo7g8+xB
	sUD9Czp6tBoP89vigQIVkI4BpMAFZP/+wHm3gMY7R6f2G7Ake/fEphyqII6Y4bvdAr5AhwQNn
	tsd4oAgPZOqKuJTG
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.134
Subject: Re: [Qemu-trivial] [PATCH] CODING_STYLE: Mention preferred comment
 form
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
X-List-Received-Date: Sun, 05 Feb 2017 18:02:51 -0000

Le 03/02/2017 à 18:58, Peter Maydell a écrit :
> Our defacto coding style strongly prefers /* */ style comments
> over the single-line // style, and checkpatch enforces this,
> but we don't actually document this. Mention it in CODING_STYLE.
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  CODING_STYLE | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/CODING_STYLE b/CODING_STYLE
> index f53180b..2fa0c0b 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -116,3 +116,10 @@ if (a == 1) {
>  Rationale: Yoda conditions (as in 'if (1 == a)') are awkward to read.
>  Besides, good compilers already warn users when '==' is mis-typed as '=',
>  even when the constant is on the right.
> +
> +7. Comment style
> +
> +We use traditional C-style /* */ comments and avoid // comments.
> +
> +Rationale: The // form is valid in C99, so this is purely a matter of
> +consistency of style. The checkpatch script will warn you about this.
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


