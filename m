Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZuS7-00024S-49
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2020 06:26:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZuS4-0001zU-Me
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 06:26:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZuS2-0006Tb-16
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 06:26:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604402768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/AHR77zRKAMCmRWgdDl0ch1BMwO1MYz9I/QcKMgp7y4=;
 b=P0JqHWKfaXkn2ZEgoExLSTvmrVXxyNdr6Z/DdQS48LTAdg+sfmgUfjFAT9h/X5J62QBcrj
 o04OPbTO4lncx8bzJbEMS9DQjUssCrzdn9HEgfnAMEAkrkr5QrBqOjp9ZQG232tLybwUOP
 zZCArrVcFgEp20TltAa0TxUSP0P9gAY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-1Nz6MhHSNHWixAK3oT3Knw-1; Tue, 03 Nov 2020 06:26:07 -0500
X-MC-Unique: 1Nz6MhHSNHWixAK3oT3Knw-1
Received: by mail-wr1-f70.google.com with SMTP id m4so7689154wrq.23
 for <qemu-trivial@nongnu.org>; Tue, 03 Nov 2020 03:26:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/AHR77zRKAMCmRWgdDl0ch1BMwO1MYz9I/QcKMgp7y4=;
 b=ip4gFz6z1F+a9xlIMblh/vAh2VkJlu6UOCHKSOvaPbSFkK004RrmTYE1TR9OQave2m
 mDYjNSVjHz/WXnbTKGBZM3Lgkl742uaCPB2ETRyjl2ebKmUuSBgajJflxFA7Wqx4nmC7
 sqi3UmSCOcTdWpw/TThfeaXFgchuL/ZGPwKp/hpRQN/ZIRqbeKlK/+gi1w22HTcpi3bV
 j67/jMKViy4+EzYAkJ42I3ldtOT4qo/hEJuA31Q/Pf0cL0yoA+ms0zB+tZc5quXJIeji
 Rr874uHXUIeuhPFmwIBLVduDRWDsgJcwqj7wJoPC0F37s79FDpYj12fiRB9awtORPGxk
 ic3g==
X-Gm-Message-State: AOAM532VMzUiUApWhWejd44kt+6xEsXpqPMMau1Q4g+5ZkNvQ6MAjoqc
 zco93E8pxCr/oNoqn4CjTUY+GJ/a3L7o7kPfynLjv8HL2wkOXQ0T8WrgS6E3n1BaOV0YkuzfD8x
 sOHQhzG+irgphigJr2A==
X-Received: by 2002:a05:6000:10c:: with SMTP id
 o12mr27240276wrx.81.1604402766015; 
 Tue, 03 Nov 2020 03:26:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNtFqqbhhJg/UDzhJNPIs3iD3sg/7LZUKn8zxMUfFHWwoa8kiWvjsDbedhDS+L53Y4ttNBZw==
X-Received: by 2002:a05:6000:10c:: with SMTP id
 o12mr27240251wrx.81.1604402765817; 
 Tue, 03 Nov 2020 03:26:05 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id f17sm2613658wmf.41.2020.11.03.03.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 03:26:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Gerd Hoffmann <kraxel@redhat.com>, Dov Murik <dovmurik@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-5.2 1/4] hw/display/cirrus_vga: Remove debugging code
 commented out
Date: Tue,  3 Nov 2020 12:25:55 +0100
Message-Id: <20201103112558.2554390-2-philmd@redhat.com>
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
X-List-Received-Date: Tue, 03 Nov 2020 11:26:13 -0000

Commit ec87f206d70 ("cirrus: replace debug printf with trace points")
forgot to remove this code once replaced. Do it now.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/display/cirrus_vga.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 722b9e7004c..e14096deb46 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -2532,9 +2532,6 @@ static uint64_t cirrus_vga_ioport_read(void *opaque, hwaddr addr,
 	case 0x3c5:
 	    val = cirrus_vga_read_sr(c);
             break;
-#ifdef DEBUG_VGA_REG
-	    printf("vga: read SR%x = 0x%02x\n", s->sr_index, val);
-#endif
 	    break;
 	case 0x3c6:
 	    val = cirrus_read_hidden_dac(c);
@@ -2560,9 +2557,6 @@ static uint64_t cirrus_vga_ioport_read(void *opaque, hwaddr addr,
 	    break;
 	case 0x3cf:
 	    val = cirrus_vga_read_gr(c, s->gr_index);
-#ifdef DEBUG_VGA_REG
-	    printf("vga: read GR%x = 0x%02x\n", s->gr_index, val);
-#endif
 	    break;
 	case 0x3b4:
 	case 0x3d4:
@@ -2571,9 +2565,6 @@ static uint64_t cirrus_vga_ioport_read(void *opaque, hwaddr addr,
 	case 0x3b5:
 	case 0x3d5:
             val = cirrus_vga_read_cr(c, s->cr_index);
-#ifdef DEBUG_VGA_REG
-	    printf("vga: read CR%x = 0x%02x\n", s->cr_index, val);
-#endif
 	    break;
 	case 0x3ba:
 	case 0x3da:
@@ -2645,9 +2636,6 @@ static void cirrus_vga_ioport_write(void *opaque, hwaddr addr, uint64_t val,
 	s->sr_index = val;
 	break;
     case 0x3c5:
-#ifdef DEBUG_VGA_REG
-	printf("vga: write SR%x = 0x%02" PRIu64 "\n", s->sr_index, val);
-#endif
 	cirrus_vga_write_sr(c, val);
         break;
     case 0x3c6:
@@ -2670,9 +2658,6 @@ static void cirrus_vga_ioport_write(void *opaque, hwaddr addr, uint64_t val,
 	s->gr_index = val;
 	break;
     case 0x3cf:
-#ifdef DEBUG_VGA_REG
-	printf("vga: write GR%x = 0x%02" PRIu64 "\n", s->gr_index, val);
-#endif
 	cirrus_vga_write_gr(c, s->gr_index, val);
 	break;
     case 0x3b4:
@@ -2681,9 +2666,6 @@ static void cirrus_vga_ioport_write(void *opaque, hwaddr addr, uint64_t val,
 	break;
     case 0x3b5:
     case 0x3d5:
-#ifdef DEBUG_VGA_REG
-	printf("vga: write CR%x = 0x%02"PRIu64"\n", s->cr_index, val);
-#endif
 	cirrus_vga_write_cr(c, val);
 	break;
     case 0x3ba:
-- 
2.26.2


