Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZuSD-0002Be-8w
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2020 06:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZuS8-00028U-SZ
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 06:26:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZuS6-0006WP-Uj
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 06:26:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604402774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jsldW9KcK6vt6+l44bfLcLh5QfAWQnVBXAW4qRe393k=;
 b=VhXjaxOKC5glMdo5BivM1IAKQG0uA/GtLzrImvoAR4g24q2xlNV/1XIBSdwJGtVWdiWi0h
 WkRbQYJFlyj9w4l51/5ssmicTsL1Pk15XUTfJKSduO0kphyJDtY7uAH3OZJXqLIq36da8a
 8JqqbN7yALZozCBRs07vb1umhZ5c9XU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-gPtKo_45Ph2GIIQRAbf_zQ-1; Tue, 03 Nov 2020 06:26:12 -0500
X-MC-Unique: gPtKo_45Ph2GIIQRAbf_zQ-1
Received: by mail-wr1-f71.google.com with SMTP id e3so7727497wrn.19
 for <qemu-trivial@nongnu.org>; Tue, 03 Nov 2020 03:26:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jsldW9KcK6vt6+l44bfLcLh5QfAWQnVBXAW4qRe393k=;
 b=KlofnWvsm3umlYLFzbTe4J2kuxSaxo7JtIoqWTTbJIaIXvmeTouofPT+s8S+0p+pu9
 1ofhX0oJT6Bat5v2I4NwiM0DVVzablhttyqLWKuNc3IX+2tFDnxFJDT9ZAmPaf5q3Go1
 huNm0PKAB3iakORO7qd06s+IfVfv9qthIJsWZH9rf2EqLWfSbWYdX7HmF0t63uF9SVa+
 iuUkSrROiEQNuML1rIAisFShEEivQfeWgR2hKXCf0tt0bdgADJA9Fq2aT8q5JlHJ//we
 K+RQJtBg67l6rYSmChDQRoWCAPDfejqfdRZ3G6J8j9kL7j9exDB/CO/f++TCqot4TIIq
 oZhg==
X-Gm-Message-State: AOAM532OlMKqBBliVjtBwsThhDmQN7o9lSCvr5temhvgl2YOx/WBAcwA
 Xyxl9U3gRdofvkZQ5IwiFK4nb8l71Gde/j5IkTDwg5f5PQevpOxtYPxCaZ8EGq1d9TydSMh9yQX
 XfpmbRnU+EbCWf6D7TA==
X-Received: by 2002:a7b:c2ef:: with SMTP id e15mr3229469wmk.180.1604402771191; 
 Tue, 03 Nov 2020 03:26:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwl52Ds1oRu6dTtUZhGm8AV0CHCxfu1jIdltfQr0X/jECQCS5/5xrlI7Ccy0qyfSva7NILQ9Q==
X-Received: by 2002:a7b:c2ef:: with SMTP id e15mr3229451wmk.180.1604402771044; 
 Tue, 03 Nov 2020 03:26:11 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id n22sm2083018wmk.40.2020.11.03.03.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 03:26:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Gerd Hoffmann <kraxel@redhat.com>, Dov Murik <dovmurik@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-5.2 2/4] hw/display/cirrus_vga: Fix hexadecimal format
 string specifier
Date: Tue,  3 Nov 2020 12:25:56 +0100
Message-Id: <20201103112558.2554390-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103112558.2554390-1-philmd@redhat.com>
References: <20201103112558.2554390-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 01:02:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 03 Nov 2020 11:26:17 -0000

The '%u' conversion specifier is for decimal notation.
When prefixing a format with '0x', we want the hexadecimal
specifier ('%x').

Inspired-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/display/cirrus_vga.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index e14096deb46..fdca6ca659f 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -2105,7 +2105,7 @@ static void cirrus_vga_mem_write(void *opaque,
     } else {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "cirrus: mem_writeb 0x" TARGET_FMT_plx " "
-                      "value 0x%02" PRIu64 "\n", addr, mem_value);
+                      "value 0x%02" PRIx64 "\n", addr, mem_value);
     }
 }
 
-- 
2.26.2


