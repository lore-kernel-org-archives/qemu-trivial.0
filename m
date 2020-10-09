Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQxmf-00076r-TR
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2020 15:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eafanasova@gmail.com>)
 id 1kQxmd-00075Z-Pq; Fri, 09 Oct 2020 15:10:27 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:32890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eafanasova@gmail.com>)
 id 1kQxmc-0008C6-9o; Fri, 09 Oct 2020 15:10:27 -0400
Received: by mail-lj1-x244.google.com with SMTP id 133so10633664ljj.0;
 Fri, 09 Oct 2020 12:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=h3BHiBImTSYBNwunlyobpGQ88O38txvYjdThycmXeiI=;
 b=AKxROpTIaZLMWK1lICRCw1I39WPEOf95PCjo8fLIZpjD7vs3llhy+2MmW1Av3mDU/j
 ZSj0txcqfUztadXbSHwG6d054lkoYfh9daOwNtNms51snQOT8qD4tFk8doat2CZ8o7et
 ZlQl5fEx907NGWc9Z76scCx0EEYFy6lEc1BwK1n5B+sl5kJ+Le5hPI7xVKPpDvQPhzWS
 9Cq7Cjf/C3r2CxQI/yzcEmLM+f/6bxHC3MCy1XBNm8sTQIDsmYuxf/8Ju0GwBJbHxXlz
 QrJwosX/YQQMKLJGDv0Oia/VqviIZenIIi1UYtsPbtyvvF3PrZ1rCqgzmHJxE8Nx7Jnw
 /cBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=h3BHiBImTSYBNwunlyobpGQ88O38txvYjdThycmXeiI=;
 b=ZS0y1TAbFNsZtQheCKa5x04Z3OtKxLTTBeDGEEZwbP+EIEfjb2r9fTptK9dd7HtXtN
 5I1ZPxGw2pESwBihzoj5kNXHGEmJCn6Wdw+29WJr2VKbrg4aH0sA73yu4EQ0i+kyqpkt
 5jwYt08Icnb2dVN7zPUzUuscuYAOAucEpEDoZnWx8fI7hOyo1dp3jTpgcVfcsTaRU6Ok
 HVEThFVGLHx3yhd5MEVuC1NnisQu1vVLubbnNQ1okVSEjV8T+UWKJ0qBv8hDc52Y02J5
 HOH9I4CGjeGboL6TMnlr1rC4MiUwlGC4kiOjE95aHBJouf1er+UgAs3rFdy6BFZA4Lw+
 FXIQ==
X-Gm-Message-State: AOAM530P2lwq+NKytM9hxT4Bh2uswYFbNOxSQ0LADmlSc1VmfDy/g8QD
 ECzY/vJclk4QLZShFqdnaSE=
X-Google-Smtp-Source: ABdhPJzws/KS8CxegbSfa7wffDIMNlpklj7igreQ7dKKx30dv7dxm1DnqT1+xHY7oDmjArYSmALQjQ==
X-Received: by 2002:a2e:a315:: with SMTP id l21mr5356361lje.31.1602270623364; 
 Fri, 09 Oct 2020 12:10:23 -0700 (PDT)
Received: from [192.168.167.128] (37-145-186-126.broadband.corbina.ru.
 [37.145.186.126])
 by smtp.gmail.com with ESMTPSA id x4sm1637167lfn.280.2020.10.09.12.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 12:10:22 -0700 (PDT)
Message-ID: <1e903f928eb3da332cc95e2a6f87243bd9fe66e4.camel@gmail.com>
Subject: [PATCH] block/blkdebug: fix memory leak
From: Elena Afanasova <eafanasova@gmail.com>
To: kwolf@redhat.com, mreitz@redhat.com, qemu-block@nongnu.org, 
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Fri, 09 Oct 2020 12:09:59 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::244;
 envelope-from=eafanasova@gmail.com; helo=mail-lj1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 09 Oct 2020 19:10:28 -0000

Spotted by PVS-Studio

Signed-off-by: Elena Afanasova <eafanasova@gmail.com>
---
 block/blkdebug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index eecbf3e5c4..54da719dd1 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -215,6 +215,7 @@ static int add_rule(void *opaque, QemuOpts *opts, Error **errp)
                                  BLKDEBUG_IO_TYPE__MAX, &local_error);
         if (local_error) {
             error_propagate(errp, local_error);
+            g_free(rule);
             return -1;
         }
         if (iotype != BLKDEBUG_IO_TYPE__MAX) {
-- 
2.25.1



