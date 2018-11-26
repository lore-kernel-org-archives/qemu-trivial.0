Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRDfn-0005bm-AI
	for mharc-qemu-trivial@gnu.org; Mon, 26 Nov 2018 04:59:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRDfk-0005Zh-W1
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 04:59:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRDfg-0002Cn-1t
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 04:59:20 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:39513)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gRDff-00025T-OV; Mon, 26 Nov 2018 04:59:15 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MGhi0-1gDWHa4318-00DmOX; Mon, 26 Nov 2018 10:59:05 +0100
To: Li Qiang <liq3ea@gmail.com>, pbonzini@redhat.com, rth@twiddle.net,
	ehabkost@redhat.com, alex.bennee@linaro.org, philmd@redhat.com,
	armbru@redhat.com
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <1543226179-5135-1-git-send-email-liq3ea@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <9382f2b5-89ea-04b4-de21-5fdbcec1fd47@vivier.eu>
Date: Mon, 26 Nov 2018 10:59:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1543226179-5135-1-git-send-email-liq3ea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rSQAwkDoeMM6TQb75ZxEL5mTFN0+KWlvz38wu5WMKcm5QHY3mYZ
	8FEy2CcipD2SYLOsgrzga5XuU/Jet+G2v7CDHS/mgXKG/kRjkjbb7Ijh+6aKalWnYhMSser
	vKDT//3wj/rKXPolSsM5SzrXGnISC+lZps2jYCavTC44ZdyRt/WPgYxP5NtPIRgqY9kiSJj
	4EJ8YsjQ0rTVAb5BNDoQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EhdYGwTrpB8=:zN6InoiD8z/0Nju9a0xIxC
	BK6iqoSkyhyN2oTs2kXOm7aMidkYfS+7SGZ0DJIbCVYwWb7D+nUzwaGz6bV6ZmHiGdOBjENZF
	E9dDeyYqnu+B/pwVRv18YIB8lGgQ3k2lllZxklk28Nq+HvYw4iSkoMwuM+sZg8ZEIE4HlSXqs
	QMKz2ahFdNxekGYSvQqhvGMZlfV9l76uiXNSX5ooDyc/NhOnhCAPrVbxdKKycgI8eJGsqNai2
	j9nqW71I+8Em0ERudPMg8La/dgoM8EEFx+r7RI1DjW1LKjC/6WYkCmEXgs69tsqM3kZFUZNVp
	xWGeXIQCz57b0TvIY5oGTyen6N9tY7SZ+dA3760t7+mR4VzEpbgw7DZ2qs+rBt+F/BmToPsSu
	ZZKPbNm11fcvReEL55ApyNxfM8cXRjkTQBn/c7vatXJSeJOYtWG6OWBbCVGJIUM8MKTHIZeg2
	xUAtnM3cJC7xbzYm6djLZfmaVUtU4We1LNUxxsLaKDK6xW2ULthWSkPxjCd3VfM0uABnEzmuC
	rsSNQAwsLpYMrrCUThcmaM5klHObJ+bG6VEmS6FlNnD2+PG3ddrfqwqy1EyVzwWNNqaZ9w9/j
	TdxfbIcXBbEfBf6Bm5RP8//NCl2Bqob0cW4W9zXMa28UCODS1g7xWdJhlfCl/88KCD3khBIWX
	6Mfb0RPvgP21EBndzWSptnZ2OWfLfdGLm5zFh4L9Xhj2hB7L0YUAr9GiE/axsuoinf+K3ByEU
	dve5ywUqmrfD8xdF6qO5rD4FJ9cVMz6rLVALl1azTDS2mC2inpwS1VQo6vi+LjHIMLT47La0t
	+MtrAjVHBaCj0hXUa5Ac8AyXmZNPg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: Re: [Qemu-trivial] [PATCH] target: hax: replace g_malloc with g_new0
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
X-List-Received-Date: Mon, 26 Nov 2018 09:59:22 -0000

On 26/11/2018 10:56, Li Qiang wrote:
> And also the g_malloc doesn't need check return value,
> remove it.
> 
> Cc: qemu-trivial@nongnu.org
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Li Qiang <liq3ea@gmail.com>
> ---
>  target/i386/hax-all.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
> index d2e512856b..502ce6f0af 100644
> --- a/target/i386/hax-all.c
> +++ b/target/i386/hax-all.c
> @@ -154,13 +154,7 @@ int hax_vcpu_create(int id)
>          return 0;
>      }
>  
> -    vcpu = g_malloc(sizeof(struct hax_vcpu_state));
> -    if (!vcpu) {
> -        fprintf(stderr, "Failed to alloc vcpu state\n");
> -        return -ENOMEM;
> -    }
> -
> -    memset(vcpu, 0, sizeof(struct hax_vcpu_state));
> +    vcpu = g_new0(struct hax_vcpu_state, 1);
>  
>      ret = hax_host_create_vcpu(hax_global.vm->fd, id);
>      if (ret) {
> @@ -250,11 +244,8 @@ struct hax_vm *hax_vm_create(struct hax_state *hax)
>          return hax->vm;
>      }
>  
> -    vm = g_malloc(sizeof(struct hax_vm));
> -    if (!vm) {
> -        return NULL;
> -    }
> -    memset(vm, 0, sizeof(struct hax_vm));
> +    vm = g_new0(struct hax_vm, 1);
> +
>      ret = hax_host_create_vm(hax, &vm_id);
>      if (ret) {
>          fprintf(stderr, "Failed to create vm %x\n", ret);
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


