Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b2xm2-0008Am-0J
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 05:28:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1b2xlz-00088v-Em
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 05:28:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1b2xlw-0007pI-6M
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 05:28:11 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:33650)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1b2xlm-0007lR-C8; Wed, 18 May 2016 05:27:58 -0400
Received: by mail-wm0-x241.google.com with SMTP id r12so11243882wme.0;
	Wed, 18 May 2016 02:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=fGHxlqx5pxmBL83Z5SxFYsCI8asIisFPhWpT8nqvzSo=;
	b=FCgUPQxvlJPtCljWZ5uze3a5iciR7g6hyhmlX7s0ZESzN16HGli9Vh8YXrB5ae4T4+
	Z4eWr1oM05jaxHPU4ZP8uT/EodTlCmh/y2JUUhO3cCSjZ7O6JEPlpqrgXE+R/eLChHWK
	3wIYlUel6PoS6TJsMuQcoNWkvy7myTmy9uipyOZDbyrE4kqggYHButf8S0y76Li72U8O
	0DRi5blQAe5UxkV3s8smwssSlTDhz4pb1re4bHlYBBHV9Kd/GDNtPV5QUOBGQoCfj4Jn
	6wbudPyPPApUbd7UEJI0BrrfjLgYA2rDWPd7ZT6BvvR94i0qZhyzcoNHIn0bPYLxV7Kd
	Qghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=fGHxlqx5pxmBL83Z5SxFYsCI8asIisFPhWpT8nqvzSo=;
	b=V7H3BNkulC+2d262mV2+gtJmbvUKKsNbjVVOzo6oThz0zLv+T8bRToEwQHSvqs70GF
	yKAb6hZe4RCjAL8XilHwXFpOvXMsN3i6aFsxpl4KFsWeR0wK6cW9GnPqsEh3q/6jmEZ2
	iZ2jyfjtUq/c1Gyj9OOZCOse8VQstu6Rp9sZ0fO7VVslMItnttexOlqgwvTC58mQB3D0
	7lEWed5QTR5lypJ2Ia8DhtvLsw5SsH3qggaOjLb0XpuGhHHLPq3OUwzGAX/+j4quaYW1
	un7SVZN67mz0wcQrDwMskQ916S/k79m832ZcEx83STGzCBtxXqvrgxEPaIvuDyn91tdW
	hq8w==
X-Gm-Message-State: AOPr4FUaekbQ8qZ9MaWV1qvrU2b/bhgf7S2N8+cE0S5XJBZWpnAE9yMIHmEo+Lpys8zK0A==
X-Received: by 10.194.96.10 with SMTP id do10mr5980918wjb.132.1463563677652;
	Wed, 18 May 2016 02:27:57 -0700 (PDT)
Received: from donizetti.lan (dynamic-adsl-78-12-252-58.clienti.tiscali.it.
	[78.12.252.58])
	by smtp.gmail.com with ESMTPSA id i4sm7599455wjj.49.2016.05.18.02.27.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 May 2016 02:27:56 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	armbru@redhat.com
Date: Wed, 18 May 2016 11:27:53 +0200
Message-Id: <1463563673-671-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 2.5.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Subject: [Qemu-trivial] [PATCH] coccinelle: add g_assert_cmp* to macro file
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2016 09:28:12 -0000

This helps applying semantic patches to unit tests.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/cocci-macro-file.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h
index eceb4be..9f2e72e 100644
--- a/scripts/cocci-macro-file.h
+++ b/scripts/cocci-macro-file.h
@@ -117,3 +117,9 @@ struct {                                                                \
         type *tqe_next;       /* next element */                        \
         type **tqe_prev;      /* address of previous next element */    \
 }
+
+/* From glib */
+#define g_assert_cmpint(a, op, b)   g_assert(a op b)
+#define g_assert_cmpuint(a, op, b)   g_assert(a op b)
+#define g_assert_cmphex(a, op, b)   g_assert(a op b)
+#define g_assert_cmpstr(a, op, b)   g_assert(strcmp(a, b) op 0)
-- 
2.5.5


