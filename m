Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hEfg6-0007ia-Qa
	for mharc-qemu-trivial@gnu.org; Thu, 11 Apr 2019 15:48:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hEfg4-0007gv-FF
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2019 15:48:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hEfg3-0002Bw-H0
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2019 15:48:04 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:50369)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hEfg1-00027a-AL; Thu, 11 Apr 2019 15:48:01 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
	1MekvV-1gdxrg0k7R-00apYk; Thu, 11 Apr 2019 21:42:41 +0200
To: Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: peter.maydell@linaro.org, philmd@redhat.com, mjt@tls.msk.ru,
	imammedo@redhat.com, eblake@redhat.com, sgarzare@redhat.com
References: <20190304071631.27567-1-richardw.yang@linux.intel.com>
	<20190304071631.27567-3-richardw.yang@linux.intel.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9a8d8585-4113-8ffe-d025-abd49c208428@vivier.eu>
Date: Thu, 11 Apr 2019 21:42:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190304071631.27567-3-richardw.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mvG07dIpjXQpTVmKoXIWocqHus1AQClPlb9RVVuavljOXVTLXq9
	obZKYICCeZ1ezhhMBhx8j2yCQe7fePTicSMMGViA3SCxui0oWxJAzMe/aevLTvudpN9PazZ
	h0XwrOYbLVD1K5vXV8+jLizWAuQgsw7eMhgE8gQpxx1oDmC7M7oNwqSJunlJKKFOwJ6ee14
	dPHRJzrjUs+ZLZTCV674g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RwCeqARjoxo=:ggiseNMLsOERsX5/TfSw7m
	VNpJLdn9A1mSoO1umTieOgyESA1UVq98MwSmTCXJPVHxKHlGezyLS6o6auNriwzILxexWExdF
	3rhWl/2KF0jREbnZgcvRzmaK8pqJTeAJBdxMeByrU2gPIlHgvooVy3QkSQAJ5r/LkXXjlCuHL
	1u24NHRwY8BD1mbaKdVPakQ3MEwxFpBkK1ItL4zfDaxKBQsqgeisGVc0ke1tui3jCQr14FhE6
	ja6y23zNxTvPWn18bG41oOPsj1jMmo/IoXaQchUYaNrL5rJfwDPBDqop8UaR3e4NTNsoZCxEv
	xc30WzPvvs/iwNJZnuUD+RIbqksxe3WZqA/6YnkBFpdvfc7VDhJ6Byo7TRA84ZiOChlxDMQ8m
	ed55E7ppMDzdHH3vvMw0SH9BJGk3xw1FbJHuLl5ew0Ilm0/JBi2umd3+0hydC6qwxzwXm0BzH
	+0X54eZm3j5WTVki2UUCdlLJDYPssfWgeiJunLb+bnBRq57FEqa78iAFQMTrESTqPQz2ZgQIv
	00gZFbDsVNRKoAicJ/ZoxE/IlfPIKtBLNIARla5RWwJpZufQpL5p5wM9ZIgPOZhfnuU89B63H
	iZ9mBJAzZRQE0L7zwhmBrDPKhuL68juOauh+Y22ZHbuvg0ot7iKDVWYyO9xi3nyk43zkq83PQ
	KsNbfMOjVYh+l2EdnWQiSD/Al1nsuOxBj8oytr8D+ITJT/hpJRzEK5Ie2Lsu7dXwvyJAuAgww
	jJKzldGluNIYeqjbN9iEDCliqLJNJfTlIXQZ+TFa2pI5ozzOProzQ1kI2cE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: Re: [Qemu-trivial] [PATCH v6 2/2] CODING_STYLE: indent example code
 as all others
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
X-List-Received-Date: Thu, 11 Apr 2019 19:48:05 -0000

On 04/03/2019 08:16, Wei Yang wrote:
> All the example code are indented with four spaces except this one.
> 
> Fix this by adding four spaces here.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  CODING_STYLE | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/CODING_STYLE b/CODING_STYLE
> index 90321e9c28..cb8edcbb36 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -147,10 +147,10 @@ block to a separate function altogether.
>  When comparing a variable for (in)equality with a constant, list the
>  constant on the right, as in:
>  
> -if (a == 1) {
> -    /* Reads like: "If a equals 1" */
> -    do_something();
> -}
> +    if (a == 1) {
> +        /* Reads like: "If a equals 1" */
> +        do_something();
> +    }
>  
>  Rationale: Yoda conditions (as in 'if (1 == a)') are awkward to read.
>  Besides, good compilers already warn users when '==' is mis-typed as '=',
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

