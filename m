Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gomuo-0004z4-CT
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 05:16:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gomum-0004yA-Qn
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 05:16:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gomul-0005XD-Uq
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 05:16:16 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:39521)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gomul-0005VJ-Lv; Wed, 30 Jan 2019 05:16:15 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1M3lsh-1gp41q0NJD-000xXh; Wed, 30 Jan 2019 11:16:09 +0100
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
References: <20190130095231.42081-1-sgarzare@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <ba3d95a8-6b8c-5d94-f079-ca2899b150c4@vivier.eu>
Date: Wed, 30 Jan 2019 11:16:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190130095231.42081-1-sgarzare@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:liExGGTIdxDoU9XZyf7yTnhUkCYq1aG7eLeBtzUXiywKto0PENt
	gM1v7alWIElY6eJ9UgKVEDyL2GmtDOo3WaQCQhNMdyajyAxxLxjyrIZoaMA5bHYEMRxAHg5
	r1/mz/655iWsCf1khFeb6a91vHSbnwa8xbGJVLbOzK4CxkakBoWBVhltInI3xye320DooeT
	4k0Nt2Eab1BUsGUAv3xGg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ld/7p3V/wUw=:3rEwe9cm+OcTCbDztMlvnv
	sX/HdJuPMgP1SxjYife296BK03YrO9UB1sqSRajnGAQrGB0xKM49TyF5HIRoOC7aRiAlqIWU0
	z6Sa/HEI37cn9ol6677E3Jlx+srLcA3Uo9rdTQHT2Mi7uVGctnAdN4o3PSyoPOfokeIsGiCi9
	Mp+EOSRoWO9XfxonvoY+ZUECk6CqCFRvI+Ey1FDYa7mOLQcL4vBD4XHzHApQMtjCtM32hx+7u
	ewEnuDTJwLmqgZP72YXmBng756dKDl4fCcc7qORUHNDI5JCu3DTVB0Y4+RUZfRdxtoXMuSJH1
	6crSV3YFuNUHvuU7nC0vCpcloGQGqzhUXNC+3VI6v6A/wLCDrUfVeQUYX2zQSMsH2Rrgd4+Gg
	lWFz7AatMUS077kutLoGGfZUyd97vtBFmR1qMKoPkmeXm7J0mu82f15rxr6fdMaekZZE6fYYu
	e6elzgZsXYCk9Pwe9jMmjhie3FXgD6QDGzjVdIN/VVSp64QZ++t0jDUD8QNkdk6RPqfAUT1DJ
	7F1hn3x4AAoeKcgYOLI5NAXsE5ERe8aBHOuQGg9n/dtm9kf1O/Ax//1qG+sBIJipGDYCupodN
	6a3ikYmG8nXv30YK/C8KcNt1eeQT2B3xLBTTy5kEd4QQTLgWVG5QIu3ycXYXEiTuXo97RHI7h
	RC8U9Y/ljkqasS2PUuA9DD2lYztC6UXXE7ak1zDqCEv4NaXBUGByL4psFKgLNmIZowHvBIb1G
	QHZmloJ4lDY3nK/C/YNXL82b8fcDQa1apXwppEyqCqt3iIqtED5K+FWgrlU=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-trivial] [PATCH] virtio-blk: remove duplicate definition
 of VirtIOBlock *s pointer
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
X-List-Received-Date: Wed, 30 Jan 2019 10:16:17 -0000

On 30/01/2019 10:52, Stefano Garzarella wrote:
> VirtIOBlock *s is already defined and initialized with req->dev
> on top of virtio_blk_handle_request(), so we can remove it from
> the code block of VIRTIO_BLK_T_GET_ID case.
> 
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  hw/block/virtio-blk.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index f208c6ddb9..9a87b3bfac 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -569,8 +569,6 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
>          break;
>      case VIRTIO_BLK_T_GET_ID:
>      {
> -        VirtIOBlock *s = req->dev;
> -
>          /*
>           * NB: per existing s/n string convention the string is
>           * terminated by '\0' only when shorter than buffer.
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

