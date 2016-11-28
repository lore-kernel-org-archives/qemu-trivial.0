Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cBVgi-0000jN-BA
	for mharc-qemu-trivial@gnu.org; Mon, 28 Nov 2016 18:50:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cBVgc-0000hb-Vt
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2016 18:50:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cBVgb-0005Hz-Sb
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2016 18:50:15 -0500
Received: from mail-oi0-f68.google.com ([209.85.218.68]:33400)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cBVgU-0005Bz-Ar; Mon, 28 Nov 2016 18:50:06 -0500
Received: by mail-oi0-f68.google.com with SMTP id f201so16095612oib.0;
	Mon, 28 Nov 2016 15:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=zfDxfEbZNtWdLV3ujGcmFgfVZGmRDb5yMdeNYy4pV8s=;
	b=TZJQmFEGuCEMRh50SNvFFwIhDWak3ERA2/euGvYqpMQgfm2wTx9UrdgNnvMNQlSOh7
	R56rQuwPkGbulBdQIqO1+pYs/GTqGrwFp9yHq1JkEhv5WX8WZ1q9W1j3vCm9OkupkoVQ
	LtAkrIfb3afK/+KLDur54kCnPGBA258xJeaJaRS9gErfEqJEe/XkWWv2c6lrjqWAoyZE
	2srzFd7l2VVMqwhHIXpnWbKa8aGk2vblT7Hp6DfElSU3FM0UtZ26bhd2hHJuHGXjskB2
	jBj1qCaXEQGtA7y+TsBSvMkyLCvRJ8o/zmCuEdYs4oY+xkjkL3vok4PE3YakFl9bnJrU
	d4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=zfDxfEbZNtWdLV3ujGcmFgfVZGmRDb5yMdeNYy4pV8s=;
	b=g1+QFlMh0dv02T0RwCBpqc4l4fagMe9IGMy7+DbbUH9wvLC9U7DdddHS1UvqDmqQjD
	h4af1xWok+kzH2j6gh1rOb3slRebogDUD4LuddY9jkqbSEOYBAgm4tLAI9sRWiDw7y+p
	VsYtGLmDqMtv2b265mygHZrtWAHu4xi5eNWBwDS45qki0WdS6xinbLqTsm1Nap0EPxO4
	oUaYrkaLRRgMtE4A6qYD5babNllq2AnBk9VLncH6ls0902rRZLtVHEavIK0Fyy8zFU11
	2FO3bZE669lh3vzYZb2rkbjG/NEtjGGq5QYfWKdoPGwmFhpelkI7QfWELcGPUhGmxX1r
	259g==
X-Gm-Message-State: AKaTC02U9Lya3rJF3LdvR+MiaiaY4sRYuKbXREizPf7pfXHO7l2Tzjw6Uid/JeAVnsUJX41nN+JWn6KrylA+fg==
X-Received: by 10.202.173.1 with SMTP id w1mr12317549oie.164.1480376943803;
	Mon, 28 Nov 2016 15:49:03 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.122.34 with HTTP; Mon, 28 Nov 2016 15:48:33 -0800 (PST)
In-Reply-To: <20161119194715.19841-1-sw@weilnetz.de>
References: <20161119194715.19841-1-sw@weilnetz.de>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 28 Nov 2016 15:48:33 -0800
X-Google-Sender-Auth: efPX0OGN2ffOkGISae16HLTgrNI
Message-ID: <CAKmqyKMGkfOMCmcyjrOJMOgZ3WP6eoMLsQz2NdoKu+SWSRqejw@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.218.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.8] include: Fix typos
 found by codespell
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
X-List-Received-Date: Mon, 28 Nov 2016 23:50:19 -0000

On Sat, Nov 19, 2016 at 11:47 AM, Stefan Weil <sw@weilnetz.de> wrote:
> Add also a missing parenthesis in a comment.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Acked-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  include/hw/dma/xlnx_dpdma.h    | 3 ++-
>  include/hw/pci-host/q35.h      | 2 +-
>  include/hw/register.h          | 2 +-
>  include/io/task.h              | 2 +-
>  include/qapi/dealloc-visitor.h | 2 +-
>  include/qemu/qht.h             | 2 +-
>  include/qemu/xattr.h           | 2 +-
>  7 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/include/hw/dma/xlnx_dpdma.h b/include/hw/dma/xlnx_dpdma.h
> index 664df28..7a304a5 100644
> --- a/include/hw/dma/xlnx_dpdma.h
> +++ b/include/hw/dma/xlnx_dpdma.h
> @@ -53,7 +53,8 @@ typedef struct XlnxDPDMAState XlnxDPDMAState;
>   *                             data to the buffer specified by
>   *                             dpdma_set_host_data_location().
>   *
> - * Returns The number of bytes transfered by the DPDMA or 0 if an error occured.
> + * Returns The number of bytes transferred by the DPDMA
> + *         or 0 if an error occurred.
>   *
>   * @s The DPDMA state.
>   * @channel The channel to start.
> diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
> index 94486fd..53b6760 100644
> --- a/include/hw/pci-host/q35.h
> +++ b/include/hw/pci-host/q35.h
> @@ -180,7 +180,7 @@ typedef struct Q35PCIHost {
>  uint64_t mch_mcfg_base(void);
>
>  /*
> - * Arbitary but unique BNF number for IOAPIC device.
> + * Arbitrary but unique BNF number for IOAPIC device.
>   *
>   * TODO: make sure there would have no conflict with real PCI bus
>   */
> diff --git a/include/hw/register.h b/include/hw/register.h
> index 8c12233..5b6dc32 100644
> --- a/include/hw/register.h
> +++ b/include/hw/register.h
> @@ -92,7 +92,7 @@ struct RegisterInfo {
>   * This structure is used to group all of the individual registers which are
>   * modeled using the RegisterInfo structure.
>   *
> - * @r is an aray containing of all the relevent RegisterInfo structures.
> + * @r is an array containing of all the relevant RegisterInfo structures.
>   *
>   * @num_elements is the number of elements in the array r
>   *
> diff --git a/include/io/task.h b/include/io/task.h
> index 42028cb..6810842 100644
> --- a/include/io/task.h
> +++ b/include/io/task.h
> @@ -231,7 +231,7 @@ void qio_task_complete(QIOTask *task);
>   *
>   * Mark the operation as failed, with @err providing
>   * details about the failure. The @err may be freed
> - * afer the function returns, as the notification
> + * after the function returns, as the notification
>   * callback is invoked synchronously. The @task will
>   * be freed when this call completes.
>   */
> diff --git a/include/qapi/dealloc-visitor.h b/include/qapi/dealloc-visitor.h
> index b3e5c85..c36715f 100644
> --- a/include/qapi/dealloc-visitor.h
> +++ b/include/qapi/dealloc-visitor.h
> @@ -19,7 +19,7 @@
>  typedef struct QapiDeallocVisitor QapiDeallocVisitor;
>
>  /*
> - * The dealloc visitor is primarly used only by generated
> + * The dealloc visitor is primarily used only by generated
>   * qapi_free_FOO() functions, and is the only visitor designed to work
>   * correctly in the face of a partially-constructed QAPI tree.
>   */
> diff --git a/include/qemu/qht.h b/include/qemu/qht.h
> index 311139b..56c2c77 100644
> --- a/include/qemu/qht.h
> +++ b/include/qemu/qht.h
> @@ -72,7 +72,7 @@ void qht_destroy(struct qht *ht);
>   * In case of successful operation, smp_wmb() is implied before the pointer is
>   * inserted into the hash table.
>   *
> - * Returns true on sucess.
> + * Returns true on success.
>   * Returns false if the @p-@hash pair already exists in the hash table.
>   */
>  bool qht_insert(struct qht *ht, void *p, uint32_t hash);
> diff --git a/include/qemu/xattr.h b/include/qemu/xattr.h
> index 83cf98c..a83fe8e 100644
> --- a/include/qemu/xattr.h
> +++ b/include/qemu/xattr.h
> @@ -14,7 +14,7 @@
>  #define QEMU_XATTR_H
>
>  /*
> - * Modern distributions (e.g. Fedora 15, have no libattr.so, place attr.h
> + * Modern distributions (e.g. Fedora 15), have no libattr.so, place attr.h
>   * in /usr/include/sys, and don't have ENOATTR.
>   */
>
> --
> 2.10.2
>
>

