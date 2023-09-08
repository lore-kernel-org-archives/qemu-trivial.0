Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qeWMj-00055t-Vj
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2023 03:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qeWMi-00053A-6t
 for qemu-trivial@nongnu.org; Fri, 08 Sep 2023 03:57:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qeWMe-0007Mu-FB
 for qemu-trivial@nongnu.org; Fri, 08 Sep 2023 03:57:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694159835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=85kh3TLzxvqW9aCAsaWAj32WwGP0cmTpAx49VzXkwGs=;
 b=h8GWMMCUAaarnK7Avu/is3+19ZO/dSw6fk7ld+DnvAlnPv7D3oIioRZ5RNqfRHXimXRIZp
 HmsNCsO1VkznFf8bkFPMTYdYwaaH6Q4wRAnWeD4d5JB5+I/TMcsVMwjqyastKWqgiA6Fs7
 wU1ga0bDB9D9tKoc8hPLkXNkuBEZwcQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-jXKz0cxUM_qG9-OSblPvtQ-1; Fri, 08 Sep 2023 03:57:13 -0400
X-MC-Unique: jXKz0cxUM_qG9-OSblPvtQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-401d9abf21cso14553435e9.0
 for <qemu-trivial@nongnu.org>; Fri, 08 Sep 2023 00:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694159832; x=1694764632;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=85kh3TLzxvqW9aCAsaWAj32WwGP0cmTpAx49VzXkwGs=;
 b=IRsxSSGci2Fy2JT6Ype+gQ7h5wPmdET6NqKtTURizAWbJA6BzsORpzgDlYajuHmDlk
 MOsf1IWfeFttZ24DQj3/ho1tIigo4F/zOMw/x15bVCsXrLe4D1VbULmLfw7up0bnJIXb
 kzi74MkXjalgFcggIsoEIg9Uau5ImIVN+0XmGu+oUkHsmMMeBlLuJp9KuZeRd1MmBtYT
 b/MLMgxLQ9Tw/URkBpIYbcQKv+SJhPwRmLqeOxju7XCYQlcqJfQzrk4TYCMdSQN5WQbE
 MhSOAXchkN17tfKZx8TLvuTqSWbiL8sTV7BuGHO3hVm/zcGEdWkCT+D07CzulEWQg0WA
 8kTA==
X-Gm-Message-State: AOJu0YxcQEpB+STKRWtKTm2u9HJlRdTffOT1wT/WpN8RzskxHejnepLe
 66GIKMOhA/YphO7k3gAzHog0ooT19YKFPd5gB0o5q+4yvHxoW6CLzfdNv8EIjPrRHVvakGDCPZx
 Dig/vxnjgQ3ue4iPekA==
X-Received: by 2002:a1c:f70b:0:b0:3fd:3006:410b with SMTP id
 v11-20020a1cf70b000000b003fd3006410bmr1522840wmh.34.1694159832368; 
 Fri, 08 Sep 2023 00:57:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1bFDhyAcM/TpRX+nloRXki9u7ZRoGvlb2nayQtWsenrZqHA9/TumLkp/pgEY2PEQ/j3b2pQ==
X-Received: by 2002:a1c:f70b:0:b0:3fd:3006:410b with SMTP id
 v11-20020a1cf70b000000b003fd3006410bmr1522824wmh.34.1694159831825; 
 Fri, 08 Sep 2023 00:57:11 -0700 (PDT)
Received: from [192.168.10.118] ([93.56.171.164])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a05600c040c00b003fe539b83f2sm4481946wmb.42.2023.09.08.00.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 00:57:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH] block: mark aio_poll as non-coroutine
Date: Fri,  8 Sep 2023 09:54:58 +0200
Message-ID: <20230908075458.527013-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 08 Sep 2023 07:57:20 -0000

It is forbidden to block on the event loop during a coroutine, as that
can cause deadlocks due to recursive locking.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/block/aio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/block/aio.h b/include/block/aio.h
index 32042e8905a..f1d0a37d68f 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -468,7 +468,7 @@ void aio_dispatch(AioContext *ctx);
  * or more AIO events have completed, to ensure something has moved
  * before returning.
  */
-bool aio_poll(AioContext *ctx, bool blocking);
+bool no_coroutine_fn aio_poll(AioContext *ctx, bool blocking);
 
 /* Register a file descriptor and associated callbacks.  Behaves very similarly
  * to qemu_set_fd_handler.  Unlike qemu_set_fd_handler, these callbacks will
-- 
2.41.0


