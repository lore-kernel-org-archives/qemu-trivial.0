Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kFJku-0000gs-CR
	for mharc-qemu-trivial@gnu.org; Mon, 07 Sep 2020 12:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFJks-0000c1-74
 for qemu-trivial@nongnu.org; Mon, 07 Sep 2020 12:12:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFJkq-0004oN-GN
 for qemu-trivial@nongnu.org; Mon, 07 Sep 2020 12:12:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599495147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GQ+cbz0CeEvC6Na5RtSDFgnFbW74Fu3NiI79vFOKvmY=;
 b=VT6wn6J7/zvfbIb1HH4Ws8OrnlPDOpN5SuBOQyAwzLC+mgvt4l63E077qZiBqzg30N9pa3
 WK2LbFhjONw5/FoVGJr71f19rNlGhpss9PXfnvUB+OHKbL5Cz/XeQDxSM0TVrwe8PNXRr1
 ixFPXv1CcHCwdXTP9PhBb0nVj71gREw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-W_YgFdN_N2KfikAAUgURjA-1; Mon, 07 Sep 2020 12:12:25 -0400
X-MC-Unique: W_YgFdN_N2KfikAAUgURjA-1
Received: by mail-ej1-f70.google.com with SMTP id m24so5748770ejr.9
 for <qemu-trivial@nongnu.org>; Mon, 07 Sep 2020 09:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GQ+cbz0CeEvC6Na5RtSDFgnFbW74Fu3NiI79vFOKvmY=;
 b=CnGMUy2s3x9IsTt3jJ4Pnk5Rn7dn9ct8UtL56XbdDDGQubmKUp7THHv3XrY4/43nPI
 FMkNxf3RXkOvw8f4JW5rfpoA8KZywAnq9Fo4ttnb5Bl6RV8LCanMLmtcS8hThRB+rmYh
 FMA/V3+C8pgTJacORmG1LLhbGmMZMRVdorvEk8Ll5pbN/bZ9+EdG1hp+ciEFu33na0FA
 2GWb4BrSExu8jUpsp4VgdkSgi1R4fvGxVUpTb8U14cUDaETDqXOEpb8G3U53umkcdthd
 YKNFmkmGeUGKUto7grm7CBErPlRs3W5w7ynVoWsFxIAgxedHOX/wtPC9KlxYV4ZZsiwT
 ZoBw==
X-Gm-Message-State: AOAM532QlFjUHsU6l2lfmDnZ3xBIE5tXWVXzMl//ZD/cPS39Y7G+ztoD
 rsXw21ZBx7vuNClQgjjPiXk7WKdmMNkk/3m134EVDVUbCGCOb1nZOjGv/nQcyUfY+xbFy1da7WU
 vXQM/r6lvW0+RzXO9Cg==
X-Received: by 2002:a05:6402:503:: with SMTP id
 m3mr22934252edv.45.1599495144699; 
 Mon, 07 Sep 2020 09:12:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzm30FMGWjXv65OteFjz3fJMtuByluwoPlo0w+rfw0pp83FfRh++C+/d5ohurw46re8/GS79w==
X-Received: by 2002:a05:6402:503:: with SMTP id
 m3mr22934231edv.45.1599495144562; 
 Mon, 07 Sep 2020 09:12:24 -0700 (PDT)
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id qu9sm15634445ejb.24.2020.09.07.09.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 09:12:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2] scripts/git.orderfile: Display meson files along with
 buildsys ones
Date: Mon,  7 Sep 2020 18:12:22 +0200
Message-Id: <20200907161222.41915-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 05:27:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 07 Sep 2020 16:12:30 -0000

Since commit a56650518f5 ("configure: integrate Meson in the build
system") we replaced many Makefile by Meson files. Adapt the
git.orderfile script to display the new file at the same position.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 scripts/git.orderfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/git.orderfile b/scripts/git.orderfile
index 73fd818d7f3..a021afc2d51 100644
--- a/scripts/git.orderfile
+++ b/scripts/git.orderfile
@@ -18,6 +18,7 @@ docs/*
 configure
 Makefile*
 *.mak
+meson.build
 
 # qapi schema
 qapi/*.json
-- 
2.26.2


