Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sUnzj-00089E-3U
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jul 2024 09:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1sUnzh-00085x-2W
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2024 09:49:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1sUnzf-0003Ym-6F
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2024 09:49:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721396993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NzpP5zxi/dF3488FKEyR86bHqqfJr7CcoP3BrHPIZ5Y=;
 b=Tq6LhxMDd20roNAMcV/BAwEEkViF92eq5WHDxcvaZn5gsDq3VpZCqyyRjn5eDViZarRaZp
 3gQK7nZ3+HPx6R8P38rvDaOo639Gnjj9OxXwr3Wk5PVYSFK1ASqibEb7E3IC/1c1WiHwIU
 lg6XTzV+rc2wRpRNzPX+BygUs/2bMfU=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-WIksVdt2PvW_yMniXxP_qA-1; Fri, 19 Jul 2024 09:49:51 -0400
X-MC-Unique: WIksVdt2PvW_yMniXxP_qA-1
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-78e08ce33d0so1834923a12.0
 for <qemu-trivial@nongnu.org>; Fri, 19 Jul 2024 06:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721396990; x=1722001790;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NzpP5zxi/dF3488FKEyR86bHqqfJr7CcoP3BrHPIZ5Y=;
 b=r6oEcxQjxPzt/cK3rzBkqZR8XvAqb8dU6HcnbVSJljSEcr5El9W7IhW6jF65bDDz9E
 IQ3muT82qe78qU7PlYEHX6tncd3MzY6HpOaqqNKAf2mAbvBahbYxw6nBB7enmROQXkj+
 prbEoIJzYia3RJYBLdgqPyt0kAR/TtOQ+EYb/CYQCyobUcyfEiB1AytTDwvJtPbLwYNz
 ODtMingqZIR0TnupKMxn2/WTP1s9abE5KC1Ko2nmXUD2U3fVC6A9WZge6Myop0yWepS8
 q79sHVmH7Dl2u0rpDB3tr26NYbPAHwCKuK6BVDY/tIU+ut0c6Hw29JiaTozBTXSxNvy7
 DcbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViz3RAhQhtKNkOy6zJhmI40qDG6fOHuv06d9TQD5pxQnrmVC5kbid8spgg3jT5nHXxLWtagwF54ml81VvSTJVvGZCHIvyJ5w==
X-Gm-Message-State: AOJu0YxF9odQXxvhMqqcVyQpgf0SJxOEa2DSK7zjJ2CZhBthHpKe8WYG
 Wyd8AJjpTnilSoWKA0yuete+ztCyBSaMjvLW/E4IW2nQ/dVAgS9b1pJNvUHUU9GQeQd9luUnWJG
 zJuIp9foilk1PxE5ScAYH+GTIJ1zRMlNFf/uO4QaPeZvMbqnW3b7Bax8=
X-Received: by 2002:a05:6a21:9986:b0:1c3:b2b3:442d with SMTP id
 adf61e73a8af0-1c3fdd3082fmr9450893637.40.1721396990438; 
 Fri, 19 Jul 2024 06:49:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo7ESVjai3vPwUqiXQxgtlNgRx0TFEoSnrj1a3SD+Rsx0zv4co4zEE+izm551vwVNo7gL7Rw==
X-Received: by 2002:a05:6a21:9986:b0:1c3:b2b3:442d with SMTP id
 adf61e73a8af0-1c3fdd3082fmr9450865637.40.1721396989987; 
 Fri, 19 Jul 2024 06:49:49 -0700 (PDT)
Received: from localhost.localdomain ([115.96.152.71])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-1fd6f45cfe8sm4737825ad.249.2024.07.19.06.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 06:49:49 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: Ani Sinha <anisinha@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] hw/x86: add a couple of comments explaining how the kernel
 image is parsed
Date: Fri, 19 Jul 2024 19:19:37 +0530
Message-ID: <20240719134937.3643-1-anisinha@redhat.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 19 Jul 2024 13:49:57 -0000

Cosmetic: add comments in x86_load_linux() pointing to the kernel documentation
so that users can better understand the code.

CC: qemu-trivial@nongnu.org
Signed-off-by: Ani Sinha <anisinha@redhat.com>
---
 hw/i386/x86-common.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/i386/x86-common.c b/hw/i386/x86-common.c
index c0c66a0eb5..992ea1f25e 100644
--- a/hw/i386/x86-common.c
+++ b/hw/i386/x86-common.c
@@ -665,8 +665,11 @@ void x86_load_linux(X86MachineState *x86ms,
         exit(1);
     }
 
-    /* kernel protocol version */
-    if (ldl_p(header + 0x202) == 0x53726448) {
+    /*
+     * kernel protocol version.
+     * Please see https://www.kernel.org/doc/Documentation/x86/boot.txt
+     */
+    if (ldl_p(header + 0x202) == 0x53726448) /* Magic signature "HdrS" */ {
         protocol = lduw_p(header + 0x206);
     } else {
         /*
-- 
2.45.2


