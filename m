Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h2dKz-0001IO-EA
	for mharc-qemu-trivial@gnu.org; Sat, 09 Mar 2019 09:52:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h2dKx-0001II-T7
	for qemu-trivial@nongnu.org; Sat, 09 Mar 2019 09:52:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h2dKw-0004aT-3K
	for qemu-trivial@nongnu.org; Sat, 09 Mar 2019 09:52:30 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:39043)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h2dKt-0004YH-AE; Sat, 09 Mar 2019 09:52:28 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
	1MIxBc-1hLouZ0qMc-00KTXq; Sat, 09 Mar 2019 15:52:25 +0100
To: Aarushi Mehta <mehta.aaru20@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Stefan Hajnoczi <stefanha@gmail.com>, Julia Suvorova <jusual@mail.ru>
References: <a09acf9e093c09a70896bb9886370cf7f049f941.camel@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <740a3074-e0ff-1331-ff07-05635d7e0edc@vivier.eu>
Date: Sat, 9 Mar 2019 15:52:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <a09acf9e093c09a70896bb9886370cf7f049f941.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:K9amDpTg+A6aFQnr8BsfwgaJuIPu0tFsfzG7YwTmDlJt9lJeQ2/
	iyBEizxLloi3d27pZD8ObOMi1N5MlkQNBCiowJfx2n1LoI3favw1Rd+jwefXce8X6rZejzD
	CgZCO0UyffoE8m9Y2QR50n4ABJrgAX3tAzV5xEP9YGbPrjyHOvs7hAU8PHoWzAot9OXVb8m
	awg1vPHMyerdMyXIfhWhw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lTlicw/+XCY=:K2pCzVCO1wTtbK+pS7yVoh
	4P8WwXKNmYjLeePGMmvVpZyuHRd1klyLbBNpcbZ78O9Gg4QCfZiSeQQjpak8DflqvvFPXmcUp
	Hasjauthk+0Z2KiBWO/qfOIHIw6j0jeS0SWueBL4M2FcDn5YOUpICqf62IY7psVTz/J+hywZI
	i5Q2asPcR5+joA2xBuYJVp+s1RDYjIMzGUZUZPiBO/CIvZyDvQf6ToqNwgU1jiOR5kqZXzzg2
	14UoBDox9vX+xj71NLqVNQaXoiM4oQrhAK/RuX8VAPNP1nfHjJH6ZZo0JyA4sMtakwc2CgA84
	MLu6G7/bu5Cnmt8/XRnnXXhNk7t+66zM/MU11syKRBNCZhZkyZj+6SGmmEUaqfhynu5eKIw0k
	EzdQa++tAqRxbyrWphHetG5gIZ75j0L738J02xIKmAfWI6i108rreF92sXychnS1jeN3TwrY6
	ic+I7cZ+7+QtAQixAtv5tiLZLp4IZACCayayguUtnU4ssBY9X1inh9RAW6QIXrOpUPEw1fKBH
	qcx9XQ65y92uW6ZeQTiDweZu9bk/bMSw3l/BAJ8bTY3EREDa8cNPJsxTC6WtwCKE0kEqPPU7V
	CgUdBo6LukcIRYQh5k1lbr1JybwjVozk+oXLZBBjA3KKdqD3qQjsCm3mRVcXq+KQ4UWNhx4S2
	QR1mjD9sxQ5cCJYBcNEsj4xYng6c30uS7zAVgZ+xPt9KvXlXZSUOGdCyqhX1M1VzxCw65lHG4
	nuNQiQAr/HBaUcRAkQL6AxxIuryRFu2cYLgHa3AcCBKvn6Z6L0jwobMIS/w=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-trivial] [PATCH] thunk: improve readability of allocation
 loop
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
X-List-Received-Date: Sat, 09 Mar 2019 14:52:32 -0000

On 08/03/2019 20:43, Aarushi Mehta wrote:
> Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
> ---
>  thunk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/thunk.c b/thunk.c
> index 17f3d320bb..7f31cffe09 100644
> --- a/thunk.c
> +++ b/thunk.c
> @@ -86,7 +86,7 @@ void thunk_register_struct(int id, const char *name, const argtype *types)
>  #endif
>      /* now we can alloc the data */
>  
> -    for(i = 0;i < 2; i++) {
> +    for (i = 0; i < ARRAY_SIZE(se->field_offsets); i++) {
>          offset = 0;
>          max_align = 1;
>          se->field_offsets[i] = g_new(int, nb_fields);
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

