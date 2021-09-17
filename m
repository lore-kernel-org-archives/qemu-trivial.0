Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mRJ7S-0007QO-M2
	for mharc-qemu-trivial@gnu.org; Fri, 17 Sep 2021 15:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mRJ7J-0007Ol-JT
 for qemu-trivial@nongnu.org; Fri, 17 Sep 2021 15:01:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mRJ7G-00079b-8I
 for qemu-trivial@nongnu.org; Fri, 17 Sep 2021 15:01:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631905301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hgoghYfZRIeDvRxj3ZfcbgvdiGQl14HjQky0pmmWBDQ=;
 b=OjrW3LsIRuGNhF4IbrmVeW+Ajx2v5xfmcWa40E7pZwy2hCOeLgxZzcHyu2xTn0gI3EM/B6
 QB0GdVi3/2VrmyScFqk9P6elleQw7QCJU+nVehp5mU3B3Ola71qHJzCRu99x/bYcvcFYaT
 zzvBwLWeJrk/Ih1gjFKWK1GLSMsJtbc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-MuYrFzTbPNKnjXfDHGUn7g-1; Fri, 17 Sep 2021 15:01:39 -0400
X-MC-Unique: MuYrFzTbPNKnjXfDHGUn7g-1
Received: by mail-wm1-f69.google.com with SMTP id
 y23-20020a05600c365700b003015b277f98so1977105wmq.2
 for <qemu-trivial@nongnu.org>; Fri, 17 Sep 2021 12:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hgoghYfZRIeDvRxj3ZfcbgvdiGQl14HjQky0pmmWBDQ=;
 b=XN0G0n1GHnHNDrDmvw8U7+6hVexLk+iQpDDFcWZ6aRv1XDJzSrPeeTKOSIKp1YuZCs
 mSfRPAj9zzijhZrGwrtW6NqMjn96UQwFmtu32McgRGsPwi7Ttzmn3nA+vtL4DWkDTh9O
 WXa3eQQIfFhEBjU5RgIblmGZzmyf8B7mDryEntpy1izVuai8KJClwQailiFN85BU5HPq
 9vbjI7iKymJXWVD+vKEFw0GZBt6+4M/scPD2o0DLP+qU5Iy4o3u3hU2w7VGP6ELtTufg
 bh9FnfcA5P2lZOpny87neoLdE0ZnFZX9UZ4mNPT93dxBGGplM1fQ9pAuwAKsL9M0N/mr
 nQOg==
X-Gm-Message-State: AOAM531dH4QtfOZaN7qF+FQjcoiuK656RjuPCqH2x74Adg0Rtcsfbsh3
 TpDBj+mqon3SX6HgmGO0TKG1pTGJR3eD/R5Las49wp6wGQcO48db7Vn8IU6aWdVSl71tYIs21P/
 rM0t/87p5OCbcA1sV9g==
X-Received: by 2002:adf:f1c4:: with SMTP id z4mr13907828wro.418.1631905298686; 
 Fri, 17 Sep 2021 12:01:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYVniF5UDzS5kXD1Oe0bnlBXHQCegOuasLEHxFwYZ0+nYtjS9Yyn/btUgk+Finuzk2ORs+4Q==
X-Received: by 2002:adf:f1c4:: with SMTP id z4mr13907796wro.418.1631905298414; 
 Fri, 17 Sep 2021 12:01:38 -0700 (PDT)
Received: from x1w.. (14.red-83-35-25.dynamicip.rima-tde.net. [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id z2sm6943353wma.45.2021.09.17.12.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 12:01:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] hw/loader: Remove unused rom_add_file_as() definition
Date: Fri, 17 Sep 2021 21:01:36 +0200
Message-Id: <20210917190136.2246440-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 17 Sep 2021 19:01:49 -0000

rom_add_file_as() is not used anywhere, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/loader.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index cbfc1848737..c52a1df8b68 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -329,8 +329,6 @@ void hmp_info_roms(Monitor *mon, const QDict *qdict);
     rom_add_blob(_f, _b, _l, _l, _a, NULL, NULL, NULL, NULL, true)
 #define rom_add_file_mr(_f, _mr, _i)            \
     rom_add_file(_f, NULL, 0, _i, false, _mr, NULL)
-#define rom_add_file_as(_f, _as, _i)            \
-    rom_add_file(_f, NULL, 0, _i, false, NULL, _as)
 #define rom_add_file_fixed_as(_f, _a, _i, _as)          \
     rom_add_file(_f, NULL, _a, _i, false, NULL, _as)
 #define rom_add_blob_fixed_as(_f, _b, _l, _a, _as)      \
-- 
2.31.1


