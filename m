Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgPq4-0005p3-Gj
	for mharc-qemu-trivial@gnu.org; Tue, 11 May 2021 06:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgPq2-0005kI-Vf
 for qemu-trivial@nongnu.org; Tue, 11 May 2021 06:42:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgPq1-0002An-0H
 for qemu-trivial@nongnu.org; Tue, 11 May 2021 06:42:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620729724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j7d1rDqCAA8qsauHkv0gSWnRoeiYJXBL904ZNG6nFw4=;
 b=G9v4Q2NXC4JKT2tUIUEzxT/PBZoK4Xz+/W/5wstsfvPNIYG0yXI4QIAmDjNHp01JEJqYJR
 oYdYjDyArYGTY24iRgBggzv11h0meEbMpTpBWDOy0p6mV5+bh31QpmonW7TMK4R9ucChV/
 0sWI7xM7hXRNOVmd4livgvbaUAiWHP4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-NCjdZzCZPCm82k48HIkciw-1; Tue, 11 May 2021 06:42:00 -0400
X-MC-Unique: NCjdZzCZPCm82k48HIkciw-1
Received: by mail-wr1-f71.google.com with SMTP id
 n2-20020adfb7420000b029010e47b59f31so5879393wre.9
 for <qemu-trivial@nongnu.org>; Tue, 11 May 2021 03:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xlbWfCBF6vgyaOmQZsaQ9/Pu05E9+2cb/6mazZenWLw=;
 b=K6jIyRh5aF58kxpD7fX74NdtHJ9vGt8opL4lEcug53u7l2DrcPukTvUOd+GIzV+YcD
 IBsAFVquUe5SNtdnqQOfbl3uyRPkbuXyND7q65VQfwjSdrt0V+v7g26RDkgEXlvLURpX
 ej+9TPjq4/iXFHfhG2z1/bA8geptWmQlU6jE2WPYTVDdchZhpUx128ZwKnQrV7SDEKRR
 CFgjhl2BJ1BwxbPaklGdrg5G0vkaxTYCQVTljv55i0gyTtlZTkhIzeLVl6EPP3sCHsbc
 Fw9a8To5Nso/0LvXLabHt4H8ThlOOOU3bL7cYSTyacls0tzG4mpiSdpCpq0XE8pDymAj
 +OcA==
X-Gm-Message-State: AOAM531YFgUbDSnUFStMRtEAKbSAKwuQJ7QsD1Q+vua/bzyqwSIMR38e
 wUXAqrxxbSmlYCu0BeKSmTpTDLvv7UA80b8AIG+HCch95G6ZgQgoTE9nRAUcU3XjgX4JgVdcm6+
 E290obdG/BAIPvLX/RQ==
X-Received: by 2002:a7b:cc83:: with SMTP id p3mr4775940wma.24.1620729719494;
 Tue, 11 May 2021 03:41:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCyErJiTg41DmdKwoAWDvCZL8zC81AHLAksjWGgU15W7MXq0ie5JAVqWzuF+KCA/O2XzOrdw==
X-Received: by 2002:a7b:cc83:: with SMTP id p3mr4775913wma.24.1620729719288;
 Tue, 11 May 2021 03:41:59 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f18sm2954194wmg.26.2021.05.11.03.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 03:41:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 0/3] hw/virtio: Constify VirtIOFeature
Date: Tue, 11 May 2021 12:41:54 +0200
Message-Id: <20210511104157.2880306-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 11 May 2021 10:42:07 -0000

Trivial patches to keep VirtIOFeature arrays read-only=0D
(better safe than sorry).=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/virtio: Pass virtio_feature_get_config_size() a const argument=0D
  virtio-blk: Constify VirtIOFeature feature_sizes[]=0D
  virtio-net: Constify VirtIOFeature feature_sizes[]=0D
=0D
 include/hw/virtio/virtio.h | 2 +-=0D
 hw/block/virtio-blk.c      | 2 +-=0D
 hw/net/virtio-net.c        | 2 +-=0D
 hw/virtio/virtio.c         | 2 +-=0D
 4 files changed, 4 insertions(+), 4 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


