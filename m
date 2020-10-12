Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kRxCY-0004py-RU
	for mharc-qemu-trivial@gnu.org; Mon, 12 Oct 2020 08:45:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRxCW-0004lk-SI
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2020 08:45:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRxCT-0008SL-6s
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2020 08:45:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602506712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0VfM6Y1Z4oOM9AviCLT3C6cOeCH1n4rJ8RPo235glro=;
 b=BqVfRC78Yay5r9pQAjHpfkB3ZhHu0D3ht7SN2G6igkXLk9HuQ31kutBfViW4f4sZmLeTJO
 ebUxKFphxUSWueLzcWiC9BMVzbtr6r1rRCbn5AW8pETanUfjIDvXC480JHIOeD/LFk4U2l
 IvWNSSJw9N6pJJgEVNrvwMdkg87ECMo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-rZzXIyPhP9eZvXcf5nlfBQ-1; Mon, 12 Oct 2020 08:45:10 -0400
X-MC-Unique: rZzXIyPhP9eZvXcf5nlfBQ-1
Received: by mail-wm1-f69.google.com with SMTP id d197so5195809wmd.4
 for <qemu-trivial@nongnu.org>; Mon, 12 Oct 2020 05:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UtSObLJfNIzbJcrgKRU5Cu+zNLd9lEQsFGBvfOC7Lok=;
 b=L7YDhkUZfX7XFsrzWrpiIdFO+Y5jNM0yv7ZUVxlnGw9sx9WaDJRnByCj2AdZ0zt8hM
 0mwkLf4TrKfxQPbL9PYJ5DmxjFQH4ztEqYqtUezp2hLWsQ0IbZj16GYXJjdpm4ecY71p
 RnoTXHgmDRmiB3aI7Py7VL0FzpPqhIxkiEpXUEYhlSyN62j96+0Vcb+Mc/Q1aPqt9Alz
 oZear36vxp+YSVYYBzV7R/1+D07G2NM4q4N7QdQoZfAQet6QQKPg8yu1l4sn+pj3OwwT
 Zjb2EX0sXIld38IoegLjnsMoFnNFjDOjLahD6cyeHq2wsZjL0W0Fz7iee6sYrulZ/Gae
 1SiQ==
X-Gm-Message-State: AOAM532RFID2jO94SArKJmwo54733xVXKKOIdWNBKWLtDSnzvGpQ8uIX
 mAgqe+kimZWtH9Gjar3FOJjXdMmgclsOMcQeLT3LjBBR1uk7Fia3l0ndkFYWwpaKZDbboBjeoAc
 O++dh9IWF3WtQ3OEQ4w==
X-Received: by 2002:a5d:46c1:: with SMTP id g1mr9137859wrs.101.1602506709365; 
 Mon, 12 Oct 2020 05:45:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz6hFiVJHdaU7cfa/kbxEMNRyQTLhhCcs5f5STC6wr7DnE8rXhJdscPh109XPd+XACdRYSYQ==
X-Received: by 2002:a5d:46c1:: with SMTP id g1mr9137815wrs.101.1602506709130; 
 Mon, 12 Oct 2020 05:45:09 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id d2sm14916054wrq.34.2020.10.12.05.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 05:45:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-trivial@nongnu.org, Paul Durrant <paul@xen.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Helge Deller <deller@gmx.de>,
 Anthony Perard <anthony.perard@citrix.com>,
 Richard Henderson <rth@twiddle.net>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 0/5] hw: Use PCI macros from 'hw/pci/pci.h'
Date: Mon, 12 Oct 2020 14:45:01 +0200
Message-Id: <20201012124506.3406909-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 02:58:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 12 Oct 2020 12:45:17 -0000

Trivial patches using the generic PCI macros from "hw/pci/pci.h".=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  hw/pci-host/bonito: Make PCI_ADDR() macro more readable=0D
  hw/pci-host: Use the PCI_BUILD_BDF() macro from 'hw/pci/pci.h'=0D
  hw/pci-host/uninorth: Use the PCI_FUNC() macro from 'hw/pci/pci.h'=0D
  hw: Use the PCI_SLOT() macro from 'hw/pci/pci.h'=0D
  hw: Use the PCI_DEVFN() macro from 'hw/pci/pci.h'=0D
=0D
 hw/arm/virt.c          | 3 ++-=0D
 hw/hppa/dino.c         | 2 +-=0D
 hw/i386/xen/xen-hvm.c  | 2 +-=0D
 hw/isa/piix3.c         | 2 +-=0D
 hw/mips/gt64xxx_pci.c  | 2 +-=0D
 hw/pci-host/bonito.c   | 5 ++---=0D
 hw/pci-host/pnv_phb4.c | 2 +-=0D
 hw/pci-host/ppce500.c  | 2 +-=0D
 hw/pci-host/uninorth.c | 8 +++-----=0D
 hw/ppc/ppc4xx_pci.c    | 2 +-=0D
 hw/sh4/sh_pci.c        | 2 +-=0D
 11 files changed, 15 insertions(+), 17 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


