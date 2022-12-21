Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p7ynk-0006UQ-0V
	for mharc-qemu-trivial@gnu.org; Wed, 21 Dec 2022 08:06:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynX-00067i-8q
 for qemu-trivial@nongnu.org; Wed, 21 Dec 2022 08:06:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynV-0004So-QI
 for qemu-trivial@nongnu.org; Wed, 21 Dec 2022 08:06:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y2wt1xLPFdliQkR7s/8RJDYVOUgSrTEv1M6g0dTjSMQ=;
 b=XCgG3weqgfvcOPGTBZAvxfM3kVCWH8FLDg83o7jTlEGQixYajE1j+06avTD8tqKRVnlsUE
 KpIbNlVqvCVHKzX8Ii1ACamKbssmxEPi0HGqAMLR4kOjbR/Q2DCj82j4yocaVeeULK94qS
 jQpKeFtCbIK+f0Cu5QJ4yOXKtDZ+p+o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-304-hrxodfKNM1WWWmvz5w03Eg-1; Wed, 21 Dec 2022 08:06:12 -0500
X-MC-Unique: hrxodfKNM1WWWmvz5w03Eg-1
Received: by mail-wr1-f71.google.com with SMTP id
 h10-20020adfaa8a000000b0024208cf285eso2913868wrc.22
 for <qemu-trivial@nongnu.org>; Wed, 21 Dec 2022 05:06:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y2wt1xLPFdliQkR7s/8RJDYVOUgSrTEv1M6g0dTjSMQ=;
 b=eXdEJuclF/YHhoiEs70ifpdXwqSuQLKd9aZkHCSDKwdXQTKEp8l0pslOg+sbCo/cRh
 7YOIJ1CYHX5EQHtjHqV4ewmZqCqnaQdhkcoXmsFG8trLEQtzlZgPXf4Kf9ddpzsHC+Xr
 Tzq+bG9+NIC2AFfpBS+920Mru8WS6IKKsQu6uOiyPQ58p8p8BPnYv1LmotJ2ZfmYBiPg
 lq0bOijo/Ny5eLvYP19DiubLoPZfNgFS1VzlG6uIfUokYom+sjL0/+oSst7W9kObntKE
 wlJ9SIFpADU+gAbvcFYbWAIE5JUsWm54mcky8cZrrUYB1wqpLWUwblXqaZbVfSpUe6Le
 tU0Q==
X-Gm-Message-State: AFqh2kqJEwz9pjGhUNPAUW+j2mRtFWnw1xNVHMPP+IACp0A9uBufc4dL
 L6QWUbpuEOCgLed5RXEjgpCHaK+2fshknLh4PRpgs4BuSyQiCFaAiQCp8Vfihmi7m1xsfjBNg1S
 Wa0ANL3q1J1JrRiHTyQ==
X-Received: by 2002:a05:600c:1d20:b0:3d2:2aaf:316 with SMTP id
 l32-20020a05600c1d2000b003d22aaf0316mr1562158wms.36.1671627970722; 
 Wed, 21 Dec 2022 05:06:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsAx9XXA6PN28ZoGcBqWsXANcQJXMt24tdPb8O7yCvmkyQrCt+6Om5EWj2zlTAjih4B2ZQviA==
X-Received: by 2002:a05:600c:1d20:b0:3d2:2aaf:316 with SMTP id
 l32-20020a05600c1d2000b003d22aaf0316mr1562142wms.36.1671627970478; 
 Wed, 21 Dec 2022 05:06:10 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 v192-20020a1cacc9000000b003cfd4e6400csm2143247wme.19.2022.12.21.05.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:06:09 -0800 (PST)
Date: Wed, 21 Dec 2022 08:06:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 qemu-trivial@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PULL 30/41] docs/acpi/bits: document BITS_DEBUG environment variable
Message-ID: <20221221130339.1234592-31-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 21 Dec 2022 13:06:18 -0000

From: Ani Sinha <ani@anisinha.ca>

Debug specific actions can be enabled in bios bits acpi tests by passing
BITS_DEBUG in the environment variable while running the test. Document that.

CC: qemu-trivial@nongnu.org
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20221203132346.34479-1-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 docs/devel/acpi-bits.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
index 4a94c7d83d..9eb4b9e666 100644
--- a/docs/devel/acpi-bits.rst
+++ b/docs/devel/acpi-bits.rst
@@ -52,6 +52,9 @@ Under ``tests/avocado/`` as the root we have:
    for their tests. In order to enable debugging, you can set **V=1**
    environment variable. This enables verbose mode for the test and also dumps
    the entire log from bios bits and more information in case failure happens.
+   You can also set **BITS_DEBUG=1** to turn on debug mode. It will enable
+   verbose logs and also retain the temporary work directory the test used for
+   you to inspect and run the specific commands manually.
 
    In order to run this test, please perform the following steps from the QEMU
    build directory:
-- 
MST


