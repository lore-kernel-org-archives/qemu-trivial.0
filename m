Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJkWk-0006TR-N5
	for mharc-qemu-trivial@gnu.org; Tue, 09 Mar 2021 17:08:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJkWj-0006RZ-5t
 for qemu-trivial@nongnu.org; Tue, 09 Mar 2021 17:08:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJkWf-0004Io-Kc
 for qemu-trivial@nongnu.org; Tue, 09 Mar 2021 17:08:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615327703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TrRfkpaCyAif10vY2NLzElT8H9hcz96S44UT+WnEyM0=;
 b=FgUnxXZsgjBvrb3220+nGB0Q8THgSq7pMRjoJj9bSnNJqs/394SltmWFUD0Bcs4VUQ2gLl
 HMRt+fKVq1RKElSa4cpJ4VcSvlWtCTvsL+GkHqs8OJMh4v9W+xHztl/YBhC4SjKjRnu5SB
 BnvkgZ45FIzSZx3/cSCaaxFI6s28Ug4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-rTKqhnZsPYCc8SJPI8SnXQ-1; Tue, 09 Mar 2021 17:08:22 -0500
X-MC-Unique: rTKqhnZsPYCc8SJPI8SnXQ-1
Received: by mail-ej1-f69.google.com with SMTP id k16so6297620ejg.9
 for <qemu-trivial@nongnu.org>; Tue, 09 Mar 2021 14:08:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TrRfkpaCyAif10vY2NLzElT8H9hcz96S44UT+WnEyM0=;
 b=Ia/6H/QCTIs54HhXQHkNFhqu2DWF0BJ64MO24d92l2e9y8cY117xtH7c3Q1z6nD4Mm
 DdkRduov1r1BttSgbzDy3FTtuUyEOgwOSV8/191fhD207LeYHvTl2EkeSIxG2rrs6KA9
 s1NbYiwkHU9Cv1cRUwdv2Gh942gGotH8NjcHLgBtNyXQrHH6WiHhcPFT4smtjB1gtHSW
 9e5lePHJUK1rfAKScaR0uC4oAqodq0BiSB8HU8Zt41QHzp4M2NjUzDNZHMj7F57csNZq
 BQ0mpwohCgx5jnmG7U0MEamb+UStKiYaTffUV/tkKZAt4FLPu1slNOPTqJkfZRnEhS/e
 mCuQ==
X-Gm-Message-State: AOAM5327IQUpOOvfghGrJ6gw+NZA5DuUVhrwiJqxAx7/LLhJlKVM3bKG
 lU2gm2thR1Y+FkJH5MZQAlIM/d3WmrOxx7lACyTSpXviQ46Tfyg9jFuSHZF2izW3LSrV5fekrRY
 erU45pYTvpqIx4AuzJA==
X-Received: by 2002:a17:907:d15:: with SMTP id
 gn21mr181011ejc.337.1615327701114; 
 Tue, 09 Mar 2021 14:08:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoPZbz8BsbfZxNq4crDSMnBl/+S3hyEa4IsAMqqCextuO59Wc8A5fWQ9LtkxA8SuHE3e3dRQ==
X-Received: by 2002:a17:907:d15:: with SMTP id
 gn21mr180947ejc.337.1615327700754; 
 Tue, 09 Mar 2021 14:08:20 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u15sm10107092eds.6.2021.03.09.14.08.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 14:08:20 -0800 (PST)
Subject: Re: [PATCH 0/2] sysemu: Let VMChangeStateHandler take boolean
 'running' argument
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, Greg Kurz <groug@kaod.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Amit Shah <amit@kernel.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Fam Zheng <fam@euphon.net>,
 qemu-ppc@nongnu.org, kvm@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-block@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210111152020.1422021-1-philmd@redhat.com>
 <84048681-32d3-7217-e94c-461501cf550b@redhat.com>
Message-ID: <3112233d-e227-b0c5-4a97-3ad0127a4d12@redhat.com>
Date: Tue, 9 Mar 2021 23:08:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <84048681-32d3-7217-e94c-461501cf550b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 09 Mar 2021 22:08:29 -0000

ping, qemu-trivial maybe?

On 2/22/21 3:34 PM, Philippe Mathieu-Daudé wrote:
> Paolo, this series is fully reviewed, can it go via your
> misc tree?
> 
> On 1/11/21 4:20 PM, Philippe Mathieu-Daudé wrote:
>> Trivial prototype change to clarify the use of the 'running'
>> argument of VMChangeStateHandler.
>>
>> Green CI:
>> https://gitlab.com/philmd/qemu/-/pipelines/239497352
>>
>> Philippe Mathieu-Daudé (2):
>>   sysemu/runstate: Let runstate_is_running() return bool
>>   sysemu: Let VMChangeStateHandler take boolean 'running' argument
>>
>>  include/sysemu/runstate.h   | 12 +++++++++---
>>  target/arm/kvm_arm.h        |  2 +-
>>  target/ppc/cpu-qom.h        |  2 +-
>>  accel/xen/xen-all.c         |  2 +-
>>  audio/audio.c               |  2 +-
>>  block/block-backend.c       |  2 +-
>>  gdbstub.c                   |  2 +-
>>  hw/block/pflash_cfi01.c     |  2 +-
>>  hw/block/virtio-blk.c       |  2 +-
>>  hw/display/qxl.c            |  2 +-
>>  hw/i386/kvm/clock.c         |  2 +-
>>  hw/i386/kvm/i8254.c         |  2 +-
>>  hw/i386/kvmvapic.c          |  2 +-
>>  hw/i386/xen/xen-hvm.c       |  2 +-
>>  hw/ide/core.c               |  2 +-
>>  hw/intc/arm_gicv3_its_kvm.c |  2 +-
>>  hw/intc/arm_gicv3_kvm.c     |  2 +-
>>  hw/intc/spapr_xive_kvm.c    |  2 +-
>>  hw/misc/mac_via.c           |  2 +-
>>  hw/net/e1000e_core.c        |  2 +-
>>  hw/nvram/spapr_nvram.c      |  2 +-
>>  hw/ppc/ppc.c                |  2 +-
>>  hw/ppc/ppc_booke.c          |  2 +-
>>  hw/s390x/tod-kvm.c          |  2 +-
>>  hw/scsi/scsi-bus.c          |  2 +-
>>  hw/usb/hcd-ehci.c           |  2 +-
>>  hw/usb/host-libusb.c        |  2 +-
>>  hw/usb/redirect.c           |  2 +-
>>  hw/vfio/migration.c         |  2 +-
>>  hw/virtio/virtio-rng.c      |  2 +-
>>  hw/virtio/virtio.c          |  2 +-
>>  net/net.c                   |  2 +-
>>  softmmu/memory.c            |  2 +-
>>  softmmu/runstate.c          |  4 ++--
>>  target/arm/kvm.c            |  2 +-
>>  target/i386/kvm/kvm.c       |  2 +-
>>  target/i386/sev.c           |  2 +-
>>  target/i386/whpx/whpx-all.c |  2 +-
>>  target/mips/kvm.c           |  4 ++--
>>  ui/gtk.c                    |  2 +-
>>  ui/spice-core.c             |  2 +-
>>  41 files changed, 51 insertions(+), 45 deletions(-)
>>
> 


