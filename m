Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZuSH-0002Eb-Ni
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2020 06:26:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZuSF-0002Cr-5j
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 06:26:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZuSB-0006Xw-6f
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 06:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604402778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J/WriUkAF5WQqVMHWgQv1QLJ6c0DsVi572s0W42JyGk=;
 b=YhqaQjJbixZonkQfLcB6WsJSlerp8HqiRmh9Avrv4GF6R/0c0cbWBH+6u1xZzW6bJ3dkVQ
 rqRXY2rZUWjQ1Z3VpBS3FoJBVrWun4xj//NK23lI2+dWLTtr4L15DiB5XPoSzyS9Zma6nl
 CKwKYjEvwB/s1O3EM7AdfAS2TbJROdk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-kF2M-jiAMAezd6Qma1rYOw-1; Tue, 03 Nov 2020 06:26:17 -0500
X-MC-Unique: kF2M-jiAMAezd6Qma1rYOw-1
Received: by mail-wm1-f72.google.com with SMTP id p7so2529373wma.9
 for <qemu-trivial@nongnu.org>; Tue, 03 Nov 2020 03:26:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J/WriUkAF5WQqVMHWgQv1QLJ6c0DsVi572s0W42JyGk=;
 b=mt4CP+tMH7cdutc3CRFrWpvpEHcRP+gOBvYBFCNCbyErYjXyGtA4QqhziEBROwDQGB
 IHF6Me4XgbcxewPLTyTGPRYf+IJdybFnPO+vWZVyIEGhIS2rhjdsESunxwXww7eMIjrL
 wc5Fi06Ca7ftLN6521Fx8dIM2AiR+V0E6z6NlPkprb1HOZoORF/bfRcKOQaa74rNkCMs
 lMtVE29ve6pz1ZjQbGk86hQJBO+r/lLXTjG6+JaAbXhSGGc0YdHUpBqKaidk53fswWPz
 8BoFOZXZo8XGeS4A/53zx2YJ0dZaA1AXaDd1dYDFzvisgH6JtTtPplYMtRnI7MEc+KFR
 +5PQ==
X-Gm-Message-State: AOAM5302bycgzoXhOae/MALS8X6Ee5xrO2sgLKxVVfe/4FmYhxrmMRGu
 nm/T1grkvK3NXLuEKggPMd9diAh2Bvi1J4pwUAWd8knLykaTzh9pEe41/uRu1ES952ePUP5uS/v
 cLk6HVgrFTh8EyJ/Owg==
X-Received: by 2002:adf:dc4c:: with SMTP id m12mr12923488wrj.177.1604402776126; 
 Tue, 03 Nov 2020 03:26:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTl+t5I9FpG8/KLS8m1QoHOaFWtqY+CTqoUmfuR/B2d6DVdY+/+PfSoNgEgI7cecNbPe3uAQ==
X-Received: by 2002:adf:dc4c:: with SMTP id m12mr12923461wrj.177.1604402775992; 
 Tue, 03 Nov 2020 03:26:15 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id l3sm2990672wmg.32.2020.11.03.03.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 03:26:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Gerd Hoffmann <kraxel@redhat.com>, Dov Murik <dovmurik@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-5.2 3/4] hw/ppc/spapr_tpm_proxy: Fix hexadecimal format
 string specifier
Date: Tue,  3 Nov 2020 12:25:57 +0100
Message-Id: <20201103112558.2554390-4-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 03 Nov 2020 11:26:24 -0000

The '%u' conversion specifier is for decimal notation.
When prefixing a format with '0x', we want the hexadecimal
specifier ('%x').

Inspired-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/ppc/trace-events | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index dcc06d49b5a..6d8d095aa28 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -19,7 +19,7 @@ spapr_update_dt_failed_size(unsigned cbold, unsigned cbnew, unsigned magic) "Old
 spapr_update_dt_failed_check(unsigned cbold, unsigned cbnew, unsigned magic) "Old blob %u bytes, new blob %u bytes, magic 0x%x"
 
 # spapr_tpm_proxy.c
-spapr_h_tpm_comm(const char *device_path, uint64_t operation) "tpm_device_path=%s operation=0x%"PRIu64
+spapr_h_tpm_comm(const char *device_path, uint64_t operation) "tpm_device_path=%s operation=0x%"PRIx64
 spapr_tpm_execute(uint64_t data_in, uint64_t data_in_sz, uint64_t data_out, uint64_t data_out_sz) "data_in=0x%"PRIx64", data_in_sz=%"PRIu64", data_out=0x%"PRIx64", data_out_sz=%"PRIu64
 
 # spapr_iommu.c
-- 
2.26.2


