Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n0uFY-0005NK-PT
	for mharc-qemu-trivial@gnu.org; Fri, 24 Dec 2021 18:45:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0uFW-0005MX-8G
 for qemu-trivial@nongnu.org; Fri, 24 Dec 2021 18:45:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0uFS-0007e9-Iz
 for qemu-trivial@nongnu.org; Fri, 24 Dec 2021 18:45:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640389516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=djtV4Zg+5Y2t9qXSDNiQLJloqba1CwpOshfT6XZOspA=;
 b=GDgswebiSfaPnLP7W4kmkIW+UR4572gh+XSFcfchJh1e1ieGgPjYnApaZ+m+9LbaenGlta
 AYVCPch0igWXInWSI8evpDe+zFJtjDWpChy8xwpIpeAJTjc8qe57pmUKYVY96IDp+MNYqi
 KC9EAGM4QsGIl7wMBsT2xTu5W4E8SyU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-09LFV6LCMdiEml01I1Ny5w-1; Fri, 24 Dec 2021 18:45:15 -0500
X-MC-Unique: 09LFV6LCMdiEml01I1Ny5w-1
Received: by mail-wr1-f70.google.com with SMTP id
 h7-20020adfaa87000000b001885269a937so1719536wrc.17
 for <qemu-trivial@nongnu.org>; Fri, 24 Dec 2021 15:45:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=djtV4Zg+5Y2t9qXSDNiQLJloqba1CwpOshfT6XZOspA=;
 b=Gd6X+CB67FomJHZ6pCqdkJ0DTD/U+x/fUf0GVbCTFrUq9uVKWUnuyvzHDooc+ZmDXO
 gaohhGamsB4LjJlkmn6NdXYyfCqBFT5fr4Wyqyb3LGsPHzrWLcG8tylhpYzTFYFXBvlQ
 qi2Sb6utb6xOjQ5LygtbgbF2NVQUXG1Ql0RxR+l5t2COHS/8TXl0+DXBGn7/eaQs89Iv
 PNHuV3BT84nEh0ngSAxnAB6Lp9NJ/MvkP7/ZwalpRlxTSwIp7Jhyiq2BjeOyATFXyuAE
 xaPNi7rOmIlnL7gEqmhA4KULe+fOvczcFxO2nLWt0DDX1JQy553xLSm/5EgEncn5FH03
 LDXg==
X-Gm-Message-State: AOAM530HeDmF7hUTr9+z5DQ4Gjgm14dZV+oV7vzHj9CtwMas8BhTBN7W
 R7Z14vH9NRxpQ6bdh1iy8qGawKOLl+irQJAxCl8+x4pexFnW+PXRBQZwyKlccHkRdgZAlPfMIVr
 0+zMeJdJXS+coLFkL+Q==
X-Received: by 2002:adf:ec85:: with SMTP id z5mr5836458wrn.568.1640389514088; 
 Fri, 24 Dec 2021 15:45:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxwfXTXvZngkVd3lvDxTxowWvcYlkt/nFGVEaGHQbMnhcSQSIvNZ0BS8pIqAte4y5L2CUAmw==
X-Received: by 2002:adf:ec85:: with SMTP id z5mr5836446wrn.568.1640389513859; 
 Fri, 24 Dec 2021 15:45:13 -0800 (PST)
Received: from localhost.localdomain
 (adijon-655-1-69-27.w90-13.abo.wanadoo.fr. [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id bg34sm13174955wmb.47.2021.12.24.15.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 15:45:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] tests/unit/test-util-sockets: Use g_file_open_tmp() to create
 temp file
Date: Sat, 25 Dec 2021 00:45:04 +0100
Message-Id: <20211224234504.3413370-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 24 Dec 2021 23:45:22 -0000

Similarly to commit e63ed64c6d1 ("tests/qtest/virtio-net-failover:
Use g_file_open_tmp() to create temporary file"), avoid calling
g_test_rand_int() before g_test_init(): use g_file_open_tmp().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-util-sockets.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/unit/test-util-sockets.c b/tests/unit/test-util-sockets.c
index 72b92465298..896247e3ed3 100644
--- a/tests/unit/test-util-sockets.c
+++ b/tests/unit/test-util-sockets.c
@@ -305,9 +305,11 @@ static void test_socket_unix_abstract(void)
     };
     int i;
 
+    i = g_file_open_tmp("unix-XXXXXX", &addr.u.q_unix.path, NULL);
+    g_assert_true(i >= 0);
+    close(i);
+
     addr.type = SOCKET_ADDRESS_TYPE_UNIX;
-    addr.u.q_unix.path = g_strdup_printf("unix-%d-%u",
-                                         getpid(), g_random_int());
     addr.u.q_unix.has_abstract = true;
     addr.u.q_unix.abstract = true;
     addr.u.q_unix.has_tight = false;
-- 
2.33.1


