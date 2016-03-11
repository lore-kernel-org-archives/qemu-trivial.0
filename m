Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aeQ2F-0005wi-Ip
	for mharc-qemu-trivial@gnu.org; Fri, 11 Mar 2016 11:35:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aeQ2C-0005vk-S4
	for qemu-trivial@nongnu.org; Fri, 11 Mar 2016 11:35:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aeQ2A-0004o1-DD
	for qemu-trivial@nongnu.org; Fri, 11 Mar 2016 11:35:28 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:34815)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aeQ2A-0004nY-3O
	for qemu-trivial@nongnu.org; Fri, 11 Mar 2016 11:35:26 -0500
Received: by mail-wm0-x22d.google.com with SMTP id p65so24969380wmp.1
	for <qemu-trivial@nongnu.org>; Fri, 11 Mar 2016 08:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=xS0g8FnfLQiDAwu8a4ll+HIBhPLCG1WNTxNldcT7Vto=;
	b=TN+ezMdfblW0Jc/w6O6S1G47OCtZUwYy61mzv2AYt+spwypl5iC99s2fueSlv3KPqt
	fOf7qDsEVH6rTQA4gyg5+O6AV7WqrVBt44NDuLYRk4kOXIGm0yNL1Hg9SVOdsjyukgAe
	lU/fJAAxHXR+/wgmwU5sSiq/RrTJ9HVqO6jG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=xS0g8FnfLQiDAwu8a4ll+HIBhPLCG1WNTxNldcT7Vto=;
	b=VQoYXGlXqB95rqk2/ITl/0UerhNU1rnPIn2taD4Ft3gygA1CuA0azB2SYuO7aIIY6Q
	c/8UmcCRqSSYVB8SeYFaDc9Oa5Nm2UY2c3l3BVxuNjBuW9oByhivvIbrUzIa5iMdrDh6
	FUa0piJsvEeOKXJO/Ka61pDYT6PGbaDYTHbyZd2MhqOCIq2ndDavIqWj4Dlw8CF0uMdO
	M48CDYRbZ+bweO3KGZPibywyjHgT2lCJBzvACprDpYv9OuaMDlKwGslzoSrzKwDpCqIZ
	5BhqMfyAAARMlEPIg3rXK7t9iomjzQ7E3zPrRTL1e/UL24CRCcaPtyZvFfNsEAuyFHfW
	1ghA==
X-Gm-Message-State: AD7BkJJWEz9CpJZW42MYbMWs648KkgUwfzqrAzPq8GzmzkM+Vt1gNFdmgeNzlP0vUja6DKkQ
X-Received: by 10.194.184.112 with SMTP id et16mr10888867wjc.75.1457714124182; 
	Fri, 11 Mar 2016 08:35:24 -0800 (PST)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	x203sm3022490wmg.23.2016.03.11.08.35.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Mar 2016 08:35:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 121743E1D23;
	Fri, 11 Mar 2016 16:35:22 +0000 (GMT)
References: <CALwKnOiWKiXMVwvvZj9pFdJnJ6Q5Z_Ar=Q7rEEp6AC6_vKs3Ww@mail.gmail.com>
User-agent: mu4e 0.9.17; emacs 25.0.92.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Siddharth Gupta <siddharthgupta04@gmail.com>
In-reply-to: <CALwKnOiWKiXMVwvvZj9pFdJnJ6Q5Z_Ar=Q7rEEp6AC6_vKs3Ww@mail.gmail.com>
Date: Fri, 11 Mar 2016 16:35:21 +0000
Message-ID: <87bn6lt1km.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22d
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] BiteSizedPatch-LargeFrames
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
X-List-Received-Date: Fri, 11 Mar 2016 16:35:30 -0000


Siddharth Gupta <siddharthgupta04@gmail.com> writes:

> From 032be62f56a207833ae12cc9474e3e8be5ed8eb4 Mon Sep 17 00:00:00 2001
> From: Siddharth Gupta <siddharthgupta04@gmail.com>
> Date: Fri, 11 Mar 2016 20:10:41 +0530
> Subject: [PATCH]
> bitesizedtasks-large_frames-hw_dma_xilinx-hw_net_virtio

I think the subject should be what was done rather than where the work
came from.

Paolo has already mentioned that this may not be a good idea,
especially for virtio so the following comments are general QEMU style
comments for future reference.

>
> ---
>  hw/dma/xilinx_axidma.c |  5 ++++-
>  hw/net/virtio-net.c    | 11 ++++++++++-
>  2 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index ce5c1e6..9c6bda2 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -255,13 +255,15 @@ static void stream_process_mem2s(struct Stream *s,
> StreamSlave *tx_data_dev,
>                                   StreamSlave *tx_control_dev)
>  {
>      uint32_t prev_d;
> -    unsigned char txbuf[16 * 1024];
> +    unsigned char *txbuf;
>      unsigned int txlen;
>
>      if (!stream_running(s) || stream_idle(s)) {
>          return;
>      }
>
> +    txbuf = (unsigned char *) malloc(16 * 1024 * sizeof(unsigned
> char));

QEMU uses g_malloc/g_free wrappers for memory allocation. For one thing
g_malloc can never fail where as here you may end up with a NULL ptr.

> +
>      while (1) {
>          stream_desc_load(s, s->regs[R_CURDESC]);
>
> @@ -303,6 +305,7 @@ static void stream_process_mem2s(struct Stream *s,
> StreamSlave *tx_data_dev,
>              break;
>          }
>      }
> +    free(txbuf);
>  }
>
>  static size_t stream_process_s2mem(struct Stream *s, unsigned char *buf,
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 5798f87..ba6ebac 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -1094,7 +1094,7 @@ static ssize_t virtio_net_receive(NetClientState *nc,
> const uint8_t *buf, size_t
>      VirtIONet *n = qemu_get_nic_opaque(nc);
>      VirtIONetQueue *q = virtio_net_get_subqueue(nc);
>      VirtIODevice *vdev = VIRTIO_DEVICE(n);
> -    struct iovec mhdr_sg[VIRTQUEUE_MAX_SIZE];
> +    struct iovec *mhdr_sg;
>      struct virtio_net_hdr_mrg_rxbuf mhdr;
>      unsigned mhdr_cnt = 0;
>      size_t offset, i, guest_offset;
> @@ -1113,6 +1113,8 @@ static ssize_t virtio_net_receive(NetClientState *nc,
> const uint8_t *buf, size_t
>
>      offset = i = 0;
>
> +    mhdr_sg = (struct iovec *) malloc(VIRTQUEUE_MAX_SIZE * sizeof(struct
> iovec));
> +
>      while (offset < size) {
>          VirtQueueElement *elem;
>          int len, total;
> @@ -1122,6 +1124,7 @@ static ssize_t virtio_net_receive(NetClientState *nc,
> const uint8_t *buf, size_t
>
>          elem = virtqueue_pop(q->rx_vq, sizeof(VirtQueueElement));
>          if (!elem) {
> +            free(mhdr_sg);
>              if (i == 0)
>                  return -1;
>              error_report("virtio-net unexpected empty queue: "
> @@ -1136,11 +1139,15 @@ static ssize_t virtio_net_receive(NetClientState
> *nc, const uint8_t *buf, size_t
>
>          if (elem->in_num < 1) {
>              error_report("virtio-net receive queue contains no in
> buffers");
> +            free(mhdr_sg);
>              exit(1);
>          }
>
>          sg = elem->in_sg;
>          if (i == 0) {
> +            if (offset != 0) {
> +                free(mhdr_sg);
> +            }
>              assert(offset == 0);
>              if (n->mergeable_rx_bufs) {
>                  mhdr_cnt = iov_copy(mhdr_sg, ARRAY_SIZE(mhdr_sg),
> @@ -1168,6 +1175,7 @@ static ssize_t virtio_net_receive(NetClientState *nc,
> const uint8_t *buf, size_t
>          if (!n->mergeable_rx_bufs && offset < size) {
>              virtqueue_discard(q->rx_vq, elem, total);
>              g_free(elem);
> +            free(mhdr_sg);
>              return size;
>          }
>
> @@ -1186,6 +1194,7 @@ static ssize_t virtio_net_receive(NetClientState *nc,
> const uint8_t *buf, size_t
>      virtqueue_flush(q->rx_vq, i);
>      virtio_notify(vdev, q->rx_vq);
>
> +    free(mhdr_sg);
>      return size;
>  }


--
Alex Bennée

