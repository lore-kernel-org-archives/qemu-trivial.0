Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cOmvM-0005bX-DJ
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jan 2017 09:52:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cOmvK-0005aX-Go
	for qemu-trivial@nongnu.org; Wed, 04 Jan 2017 09:52:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cOmvJ-0003Pw-Pz
	for qemu-trivial@nongnu.org; Wed, 04 Jan 2017 09:52:18 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:34718)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1cOmvF-0003Mz-8H; Wed, 04 Jan 2017 09:52:13 -0500
Received: by mail-wm0-x241.google.com with SMTP id c85so53586908wmi.1;
	Wed, 04 Jan 2017 06:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=EVFt+Ok0uRE9PUILlLSgYTnjnONYZGj1gXth4NB6Chs=;
	b=IeOYvF4W3I9O3n0yEzabtX2NWAQf0fuXgMW9+EHqS8oUALh4+tlMMEVJMPrJX+1esE
	bJlXEHWesljlb2d6q5MrGkeMFP1eVmhAK4PJVi5uiTibMhnabb4AmtIdBA/0N/8tjON+
	ndyueNQz8/ovsrIF3eulmNmTva6RhHXdn6E+Acn2Zsu7c0JMpvMo4S3/snAhOZY2kf3r
	7OJ2s26UCoY8yYwq8GmuY2FNIIl3JNiwvw/L65c5kNIEBiCspnZanOFbwvL9q0eeO0ES
	VtCcV0CR5f5xu8slUzacvjFxYzxDIxGu4g+DkNwPB22SIqtJx8sydQlK0qvmB8/6QgJA
	2J8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=EVFt+Ok0uRE9PUILlLSgYTnjnONYZGj1gXth4NB6Chs=;
	b=Z0/ZebP9Rb1/EoEdLlTKahfH/kwrywjIG8JU0xod6vAYyMrk76AoxfaQTEiXa78Zqo
	Gzcd2hiP3fNoolxDAhMPhtrl0lfXPxuinx7TEI8xgqCd/wJS0T6Eof9lBnjPe4vtjSpL
	itzWyv8lzeQclfEqp0MwDStGjRcA4nf3WY3Uv2GjVwj273mLMBQiAjKyvk8+2RVZ3wIX
	Bm+xlQDpmPsghccK/E8ixs6E6BUpCXAQ5cuhz5cyXYsnB4MTTY6hxlHvcdexdKrZ//6u
	C9cpLIZs66HKMooe4yP/uiuGchmANF/sGD9NUJjV8aQybcmm6gYfgb2Bh07TUX+YwqhG
	3sjw==
X-Gm-Message-State: AIkVDXJ0gIt+KtuqQQmSDGKb0lk7Cdbk4H7a9ThglnmH7DzeGBtsRZTwh+6uOQubOhd3Ig==
X-Received: by 10.28.187.11 with SMTP id l11mr53994531wmf.72.1483541531665;
	Wed, 04 Jan 2017 06:52:11 -0800 (PST)
Received: from donizetti.lan (94-39-158-71.adsl-ull.clienti.tiscali.it.
	[94.39.158.71]) by smtp.gmail.com with ESMTPSA id
	k11sm95025734wmf.24.2017.01.04.06.52.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jan 2017 06:52:10 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Wed,  4 Jan 2017 15:52:10 +0100
Message-Id: <20170104145210.31608-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Subject: [Qemu-trivial] [PATCH] qga: fix erroneous argument to strerror
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
X-List-Received-Date: Wed, 04 Jan 2017 14:52:19 -0000

process_command returns a negative value in case of error.  Make this
clear in the "if" statement and fix the strerror argument to flip it
to positive.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qga/main.c b/qga/main.c
index 6caf215..538e4ee 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -558,8 +558,8 @@ static void process_command(GAState *s, QDict *req)
     rsp = qmp_dispatch(QOBJECT(req));
     if (rsp) {
         ret = send_response(s, rsp);
-        if (ret) {
-            g_warning("error sending response: %s", strerror(ret));
+        if (ret < 0) {
+            g_warning("error sending response: %s", strerror(-ret));
         }
         qobject_decref(rsp);
     }
-- 
2.9.3


