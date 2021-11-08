Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mk8CD-0007Go-KE
	for mharc-qemu-trivial@gnu.org; Mon, 08 Nov 2021 12:12:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mk8CB-0007GI-7F
 for qemu-trivial@nongnu.org; Mon, 08 Nov 2021 12:12:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mk8C6-0006QA-GE
 for qemu-trivial@nongnu.org; Mon, 08 Nov 2021 12:12:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636391549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L15VG5kqxr9Wg3mtcd1ApDONiExBO+852pj1Et2sji8=;
 b=N7DzetdLgCZpWlbh5YAfAnWeqQaSmUA21LKuL2LjV0L+FzCa6IXqVuWu8yQohOe5IHaf84
 RsSnnCfo1XwZJfqnSNv7eyp8e4d/1FdqHCDymsXym3zgblu8rXTZzfxmSgq/D3V7Zk6CXJ
 lZ38+4OmnAKK22ti6sBc1Ypa8IuHKP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-UGGC4mMFM2ygqDQ5kJ_DgQ-1; Mon, 08 Nov 2021 12:12:26 -0500
X-MC-Unique: UGGC4mMFM2ygqDQ5kJ_DgQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BC2181C85D;
 Mon,  8 Nov 2021 17:12:25 +0000 (UTC)
Received: from [10.39.192.185] (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5630160D30;
 Mon,  8 Nov 2021 17:12:24 +0000 (UTC)
Message-ID: <7380e0bd-f144-c6eb-b370-7b711c09b0e2@redhat.com>
Date: Mon, 8 Nov 2021 18:12:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] tests/qtest/virtio-net: fix hotplug test case
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20211028173014.139692-1-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211028173014.139692-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Nov 2021 17:12:35 -0000

On 28/10/2021 19.30, Laurent Vivier wrote:
> virtio-net-test has an hotplug testcase that is never executed.
> 
> This is because the testcase is attached to virtio-pci interface
> rather than to virtio-net-pci.
> 
>    $ QTEST_QEMU_BINARY=./qemu-system-x86_64 tests/qtest/qos-test -l | grep hotplug
>    /x86_64/.../pci-ohci-tests/ohci_pci-test-hotplug
>    /x86_64/.../e1000e/e1000e-tests/hotplug
>    /x86_64/.../virtio-blk-pci/virtio-blk-pci-tests/hotplug
>    /x86_64/.../vhost-user-blk-pci/vhost-user-blk-pci-tests/hotplug
>    /x86_64/.../virtio-rng-pci/virtio-rng-pci-tests/hotplug
>    /x86_64/.../virtio-scsi/virtio-scsi-tests/hotplug
>    /x86_64/.../virtio-serial/virtio-serial-tests/hotplug
> 
> With this fix:
> 
>    $ QTEST_QEMU_BINARY=./qemu-system-x86_64 tests/qtest/qos-test -l | grep hotplug
>    ...
>    /x86_64/.../vhost-user-blk-pci/vhost-user-blk-pci-tests/hotplug
>    /x86_64/.../virtio-net-pci/virtio-net-pci-tests/hotplug
>    /x86_64/.../virtio-rng-pci/virtio-rng-pci-tests/hotplug
>    ...
>    $ QTEST_QEMU_BINARY=./qemu-system-x86_64 tests/qtest/qos-test -p /x86_64/.../virtio-net-pci-tests/hotplug
>    /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net-pci-tests/hotplug: OK
> 
> Fixes: 6ae333f91b99 ("qos-test: virtio-net test node")
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   tests/qtest/virtio-net-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/virtio-net-test.c b/tests/qtest/virtio-net-test.c
> index a08e2ffe123f..8bf74e516cce 100644
> --- a/tests/qtest/virtio-net-test.c
> +++ b/tests/qtest/virtio-net-test.c
> @@ -319,7 +319,7 @@ static void register_virtio_net_test(void)
>           .before = virtio_net_test_setup,
>       };
>   
> -    qos_add_test("hotplug", "virtio-pci", hotplug, &opts);
> +    qos_add_test("hotplug", "virtio-net-pci", hotplug, &opts);
>   #ifndef _WIN32
>       qos_add_test("basic", "virtio-net", send_recv_test, &opts);
>       qos_add_test("rx_stop_cont", "virtio-net", stop_cont_test, &opts);
> 

Acked-by: Thomas Huth <thuth@redhat.com>


