Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVyYu-0006f8-PX
	for mharc-qemu-trivial@gnu.org; Tue, 05 May 2020 10:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVyYt-0006eo-48
 for qemu-trivial@nongnu.org; Tue, 05 May 2020 10:28:43 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:38757
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVyYs-0005xk-Ce
 for qemu-trivial@nongnu.org; Tue, 05 May 2020 10:28:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588688921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SODIKxZt1q2rQc3n2F7gikb/kboYOa22VRDmN6O5sjc=;
 b=EHH9uMEYiKXQsMyju88v85Eqv8naplXXJQ26lqRdlfLaYXn0H0kOL33ysN7anfUQh/KLl8
 PmIhgPvpCFg8trC5diZPkZXRoCxnFqN9iWw+oZ+dZMuJAybZv7u4C99r4yEILUvdIx5pwA
 QyxV8+sordPUOXJV6F4yXIiaNtO1qkE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-eqoOxsUKPlaoplbqk1zstQ-1; Tue, 05 May 2020 10:28:40 -0400
X-MC-Unique: eqoOxsUKPlaoplbqk1zstQ-1
Received: by mail-wr1-f72.google.com with SMTP id r11so1278593wrx.21
 for <qemu-trivial@nongnu.org>; Tue, 05 May 2020 07:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l7ZiJPL7K6pr7CqBYpvvYjXrgczUlL8OlxjhI3odDYw=;
 b=QwPupPVQqUJEdMT2PhyufYCTzbmw2dYM61nk0LtCXFmBhS1AYHJzG8NIl+ZQSq1QtO
 5lh7us6NEEL6Z7jXYBV/72EBVYxS1hGnRzCzYbfI5oFGyAveYh0sg8BqtWe2F5H/FW9S
 5k6Tr41gRYkG9CW3sYU8yujp2lcyU6EzDLRbmwV8QuyGpzxEN36va7QnoHtGeEeATrqz
 gZGlkYeOxyJYA2BMST6KZZoESwjW8A4RVigdshV6fDkxLHfR7pYuXwn5WyC6+gZtq9Oc
 lKyv7tn2oP2HqrWiIh3grfv3cr0X7yrhlmIPk7EkDRgqqWbwrmEE5bTOTtMamGLK7D41
 Vn6A==
X-Gm-Message-State: AGi0PuYhREipvsPo4fYDua0dHO/1Gl+dZZFtwOJIXeRcJG4mZttYmrb0
 jMKt5dWJx7qBMOAmtNg+uw6tSY8HMOizkjlESlgtlCAq+g09EczD8F2z5Cm7FM+JLeC+dZ2PzD3
 ahTxt9YGAoutLn8b+kg==
X-Received: by 2002:a5d:4c4b:: with SMTP id n11mr4212988wrt.139.1588688919010; 
 Tue, 05 May 2020 07:28:39 -0700 (PDT)
X-Google-Smtp-Source: APiQypJlT+XEDvfcZoEq3FuYBp6cP51UAet/z0Xr0BwF9nqyKqwe2w8NWFg9tAJthsxjtZap7RBO3w==
X-Received: by 2002:a5d:4c4b:: with SMTP id n11mr4212945wrt.139.1588688918544; 
 Tue, 05 May 2020 07:28:38 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id c128sm1167317wma.42.2020.05.05.07.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 07:28:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Henderson <rth@twiddle.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] hw/i386/vmport: Drop superfluous parenthesis around function
 typedef
Date: Tue,  5 May 2020 16:28:36 +0200
Message-Id: <20200505142836.16903-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 00:37:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 05 May 2020 14:28:43 -0000

Drop superfluous parenthesis around VMPortReadFunc typedef
(added in d67f679d99, missed to remove when moved in e595112985).

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i386/vmport.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/vmport.h b/hw/i386/vmport.h
index 47eda7a22b..a6624e3045 100644
--- a/hw/i386/vmport.h
+++ b/hw/i386/vmport.h
@@ -27,7 +27,7 @@
=20
 #define TYPE_VMPORT "vmport"
=20
-typedef uint32_t (VMPortReadFunc)(void *opaque, uint32_t address);
+typedef uint32_t VMPortReadFunc(void *opaque, uint32_t address);
=20
 void vmport_register(unsigned char command, VMPortReadFunc *func, void *op=
aque);
=20
--=20
2.21.3


