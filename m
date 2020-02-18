Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zQP-0001DI-6V
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:44:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43213)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQM-00015A-FE
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQL-0005pv-Fh
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:14 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35082
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQL-0005pP-Bw
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:44:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZU7fveF1nmznN+St3KEHVmWeNf346k9KkwUIERJBNlc=;
 b=FBuP2m39Ei0u5yezOGWskeu39oWChFC0pyaj2rfFkmB/w3/gu6MaCBGvA1g8wJTuB3Wn9L
 5bkE+jmN1SVmm7b1zR6Q+dLjp34l452wqTJFEYxcxJqmpPbiRu8kxSD8MB2PdifvKeD7mv
 A8x+hnVpW+gV6YNH9QTXIBxPrlFUjFs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-KleCRHsSMVOW9A0YyjVw-w-1; Tue, 18 Feb 2020 04:44:11 -0500
Received: by mail-wm1-f69.google.com with SMTP id p2so785928wmi.8
 for <qemu-trivial@nongnu.org>; Tue, 18 Feb 2020 01:44:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ajGEvpxvLQVL8Fd5Rt9Hd36QOTmv1kRHcUMcc2d9U3U=;
 b=IUs1UQ3IRGMNfvDNkxdnBKfrkwacv+LLwvusD+F7nhj+BXlCYJ+Ba/yHoQJnidXosP
 7n4HZtsO4RmnX5fY5KlTsVfJe429BylJ9DwlL3VwWmyemXd5gVzWdzX+xilb/TAfY+Hn
 0rYNW9mRKOTK5XdBQZManRxSUAKadSb2kShOETygCtBLL6e5HWRsKv7tP5+vjy/hd8Tv
 LVPeeyz55vGGkFDBfCTjc5PKA2eNVQAp8UfA4wKsMQANY1JMIKRfprzh6jiDmhFKAj5o
 pA3R6uSvM0StFnepPazOrr24sN5UuJC08Ndf28GPgMwaBn9t2KI1x/0Sx1LxAhUlOATe
 HJDw==
X-Gm-Message-State: APjAAAXVs6paBPtBCGPRHWq0iuHQ1zo+sgtnLPYXjKlagn9+B3Rc4CaK
 hQ0NAw50kaTLmcHY3Ivl6QtxFyYHKpkMg7AFqN/av5Xf1MQeP2AHWZn+uEl3gFrDQVc/ylBMRdF
 3k6+LNcIg0enWIYAQJA==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr2205617wmi.116.1582019049853; 
 Tue, 18 Feb 2020 01:44:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqwB3rGLxQZLgg+OP0hNSeyQWsU6nFZjDKtPoOMnFmWEI1CmOX2tYvfjrMRtNoIZv/SUqeisfQ==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr2205584wmi.116.1582019049667; 
 Tue, 18 Feb 2020 01:44:09 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Julia Suvorova <jusual@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?= <DirtY.iCE.hu@gmail.com>
Subject: [PATCH RESEND 02/13] audio/alsaaudio: Remove superfluous semicolons
Date: Tue, 18 Feb 2020 10:43:51 +0100
Message-Id: <20200218094402.26625-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: KleCRHsSMVOW9A0YyjVw-w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Tue, 18 Feb 2020 09:44:15 -0000

Fixes: 286a5d201e4
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: "K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n" <DirtY.iCE.hu@gmail.com>
---
 audio/alsaaudio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index a23a5a0b60..a8e62542f9 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -819,7 +819,7 @@ static size_t alsa_read(HWVoiceIn *hw, void *buf, size_=
t len)
             switch (nread) {
             case 0:
                 trace_alsa_read_zero(len);
-                return pos;;
+                return pos;
=20
             case -EPIPE:
                 if (alsa_recover(alsa->handle)) {
@@ -835,7 +835,7 @@ static size_t alsa_read(HWVoiceIn *hw, void *buf, size_=
t len)
             default:
                 alsa_logerr(nread, "Failed to read %zu frames to %p\n",
                             len, dst);
-                return pos;;
+                return pos;
             }
         }
=20
--=20
2.21.1


