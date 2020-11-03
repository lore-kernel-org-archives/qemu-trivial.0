Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZuS4-0001y9-AD
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2020 06:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZuS1-0001tB-W3
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 06:26:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZuRz-0006RH-3R
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 06:26:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604402765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w6SR3qexhew8QZIGrvPyTkX19QMU0Fd0kp/bKXuvp+g=;
 b=YS3FaM+tbJ8EcnfZZW5+ZutuoTUStCrUoGLE0NScQ6w9KMJHjQFUiopMjCLTeKCf+2M04M
 fGI/3sXtL7AGXgLiL9zMprtHT437ag2taRiGFJlvyyuB1VXfYX0vZTQBje1khMkG1yxv8s
 /sOzIZIYsoCexMqv3TqqBa0Ipiu2qFE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-bofcWHcZNXCaqtKT6y80Qg-1; Tue, 03 Nov 2020 06:26:02 -0500
X-MC-Unique: bofcWHcZNXCaqtKT6y80Qg-1
Received: by mail-wr1-f69.google.com with SMTP id p12so200489wrx.3
 for <qemu-trivial@nongnu.org>; Tue, 03 Nov 2020 03:26:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cOwvaFDpzfqQSMkONe6gZYr5s6qKTKepFSfx14/aQnk=;
 b=nOIlE2v+ktA4vFo2kjpAti61yJUH18nChaPUtwzMJNYh4TcYs+BxFQr7Cu7uuN/1jx
 XSiP7jKTk4aIwu1K7zk9QLTCGrBrsT018vPPiVQBvBs5VPMnxZqy0CndI8VgBa6lA5er
 U608d2w3BylB159XGQWRlr1ayml3DgJmWruzeSbR/ibadAHiuXfTaq+XoMvBHOT5IzCb
 YOFeUnLIn8vtnt1bFvsCo8jygWMGukNVEdXSf3hpzzi35/joSIDOU41Xujx0+wJB64q1
 pO8lVenz+2EV4oMPxbPL0zRG4aPcXFhDrgPkbKcBgGITpzEuTheYgKIFRlv41FQRDIoj
 2WtA==
X-Gm-Message-State: AOAM530Nh4O0HAZ8s3um8bfl5qif+2pmf8FjBIhNuSGBXka1MQOPNM66
 boGLTAq5Zt/0agybK+W7nfwFdaot6PwcgZRjXGPaSv1Ae/jV4O9KZygjeYVeo0aQ8dtI+f3Krwc
 xi8Hhw6ykThko5vMNFA==
X-Received: by 2002:adf:e412:: with SMTP id g18mr25553139wrm.211.1604402761109; 
 Tue, 03 Nov 2020 03:26:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw17AtmRu+w0do51mB9pndzGMRGWZz15JWAOyp8bO7a5U9dwZzSMphQCKJO+S0BoWeykkaiWA==
X-Received: by 2002:adf:e412:: with SMTP id g18mr25553111wrm.211.1604402760885; 
 Tue, 03 Nov 2020 03:26:00 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id e2sm27096967wrr.85.2020.11.03.03.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 03:26:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Gerd Hoffmann <kraxel@redhat.com>, Dov Murik <dovmurik@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-5.2 0/4] misc: Trivial format string fixes
Date: Tue,  3 Nov 2020 12:25:54 +0100
Message-Id: <20201103112558.2554390-1-philmd@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 03 Nov 2020 11:26:10 -0000

IIUC qemu-trivial@ doesn't queue patches during freeze,=0D
so it might be easier if patches are queued by respective=0D
subsystem maintainers.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  hw/display/cirrus_vga: Remove debugging code commented out=0D
  hw/display/cirrus_vga: Fix hexadecimal format string specifier=0D
  hw/ppc/spapr_tpm_proxy: Fix hexadecimal format string specifier=0D
  migration/ram: Fix hexadecimal format string specifier=0D
=0D
 hw/display/cirrus_vga.c | 20 +-------------------=0D
 migration/ram.c         |  2 +-=0D
 hw/ppc/trace-events     |  2 +-=0D
 3 files changed, 3 insertions(+), 21 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


