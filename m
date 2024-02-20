Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rcLsU-0000AK-EN
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2024 03:53:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsS-0008TW-JL
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 03:53:24 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsM-0008CK-OM
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 03:53:24 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a3566c0309fso601851366b.1
 for <qemu-trivial@nongnu.org>; Tue, 20 Feb 2024 00:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708419197; x=1709023997; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o89E/Ku3KzR64hkojq1CtXI0Qta+vdWxO3OzuZ7eBoY=;
 b=pWJsZVTSXObnowGiGoI+AgoHsUQgh/F4wP446N9Y++va8hY++enuomAdsVgyl2irrE
 558y7Pyu3dP3vBfz3GDl4wvJZCbc2lju54dREfARTzEUFmlP0pLb+LP4+UQheF+rwMQ0
 Zte/AiwiHtP+oE/2A6XvIUrLWdTjeLvWHCvvJMzJZs6IdWE3cazDpnasNpAYIgTgi2dC
 PqNtUhUiHmu6w7kCTx/daxz0YdeBPBVg0ZyGRpkt+Sq/Fquhs5uhhpMHUU52Jb5JbQFo
 DBKL+OaEWwqeFp4UGCka0qVkO5AGtOKD5nBf+1jrd5tw7a3NepiddsaliYnsgnTApejr
 7UxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708419197; x=1709023997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o89E/Ku3KzR64hkojq1CtXI0Qta+vdWxO3OzuZ7eBoY=;
 b=ekNByUSFrTFX/s7+mDY47oFAaWeAhf7EoA8ehGvxh62Am8UGy8u6JgyysPwy1QKpMa
 4tdmwI8Fvhoc8b8zt5W9dLEOGRRdvP+29382VSM78uDC/pzVLNw4r53DqKVH9DXPMjq9
 /4v+rv/AI9sKpKdNZqklG2FthvPIFJ1AWsxPvUE+k18dOWkOYVaqNzNSIp1CnPyCwMQ1
 d91lLqW7yGVqQz1yDkKjvYaM7lAlNJB9dKnXuPvnBdch6IRcBVQvBLPL3707RrXgkgPi
 1kJJnME1WL+mfjh26dVfipPEANf2AfZ1CInG59W4mtVJ+tYT1XE7Uflrg4++eZIP5zPM
 sxoQ==
X-Gm-Message-State: AOJu0Yx5JHNEnNx7L/OHFRL1rydAX3ArByKFI4wl7w5MqOKIp1vPdpUX
 of3Ybn4KsZduh1n8GDXv9skCzvv2lPY1ZKKUUV+M3b4eAkKOCyiK9nkF2qLrZW/pU3Cx1yq8/OW
 5jV8=
X-Google-Smtp-Source: AGHT+IHZ/5+wJaE8BswIiI13qF638fQ84Xq68mx6bhNQPrYduawqHNgg3bpQsy0Pa63H+aZDMetv3w==
X-Received: by 2002:a17:906:2657:b0:a3e:46f3:ac92 with SMTP id
 i23-20020a170906265700b00a3e46f3ac92mr4182933ejc.21.1708419197251; 
 Tue, 20 Feb 2024 00:53:17 -0800 (PST)
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr.
 [37.6.163.245]) by smtp.gmail.com with ESMTPSA id
 cu3-20020a170906ba8300b00a3d014fa12esm3747876ejd.196.2024.02.20.00.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 00:53:17 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v1 08/21] include/exec/memory.h: correct typos
Date: Tue, 20 Feb 2024 10:52:15 +0200
Message-Id: <16e84fbb3dec43ee349a8ea5dd945c9630630bb3.1708419115.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 20 Feb 2024 08:53:24 -0000

Correct typos automatically found with the `typos` tool
<https://crates.io/crates/typos>

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 include/exec/memory.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 177be23db7..8626a355b3 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -3146,7 +3146,7 @@ int ram_block_discard_require(bool state);
 
 /*
  * See ram_block_discard_require(): only inhibit technologies that disable
- * uncoordinated discarding of pages in RAM blocks, allowing co-existance with
+ * uncoordinated discarding of pages in RAM blocks, allowing co-existence with
  * technologies that only inhibit uncoordinated discards (via the
  * RamDiscardManager).
  */
-- 
γαῖα πυρί μιχθήτω


