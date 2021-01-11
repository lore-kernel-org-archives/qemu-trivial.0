Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kyyzo-00020T-Fv
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2021 10:20:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyyzm-0001vR-PP
 for qemu-trivial@nongnu.org; Mon, 11 Jan 2021 10:20:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyyzl-000457-1E
 for qemu-trivial@nongnu.org; Mon, 11 Jan 2021 10:20:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610378436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=97BNT6jh6NRO0TVk+TL23RreQDhzFRma0TINePq+NK8=;
 b=WmrD/QMLLe6mMlP9odwpyo3CG/WprmCO3tuHBOCOnFr5nKsyybD7J8lFKV398L+OslpC5T
 k2U7+AjUbAeco4+MvOBuSrrnulaYnN53YwinaYfDDo9g0cjm0QjFwHDySsIZZhcJrgT8sR
 EkSNuvQjbOH01Ut1W9TpfFYuPNYBAu0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-YA7Q8ASBOxy0FQYTMEwilQ-1; Mon, 11 Jan 2021 10:20:32 -0500
X-MC-Unique: YA7Q8ASBOxy0FQYTMEwilQ-1
Received: by mail-ed1-f72.google.com with SMTP id dh21so8361213edb.6
 for <qemu-trivial@nongnu.org>; Mon, 11 Jan 2021 07:20:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=97BNT6jh6NRO0TVk+TL23RreQDhzFRma0TINePq+NK8=;
 b=oZem7UDaM26mLVzxGrk9odMpzCr5Rtqlswz7J+eT8kOnEtbSwCAJAKNjSTdYmQ1G7I
 7+I+A8FGDbwhfEb5tMdFQIcMCNnO8fvnmsv6yI/IduJeNy/y+/uSGk2jbAfFwtYqBwnj
 aRCu0M9LYO0zdovIQ7UJw2a2rFQ3S9mI20j25TUXUv5Senn4WbXxZ4nvjmeeuzi+WOpW
 G+sfm3cqsIul+mW7BlQdxY1CoGD0HsQiGgq9X3dn1l8BpdBm2b4BdMRM9pSgETsBqbLB
 R9CNavCk/SMbxHuzy/rINrIMGhLqi0hiOyTI1d0rBfIq6Dy4Dwat4UZATyy/ks1bSEYP
 +7Pg==
X-Gm-Message-State: AOAM531RdnuWHZ+4X4V+KIyWPdElP+H9x6fUfrr2WkikJz080wj4V1iX
 U++OT4gIVmjp2eh/EejtPa+Nbb0SwV4K7H3j8YNPEDznb4J31VOHaNlllxyMjv9Pr5xLH+LHtnh
 4LQRlCWy5juaxvTG/4g==
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr14236998edw.52.1610378431355; 
 Mon, 11 Jan 2021 07:20:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfzQ4g/Xi77uXbjKsyJn2nZrlWGnmTOg2kIy8FkRbXj1BTf3rxwC5MxkZMkcW73D4xDrLEXw==
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr14236981edw.52.1610378431207; 
 Mon, 11 Jan 2021 07:20:31 -0800 (PST)
Received: from x1w.redhat.com (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id c12sm76932edw.55.2021.01.11.07.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 07:20:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>, Greg Kurz <groug@kaod.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Amit Shah <amit@kernel.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Fam Zheng <fam@euphon.net>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-block@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/2] sysemu/runstate: Let runstate_is_running() return bool
Date: Mon, 11 Jan 2021 16:20:19 +0100
Message-Id: <20210111152020.1422021-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111152020.1422021-1-philmd@redhat.com>
References: <20210111152020.1422021-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 11 Jan 2021 15:20:39 -0000

runstate_check() returns a boolean. runstate_is_running()
returns what runstate_check() returns, also a boolean.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/runstate.h | 2 +-
 softmmu/runstate.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index e557f470d42..3ab35a039a0 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -6,7 +6,7 @@
 
 bool runstate_check(RunState state);
 void runstate_set(RunState new_state);
-int runstate_is_running(void);
+bool runstate_is_running(void);
 bool runstate_needs_reset(void);
 bool runstate_store(char *str, size_t size);
 
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 636aab0addb..c7a67147d17 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -217,7 +217,7 @@ void runstate_set(RunState new_state)
     current_run_state = new_state;
 }
 
-int runstate_is_running(void)
+bool runstate_is_running(void)
 {
     return runstate_check(RUN_STATE_RUNNING);
 }
-- 
2.26.2


