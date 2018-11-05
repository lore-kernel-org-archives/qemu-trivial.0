Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gJdGb-0002dk-P7
	for mharc-qemu-trivial@gnu.org; Mon, 05 Nov 2018 06:42:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gJdGW-0002c0-0L
	for qemu-trivial@nongnu.org; Mon, 05 Nov 2018 06:41:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gJdGU-00082y-3y
	for qemu-trivial@nongnu.org; Mon, 05 Nov 2018 06:41:55 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:59619)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gJdG8-0002pZ-TN; Mon, 05 Nov 2018 06:41:38 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1N17pC-1fMx4O06ig-012XvS; Mon, 05 Nov 2018 12:41:10 +0100
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1N17pC-1fMx4O06ig-012XvS; Mon, 05 Nov 2018 12:41:10 +0100
To: Dongli Zhang <dongli.zhang@oracle.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, mst@redhat.com
References: <1541139396-4727-1-git-send-email-dongli.zhang@oracle.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <e06eeaf1-0042-2a68-904f-d625357c714d@vivier.eu>
Date: Mon, 5 Nov 2018 12:41:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1541139396-4727-1-git-send-email-dongli.zhang@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:xwEOpW3h7yCYewFprD41nRpB23mXiaiVj1OXCuoQQmRHwvAiHig
	KY97PG5dA0R6a67yCcwP48nK2kBuVufnlGbWYz9WWo5Gn56iS4Ld/VVN+Y8Nwyvyk9C2SDY
	/qq3QL+co687rAfBrK5R3Lm4p0vytJrxzUIoxTQgbRCVpTDzH9nO2gV5ZHSsShfYjeYfic+
	zpjeEDoppe60PuuYY88mA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:IPp0FlnMu/M=:grOGaHN5xlxoplwH9WyV6e
	gTyGmEW6YSvdUdEwP7h6FXz0b+5kOZIFl3mK9alol1CGyGR1+0nsbdyRIBo+aor6c2fzDhcD/
	TWBzI+cC8RPvhxYS3tAvaaE2/nnbp6orOJ2p7Vjqh7G5XhsS/6MTKxn3P3LDLoYXip1SM5lRW
	2ykQOCl858zzzMVXGnWoJXcHg16qHreHLydJpcfag0RpwChe8OiEc21DbVND/0Lz60RcCmKvy
	ALJna8WlSDOB5n6rBxqAJKNEQEqPit8Xka3NDB8Uddfe9/uEIna+v0p8DzyUUTFay/OSs3HtT
	npZg2SDkJ53WBTFjRMxmjZKPexdzgVqTSFKgPnhSbUAaQ5PdWKtP9Sd1c35odLiEUOMwIddlP
	+DPx6D2+7WB46T+uo2ScYB8vhsX+ZJMTWAUg9hQ34N8sFDtZxgYGYfmkqmPQEPxpRz1mBJkIm
	t8cR9yGZgZWK19eCrUb8BVHjPaKgMaVHMzKLXuTqE+2wQ3hu7wAol5j4qMIkt8hcz9+g6Ytwc
	JRjx2aIucdwztUQ9oA5B2H7oB1LgxchahUzkCIKy21sJuEcM5Rt2lfbZDYQWFwvLzh0K+fc/8
	cGd2lL4aDeNZYKN78jHaPegc6WDktnynxbvOf5haIdc7O6BCUheJBjjgAH6D6eFVLJfBtmw6f
	SCMZE5mNrorjU4BaSxlkY6V1QtFwTN45K0DQCS3gwibjnmF4089WttVdRv+YzE0yexs2VMEyB
	7So7HhppyFSqnOBL
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: Re: [Qemu-trivial] [PATCH 1/1] virtio: pass argument by value for
 virtqueue_map_iovec()
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
X-List-Received-Date: Mon, 05 Nov 2018 11:42:00 -0000

On 02/11/2018 07:16, Dongli Zhang wrote:
> Pass num_sg by value instead of by pointer, as num_sg is never modified in
> virtqueue_map_iovec().
> 
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
>  hw/virtio/virtio.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Applied to my branch trivial-patches.

Thanks,
Laurent


