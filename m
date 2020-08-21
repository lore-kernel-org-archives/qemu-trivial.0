Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k98kM-0006G4-0V
	for mharc-qemu-trivial@gnu.org; Fri, 21 Aug 2020 11:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k98kK-0006FR-Dy
 for qemu-trivial@nongnu.org; Fri, 21 Aug 2020 11:14:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49191
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k98kI-0004Nl-Qt
 for qemu-trivial@nongnu.org; Fri, 21 Aug 2020 11:14:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598022861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9wW2R1txbDruOQwk4ej7U8TTbA4SEYTfXBJdpBxm1P0=;
 b=Xhdm5qYNZBl6HMYW4xGlvceJOn0f/iwFxnng7nng6pg3cBOo2vNq+KWusshGstbH4VCuzP
 Rkrvsss9yUTxavl+WCdvmOSIaZ5yOwQII9TYNwMOzTNYBd4TaNxbNfb1cHpEjJ8mKl4N2A
 MsFfzFAan7ZXOvceBPBN0LfiXqH/uKk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-1WxLQmuRP7CDhmUR25r7kg-1; Fri, 21 Aug 2020 11:14:20 -0400
X-MC-Unique: 1WxLQmuRP7CDhmUR25r7kg-1
Received: by mail-wr1-f71.google.com with SMTP id r14so640003wrq.3
 for <qemu-trivial@nongnu.org>; Fri, 21 Aug 2020 08:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9wW2R1txbDruOQwk4ej7U8TTbA4SEYTfXBJdpBxm1P0=;
 b=IfHBEpnn94hfk4DhWg98KX2zAms+Klnj4XY5mYhp9QP6Nm9hEWwFS8hwExyLRRGIrY
 tOucofDI1NIz+ut9ostkNIC/jtfrGju+4C0kPAtYPxlhdbwpifoFIV2ddIyYSetalH3z
 sbkav2D17QwElSUMchoyzUULQzY1TXNn+1hkhsQV8rNs+fMqK3+bA09pfwbX7Ma3RXo8
 KIpa9QQ6gOyejNRD4TlKf+LEFjnqfJ3Qe/V1IXCg0CA6WcdxRGZ91FiDJ7hjj74RdLf6
 TCv/3xgajTCFesz4ru3DttUEkIpIV9Kqu/qRvAfmqXtORZwkQfLXu4QErwP461Ow7Bb7
 9XkQ==
X-Gm-Message-State: AOAM533SNlkOx4fV+7ogqxdTxI2tBJaga8fHMrrfjIBpkCSANkjxFDTd
 f7RuOh6y/YtmvCnSzApc8kvZKfHhbkuS4q/9vy0oxbS+rxiP0hNMPGoJEZMguYUkPxKuCFws2nb
 5eKvAwY9i5Z2U2bcD6Q==
X-Received: by 2002:adf:fbc6:: with SMTP id d6mr3235227wrs.189.1598022858954; 
 Fri, 21 Aug 2020 08:14:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8mCDgChHVeJcHIrS83PxYMRgIiV0Yp26sDWfi7Jf2P20ks01HMDhfnYLpp47IS8uplWojMw==
X-Received: by 2002:adf:fbc6:: with SMTP id d6mr3235197wrs.189.1598022858676; 
 Fri, 21 Aug 2020 08:14:18 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id l7sm5540760wmh.15.2020.08.21.08.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 08:14:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] configure: Silence shift warning in version_ge()
Date: Fri, 21 Aug 2020 17:14:16 +0200
Message-Id: <20200821151416.1240494-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 04:55:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 21 Aug 2020 15:14:24 -0000

As we might expect less than 2 argument, only shift again
if there is arguments to shift.

This fixes:

    ../configure: line 232: shift: shift count out of range

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 4e5fe332110..cf044ad2d25 100755
--- a/configure
+++ b/configure
@@ -229,7 +229,7 @@ version_ge () {
         set x $local_ver1
         local_first=${2-0}
         # shift 2 does nothing if there are less than 2 arguments
-        shift; shift
+        shift || shift
         local_ver1=$*
         set x $local_ver2
         # the second argument finished, the first must be greater or equal
-- 
2.26.2


