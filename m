Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k5W1P-0006Hy-AZ
	for mharc-qemu-trivial@gnu.org; Tue, 11 Aug 2020 11:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k5W1N-0006EX-Ls
 for qemu-trivial@nongnu.org; Tue, 11 Aug 2020 11:17:01 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58547
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k5W1L-0000c6-U5
 for qemu-trivial@nongnu.org; Tue, 11 Aug 2020 11:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597159018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zhnHxfxiUERu1MREU1ntOMjckPxtITbDsV/Q25LHat4=;
 b=iorDkxuTWUpI1W5t2kRG2yigBqEW4v066LfpAeja4dqnVq8YU3PfQBLbaMvdk7jFwRpEW2
 Y4+Zyxqj71ckxc26kLMgoTNBuxQMaMEd//G/isF6QY1C75gqgqblXU+eAopNinez93q/5L
 oUK3/mn8Mg4v7Qshju2tH+dFIpfYMyg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-BBdUVfa3OXCE6bp11Arh4Q-1; Tue, 11 Aug 2020 11:16:57 -0400
X-MC-Unique: BBdUVfa3OXCE6bp11Arh4Q-1
Received: by mail-wr1-f70.google.com with SMTP id b8so5744616wrr.2
 for <qemu-trivial@nongnu.org>; Tue, 11 Aug 2020 08:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zhnHxfxiUERu1MREU1ntOMjckPxtITbDsV/Q25LHat4=;
 b=JjJz9J7PtozCX/JMUG0kydIK40pAHDIbDSeKPTSn4y/VYJjRy+8EJXxfpJlVAlyNIf
 0TaAtYzgdnpdzYtCgvjwRAIEi+zseD7xYZTxleQ473mM4NIVGbrosd88D3EYNi15LRx0
 NIoE6k+chay/j8ke8G9QCmu0LqKOrfda5+Qd0q4XRat+N+1b5IOO/Ps0xBGPzizrwqdp
 gRyzt9grC7lPsFrzhw94hQeNKM+UnkaeHJDOvy40F9BzsCn9aWGEdopRGdKY3Pkh8ZHW
 IIDxo9L6c22PhAdQeXhsZSIF1qD2fUHWYO4Ez/9gA/7HJdpCn0B7Js9jmnqoxKiz5B0i
 Fyyw==
X-Gm-Message-State: AOAM530maHTTlyvjiCW6mnisFHoaEjQOJSUasA6Oeou8TibroRzilBYx
 XyKpsB+gfPsA/QG2R/4Ma0cCqdCuCMiUGrx8OrDYOXSb/M+XiMy6P0XcJFHNLP3MoQq+C1MWHnC
 Kq+4l0AjyWETkwdDahw==
X-Received: by 2002:adf:eb05:: with SMTP id s5mr32578593wrn.0.1597159015933;
 Tue, 11 Aug 2020 08:16:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjU8A+PUDTZ7CGt0LIPryNFYYQYhT4QbWMdPawoZPb9jzJkjSE6ZMB1koKFRqW14G9TJSLFQ==
X-Received: by 2002:adf:eb05:: with SMTP id s5mr32578577wrn.0.1597159015765;
 Tue, 11 Aug 2020 08:16:55 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id s8sm5542671wmc.1.2020.08.11.08.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 08:16:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-5.2 2/3] util/qemu-timer: Fix typo in description
Date: Tue, 11 Aug 2020 17:16:42 +0200
Message-Id: <20200811151643.21293-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200811151643.21293-1-philmd@redhat.com>
References: <20200811151643.21293-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 10:41:43
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
X-List-Received-Date: Tue, 11 Aug 2020 15:17:02 -0000

Remove the second 'and' introduced in commit e81f86790f ("qemu-timer:
avoid checkpoints for virtual clock timers in external subsystems").

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/qemu-timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/qemu-timer.c b/util/qemu-timer.c
index f62b4feecd..878d80fd5e 100644
--- a/util/qemu-timer.c
+++ b/util/qemu-timer.c
@@ -530,7 +530,7 @@ bool timerlist_run_timers(QEMUTimerList *timer_list)
     }
 
     /*
-     * Extract expired timers from active timers list and and process them.
+     * Extract expired timers from active timers list and process them.
      *
      * In rr mode we need "filtered" checkpointing for virtual clock.  The
      * checkpoint must be recorded/replayed before processing any non-EXTERNAL timer,
-- 
2.21.3


