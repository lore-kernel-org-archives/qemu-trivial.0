Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guDkc-0005xU-P6
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 04:56:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDka-0005vv-Ku
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:56:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDkX-00024e-Ml
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:56:10 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:33935)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guDkQ-0001pq-I9; Thu, 14 Feb 2019 04:56:04 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MTikV-1gUg111vll-00Tzff; Thu, 14 Feb 2019 10:55:38 +0100
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, pbonzini@redhat.com, kraxel@redhat.com,
	mst@redhat.com
Cc: qemu-trivial@nongnu.org
References: <20190212134758.10514-1-dgilbert@redhat.com>
	<20190212134758.10514-3-dgilbert@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1374bcc2-f297-5b8a-2340-5853376052c2@vivier.eu>
Date: Thu, 14 Feb 2019 10:55:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190212134758.10514-3-dgilbert@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:0UWhgJNctb64Kp2qc2ywxKA3cwseDxzHX5r6PUplZPEwgo2bQzw
	2Ax+UPXXZyl/CKVJF9gyzfqf0EoAP5tjefoEhS1SvOzMimuo7HSFVm5Ry+WhTScz1+r4Obg
	g0bA2tVZKbxmsVYcMJse/Vx/fdL5YoH1eFiGGbfhqq9xmeSr81rUIE1GvODbZnYTwG4MR7K
	4nMYsQgpYuyA8e64E0kXw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ejwnSamT0Tk=:FLMIFlU8SU8QU+5e/iIeOb
	i94Lfaxxvyvux5zeX7/6vSLTlgf3RBFPcyY6oDFsSjg2uHhev5hH3mm116ZgKGC85XKH+Wruk
	cE9IAUgoBju5DS/U729fvinqneH0D378EGFBqolaTu2c+NzSjUPvsiiUjVfMfE5SKscemAV7p
	TnTBvB5DyhOeaCmMjV2ejTkRlrIFA1YafXMmwSPL+jTQE62SgSI2Jr+7lk5hyrZrR7y9mjcyD
	pmFf/XbkmYCh0yFMzAzc1GJWwaPsQEOfI6y1gUlj5zIm2xOOsVSU0ag5l4PQqgkU0FAVsG9wE
	4y7D3XjS3AyS1hNacdyx6nrgdqW9XLyZZgp9BBYzkzLjWJvmPEXU3Vme817QgqKDamMhOw0Rg
	N1e5h5ZfF5C3jTXsaBhHCjI2J0e6Ef0i9CFNxmHzzNCgxAjT7bP59VGCpWkUYkG6OSmWZjPl2
	w3U0exowQVh/6cP3EdOLF1V/veHFuDQlHavxGeczoZa1qApKwc8ZRnyJiNEDfzGrmib2G6J05
	PXxMkPA4SSoGpjMju1kxizGjpkexoZ0hFYcUP+i7PlSr/cvkVkshI7skJeOo6sIcHdNwpkt3u
	Ou3tw9UEOokTxuQHSwYXn5QZl06tWln1bU444gYHKpnXlCr8C9EbvCbN53UuT0zC2JRcXd+FL
	JkwPp7j2YsGXLLiOfBXYLK0hQ9ImS8+Oem3KdhJGHo3FTLbr+Cx9KB4UN/ff7NhSf8huYRYBy
	ybz4TeNkwNcNcTBNDXJsZc7X5XgakwgxZVFsVYMklJuEC04meJoVlh0s3WU=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-trivial] [PATCH 2/4] HMP: Prepend errors with 'Error:'
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
X-List-Received-Date: Thu, 14 Feb 2019 09:56:13 -0000

On 12/02/2019 14:47, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Always make error messages start with 'Error:' as a fallback
> to make sure that anything parsing them can tell it failed.
> 
> Note: Some places don't use hmp_handle_error
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hmp.c b/hmp.c
> index b2a2b1f84e..4d14718fea 100644
> --- a/hmp.c
> +++ b/hmp.c
> @@ -62,7 +62,7 @@ static void hmp_handle_error(Monitor *mon, Error **errp)
>  {
>      assert(errp);
>      if (*errp) {
> -        error_report_err(*errp);
> +        error_reportf_err(*errp, "Error: ");
>      }
>  }
>  
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

