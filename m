Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z2ftx-0002QE-4a
	for mharc-qemu-trivial@gnu.org; Wed, 10 Jun 2015 09:18:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z2ftt-0002Nl-Ue
	for qemu-trivial@nongnu.org; Wed, 10 Jun 2015 09:18:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z2ftn-0003wt-V7
	for qemu-trivial@nongnu.org; Wed, 10 Jun 2015 09:18:37 -0400
Received: from mail-pa0-f51.google.com ([209.85.220.51]:36473)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Z2ftn-0003uv-QW
	for qemu-trivial@nongnu.org; Wed, 10 Jun 2015 09:18:31 -0400
Received: by pabqy3 with SMTP id qy3so34791507pab.3
	for <qemu-trivial@nongnu.org>; Wed, 10 Jun 2015 06:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=wzQH8hjL4LVnXzUQs7r08tH10hOPmJE62NldklbG1ZM=;
	b=KtJMCYkfwWSf2ZAUj+kqNJTjql8FjCxvzdNQx/7X4LIY/ALnSYPC4PDKEE6e5teFH5
	eKMdh+T/R9moi9mD8KWs6yIuw9cnOZ7PmFFKhXkqWXu16fWXhnGWxih9fKwwgROlBEri
	CIC3Rc5u1ZcFeFthhEBdzrJ8h4K99x8bu1gpaSP621qtJtKDd1P6txtvb7mx+gkMx1/2
	Fu9ZDb6LEf33Ll0dS9seyaxPaUB96h28BzYgWskUrSwGGc5MzTiQF9tqEDrzviCCwLi+
	InYRUzM8hcgf5lSPSaLiPEiTrRY2Hv6mbV9AhHaAqd13EIwmJvEIpJSch3aKpFtI9Icd
	fyBg==
X-Gm-Message-State: ALoCoQl9iIj/iu+rNVPIC45DoYLHQQIVsJLMp1Jl8JKS5itCwmX8fpypbUHQlAO3vesoHHLwrZ1P
X-Received: by 10.66.159.68 with SMTP id xa4mr5848446pab.105.1433942310541;
	Wed, 10 Jun 2015 06:18:30 -0700 (PDT)
Received: from [10.22.20.50] ([180.150.157.31])
	by mx.google.com with ESMTPSA id tr3sm5728881pbc.75.2015.06.10.06.18.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Jun 2015 06:18:28 -0700 (PDT)
Message-ID: <55783923.2000203@linaro.org>
Date: Wed, 10 Jun 2015 21:18:27 +0800
From: Shannon Zhao <shannon.zhao@linaro.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <1430321049-11859-1-git-send-email-shannon.zhao@linaro.org>
In-Reply-To: <1430321049-11859-1-git-send-email-shannon.zhao@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.51
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
	zhaoshenglong@huawei.com, mst@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 0/7] virtio: inline private qdev
 properties into virtio devices
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
X-List-Received-Date: Wed, 10 Jun 2015 13:18:39 -0000

Ping?
Have these patches been missed?

On 2015/4/29 23:24, Shannon Zhao wrote:
> The private qdev properties of virtio devices are only used by
> themselves. As Peter suggested and like what virtio-blk has done, we
> should move the private qdev properties into devices and don't expose
> them to avoid wrongly use.
>
> This patchset is based on following patchset which moves host features
> to backends.
> http://lists.gnu.org/archive/html/qemu-devel/2015-04/msg03785.html
>
> Shannon Zhao (7):
>    virtio-net: move qdev properties into virtio-net.c
>    virtio-net.h: Remove unsed DEFINE_VIRTIO_NET_PROPERTIES
>    virtio-scsi: move qdev properties into virtio-scsi.c
>    virtio-rng: move qdev properties into virtio-rng.c
>    virtio-serial-bus: move qdev properties into virtio-serial-bus.c
>    virtio-9p-device: move qdev properties into virtio-9p-device.c
>    vhost-scsi: move qdev properties into vhost-scsi.c
>
>   hw/9pfs/virtio-9p-device.c        |  3 ++-
>   hw/9pfs/virtio-9p.h               |  4 ----
>   hw/char/virtio-serial-bus.c       |  3 ++-
>   hw/net/virtio-net.c               | 42 ++++++++++++++++++++++++++++++++++++++-
>   hw/scsi/vhost-scsi.c              |  9 ++++++++-
>   hw/scsi/virtio-scsi.c             | 13 ++++++++++--
>   hw/virtio/virtio-rng.c            |  8 +++++++-
>   include/hw/virtio/vhost-scsi.h    |  9 ---------
>   include/hw/virtio/virtio-net.h    | 31 +----------------------------
>   include/hw/virtio/virtio-rng.h    | 10 ----------
>   include/hw/virtio/virtio-scsi.h   | 13 ------------
>   include/hw/virtio/virtio-serial.h |  3 ---
>   12 files changed, 72 insertions(+), 76 deletions(-)
>

-- 
Shannon

