Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kyyzn-0001wT-7N
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2021 10:20:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyyzl-0001sF-Ak
 for qemu-trivial@nongnu.org; Mon, 11 Jan 2021 10:20:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyyzg-00044G-Tw
 for qemu-trivial@nongnu.org; Mon, 11 Jan 2021 10:20:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610378429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LM7AeLfQEqrU558zvQoXSQweJ4vkeUX1kaefzrhoJho=;
 b=YkxYGwGWOYWNGfrisMetuHVhx16PugXSCwnmAKLWECv7I5Db5amGX9G4uRIUxmWLNFob2O
 nlLcbkXXop51mSD7Euk/y56iL2CTxGAQkrWBi7I2/vIvpoy6qZJE+WXcEXb52O6No9vOIi
 3hV6dTsl8N81WeTn7wisiJ1oC854wvI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-lVHZWITLMterjwXU1YRJrA-1; Mon, 11 Jan 2021 10:20:25 -0500
X-MC-Unique: lVHZWITLMterjwXU1YRJrA-1
Received: by mail-ej1-f72.google.com with SMTP id n17so21334eja.23
 for <qemu-trivial@nongnu.org>; Mon, 11 Jan 2021 07:20:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ucd06r2eJPcCIqt9QCTk/uw4j4Vi5AVfWPojlXh2MWo=;
 b=WcHqIPUwmqIkQZm7N/ws38lpkSqKw2PAlRfV6MI/orXTz6WODk8sF9WLUo5/V1SHif
 NsOQAakPsb7zngxOylFYpqOV2MbasVpW8rQ42I2JDPqzCjOOMJDm44XZ9y5mPT7EOUdJ
 dASC6dbI86xXeNpW91VhZyLk9vmSjMkZWY2asGHCUiP/Ez4W0sdIooSs08xgz5QnIr4p
 TvY1XTjwlV0UEqW26z7+5awpZjOMUY6e+MNKeqd5kNM034fVX2W9AMEKM4baZdGJpZWG
 krPuNnAItHHjEgnpT73dIzspRWDArRZdbBArJ1K2N2dyEbX3gpLXTmKIlJFpEJmsp73M
 /oUg==
X-Gm-Message-State: AOAM531dJmyeVN5bbJjFuFuPgq8SLunXExvCPzVHqxyht6SWkaThk5iH
 0NnpcsbRkEsvMdFkT1Kn4qTvzOth4AzkPOe4YTqaSYmMWmJhrbeFC5DRTAN+Wh+g41R52qIjegu
 CfpcfPfrVTXtnW8pQYA==
X-Received: by 2002:a17:907:e9e:: with SMTP id
 ho30mr11282830ejc.529.1610378424338; 
 Mon, 11 Jan 2021 07:20:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywxJElqigN/5jUO+VSUtxZXH9MfGPzYtOFdIcNPFnX2mDokjoLqsfHorN2m3Haq800FJrUjA==
X-Received: by 2002:a17:907:e9e:: with SMTP id
 ho30mr11282789ejc.529.1610378424080; 
 Mon, 11 Jan 2021 07:20:24 -0800 (PST)
Received: from x1w.redhat.com (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id y17sm7157263ejj.84.2021.01.11.07.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 07:20:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>, Greg Kurz <groug@kaod.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Amit Shah <amit@kernel.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Fam Zheng <fam@euphon.net>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-block@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/2] sysemu: Let VMChangeStateHandler take boolean 'running'
 argument
Date: Mon, 11 Jan 2021 16:20:18 +0100
Message-Id: <20210111152020.1422021-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 11 Jan 2021 15:20:37 -0000

Trivial prototype change to clarify the use of the 'running'=0D
argument of VMChangeStateHandler.=0D
=0D
Green CI:=0D
https://gitlab.com/philmd/qemu/-/pipelines/239497352=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  sysemu/runstate: Let runstate_is_running() return bool=0D
  sysemu: Let VMChangeStateHandler take boolean 'running' argument=0D
=0D
 include/sysemu/runstate.h   | 12 +++++++++---=0D
 target/arm/kvm_arm.h        |  2 +-=0D
 target/ppc/cpu-qom.h        |  2 +-=0D
 accel/xen/xen-all.c         |  2 +-=0D
 audio/audio.c               |  2 +-=0D
 block/block-backend.c       |  2 +-=0D
 gdbstub.c                   |  2 +-=0D
 hw/block/pflash_cfi01.c     |  2 +-=0D
 hw/block/virtio-blk.c       |  2 +-=0D
 hw/display/qxl.c            |  2 +-=0D
 hw/i386/kvm/clock.c         |  2 +-=0D
 hw/i386/kvm/i8254.c         |  2 +-=0D
 hw/i386/kvmvapic.c          |  2 +-=0D
 hw/i386/xen/xen-hvm.c       |  2 +-=0D
 hw/ide/core.c               |  2 +-=0D
 hw/intc/arm_gicv3_its_kvm.c |  2 +-=0D
 hw/intc/arm_gicv3_kvm.c     |  2 +-=0D
 hw/intc/spapr_xive_kvm.c    |  2 +-=0D
 hw/misc/mac_via.c           |  2 +-=0D
 hw/net/e1000e_core.c        |  2 +-=0D
 hw/nvram/spapr_nvram.c      |  2 +-=0D
 hw/ppc/ppc.c                |  2 +-=0D
 hw/ppc/ppc_booke.c          |  2 +-=0D
 hw/s390x/tod-kvm.c          |  2 +-=0D
 hw/scsi/scsi-bus.c          |  2 +-=0D
 hw/usb/hcd-ehci.c           |  2 +-=0D
 hw/usb/host-libusb.c        |  2 +-=0D
 hw/usb/redirect.c           |  2 +-=0D
 hw/vfio/migration.c         |  2 +-=0D
 hw/virtio/virtio-rng.c      |  2 +-=0D
 hw/virtio/virtio.c          |  2 +-=0D
 net/net.c                   |  2 +-=0D
 softmmu/memory.c            |  2 +-=0D
 softmmu/runstate.c          |  4 ++--=0D
 target/arm/kvm.c            |  2 +-=0D
 target/i386/kvm/kvm.c       |  2 +-=0D
 target/i386/sev.c           |  2 +-=0D
 target/i386/whpx/whpx-all.c |  2 +-=0D
 target/mips/kvm.c           |  4 ++--=0D
 ui/gtk.c                    |  2 +-=0D
 ui/spice-core.c             |  2 +-=0D
 41 files changed, 51 insertions(+), 45 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


