Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfIqo-0006xQ-LU
	for mharc-qemu-trivial@gnu.org; Wed, 18 Nov 2020 03:30:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfIqm-0006wD-Qh
 for qemu-trivial@nongnu.org; Wed, 18 Nov 2020 03:30:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfIqj-0004K4-VD
 for qemu-trivial@nongnu.org; Wed, 18 Nov 2020 03:30:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OQq8/T1QKKFNCeeUc3x1nyvA8RpFvpYBPnIymMsh4oU=;
 b=A+hC4yhLQV+AvqOC/tmyd/SZq4Fr22/WiCLLMDEzG3UGVpat7bBQdsKohn1QUt9gqr1npe
 X2HX1CrmFCGiT6KC5L6aPegkRVHJFU7kk/Vqm1XNpGIqy+n6JWFVTwocBANfSB9ZR2o8/E
 MmYwP43yrbtZ12aB9xRVlGe2LybKeZo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-mcSEwZ8cPdmbokrmQ6e3Kw-1; Wed, 18 Nov 2020 03:29:53 -0500
X-MC-Unique: mcSEwZ8cPdmbokrmQ6e3Kw-1
Received: by mail-ej1-f69.google.com with SMTP id 2so566359ejv.4
 for <qemu-trivial@nongnu.org>; Wed, 18 Nov 2020 00:29:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OQq8/T1QKKFNCeeUc3x1nyvA8RpFvpYBPnIymMsh4oU=;
 b=rUez5Xuvg20iaH0/Y2PpBIUKPSInDbXo59pELFkm4e+MEUHfMyPwx9bf7p4B4O8aOv
 PpDArM5dcRwXnTsnywVvkq0I8v42MtUnX+HAP7zLrYIMAUzkYrgFIyvOnR04Kb1WE9Rq
 cJnvTRt/MOQKdgtCXS/nUU4He/4XypWkOZAZuUh+QJ9AziuLiLZGvOwcJ9nnMLQ2roOh
 PFKOFU5dtBD07ZXhRaM2ZNDolU+71X3k4ETJrjWZFKCiFJmC8qFrLLlZqbqF9PsIjCgs
 iBAEtf7/CUyw2RiQr9K6a76LvNOq4YjU+BXxZDKYkePrS7bs0BneKGHXuGBBc5NY64jF
 1wGA==
X-Gm-Message-State: AOAM531EJn6wDFIaqzkJZtFeJYy7Ol8JhhSTMlOtCY3qJuVYOb61Ap7u
 P5FUEz0KbeH7r63sXetywMma/HN5HPYAh4KuqgyorLcf3glbjjE32uWVwMQ7kAU4tiKYt6JsodT
 6nWjPHo9g6ikJFtEnng==
X-Received: by 2002:a17:906:757:: with SMTP id
 z23mr168832ejb.259.1605688192520; 
 Wed, 18 Nov 2020 00:29:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmPhRq7faflB/jIeu1F2Zl61oAhvXNc/DOQmoBgtQkgIT/V0qfkYKteeGOqxEQzUXpNFWP/g==
X-Received: by 2002:a17:906:757:: with SMTP id
 z23mr168807ejb.259.1605688192044; 
 Wed, 18 Nov 2020 00:29:52 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p1sm12915784edx.4.2020.11.18.00.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 00:29:51 -0800 (PST)
Subject: Re: [PATCH for-5.2] docs: Fix some typos (found by codespell)
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alex Williamson <alex.williamson@redhat.com>, libvir-list@redhat.com
References: <20201117193448.393472-1-sw@weilnetz.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <78cbcb2d-9ae4-a11f-7b45-9756595fdde4@redhat.com>
Date: Wed, 18 Nov 2020 09:29:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117193448.393472-1-sw@weilnetz.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Nov 2020 08:30:01 -0000

On 17/11/20 20:34, Stefan Weil wrote:
> Fix also a similar typo in a code comment.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   docs/can.txt                  | 8 ++++----
>   docs/interop/vhost-user.rst   | 2 +-
>   docs/replay.txt               | 2 +-
>   docs/specs/ppc-spapr-numa.rst | 2 +-
>   docs/system/deprecated.rst    | 4 ++--
>   docs/tools/virtiofsd.rst      | 2 +-
>   hw/vfio/igd.c                 | 2 +-
>   7 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/docs/can.txt b/docs/can.txt
> index 5838f6620c..0d310237df 100644
> --- a/docs/can.txt
> +++ b/docs/can.txt
> @@ -19,7 +19,7 @@ interface to implement because such device can be easily connected
>   to systems with different CPU architectures (x86, PowerPC, Arm, etc.).
>   
>   In 2020, CTU CAN FD controller model has been added as part
> -of the bachelor theses of Jan Charvat. This controller is complete
> +of the bachelor thesis of Jan Charvat. This controller is complete
>   open-source/design/hardware solution. The core designer
>   of the project is Ondrej Ille, the financial support has been
>   provided by CTU, and more companies including Volkswagen subsidiaries.
> @@ -31,7 +31,7 @@ testing lead to goal change to provide environment which provides complete
>   emulated environment for testing and RTEMS GSoC slot has been donated
>   to work on CAN hardware emulation on QEMU.
>   
> -Examples how to use CAN emulation for SJA1000 based borads
> +Examples how to use CAN emulation for SJA1000 based boards
>   ==========================================================
>   
>   When QEMU with CAN PCI support is compiled then one of the next
> @@ -106,8 +106,8 @@ This open-source core provides CAN FD support. CAN FD drames are
>   delivered even to the host systems when SocketCAN interface is found
>   CAN FD capable.
>   
> -The PCIe borad emulation is provided for now (the device identifier is
> -ctucan_pci). The defauld build defines two CTU CAN FD cores
> +The PCIe board emulation is provided for now (the device identifier is
> +ctucan_pci). The default build defines two CTU CAN FD cores
>   on the board.
>   
>   Example how to connect the canbus0-bus (virtual wire) to the host
> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index 988f154144..72b2e8c7ba 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -513,7 +513,7 @@ descriptor table (split virtqueue) or descriptor ring (packed
>   virtqueue). However, it can't work when we process descriptors
>   out-of-order because some entries which store the information of
>   inflight descriptors in available ring (split virtqueue) or descriptor
> -ring (packed virtqueue) might be overrided by new entries. To solve
> +ring (packed virtqueue) might be overridden by new entries. To solve
>   this problem, slave need to allocate an extra buffer to store this
>   information of inflight descriptors and share it with master for
>   persistent. ``VHOST_USER_GET_INFLIGHT_FD`` and
> diff --git a/docs/replay.txt b/docs/replay.txt
> index 87a64ae068..5b008ca491 100644
> --- a/docs/replay.txt
> +++ b/docs/replay.txt
> @@ -328,7 +328,7 @@ between the snapshots. Each of the passes include the following steps:
>    1. loading the snapshot
>    2. replaying to examine the breakpoints
>    3. if breakpoint or watchpoint was met
> -    - loading the snaphot again
> +    - loading the snapshot again
>       - replaying to the required breakpoint
>    4. else
>       - proceeding to the p.1 with the earlier snapshot
> diff --git a/docs/specs/ppc-spapr-numa.rst b/docs/specs/ppc-spapr-numa.rst
> index 5fca2bdd8e..ffa687dc89 100644
> --- a/docs/specs/ppc-spapr-numa.rst
> +++ b/docs/specs/ppc-spapr-numa.rst
> @@ -198,7 +198,7 @@ This is how it is being done:
>   * user distance 121 and beyond will be interpreted as 160
>   * user distance 10 stays 10
>   
> -The reasoning behind this aproximation is to avoid any round up to the local
> +The reasoning behind this approximation is to avoid any round up to the local
>   distance (10), keeping it exclusive to the 4th NUMA level (which is still
>   exclusive to the node_id). All other ranges were chosen under the developer
>   discretion of what would be (somewhat) sensible considering the user input.
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 32a0e620db..63e9db1463 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -465,7 +465,7 @@ default configuration.
>   
>   The CPU model runnability guarantee won't apply anymore to
>   existing CPU models.  Management software that needs runnability
> -guarantees must resolve the CPU model aliases using te
> +guarantees must resolve the CPU model aliases using the
>   ``alias-of`` field returned by the ``query-cpu-definitions`` QMP
>   command.
>   
> @@ -637,7 +637,7 @@ Splitting RAM by default between NUMA nodes had the same issues as ``mem``
>   parameter with the difference that the role of the user plays QEMU using
>   implicit generic or board specific splitting rule.
>   Use ``memdev`` with *memory-backend-ram* backend or ``mem`` (if
> -it's supported by used machine type) to define mapping explictly instead.
> +it's supported by used machine type) to define mapping explicitly instead.
>   Users of existing VMs, wishing to preserve the same RAM distribution, should
>   configure it explicitly using ``-numa node,memdev`` options. Current RAM
>   distribution can be retrieved using HMP command ``info numa`` and if separate
> diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
> index 34a9e40146..866b7db3ee 100644
> --- a/docs/tools/virtiofsd.rst
> +++ b/docs/tools/virtiofsd.rst
> @@ -174,7 +174,7 @@ Using ':' as the separator a rule is of the form:
>   - 'bad' - If a client tries to use a name matching 'key' it's
>     denied using EPERM; when the server passes an attribute
>     name matching 'prepend' it's hidden.  In many ways it's use is very like
> -  'ok' as either an explict terminator or for special handling of certain
> +  'ok' as either an explicit terminator or for special handling of certain
>     patterns.
>   
>   **key** is a string tested as a prefix on an attribute name originating
> diff --git a/hw/vfio/igd.c b/hw/vfio/igd.c
> index 64e332746b..470205f487 100644
> --- a/hw/vfio/igd.c
> +++ b/hw/vfio/igd.c
> @@ -535,7 +535,7 @@ void vfio_probe_igd_bar4_quirk(VFIOPCIDevice *vdev, int nr)
>       }
>   
>       /*
> -     * Assume we have no GMS memory, but allow it to be overrided by device
> +     * Assume we have no GMS memory, but allow it to be overridden by device
>        * option (experimental).  The spec doesn't actually allow zero GMS when
>        * when IVD (IGD VGA Disable) is clear, but the claim is that it's unused,
>        * so let's not waste VM memory for it.
> 

Queued, thanks.

Paolo


