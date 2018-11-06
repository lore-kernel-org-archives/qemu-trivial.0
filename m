Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gJwG3-0007Mt-N4
	for mharc-qemu-trivial@gnu.org; Tue, 06 Nov 2018 02:58:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gJwFy-0007M6-4a
	for qemu-trivial@nongnu.org; Tue, 06 Nov 2018 02:58:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gJwFm-0000FZ-Ak
	for qemu-trivial@nongnu.org; Tue, 06 Nov 2018 02:58:32 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:49359)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gJwFk-0000BD-GI; Tue, 06 Nov 2018 02:58:25 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1M6DrU-1gQXxD11TM-006g4j; Tue, 06 Nov 2018 08:58:11 +0100
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1M6DrU-1gQXxD11TM-006g4j; Tue, 06 Nov 2018 08:58:11 +0100
To: Dongli Zhang <dongli.zhang@oracle.com>, qemu-devel@nongnu.org,
	qemu-block@nongnu.org, mst@redhat.com
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, stefanha@redhat.com,
	mreitz@redhat.com
References: <1541479952-32355-1-git-send-email-dongli.zhang@oracle.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <57f0794a-857a-8009-eb41-44d422817ce4@vivier.eu>
Date: Tue, 6 Nov 2018 08:58:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1541479952-32355-1-git-send-email-dongli.zhang@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:rRa4ApNpWjeKXnt1DfqygA1ciBn8oAHjyyeopCWQWtY9Lxb8QmL
	h8aqg7tOlYHrrNsn/Nwdul84sWzgJ//e+mkBdWcV7aEPmNNjstC5leEZWGpq2Hl663nm2rU
	CQlnyPjbGniO38wdNoYHU38o+h555+j9mv+vE6R62bchicpaJwR7ak/+Iz9S5HyhKluOtZt
	eLJusmbJaSnIw5Kdr5d6Q==
X-UI-Out-Filterresults: notjunk:1;V01:K0:YIhQaDBSgMQ=:/fwcNQalEJX6LjDIIvL9Da
	6bLoEi7NTIobjhUz+zB0vhwt1UUk/I7te6EBcsQAzuUvXZGDbzqbkeZs/BVyff/gkotqbB0oG
	AfJomGle8ZaKkjm5j0veXyVVkUff0aKMzPuR5bZA9Od6kLDoE32E7k80V8FuW0xi4qhJoX+2V
	xYL6HX1QsXCifhKH/bX9Vk6po8pL/LLFK34ZvyXUz/fCWRjCj8xID4A52ae/UvKH+Yqz+CEZv
	E3kQjAMOXUI4yoJjUAIXe/QL1d+kq3mFbKXoIOF+HK+MKTPzIwe2zcd2aBxvAfG0yPWr4nt4e
	E80yi4txdy+AmFspIXE7eJ64aB79k6ACdAjzbRn7R8IuYuaruJkMPEQfjFCKFWIzZdAWGXdAo
	3qgNfiCCtTD/VpGBaf32tHABYg5d/xYfuh1WacKF5lVOkr4pzKRl0VfkuroyeGL05FxLDiiiv
	uC9OOOkEuRqurwxfFKZ0Ya3OwVzBqrOEVLWqZUx1WwSL+Vm4lPkfYBw3fJecAGl+K1+itsQ06
	VQ8WfaD8nIsQCvaCqO1fCVI2CSjYdY+BdbAv4HVLIQ8/xyuTqg+rn0hPovWPO7zR31bpJbKOt
	8oqC1aEtxmQ1RIGpJmCKh6IRif8fn82D3ebFu9Bh0SRhCuJjEHFoTRBBI3m6vehZXNHfecu4l
	rsGAbYsEKk2xIqk8LXVy8m/jQQ2nLxGT9JemlFa98NzbmZWW4LRwDoO1mJSNuP3kS40fOb+av
	SrbvT2EhHWL+TUig
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: Re: [Qemu-trivial] [PATCH 1/1] virtio-blk: fix comment for
 virtio_blk_rw_complete as nalloc is initially -1
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
X-List-Received-Date: Tue, 06 Nov 2018 07:58:42 -0000

On 06/11/2018 05:52, Dongli Zhang wrote:
> The initial value of nalloc is -1, but not 1.
> 
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
> This is based on git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
>  hw/block/virtio-blk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index 83cf5c0..30999c3 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -96,7 +96,7 @@ static void virtio_blk_rw_complete(void *opaque, int ret)
>          trace_virtio_blk_rw_complete(vdev, req, ret);
>  
>          if (req->qiov.nalloc != -1) {
> -            /* If nalloc is != 1 req->qiov is a local copy of the original
> +            /* If nalloc is != -1 req->qiov is a local copy of the original
>               * external iovec. It was allocated in submit_requests to be
>               * able to merge requests. */
>              qemu_iovec_destroy(&req->qiov);
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


