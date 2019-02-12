Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtYoD-0007Wv-ME
	for mharc-qemu-trivial@gnu.org; Tue, 12 Feb 2019 09:13:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtYoA-0007UD-RS
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 09:13:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtYo4-0005gG-V7
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 09:13:10 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46051)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gtYo4-0004zG-GS
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 09:13:04 -0500
Received: by mail-wr1-f66.google.com with SMTP id w17so2806469wrn.12
	for <qemu-trivial@nongnu.org>; Tue, 12 Feb 2019 06:12:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gEGZd/lEU+jcsWM+RZcCDX9++ga69Rslthjs1IHB1xk=;
	b=FnplmLt3W3gY7KbTTrg8Spy0GjDy05tId9KqSgaLYbLDYJdWTWhY811FV4M7bMD41j
	GIpORaEUN1Em9E1+lQQKK4WcEA6h81nwR3lhO/0esvk0XhQq+4bTr7rRx88RQNDO2MLv
	qPw44znQz/TzxHoJgHFlsrGh/lAiZuh0VfW3F6TvcUTf1LckzmQMUj1r0g5ceVwoE1EY
	zVIeE7hcWKdrQjcGSDz8dXFPQ0go9R0oqR4j+a/gVO68QgVoYZiH7ic9nO2fwBAsSG3A
	1KpaCvBmziTyQF8NzQRJy/vIDF4aqOI4xnNaf9ns58Lxsn8nJFvdxXUhG/AcTyG1OF8G
	IP7A==
X-Gm-Message-State: AHQUAuZi3zYPQgGIx6yWBUT430nxhe/+4Fl17bD+T6kX8xBeHOGW0U+I
	DLJiI3Av4zzzz0kv0ExFpYAyHu5/Zv8=
X-Google-Smtp-Source: AHgI3IZHDlBdj8Q5yxDqkTJDbBgb3gU9i4938wK3q3P7l2LK6t2XtxjHTmg7s16eJ7TVtN/a7k4tMg==
X-Received: by 2002:adf:ee8e:: with SMTP id b14mr2973179wro.71.1549980763286; 
	Tue, 12 Feb 2019 06:12:43 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10]) by smtp.gmail.com with ESMTPSA id
	t14sm6802878wrr.49.2019.02.12.06.12.42
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Feb 2019 06:12:42 -0800 (PST)
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, pbonzini@redhat.com, kraxel@redhat.com,
	mst@redhat.com
Cc: qemu-trivial@nongnu.org
References: <20190212134758.10514-1-dgilbert@redhat.com>
	<20190212134758.10514-4-dgilbert@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <727257ce-45fb-82f9-8e0b-d11e6d48b179@redhat.com>
Date: Tue, 12 Feb 2019 15:12:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190212134758.10514-4-dgilbert@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/4] kvm: Add
 kvm_set_ioeventfd* traces
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
X-List-Received-Date: Tue, 12 Feb 2019 14:13:12 -0000

On 2/12/19 2:47 PM, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Add a couple of traces around the kvm_set_ioeventfd* calls.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  accel/kvm/kvm-all.c    | 3 +++
>  accel/kvm/trace-events | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 4e1de942ce..fd92b6f375 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -657,6 +657,8 @@ static int kvm_set_ioeventfd_mmio(int fd, hwaddr addr, uint32_t val,
>          .fd = fd,
>      };
>  
> +    trace_kvm_set_ioeventfd_mmio(fd, (uint64_t)addr, val, assign, size,
> +                                 datamatch);
>      if (!kvm_enabled()) {
>          return -ENOSYS;
>      }
> @@ -688,6 +690,7 @@ static int kvm_set_ioeventfd_pio(int fd, uint16_t addr, uint16_t val,
>          .fd = fd,
>      };
>      int r;
> +    trace_kvm_set_ioeventfd_pio(fd, addr, val, assign, size, datamatch);
>      if (!kvm_enabled()) {
>          return -ENOSYS;
>      }
> diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
> index 58e98efe5d..8841025d68 100644
> --- a/accel/kvm/trace-events
> +++ b/accel/kvm/trace-events
> @@ -12,5 +12,7 @@ kvm_irqchip_commit_routes(void) ""
>  kvm_irqchip_add_msi_route(char *name, int vector, int virq) "dev %s vector %d virq %d"
>  kvm_irqchip_update_msi_route(int virq) "Updating MSI route virq=%d"
>  kvm_irqchip_release_virq(int virq) "virq %d"
> +kvm_set_ioeventfd_mmio(int fd, uint64_t addr, uint32_t val, bool assign, uint32_t size, bool datamatch) "fd: %d @0x%" PRIx64 " val=0x%x assign: %d size: %d match: %d"
> +kvm_set_ioeventfd_pio(int fd, uint16_t addr, uint32_t val, bool assign, uint32_t size, bool datamatch) "fd: %d @0x%x val=0x%x assign: %d size: %d match: %d"
>  kvm_set_user_memory(uint32_t slot, uint32_t flags, uint64_t guest_phys_addr, uint64_t memory_size, uint64_t userspace_addr, int ret) "Slot#%d flags=0x%x gpa=0x%"PRIx64 " size=0x%"PRIx64 " ua=0x%"PRIx64 " ret=%d"
>  
> 

